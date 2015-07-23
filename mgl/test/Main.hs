module Main where
import Control.Monad (filterM)
import Control.Monad.Trans.State
import System.Environment (getArgs)
import System.Directory (doesFileExist)
import System.FilePath ((</>), takeBaseName)
import System.Console.Haskeline
import System.Locale
import System.Posix (EpochTime, getFileStatus, modificationTime)
import System.Process (readProcess)
import System.Console.GetOpt
import PGF hiding (languages)
import Treebank 
import Update (addCncTBE, parseConcretes, RConcrete (..))
import Validate (validate)
import Editor
import Defect
import Data.List (groupBy, sortBy, lookup, isInfixOf, nub, transpose, intersperse)
import Data.Ord (comparing)
import Data.Map (null, fromList, Map, (!), keys, toList, empty, insertWith, lookup)
import Data.Algorithm.Diff
import Data.Char (toUpper)
import Data.Time
import Data.Maybe (isJust)
import Data.Time.Clock.POSIX
import Text.XML.Light
#ifdef PM
import ProjectManager hiding (author)
#endif

-- Command line options

data Options = Options
  { path :: [FilePath], 
    beforeRevision, maxDepth :: Maybe Int,
    languages :: [ISOLang],
    isRegex, summarize :: Bool,
    committer :: String,
	tbPath :: FilePath
  } deriving Show


defaultOptions = Options
  { path= [".","..","test"],
    beforeRevision = Nothing,
    languages = [], -- (words "eng"),
    isRegex = False,
    summarize = False,
    maxDepth = Nothing,
    committer = "",
	tbPath = "treebank.json"
  }

type MapOpt = OptDescr (Options -> Options)

revOpt, pathOpt, langOpt :: MapOpt
revOpt = Option ['r'] ["revision"] (OptArg setRev "REV") "Check against previous revisions"
  where setRev r opts =
            case r of
                Nothing -> opts
                Just r  -> opts {beforeRevision = Just (read r)}

pathOpt = Option ['p'] ["path"] (OptArg setPath "PATH") "Find grammar in dirs"
  where setPath p opts =
            case p of
                Nothing -> opts
                Just ps -> opts {path = splitColon ps}


shortOpt = Option ['s'] ["summarize", "short"]
            (NoArg
                (\opts -> opts {summarize = True}))
            "summarize validation"

regexOpt = Option ['e'] ["regex"]
            (NoArg
                (\opts -> opts {isRegex = True}))
            "pattern is a regular expression"

depthOpt = Option ['d'] ["depth"]
            (OptArg
                (\d opts -> case d of
                                Nothing -> opts
                                Just d  -> opts {maxDepth = Just (read d)})
                "DEPTH")
            "maximum depth"

langOpt = Option ['l'] ["language"]  (ReqArg setLang "LANG") "Language"
  where setLang l opts = opts {languages = l:(languages opts)}

authorOpt = Option ['a'] ["commiter"] (ReqArg setAuthor "COMMITER") "Author of revision"
  where setAuthor a opts = opts {committer = a}

splitColon :: String -> [FilePath]
splitColon ps =
    case break (==':') ps of
        ([],[])    -> []
        (a,[])     -> [a]
        (a,':':bs) -> a:(splitColon bs)

compileOpts :: String -> [MapOpt] -> [String] -> IO (Options, [String])
compileOpts subcmd options argv =
    case getOpt Permute options argv of
        (o,n,[])   -> return (foldl (flip id) defaultOptions o, n)
        (_,_,errs) -> ioError (userError $ concat errs ++ usageInfo header options)
  where
    header = "Usage: inspect " ++ subcmd ++  " [OPTIONS...]"


-- main:
main :: IO ()
main = do
    cmd:args <- getArgs
    case cmd of
#ifdef PM
        "commit"  -> notifyCommit args
#endif
        "review"  -> doReview args
        "emit"    -> doEmit args
        "summary" -> doSummary args
        "table"   -> doTable args
        "update"  -> doUpdate args
        "add"     -> doAddLanguage args
        _         -> error $ "Command " ++ cmd ++ " not found."




simpleLoad l = loadTreebank l "treebank.json" "entries.json"

doUpdate :: [String] -> IO ()
doUpdate args = do
	ct <- getEnv "update" [langOpt,authorOpt] args
	let Sel (lang,_) = sel ct
	    TB (base,_) = tb ct
	d <- parseConcretes $ lang ++ ".txt"
	svnInfo <- getSvnInfo
	btb <- simpleLoad lang
	let rcs = case d of
                Right cs -> cs
                Left pe -> error $ show pe
	    tbm = fromTB $ tb ct
	    sel2 = Sel (lang, Just $ read (svnInfo!"Revision"))
	putStrLn $ "There are " ++ show (length rcs) ++ " concretes"
	putStrLn $ "Original treebank has " ++ show (length $ keys tbm) ++ " entries"
	ts2 <- mapM (upd (user ct) sel2 tbm) rcs
	let ntb = (tb ct) +++ TB (base,ts2)
	save $ ct {tb = ntb}
  where
	upd author sel m r@(NL _ ab _ _) = addCncTBE author sel r (m!ab)


doSummary :: [String] -> IO ()
doSummary args = do
    ctx <- getEnv "summary" [langOpt] args
    putStrLn $ ppTopElement $ topEl ctx
  where 
       
        topEl ct = blank_element {
                    elName = qn "div",
                    elContent = [
                        Elem (hd lang),
                        Elem $ ul $ map mkLi $ allDefects ct]
                    }
          where
            Sel (lang,_) = sel ct
            mkLi j = 
                let dif = diffLins ct j
                in li $ "(" ++ show j ++ ") " ++ inlineDiff "&rarr;" dif
        qn s = blank_name {qName = s}
        cd s = blank_cdata {cdData = s}
        cdd s = blank_cdata {cdVerbatim = CDataRaw, cdData = s}
        li s  = blank_element { elName = qn "li", elContent = [Text $ cdd $ s]}
        ul ls = blank_element { elName = qn "ul", elContent = map Elem ls }
        hd s  = blank_element { elName = qn "h2", elContent = [Text $ cd $ s] }
            


	
-- Info from svn

-- Get the revision from svn
getSvnInfo :: IO (Map String String)
getSvnInfo = do
    info <- readProcess "svn" ["info"] []
    return $ fromList [(f,v) | (f,':':v) <- map (break (==':')) (lines info)]


-- Utils

getSelector :: Options -> CSSelector
getSelector opts = Sel (lang,mrev)
  where lang:_ = languages opts
        mrev   = beforeRevision opts

completePath :: Options -> FilePath -> IO (Maybe FilePath)
completePath env base = do
    dirs <- filterM (\p -> doesFileExist $ p </> base) (path env)
    case dirs of
        d:_ -> return $ Just (d </> base)
        []  -> return $ Nothing

isOlder :: String -> FilePath -> IO Bool
isOlder tstr path = do
    stat <- getFileStatus path
    let pm = modificationTime stat
        modt = posixSecondsToUTCTime (realToFrac pm)
        st = takeWhile (/='(') tstr
        msvnt = parseTime defaultTimeLocale "%Y-%m-%d %H:%M:%S %z " st :: Maybe UTCTime
    case msvnt of
        Just svnt -> return $ modt < svnt
        _         -> error "Cannot parse svn last commit time"


-- Interactive

data Context = Ctx {
    pgf :: PGF,
    sel :: CSSelector,
    tb :: Treebank,
    crev :: Int,
    user :: String,
    estatus :: EntryMap}

loadTreebank :: ISOLang -> FilePath -> FilePath -> IO Context
loadTreebank lang tbpath espath = do
    tb <- readTB tbpath
    ens <- if Prelude.null espath
                then return []
                else readES espath
    let TB (base,_) = tb
    Just pgfPath <- completePath defaultOptions base
    svnInfo <- getSvnInfo
    let rev = read $ svnInfo!"Revision"
        lastChanged = svnInfo!"Last Changed Date"
    older <- isOlder lastChanged pgfPath
    pgf <- if older
             then error $ pgfPath ++ " is older than last commit: recompile." 
             else readPGF pgfPath
    return $ Ctx {
        pgf = pgf,
        sel = Sel (lang,Nothing),
        tb = tb,
        crev = rev,
        user = "jordi",
        estatus = mkMap ens}

findAbs :: Context -> String -> [Int]
findAbs ctx exp = [ n | (n,t) <- zip [0..] ts, matchIdExpr Nothing exp t]
  where
    TB (_,ts) = tb ctx

select :: Context -> [Int] -> IO (Maybe Int)
select tb js = loop js where
    loop res = do
        let page = 10
            pairs = zip ['a'..] (take page res)
            absIx j = showExpr [] $ abst $ getTBE tb j
        mapM_ (\(c,j) -> putStrLn $ c:(": " ++ absIx j)) pairs
        putStr ">> "
        c <- getChar
        case c of
            '0'  -> return Nothing
            '8'  -> loop (drop page res)
            _    ->  return $ Prelude.lookup c pairs

getAbs, getLin :: Context -> Int -> String

shDiff ctx j | isDifferent dif = showDiff $ dif
             | otherwise       = putStrLn []
  where 
        dif = diffLins ctx j



getAbs tb n = (showExpr []) . abst . (getTBE tb) $ n

getCnc ctx n = map extractCS $ reverse $(sortBy $ comparing revision) $ css
  where
    css = changesets (getTBE ctx n) (sel ctx)
    extractCS cs = ((author cs,revision cs), concrete cs, maybe [] (\cm -> ["--" ++ cm]) $ comment cs)


getTBE :: Context -> Int -> TreebankEntry
getTBE ctx n = ts!!n where
    TB (_,ts) = tb ctx

ammendAbs :: Context -> Int -> IO Context 
ammendAbs ctx n = do
    let T e1 mp = getTBE ctx n
        TB (base,ts1) = tb ctx
    mtbe <- editTree e1
    let tbe2 = T (maybe e1 id mtbe) mp
        ts2 = take n ts1 ++ tbe2:(drop (n+1) ts1)
    return ctx { tb = TB (base,ts2) }

reviewInv :: Context -> [Int] ->  IO [(Int,String)]
reviewInv ctx js = do
    mapM_ explain invalids
    return res
  where
    Sel (lang,rev) = sel ctx
    TB (_,ts) = tb ctx
    invalids = groupBy (\a b -> fst a == fst b) [(j,es) | j <- js, es <- validate (pgf ctx) [lang] rev (ts!!j)]
    res = map (\g -> ((fst.head) g, map (fst.snd) g)) invalids
    explain es = do
        let t = ts!!((fst.head) es)
        putStrLn $ showExpr [] $ abst t
        mapM_ (putStrLn.("* " ++).snd.snd) es

shEntry :: Context -> Int -> IO ()
shCncs :: Context -> Int -> IO ()
shEntry ctx j = do
    putStrLn $ "[" ++ show j ++ "] " ++ getAbs ctx j
    putStrLn []
    --putStrLn "lin:"
    --putStrLn $ '\t':(getLin ctx j)
    shDiff ctx j
    case findStatus (estatus ctx) j (sel ctx) of
        Just st -> putStrLn $ show st
        _       -> return ()		



shCncs ctx j = mapM_ pr cncs where
    pr ((au,rev),cnc,comm) = do
        putStrLn $ au ++ "/" ++ show rev ++ ":"
        putStrLn $ '\t':cnc
        putStrLn $ concat comm
    cncs = getCnc ctx j



addCnc :: Context -> Int -> String -> Maybe String -> Context
addCnc ctx j cnc mcmt =
    let
        Sel (l,Nothing) = sel ctx
        TB (base,ts) = tb ctx
        tbe = ts!!j
        cs = CS (user ctx) (crev ctx) cnc mcmt
        tbe2 = T (abst tbe) $ fromList [(l,[cs])]
        tbe3 = updateTBE tbe tbe2
        ts2 = take j ts ++ tbe3:(drop (j+1) ts)
    in ctx {tb = TB (base,ts2)}


doEmit :: [String] -> IO ()
doEmit args = do
	ct <- getEnv "emit" [langOpt] args
	putStr $ emit ct Nothing


emit :: Context -> Maybe [Int] -> String
emit ctx mjs = concat $ map extract ts where
    TB (_,ts0) = tb ctx
    ts = maybe ts0 (map (ts0!!)) mjs
    sel1 = sel ctx
    extract tbe =
        let 
            t = abst tbe
            st = showExpr [] t
            cs = case (lastcs tbe sel1) of
                    Just cs -> cs
                    _       -> error $ "No " ++ (show sel1) ++ " linearization for: " ++ st
            rev = revision cs
            cnc = concrete cs
        in unlines [show rev ++ ": " ++ st, cnc, ""]


getLin ctx j = lin
  where
    TB (base,ts) = tb ctx
    tbe = ts !! j
    exp = abst tbe
    Sel ((l:ls),_) = sel ctx
    lang = (toUpper l):ls
    gfCase = "s Nom ton"
    grammar = takeBaseName base ++ lang
    simpleLin = linearize (pgf ctx) (mkCId grammar) exp
    tabularLin = case tabularLinearizes (pgf ctx) (mkCId grammar) exp of
                    []  -> error "No lin using tabular"
                    t:_ -> t 
    lin = case (simpleLin,tabularLin) of
                (_:_,_) -> simpleLin
                ([],t)  -> case Prelude.lookup gfCase t of
                                Just l -> l
                                _      -> error $ "No lin for case " ++ show gfCase


addLin :: Context -> Int -> Context
addLin ctx j = ctx { tb = TB (base,ts2) } where
    TB (base,ts1) = tb ctx
    tbe1 = ts1!!j
    Sel (lang,_) = sel ctx
    ts2 = take j ts1 ++ (tbe2:(drop (j+1) ts1))
    tbe2 = add tbe1 lang cs
    lin = getLin ctx j
    cs = CS (user ctx) (crev ctx) lin Nothing

range :: Context -> [Int]
range ctx = [0..s] where
    TB (_,ts) = tb ctx
    s = length ts - 1



diffLins :: Context -> Int -> [(DI,String)]
diffLins ctx j = getDiff (words lin1) (words lin2) where
    lin1 = getLin ctx j
    (_,lin2,_) = head $ getCnc ctx j



showDiff dif = do
    let (f,b,s) = unzip3 $ map select $ groupByField fst dif 
    mapM_ putStrLn $ zipWith (:) "- +" $ map concat [f,b,s]
 where
    select xs = case xs of
        []      ->  ([],[],[])
        (B,c):_ -> (spaces, chars, spaces)
        (F,c):_  -> (chars, spaces, spaces)
        (S,c):_  -> (spaces, spaces, chars)
      where
        chars  = unwords $ map snd xs
        spaces = take (length chars) $ repeat ' '

inlineDiff :: String -> [(DI,String)] -> String
inlineDiff aw dif = concat $ pairSort $ map grp $ groupByField fst dif
  where
		grp g@((i,_):_) = (i,unwords (map snd g)) 
		pairSort :: [(DI,String)] -> [String]
		pairSort [] = []
		pairSort (f@(S,_):s@(F,_):rest) = pairSort (s:f:rest)
		pairSort ((F,fs):(S,ss):rest) = (" {" ++ fs++" "++aw++" "++ ss ++"} "):(pairSort rest)
		pairSort ((F,ss):bs) = (" {" ++ ss ++ " " ++ aw++"} "):(pairSort bs)
		pairSort ((S,ss):bs) = ("{"++aw++" "++ ss ++ "}"):(pairSort bs)
		pairSort ((B,xs):rest) = xs:(pairSort rest)


{-  ProjectManager

queryUsers ::  IO [User]
queryUsers = getUsersOrFail

queryTickets :: IO [Ticket]
queryTickets = getTicketsOrFail


createAndInsertTicket :: Context -> Int -> IO ()
createAndInsertTicket ctx j = do
	putStrLn $ "Inserting ticket for entry [" ++ show j ++ "]"
	tti <- askFor1 "title" >>= returnTitle
	tpri <- askFor1 "priority (1..5)" >>= returnPri
	tasg <- askFor2 "assignee" >>=  returnUser
	res <- insertTicket ctx tasg tpri j tti
	putStrLn (if res
				then "Ticket inserted"
				else "Insertion failed")
  where
	askFor1 = askFor defaults
	askFor2 = askFor $ defaults { complete = completeUsers }
	defaults = defaultSettings :: Settings IO 
	returnTitle mt =
		case mt of
			Just t -> return t
			_      -> error "Must provide a title"
			
	returnPri = maybe (return 1) (return.read)
	returnUser = maybe (return Nothing) (\u -> do
												let su = takeWhile (/=' ') u
												    tUs = mkUser (users ctx) su
	 											return tUs)
	completeUsers (l,r) = return (l,cps) where
		rl = reverse l
		n = length l
		opts = filter (isInfixOf rl) $ map alias (users ctx)
		cps = [Completion (drop n al) al True | al <- opts]
	askFor sets prompt = runInputT sets loop where
		pr = prompt ++ ": "
		loop = getInputLine pr :: InputT IO (Maybe String)


insertTicket :: Context -> Maybe User -> Int -> Int -> String ->  IO Bool
insertTicket ctx assignee priority j title | isDifferent dif = do
	mkTicket assignee title2 priority desc [lang]
	return True
                   | otherwise = putStrLn "No differences" >> return False
  where
		exp = getAbs ctx j
		dif = diffLins ctx j
		theDiff = inlineDiff "&rarr;" dif
		title2 = title ++ " (" ++ show j ++")"
		desc = "<h4>Abstract</h4>\n" ++ 
			   "<pre><code>" ++ exp ++ "</code></pre>\n" ++
			   "<h4>Difference</h4>\n"++
			   theDiff
		Sel (lang,_) = sel ctx
		
mkUser :: [User] -> String -> Maybe User
mkUser us name = Prelude.lookup name [(alias u,u) | u <- us]

-}

#ifdef PM
notifyCommit :: [String] -> IO ()
notifyCommit [url] = do
	svnInfo <- getSvnInfo
	feedCommit url $ "rev " ++ svnInfo!"Revision"
	
#endif
    

save :: Context -> IO ()
save ctx  = writeFile "treebank.json.updated" $ pp_treebank (tb ctx)

allDefects :: Context -> [Int]
allDefects ctx = map fst $ filter (isDifferent.diffs.fst) pairs
  where
    diffs = diffLins ctx
    TB (_,ts) = tb ctx
    pairs = zip [0..] ts

    
    
    
doTable :: [String] -> IO ()
doTable args = do
    dfs <- mapM g langs
    putStrLn $ insTabs langs 
    mapM_ p $ zip [0..] (transpose dfs)
  where
    insTabs l = '\t':(concat .(intersperse "\t") $ l)
    p (n,ls) = if all (=="") ls
                    then return ()
                    else putStrLn $ show n ++ ": " ++ insTabs ls
    g lang = do
        ctx <- simpleLoad lang
        let TB (_,ts) = tb ctx
            ltb = length ts - 1
            f ctx j =
                case cntDiffs (diffLins ctx j) of
                    0 -> []
                    n -> show n
        return $ map (f ctx) [0..ltb]
    langs = words "eng spa ger"
		
eng, ger, spa :: ISOLang
eng = "eng"
ger = "ger"
spa = "spa"


getEnv :: String -> [MapOpt] -> [String] -> IO Context
getEnv cmd options args = do
	(opt,args) <- compileOpts cmd options args
	let lang:_ = languages opt
	path <- if Prelude.null args
				then completePath opt (tbPath opt) >>= (maybe
															(error "Treebank not found")
															return)
				else return $ head args
	ct <- loadTreebank lang path "entries.json"
	return $ case committer opt of
				[] -> ct
				u  -> ct { user = u }
	

review ctx= do
    let defs = allDefects ctx
        mkState = StateT (next defs) :: STB (Maybe Int)
    evalStateT mkState ctx

doReview :: [String] -> IO ()
doReview args = do
    st <- getEnv "review" [langOpt] args
    review st
    return ()
	
	
doAddLanguage :: [String] -> IO ()
doAddLanguage args = do
    st <- getEnv "add" [pathOpt,langOpt,revOpt] args
    svnInfo <- getSvnInfo
    let 
    	lastRev = read $ svnInfo!"Revision"
        committer = "GF"
        Sel (lang,mrev) = sel st
        sel2 = Sel (lang, Just $ maybe lastRev id mrev)
        TB (base,ts) = tb st
        ts2 = map (insertLin (pgf st) sel2 committer) ts
        st2 = st {tb = TB (base,ts2) }
    save st2


type STB = StateT Context IO

isFull :: Context -> Bool
isFull ctx =  not $ Data.Map.null (estatus ctx)


next [] b         = return (Nothing, b)
next js@(j:_) ctx = shEntry ctx j >> loop js
  where
    loop ks@(k:ks2) = do
            putStr "> "
            c:_ <- getLine
            case c of
                'a'     -> putStrLn (getAbs ctx k) >> loop ks 
                'n'     -> next ks2 ctx
                'd'     -> shDiff ctx k >> loop ks
                'q'     -> return (Just k,ctx)
                'g'     -> gotoDefect ks
                'A'     -> insertCnc k >>= next ks2
                'l'     -> shLin ctx k >> loop ks
                'c'     -> shCncs ctx k >> loop ks
                'h'     -> shUsage >> loop ks
                -- 'T'     -> createAndInsertTicket ctx k >> loop ks
                '8'     -> select ctx ks >>= maybe (loop ks) (goto ctx ks)
                _       -> shEntry ctx k >> loop ks
    goto s js j = next (dropWhile (<j) js) s
    gotoDefect js = do
            putStrLn "entry?"
            l <- getLine
            goto ctx js (read l)
    shLin ctx k = putStrLn $ getLin ctx k
    shUsage = mapM_ putStrLn ["a\tshow abstract",
							  "n\tnew defect",
                              "d\tshow differences",
                              "g<n>\tgo to entry <n>",
                              "A\tadd linearization",
                              "l\tactual linearization",
                              "c\tshow concretes",
                              "8\tlist entries",
                              "q\tquit"]
               
    insertCnc k = do
        putStrLn "write the new lin (now is:)"
        let 
            lin = getLin ctx k
            editLin = runInputT defaultSettings loop where
            loop = getInputLineWithInitial [] (lin,[]) :: InputT IO (Maybe String)
        l <- editLin
        let cnc2 = case l of
                        Just [] -> lin
                        Just l  -> l
                        Nothing -> lin
        putStrLn "comment? (leave blank if not)"
        mcomm <- runInputT defaultSettings (getInputLine [])
        let nctx = addCnc ctx k cnc2 mcomm
        shEntry nctx k
        putStrLn "write? (y/[n])"
        yn <- getLine
        case yn of
                "y"  -> save nctx >> return nctx
                "n"  -> return ctx

--
-- Sanity check
--


mkUntracked :: Context -> [Defect]
mkUntracked ctx = map (\j -> mkNew j selc) unkn
  where
    selc = sel ctx
    unkn = filter (\j -> (not.isJust) $ f (j,selc)) (allDefects ctx)
    f k = Data.Map.lookup k (estatus ctx)

