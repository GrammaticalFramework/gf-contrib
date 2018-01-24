module QConvCGI where
import qualified Control.Exception as E
import Data.Typeable(cast)
import Network.CGI
import System.Process(readProcess)
import System.Environment(getEnv,setEnv)

import Design
import Fundep(prRelationInfo,pRelation,prNormalizations)

main = runCGI $ handleErrors $ handleCGIErrors $
                do liftIO fixPath
                   qconvCGI =<< getRequiredInput "command"
  where
    fixPath = setEnv "PATH" . ("/usr/local/bin:"++) =<< getEnv "PATH"

qconvCGI cmd =
    case cmd of
      "d" -> do src <- getRequiredInput "file"
                let e = parseER src
                    dot = prERDiagram e
                svg <- liftIO $ readProcess "fdp" ["-Tsvg"] dot
                setHeader "Content-Type" "text/html"
                output $
                  h3 "E-R diagram" ++ svg ++
                  h3 "Database schema" ++
                  pre_cls "schema" (prSchema (erdiagram2schema SER e)) ++
                  h3 "In English (not necessarily perfect)"++
                  bullets "schema" (lines (erdiagram2text e))
      "nf" -> do src <- getRequiredInput "file"
                 let rel = pRelation (lines src)
                 setHeader "Content-Type" "text/html"
                 output$
                   h3 "Dependencies and keys" ++
                   pre_cls "nf" (prRelationInfo rel) ++
                   unlines [h3 hdr ++pre_cls "nf" txt | (hdr,txt)<-prNormalizations rel]
      "hello" -> do setHeader "Content-Type" "text/plain"
                    output "Hello!\n"
      _ -> outputError 400 "Bad request" ["Unknown command: "++cmd]


getRequiredInput name = maybe (missing name) return =<< getInput name

----

bullets c = wrap_cls "ul" c . unlines . map ("<li>"++)

h3 = wrap "h3"
pre = wrap "pre"
pre_cls = wrap_cls "pre"

wrap tag s = "<"++tag++">\n"++s++"</"++tag++">\n"
wrap_cls tag cls s = "<"++tag++" class="++cls++">\n"++s++"</"++tag++">\n"

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
