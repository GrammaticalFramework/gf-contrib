module QConvCGI where
import qualified Control.Exception as E
import Data.Typeable(cast)
import Network.CGI
import System.Process(readProcess)
import System.Environment(getEnv,setEnv)
import qualified Codec.Binary.UTF8.String as UTF8 (encodeString,decodeString)

import Design
import Fundep(prRelationInfo,pRelation,prNormalizations)
import SQLCompiler(initSEnv,transQuery)
import MinSQL(parseQuery,printSQL)
import OptimizeAlgebra(pushSelect)
import Algebra(prRelHtml)
import AlgebraTree(prRelTree)
import ErrM(Err(..))

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
                outputHTML $
                  h3 "E-R diagram" ++ svg ++
                  h3 "Database schema" ++
                  pre_cls "schema" (prSchema (erdiagram2schema SER e)) ++
                  h3 "In English (not necessarily perfect)"++
                  bullets "schema" (lines (erdiagram2text e))
      "nf" -> do src <- getRequiredInput "file"
                 let erel = pRelation (lines src)
                 case erel of
                   Right msg -> outputHTML msg
                   Left rel ->
                     outputHTML $
                       h3 "Dependencies and keys" ++
                       pre_cls "nf" (prRelationInfo rel) ++
                       unlines [h3 hdr ++pre_cls "nf" txt | (hdr,txt)<-prNormalizations rel]
      "a" -> do src <- getRequiredInput "file"
                alg2html initSEnv src
                             
      "hello" -> outputPlain "Hello!\n"
      _ -> outputError 400 "Bad request" ["Unknown command: "++cmd]

alg2html env src =
  case parseQuery src of
    Bad e -> outputHTML (pre_cls "error" e)
    Ok c -> do let rel = transQuery c
                   orel = pushSelect env rel
                   cs = printSQL c
                   h = prRelHtml rel
                   oh = prRelHtml orel
                   dot = prRelTree rel
               svg <- liftIO $ readProcess "dot" ["-Tsvg"] dot
               outputHTML $
                 h3 "Source" ++ pre_cls "sql" cs ++
                 h3 "Original query" ++ div_cls "relalg" h ++
--                 h3 "Optimized query" ++ div_cls "relalg" oh ++
                 h3 "Tree diagram for original query" ++ svg

getRequiredInput name = maybe (missing name) return =<< getTextInput name

getTextInput name = fmap UTF8.decodeString <$> getInput name

----

bullets c = wrap_cls "ul" c . unlines . map ("<li>"++)

h3 = wrap "h3"
pre = wrap "pre"
pre_cls = wrap_cls "pre"
div_cls = wrap_cls "div"

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

-- * CGI output utilities

outputHTML :: String -> CGI CGIResult
outputHTML = outputText "text/html; charset=utf-8"

outputPlain :: String -> CGI CGIResult
outputPlain = outputText "text/plain; charset=utf-8"

outputText ct x = do setHeader "Content-Type" ct
                     output (UTF8.encodeString x)
