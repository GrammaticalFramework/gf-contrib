module Main where

import TreeConv
import Translate
import GetConfig
import PGF
import qualified Data.Set as S
import Data.List
import System.Environment (getArgs)
import System.Timeout

-- arguments and options:
help = unlines [
  "Usage: ud2gf <opts> <conll-file>",
  " -N<int>   -- max number of trees analysed, default no limit",
  " -G<file>  -- grammar file, default 'UDTranslate.pgf', based on RGL with wide-coverage extensions",
  " -C<files> -- configuration files, comma-separated, default 'UDTranslate.labels', mapping UD to RGL",
  " -L<file>  -- read lexicon from file, default 'pgf' i.e. build from the grammar",
  " -l<lang>  -- source language (ISO-3 code), default Eng",
  " -k<int>   -- kill: max number of trees considered per sentence, default no limit",
  " -t<int>   -- timeout: max number of milliseconds per sentence, default no limit",
  " -a<int>   -- max number of raw abstract trees shown per sentence, default no limit",
  " -g<int>   -- max number of GF trees shown per sentence, default no limit",
  " -D<disp>  -- display: what is shown (default sdagt):",
  "               s -- source sentence",
  "               c -- conll tree verbatim",
  "               r -- dependency tree structured, now annotations",
  "               d -- dependency tree, no annotations, showing parser coverage",
  "               a -- dependency tree, annotated with GF lexical functions",
  "               m -- dependency tree, annotated with GF trees",
  "               f -- dependency tree, no annotations, showing interpreter converage",
  "               g -- abstract syntax tree, GF",
  "               t -- translations to languages covered",
  "               i -- statistics of interpreter coverage per tree",
  "               n -- global statistics of coverage",
  "Example of a reasonable call:",
  "  ud2gf -N1000 -lEng -t2000 -a1 -g1 -Dsaifgtn fi-ud-test.conllu",
  "Without the <conll-file> argument, ud2gf reads standard input."
  ]

main = do
  opts <- getArgs
  case opts of
    [] -> putStrLn help
    _ | elem opts [["help"],["-help"],["--help"],["-h"]] -> putStrLn help
    _ -> do
      s <- case filter ((/='-') . head) opts of
             file:_ -> readFile file
             _ -> getContents
      testConv opts s

configFile = "UDTranslate.labels"
grammarFile = "UDTranslate.pgf"

testConv :: [String] -> String -> IO ()
testConv opts = testConvOpt tot gram config dict lang timout kill num gnum disp where
  tot     = optn 'N' 
  lang    = opt  'l' "Eng"
  dict    = opt  'L' "pgf"
  gram    = opt  'G' grammarFile
  config  = opt  'C' configFile
  timout  = optn 't' 
  kill    = optn 'k' 
  num     = optn 'a' 
  gnum    = optn 'g' 
  disp    = opt  'D' "sdagtn"

  opt c v = case [u | '-':k:u <- opts, k==c] of
    u:_ -> u
    _   -> v
  optn c = case [u | '-':k:u <- opts, k==c] of
    u:_ -> Just ((read u) :: Int)
    _   -> Nothing

testConvOpt :: Maybe Int -> FilePath -> FilePath -> String -> Lang -> Maybe Int -> Maybe Int -> Maybe Int -> Maybe Int -> String -> String -> IO ()
testConvOpt tot gram confs dic lang timout kill num gnum opts s = do
  mpgf   <- if any (flip elem "gt") opts then readPGF gram >>= return . Just else return Nothing
  config <- getConfiguration (words (map (\c -> if c==',' then ' ' else c) confs)) mpgf  -- comma-sep file names
  dict <- if elem 'g' opts
          then case dic of
            "pgf" -> return $ pgfDictionary config (maybe (error "no pgf") id mpgf) lang 
            _ -> getDictionary dic lang
          else return emptyDictionary
  let mfuns = maybe Nothing (return . S.fromList . PGF.functions) mpgf
  let ss  = getSentences (lines s)
  let css = maybe ss (\n -> take n [ss !! i | i <- [1, max 2 (div (length ss) n)..]]) tot -- take every #s/n to get a more balanced distribution
  gcs <- mapM (\ (i,s) -> print i >> testConvSentence lang mpgf mfuns config dict timout kill num gnum opts s) (zip [1..] css)
  let ave  =  round $ sum [(100*(fromIntegral c) :: Double) / ((fromIntegral g) :: Double)  | (g,c,_,_,_)  <- gcs] / fromIntegral (length css)
  let mave =  round $ sum [(100*(fromIntegral ti) :: Double) / ((fromIntegral g) :: Double) | (g,c,ti,_,_) <- gcs] / fromIntegral (length css)
  let nave =  round $ sum [(100*(fromIntegral ni) :: Double) / ((fromIntegral g) :: Double) | (g,c,ti,ni,_) <- gcs] / fromIntegral (length css)
  let sents = length gcs
  let compls  = length [() | (g,c,_,_,_) <- gcs, c==g]
  let mcompls = length [() | (g,c,i,_,_) <- gcs, i==g]
  let ncompls = length [() | (g,c,i,ni,_) <- gcs, ni==g]
  let timeouts = length [() | (_,_,_,_,(True,_)) <- gcs]
  let killeds  = length [() | (_,_,_,_,(False,True)) <- gcs]
  let timeout_N = if timeouts==1 then " timeout " else " timeouts " -- ;-)
  if elem 'n' opts
     then putStrLn $ unwords [
        show ave ++ "% nodes parsed",
        show mave ++ "% nodes interpreted",
        show nave ++ "% children intepreted",
        show sents ++ " sentences",
        show compls ++ " completely parsed",
        show mcompls ++ " completely interpreted",
        show ncompls ++ " children completely interpreted",
        show timeouts ++ timeout_N ++ show killeds ++ " truncated"
        ]
     else return ()

-- testConvSentence (Just 23) "scdatn" means returning max 23 trees
-- and showing both sentence s, conll tree c, dep tree d, ast a, gftree g, translation t ;
-- returns the number of words given and covered; shows these with option n 
testConvSentence :: Lang -> Maybe PGF -> Maybe (S.Set CId) -> Configuration -> Dictionary -> Maybe Int -> Maybe Int -> Maybe Int -> Maybe Int -> String -> [String] -> IO (Int,Int,Int,Int,(Bool,Bool))
testConvSentence lang mpgf mfuns config dict timout kill num gnum opts s = ifTimeOut $ do

-- use a GF grammar if one was read from a pgf file
  let pgf  = maybe undefined id mpgf  -- only used if option t is present
  let funs = maybe undefined id mfuns -- only used if option t is present

-- turn conll notation to structured dependency tree
  let sent = unwords $ map ((!!1) . words) s
  let dep  = conll2deptree $ unlines s

-- form AbsTree, which at this point is just a dep tree annotated with GF trees and categories
  let (asts,killed) = ([deptree2abstreeLex config dict dep], False)

-- select the best AbsTree, in terms of how much they cover of the original nodes
  let sts  = sortByNodesUsed asts
  let csts = maybe sts (\n -> take n sts) num
  let given = length s

--- this is no longer interesting, because all nodes are covered except at timeout, which is rare
---  let bestnodes = if null csts then [] else nodesUsed (head csts)
---  let covered = length bestnodes
-- annotate the dep tree with "**" for nodes that are not covered
---  let covereddep = mapTree (\dn -> if elem (position dn) bestnodes then dn else (dn{status="**"})) dep
  
-- iteratively annotate AbsTree with gf trees formed by applying endo- and exocentric functions
  let (mts,mkilled) = case kill of ---- same kill as for dep2abs
        Just n -> case splitAt n $ map (abstreeAnnotFuns config) csts of
                    (ats,nots) -> (ats, not (null nots))
        _ -> (map (abstreeAnnotFuns config) csts, False)
  let msts = sortByNodesUsed mts
  let mcsts = maybe msts (\n -> take n msts) gnum

-- pick the GF tree from the top of the annotated dependency tree
  let gts0 = map (abstree2gftree config) mcsts

-- compute the number of nodes covered by GF tree and marked the uncovered nodes with "**"
  let bestnodes = if null gts0 then [] else nodesUsedGen src (head gts0)
  let covered = length bestnodes
  let covereddep = mapTree (\dn -> if elem (position dn) bestnodes then dn else (dn{status = "**"})) dep 

-- compute the number of nodes covered without the help of backups and mark the uncovered nodes with "*"
  let mbestnodes = if null gts0 then [] else nodesUsedGen src (ignoreBackups (head gts0))
  let mcovered   = length mbestnodes
  let mcovereddep = mapTree (\dn -> if elem (position dn) mbestnodes then dn else (dn{status = status dn ++ "*"})) covereddep 

  let nbestnodes = if null gts0 then [] else concatMap (nodesUsedGen src) (ignoreBackupSplines (head gts0))
  let ncovered   = length nbestnodes
  let ncovereddep = mapTree (\dn -> if elem (position dn) nbestnodes then (dn{status = status dn ++ "^"}) else dn) mcovereddep

-- apply definitions to eliminate helper functions and native lexical items
  let gts1 = map (cleanupGFTree config) gts0

-- compute the list of missing functions in gf trees
  let mgts = [(gt, if elem 'g' opts then (missingFunctions funs gt) else []) | gt <- gts1] 
  let mfs = nub $ concatMap snd mgts

-- build final PGF trees
  let gts2 = gts1 ---- if elem 'g' opts then [gt | (gt,[]) <- mgts] else [] 
  let gts = map gftree2pgftree gts2

  if elem 's' opts then putStrLn $ "STRING: " ++ sent
                   else return ()
  if elem 'c' opts then putStrLn $ unlines $ "ORIGINAL CONLL:" : s
                   else return ()
  if elem 'r' opts then putStrLn $ "RAW STRUCTURED DEPTREE:\n" ++ prDepTree dep
                   else return ()
  if elem 'd' opts then putStrLn $ "STRUCTURED DEPTREE:\n" ++ prDepTree covereddep
                   else return ()
  if elem 'n' opts then putStrLn $ unwords [
                "PARSED " ++ show covered ++ " / " ++ show given,
                 if killed then "TRUNCATED" else ""
                 ]
                   else return ()
  if elem 'a' opts then putStrLn $ unlines $  "LEXICALLY ANNOTATED TREE:" : map prAbsTree csts else
                   return ()
  --if elem 'f' opts then putStrLn $ "FINAL COVERAGE OF DEPTREE:\n" ++ prDepTree mcovereddep
  --                 else return ()
  if elem 'f' opts then putStrLn $ "FINAL COVERAGE OF DEPTREE:\n" ++ prDepTree ncovereddep
                   else return ()
  if elem 'i' opts then putStrLn $ unwords [
                "INTERPRETED " ++ show mcovered ++ " / " ++ show given ++ " (N.INTERPRETED " ++ show ncovered ++ ")",
                 if mkilled then "TRUNCATED" else ""
                 ]
                   else return ()
  if elem 'm' opts then putStrLn $ unlines $ "FINAL ANNOTATED TREE:" : (map prAbsTree mcsts) else
                   return ()
  if elem 'g' opts then putStrLn $ unlines $ "GF TREES:" : map prPGFTreeLong gts else
                   return ()
  if not (null mfs) then putStrLn $ unwords $ ("UNKNOWN FUNCTIONS:": mfs) else
                   return ()
  if elem 't' opts then putStrLn $ unlines $ "LINEARIZATIONS:" : map (unlines . linTree pgf) gts else
                   return ()
  return (given,covered,mcovered,ncovered,killed)
 where
   ifTimeOut io = case timout of
     Nothing -> do
       (c,g,i,ni,k) <- io
       return (c,g,i,ni,(False,k))
     Just t -> do
       res <- timeout (t*1000) io
       case res of
         Just (c,g,i,ni,k) -> return (c,g,i,ni,(False,k))
         Nothing -> do
           if elem 's' opts then (putStrLn $ "STRING: " ++ unwords (map ((!!1) . words) s)) >> putStrLn "timed out"
                            else return ()
           return (length s,0,0,0,(True,False)) 
