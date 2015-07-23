module Voice where
import System.Process (system, readProcess)
import System.Exit (ExitCode(..))
-- import Data.Char (toLower)
import GHC.Unicode (toLower, isAscii)
import Text.Regex
import System.Process

type Voice = String
type Language = String

availableVoices :: Language -> IO [Voice]

uncapitalize [] = []
uncapitalize (c:cs) = (toLower c):cs

toISOLang2 :: Language -> String
toISOLang2 lang =
    case take 3 uclang of
        "ger" -> "de"
        "spa" -> "es"
        _     -> take 2 uclang
  where uclang = uncapitalize lang

#if OS == 1
availableVoices lang = do
        output <- readProcess "say" ["-v", "?"] []
        return $ [head ls | Just ls <- map (matchRegex re) (lines output)]
  where
   re = mkRegex $ "^([A-Z][a-z]+)[ ]+" ++ toISOLang2 lang ++ "_"
#elif OS == 2
availableVoices lang = do
	output <- readProcess "espeak" ["--voices=" ++ isolg] []
	return $ map ((!!4). words) $ tail $ lines output
  where
	isolg = toISOLang2 lang
#else
availableVoices _ = return []
#endif    

say :: Voice -> String -> IO ()
say name s = do 
#if OS == 1
    (code,_,errs) <- readProcessWithExitCode "say" ["-v", name] s
#elif OS == 2
    (code,_,errs) <- readProcessWithExitCode "espeak" ["-v", name] s
#else
    let code = ExitFailure 3
        errs = "No voiced output"
#endif
    case code of
        ExitSuccess -> return ()
        e           -> putStrLn $ "Error when speaking: " ++ show e ++ errs



