module Editor where
import PGF
import Treebank
import Control.Monad.State
import Data.Maybe (fromMaybe)
import Data.List (isInfixOf, groupBy, group)
import Data.Char (toUpper)
import Data.Algorithm.Diff
import Debug.Trace (traceShow)
import System.FilePath ((</>))


editTree :: Expr -> IO (Maybe Expr)
editTree exp = do
    let st = [exp]
    printStack st
    editLoop st


getArg :: Int -> Expr -> Expr
replace :: Expr -> Int -> Expr -> Expr
replaceMeta = replace (mkMeta 0)


getArg k expr = case (unApp expr) of
        Just (f,es) -> if k < length es
                        then es !! k
                        else error "No such argument"
        Nothing     -> error "not an EApp"
        

replace arg k expr = case (unApp expr) of
            Just (f,es) -> mkApp f nes where
                nes = (take k es) ++ arg:(drop (k+1) es)
            Nothing     -> error "not an EApp"      


noDiffq :: [(DI,a)] -> Bool
noDiffq = all ((==B) . fst)


doEdit :: PGF -> CSSelector -> TreebankEntry -> (Expr -> IO (Maybe Expr)) -> IO TreebankEntry
doAccept1 :: TreebankEntry -> IO TreebankEntry
doAccept2 :: PGF -> CSSelector -> TreebankEntry -> IO TreebankEntry
doPrintAbs :: TreebankEntry -> IO ()
doPrintCnc :: CSSelector -> TreebankEntry -> IO ()
doPrintLin :: PGF -> CSSelector -> TreebankEntry -> IO ()


doAccept1 t = return t

doAccept2 pgf lang tbe = doEdit pgf lang tbe (\e -> return (Just e))

doEdit pgf (Sel (lang,_)) (T e m) edit = do
    me <- edit e
    let ne = fromMaybe e me
        lin = omlin pgf lang ne
        cs = CS {author = "saludes",
                revision = 0,
                concrete = lin,
                comment = Nothing}
    return $ add (T ne m) lang cs
    
doPrintAbs t = do
    putStr "abs: "
    putStrLn $ showExpr [] $ abst t


doPrintCnc sel@(Sel (lang,_)) tbe = do
    putStr $ lang ++ ": "
    putStrLn $ show $ current $ changesets tbe sel

doPrintLin pgf (Sel (lang,_)) tbe = do
    putStr $ lang ++ ": "
    putStrLn $ omlin pgf lang tree    
  where
    tree = abst tbe
      where l:ls = lang
    
    
mylinearize prefix pgf lang tree = linearize pgf gfLang tree
  where
    l:ls = lang
    gfLang = mkCId $ prefix ++ (toUpper l):ls

omlin = mylinearize "OpenMath"


diffCnc :: PGF -> CSSelector -> TreebankEntry -> [(DI,String)]
diffCnc pgf sel tbe = getDiff (words lin1) (words lin2) where
    -- stripSp = unwords . words
    tree = abst tbe
    Sel (lang,_) = sel
    lin1 = case changesets tbe sel of
                [] -> error $ "No changesets for " ++ (show sel)
                css -> concrete (current css)
    lin2 = omlin pgf lang tree

eqLin :: PGF -> CSSelector -> TreebankEntry -> Bool
eqLin pgf sel t = not $ isDifferent $ diffCnc pgf sel t

isDifferent :: [(DI,String)] -> Bool
cntDiffs :: [(DI,String)] -> Int
isDifferent dif = not $ all ((==B).fst) dif
cntDiffs dif = cnt 0 $ (map head).group.(map fst)$ dif where
    cnt n ds =
        case break (/=B) ds of
            (_,F:S:ds2) -> cnt (n+1) ds2
            (_,S:F:ds2) -> cnt (n+1) ds2
            (_,F:ds2)   -> cnt (n+1) ds2
            (_,S:ds2)   -> cnt (n+1) ds2
            (_,[])      -> n
doPrintDiff, doInlineDiff :: [(DI,String)] -> IO ()
doPrintDiff dif =
    do
      let (f,b,s) = unzip3 $ map select $ groupByField fst dif 
      mapM_ (putStrLn . concat) [f,b,s]
  where
    select xs = case xs of
        []      ->  ([],[],[])
        (B,c):_ -> (spaces, chars, spaces)
        (F,c):_  -> (chars, spaces, spaces)
        (S,c):_  -> (spaces, spaces, chars)
      where
        chars  = unwords $ map snd xs
        spaces = take (length chars) $ repeat ' '


doInlineDiff dif =
	putStrLn $ concat $ pairSort $ map grp $ groupByField fst dif
  where
		grp g@((i,_):_) = (i,unwords (map snd g)) 
		pairSort :: [(DI,String)] -> [String]
		pairSort [] = []
		pairSort (f@(F,_):s@(S,_):rest) = pairSort (s:f:rest)
		pairSort ((S,fs):(F,ss):rest) = (" {" ++ fs++" -> " ++ ss ++"} "):(pairSort rest)
		pairSort ((S,ss):bs) = (" {" ++ ss ++ " ->} "):(pairSort bs)
		pairSort ((F,ss):bs) = ("{-> " ++ ss ++ "}"):(pairSort bs)
		pairSort ((B,xs):rest) = xs:(pairSort rest)

isInTree :: CId -> TreebankEntry -> Bool
isInTree c t = (show c) `isInfixOf` (show $ abst t)



type Stack a = State [Expr] a

push :: Expr -> Stack ()
pop  :: Stack (Maybe Expr)
peek :: Stack Expr


printStack :: [Expr] -> IO ()
printStack es = mapM_ (putStrLn . (\(n,e) -> show n ++ ": " ++  showExpr [] e)) $ reverse $ zip [0..] es
    
push e = get >>= \es -> put (e:es)

pop = get >>=
    (\es -> case es of
        (e:es) -> put es >> (return $ Just e)
        _      -> return Nothing)
        
peek = get >>= (\es -> return (head es))
        

    
doApply :: String -> Int -> Stack ()
doApply f n  = do
    es <- get
    let es2 = drop n es
        e = mkApp (mkCId f) (take n es)
    put (e:es2)
    
doSwap, doEnter :: Int -> Stack ()
doSwap k = do
    e0:es <- get
    put $ (es!!k1):(take k1 es) ++ e0:drop (k1+1) es
  where k1 = k - 1

doReplace k = do
    e0:e1:es <- get
    let e = replace e1 k' e0  
    put (e:es)
  where k' = k -1 -- arguments are 1-based
    
doRead exp = do
    case (readExpr exp) of
        Just e  -> push e
        Nothing -> return ()

doEnter k = peek >>= \e -> push (getArg k' e)
  where k' = k - 1 -- arguments are 1-based
    
editLoop :: [Expr] -> IO (Maybe Expr)
editLoop es = do
    cmd <- getLine
    case cmd of
        'e':n    -> next $ doEnter (read n)
        'a':args -> next $ case (words args) of
                                [f]   -> doApply f 0 
                                [f,n] -> doApply f (read n)
        'A':exp    -> next $ doRead exp
        "s"        -> next $ doSwap 1
        's':n      -> next $ doSwap (read n)
        'r':n      -> next $ doReplace (read n)
        "q"        -> return Nothing
        "w"        -> do
                        putStrLn $ "Changed to: " ++ showExpr [] (head es)
                        return $ Just (head es)
        ['.',s]| elem s "xyz"  -> next $ doRead ("Var2Num " ++ [s])
        ['.',s]| elem s "ABC"  -> next $ doRead ("Var2Set " ++ [s])
        ['.',s]| elem s "uvM"  -> next $ doRead ("Var2Tensor " ++ [s])
  where
    next p = do 
                let nes = snd $ (runState p) es
                printStack nes
                editLoop nes
    
printTree :: Tree -> IO ()
printTree expr = 
    putStrLn $ showExpr [] expr


type Author = String

insertLin :: PGF -> CSSelector -> Author -> TreebankEntry -> TreebankEntry
insertLin pgf (Sel (lang,Just rev)) author tbe =
    add tbe lang cs
  where
    lin = mylinearize "OpenMath" pgf lang (abst tbe)
    cs = CS author rev lin Nothing
    
    
    
-- main
mLang :: CSSelector
mLang = Sel ("eng", Nothing)

themain :: String -> IO ()
themain patt = do
    TB (base,tb) <- readTB "eng.json"
    pgf <- readPGF $ ".." </> base
    let mId = mkCId patt
    newTb <- inspectAll pgf mLang (isInTree mId) tb
    savePrettyTB (TB (base,newTb)) "fool.json"
    --return ()

inspectAll :: PGF -> CSSelector ->  (TreebankEntry -> Bool) -> [TreebankEntry] -> IO [TreebankEntry]
inspectAll pgf sel p ts = mapM
    (\t -> if p2 t
            then inspectOne pgf sel t
            else return t)  ts
  where
        p2 t = not (eqLin pgf sel t) || length (showExpr [] $ abst t) > 500 || p t


inspectOne :: PGF -> CSSelector -> TreebankEntry -> IO TreebankEntry
inspectOne pgf sel t = do
        doPrintAbs t
        let dif = diffCnc pgf sel t
        doPrintDiff dif
        putStr "? "
        l <- getLine
        case l of
            "q" -> return t
            "<" -> doPrintCnc sel t >> loop
            ">" -> doPrintLin pgf sel t >> loop
            "1" -> doAccept1 t
            "2" -> doAccept2 pgf sel t
            "d" -> doPrintDiff dif >> loop
            "a" -> doPrintAbs t >> loop
            "e" -> doEdit pgf sel t editTree
            _  -> loop
  where loop = inspectOne pgf sel t