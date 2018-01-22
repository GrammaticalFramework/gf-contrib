module QConvCGI where
import qualified Control.Exception as E
import Data.Typeable(cast)
import Network.CGI
import Design
import System.Process(readProcess)
import System.Environment(getEnv,setEnv)

main = runCGI $ handleErrors $ handleCGIErrors $
                do liftIO fixPath
                   qconvCGI =<< getRequiredInput "command"
  where
    fixPath = setEnv "PATH" . ("/usr/local/bin:"++) =<< getEnv "PATH"

qconvCGI cmd =
    case cmd of
      "d" -> do src <- getRequiredInput "file"
                let dot = prERDiagram (parseER src)
                svg <- liftIO $ readProcess "fdp" ["-Tsvg"] dot
                setHeader "Content-Type" "image/svg+xml"
                output svg
      "hello" -> do setHeader "Content-Type" "text/plain"
                    output "Hello!\n"
      _ -> outputError 400 "Bad request" ["Unknown command: "++cmd]


getRequiredInput name = maybe (missing name) return =<< getInput name


--------------------------------------------------------------------------------
-- * General CGI Error exception mechanism

data CGIError = CGIError { cgiErrorCode :: Int,
                           cgiErrorMessage :: String,
                           cgiErrorText :: [String] }
                deriving Show

instance E.Exception CGIError where
  toException e = E.SomeException e
  fromException (E.SomeException e) = cast e

throwCGIError :: Int -> String -> [String] -> CGI a
throwCGIError c m t = throwCGI $ E.toException $ CGIError c m t

handleCGIErrors :: CGI CGIResult -> CGI CGIResult
handleCGIErrors x =
    x `catchCGI` \e -> case E.fromException e of
                         Nothing -> E.throw e
                         Just (CGIError c m t) -> outputError c m t

missing = badRequest "Missing parameter"
errorMissingId = badRequest "Missing identifier" ""

notFound = throw 404 "Not found"
badRequest = throw 400

throw code msg extra =
    throwCGIError code msg [msg ++(if null extra then "" else ": "++extra)]
