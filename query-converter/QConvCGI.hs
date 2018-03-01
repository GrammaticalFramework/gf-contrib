module QConvCGI where
import qualified Control.Exception as E
import Control.Monad((<=<))
import Control.Monad.Writer(runWriter)
import Control.Monad.Except(runExceptT)
import Data.Typeable(cast)
import Network.CGI
import System.Process(readProcess)
import System.Environment(getEnv,setEnv)
import qualified Codec.Binary.UTF8.String as UTF8 (encodeString,decodeString)
import Data.List(isPrefixOf)
import Design
import Fundep(prRelationInfo,pRelation,prNormalizations,prOtherNormalizations)
import SQLCompiler(initSEnv,transQuery,transScript')
import Relation2XML(env2document)
import ValidateXML(printXML,parseDocument,validateDocument)
import XPath(parseXPath,prXPValue,queryXPath)
import MinSQL(parseQuery,parseScript,printSQL)
import OptimizeAlgebra(pushSelect)
import Algebra(prRelHtml,fmtRelHtml)
import AlgebraTree(prRelTree)
import ErrM(Err(..))

main = runCGI $ handleErrors $ handleCGIErrors $
                do liftIO fixPath
                   qconvCGI =<< getRequiredInput "command"
  where    fixPath = setEnv "PATH" . ("/usr/local/bin:"++) =<< getEnv "PATH"

qconvCGI cmd =
  case cmd of
    "d" -> design2html =<< getFile
    "nf" -> normalizations2html prNormalizations =<< getFile
    "enf"-> normalizations2html prOtherNormalizations =<< getFile
    "a" -> alg2html initSEnv =<< getFile
    "i" -> do src <- getFile
              queryResults <- getChecked "queryResults"
              xmlDocument <- getChecked "xmlDocument"
              outputHTML $ runSqlInterpreter src queryResults xmlDocument
    "ix" -> do outputErr (\_->outputHTML (wrap_cls "b" "valid" "Valid"))
                         =<< getXMLFile
    "xp" -> do q <- parseXPath <$> getRequiredInput "query"
               r <- fmap (:[]) <$> getXMLFile
               outputErr (outputHTML . pre_cls "output" . prXPValue)
                         (queryXPath <$> q <*> r)
    "hello" -> outputPlain "Hello!\n"
    _ -> outputError 400 "Bad request" ["Unknown command: "++cmd]

design2html src =
  do let e = parseER src
         dot = prERDiagram e
     svg <- liftIO $ readProcess "fdp" ["-Tsvg"] dot
     outputHTML $
       h3 "E-R diagram" ++ svg ++
       h3 "Database schema" ++
       pre_cls "schema" (prSchema (erdiagram2schema SER e)) ++
       h3 "In English (not necessarily perfect)"++
       bullets "schema" (lines (erdiagram2text e))

normalizations2html prNormRel src =
  case pRelation (lines src) of
    Right msg -> outputHTML msg
    Left rel ->
      outputHTML $
        h3 "Dependencies and keys" ++
        pre_cls "nf" (prRelationInfo rel) ++
        unlines [h3 hdr ++pre_cls "nf" txt | (hdr,txt)<-prNormRel rel]

alg2html env src = outputErr ok (parseQuery src)
  where
    ok c =  do let rel = transQuery c
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

runSqlInterpreter src queryResults xmlDocument =
    case parseScript src of
      Bad e  -> e
      Ok sql -> optional queryResults results ++
                either (wrap_cls "span" "error") outputXML r
        where
          results =
            h3 "SQL interpreter output" ++
            div_cls "output" (unlines (tablesToHTML ls))

          (r,ls0) = runWriter . runExceptT $ transScript' initSEnv sql
          ls = lines (unlines ls0)

          outputXML senv =
              optional xmlDocument $
              h3 "XML representation of final database" ++
              pre_id_cls "xmlOutput" "output" (plain2html (printXML xml))
            where
              xml = env2document "QConvData" senv

tablesToHTML [] = []
tablesToHTML ("":ls) = "<p>":tablesToHTML ls
tablesToHTML (l:ls)
    | "##" `isPrefixOf` l = h4 (plain2html (drop 2 l)):tablesToHTML ls
    | "|" `isPrefixOf` l =
        case span (isPrefixOf "|") ls of
          (ls1,ls2) -> table (l:ls1):tablesToHTML ls2
    | otherwise = fmtRelHtml l:tablesToHTML ls
  where
   table = wrap_cls "table" "table" . concatMap row
   row s = "\n<tr>"++concatMap cell s
   cell '|' = "<td>"
   cell c = [c]

----

outputBad e = outputHTML (pre_cls "error" (plain2html e))

outputErr ok err = handleErr err outputBad ok

handleErr err bad ok =
  case err of
    Bad e -> bad e
    Ok x -> ok x

----

getXMLFile = (validateDocument <=< parseDocument) <$> getFile
 
getFile = getRequiredInput "file"

getRequiredInput name = maybe (missing name) return =<< getTextInput name

getTextInput name = fmap UTF8.decodeString <$> getInput name

getChecked name = (==Just "on") <$> getInput name

----

bullets c = wrap_cls "ul" c . unlines . map ("<li>"++)

h3 = wrap "h3"
h4 = wrap "h4"
pre = wrap "pre"
pre_cls = wrap_cls "pre"
pre_id_cls = wrap_id_cls "pre"
div_cls = wrap_cls "div"

wrap tag = wrap' tag tag
wrap' start end s = "<"++start++">\n"++s++"</"++end++">\n"
wrap_cls tag cls = wrap' (tag++" class="++cls) tag
wrap_id_cls tag id cls = wrap' (tag++" id="++id++" class="++cls) tag

plain2html :: String -> String
plain2html = concatMap encode
  where
    encode '<' = "&lt;"
    encode '&' = "&amp;"
    encode c   = [c]

optional b s = if b then s else ""

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
