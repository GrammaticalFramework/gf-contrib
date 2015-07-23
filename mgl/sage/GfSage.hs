module Main where
import GfSide
import Voice (Voice)
import Transfer (Message(..))
import SageSide 
import Test
import Data.List (elem, intersperse)
import Data.Char (isDigit)
import Control.Monad ( foldM )
import Control.Monad.IO.Class (liftIO)
import Control.Monad.State.Strict ( evalStateT, lift )
import qualified Control.Exception as CE
import System.IO (hFlush, hPutStr, stdout, stderr)
import System.Exit (exitSuccess)
import System.Environment (getArgs, getProgName)
import System.Console.GetOpt
import System.Console.Haskeline
import Data.List (nub)


data Cx = Cx {
    gf :: GfCx,
    sage :: SageCx,
    verbosity :: Int,
    samples :: FilePath
}

makeCx :: Int -> String -> String -> IO Cx
makeCx level host path = do 
    gf <- mkGfCx path
    return $ Cx gf sage level ""
  where
    sage = SageCx host level
    
options :: [OptDescr (Cx -> IO Cx)]
options = [
#ifdef ADVANCED
    Option [] ["pgf-file"] (ReqArg setPgf "FILE") "pgf file",
    Option [] ["start-category"] (ReqArg setStartCat "CATEGORY") "parse category.",
#endif
    Option ['h'] ["help"]
        (NoArg helpExit) "print this page",
    Option ['H'] ["host"]
        (ReqArg setHost "HOST") "Use HOST:PORT as Sage backend",
    Option ['i'] ["input-lang"]
        (ReqArg (setLang True) "LANGUAGE") "Make queries in LANGUAGE",
    Option ['o'] ["output-lang"]
        (ReqArg (setLang False) "LANGUAGE") "Give answers in LANGUAGE",
    Option ['V'] ["verbose"]
        (ReqArg setVerbosity "LEVEL") "Set the verbosity LEVEL", 
    Option ['t'] ["test"]
        (ReqArg setTest "FILE") "Test samples in FILE", 
#ifdef VOICED
    Option ['v'] ["voice"]
        (OptArg setVoice "VOICE") "use voice output. To list voices use ? as VOICE.",
#endif
    Option ['F'] ["with-feedback"]
        (NoArg setFeedback) "Restate the query when answering."]
        
        
        
        
helpExit c = usage >>= putStr >> exitSuccess >> return c 
        
setLang      :: Bool -> String -> Cx -> IO Cx
setVoice     :: Maybe Voice.Voice -> Cx -> IO Cx
setStartCat  :: String -> Cx -> IO Cx
setVerbosity :: String -> Cx -> IO Cx
setTest      :: String -> Cx -> IO Cx
setHost      :: String -> Cx -> IO Cx

setHost site  cx = error "external host not implemented" -- return cx { sage = sagecx }
  where sagecx = (sage cx) { host = site }

setLang b lang cx = return cx {gf = newGf}  where
    oldGf = gf cx
    nl = mkLang oldGf lang
    (c1,l11,l12) = tp1 oldGf
    (c2,l21,l22) = tp2 oldGf
    newGf = if b
            then oldGf {tp1 = (c1,nl,l12), tp2 = (c2,l21,nl)} -- Input language
            else oldGf {tp2 = (c2,l21,nl)} -- Output language
                                
setStartCat cat cx =  return cx {gf = newGf} where
    oldGf = gf cx
    (_,l11,l12) = tp1 oldGf
    ncat = toCat cat
    newGf = oldGf {tp1 = (ncat,l11,l12)}
    

setVerbosity level cx = return $ cx { 
        gf   = (gf cx) {gverbosity = level'},
        sage = (sage cx) {sverbosity = level'},
        verbosity = level' } 
  where level' = read level
    
setFeedback cx = return $ cx {gf = (gf cx) {feedback = True}}

setTest path cx = return $ cx {samples = path}

#ifdef VOICED
setVoice mv cx = do
    let oldGf = gf cx
    voices <- getVoices oldGf
    mvoice <- case mv of
                Just v -> case v of
                            "?" -> do
                                putStrLn $ concat $ intersperse ", " voices
                                exitSuccess
                                return Nothing
                            _   -> if v `elem` voices
                                        then return $ Just v
                                        else error "No such voice for such language."
                Nothing ->  if null voices
                                then error "No voices avilable for this language"
                                else do
                                    let v = head voices
                                    return $ Just v
    maybe (return ()) (\v -> vputStrLn cx 1 $ "Voiced by " ++ v) mvoice
    return cx {gf = oldGf {voice = mvoice}}
#else
setVoice _ _ = error "Voice ouput not implemented."
#endif


setPgf :: FilePath -> Cx -> IO Cx
setPgf path cx = mkGfCx path >>= (\g -> return cx {gf = g})



runInteractive :: Cx -> IO ()


runInteractive cx = do
    CE.catch (evalStateT (runInputT settings repl) initSage) except
  where
    prompt = "sage> "
    host = sage cx
    settings ::  Settings SageT
    settings = setComplete gfCompletions $
        defaultSettings { historyFile = Just "history" }
    gfCompletions lr = let (a,ks) = fcomp (gf cx) 0 lr
                       in return (a, map simpleCompletion ks)
    repl :: InputT SageT ()
    repl = do
        minput <- getInputLine prompt
        case minput of
            Nothing    -> return ()
            Just input -> lift (evalCmd cx input) >> repl
    run = runInputT settings repl

    except e = do
            let err = show (e :: SomeException)
            putStrLn $ "Error: " ++ err

    run2 prompt cx = runInputT settings (loop cx)
      where
        loop :: Cx -> InputT SageT ()
        loop cx = do
            minput <- getInputLine prompt
            case minput of
                Nothing     -> return ()
                Just input  -> lift (evalCmd cx input) >>= (loop . fst)
        

evalCmd :: Cx -> String ->  SageT (Cx, Maybe String)
evalCmd cx input =  do
    cmd <- lift $ pass1 (gf cx) input
    evalLinCmd cx cmd
  where
    lhPutStrLn = lift . hputStrLn 
    evalLinCmd :: Cx -> Message -> SageT (Cx,Maybe String)
    evalLinCmd cx cmd = case cmd of
                    NoParse           -> lift (hputStrLn "No parse") >> return (cx, Nothing)
                    Ambiguous tlPairs -> ambiguityLoop cx tlPairs
                    EvalReturn tree sageCmd
                                    -> do
                                         result <- evaluateIn (sage cx) sageCmd
                                         case result of
                                            Just rExp ->
                                                    do
                                                        lift $ vputStrLn cx 3 rExp
                                                        let ngf = (gf cx) {lastExp = tree}
                                                            ncx = cx {gf = ngf} 
                                                        msg <- lift $ pass2 ngf rExp
                                                        case msg of
                                                            NoParse -> lhPutStrLn ("Cannot parse " ++ show rExp) >> return (ncx, Nothing)
                                                            Msg l -> lift (put l) >> return (ncx, Just rExp)
                                                            Ambiguous ((s,_):_) -> do
                                                                lhPutStrLn $ "Warning: Ambiguous sage expression. Returning first one"
                                                                lift (put s) >> return (ncx, Just rExp)
                                        
                                            _                     -> lhPutStrLn "expected something but got none" >> return (cx, Nothing)
                                         
                    EvalSimple tree sageCmd   -> do
                                         let ngf = (gf cx) {lastExp = tree}
                                             ncx = cx {gf = ngf}
                                         result <- evaluateIn (sage cx) sageCmd
                                         case  result of
                                            Nothing -> do
                                                            lift $ vputStrLn cx 2  "<empty>"
                                                            Msg s <- lift $ pass2 ngf []
                                                            lift (put s) >> return (ncx, Just "")
                                            e               -> lhPutStrLn ("expected nothing but got " ++ show e) >> return (ncx, Just "")

    ambiguityLoop cx pairs = do
            lift $ putStrLn $ "Ambiguous command. Pick your choice: (1.." ++ (show.length) pairs ++ ")"
            lift $ sequence_ $ zipWith (\i (l,_) -> putStrLn $ show i ++ ": " ++ l)  [1..] pairs
            cs <- lift $ getLine
            case takeWhile isDigit cs  of
                []  -> ambiguityLoop cx pairs
                cs  -> let n = read cs
                       in if 1 <= n && n <= length pairs
                            then do
                                    let t = snd $ pairs !! (n - 1)
                                        ngf = (gf cx) {lastExp = t}
                                        ncx = cx {gf = ngf}
                                    cmd <- lift $ pass1' ngf t
                                    evalLinCmd ncx cmd
                            else ambiguityLoop cx pairs
    printAnswer s = if (verbosity cx) > 0 then putStrLn ("answer: " ++ s) else return ()
#ifdef VOICED
    put s = do
        paction printAnswer cx 2 s
        sayAnswer (gf cx) printAnswer s
#else
    put = printAnswer
#endif



-- Send to stderr
hputStrLn :: String -> IO ()
hputStrLn s = hPutStr stderr (s ++ "\n")



  


usage :: IO String
usage = do
    pname <- getProgName
    let tabs n = take n $ repeat '\t'
        lang = "LANGUAGE"
        header = unlines
            ["",
             pname ++ tabs 3 ++ "Use english",
             pname ++ " " ++ lang ++ tabs 2 ++  "Use " ++ lang,
             pname ++ " [OPTIONS]" ++ tabs 1 ++ "where OPTIONS are:"]
    return $ usageInfo header options
    
    
banner :: String 
banner = unlines $ map (fill 80) [
    "",
    "gfsage: a prototype for interoperation between Gf and Sage.",
    "MOLTO: http://www.molto-project.eu",
    ""]
  where
    fill n s = "[ " ++ s ++ filler ++ " ]"  where
        filler = take (n - length s) (repeat ' ')
    
    
    
    
vputStrLn :: Cx -> Int -> String -> IO ()
vputStrLn = paction putStrLn

paction :: (a -> IO ()) -> Cx -> Int -> a -> IO ()
paction f cx n | n <= verbosity cx = f
paction _ _ _  | otherwise = \_ -> return ()



main :: IO ()
main = do
    argv <- getArgs
    putStr  banner
    cx0 <- makeCx 3 "localhost:8888" "Commands.pgf" -- Debug verbosity = 3
    cx1 <- case getOpt RequireOrder options argv of
        ([],[lang],[])  -> setLang True lang cx0 >>= setLang False lang
        (actions,[],[]) -> foldl (>>=) (return cx0) actions
        _               -> usage >>= (ioError . userError)
    checkGf (gf cx1)
    if null (samples cx1)
        then runInteractive cx1
        else error "Testing not eomplemented"
    
