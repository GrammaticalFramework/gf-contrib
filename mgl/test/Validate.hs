module Validate where
import Data.Map (keys, elems)
import Treebank
import Text.JSON
import Editor (eqLin) -- hiding (doEdit)
import PGF



--
-- Validate command
--

-- type Checking = TreebankEntry -> Bool


type Test = (TreebankEntry -> Bool, Char, String)

check :: TreebankEntry -> [Test] -> [(Char,String)]
check tbe tests = [(c,err) | (p,c,err) <- tests, not (p tbe)]




validate :: PGF -> [ISOLang] -> Maybe Int -> TreebankEntry -> [(Char,String)]
validate pgf langs rev t = check t allTests
  where
     allTests = duplicateTest:(map hasLangTest langs ++
                               map (\l -> eqLinTest pgf (Sel (l,rev))) langs)


-- Tests

hasLangTest :: ISOLang -> Test
eqLinTest :: PGF -> CSSelector -> Test
duplicateTest :: Test

hasLangTest l = (hasLang, 'C', "No '" ++ l ++ "' concrete")
  where hasLang (T _ m) = l `elem` (keys m)

eqLinTest pgf sel@(Sel (l,_)) = (eqLin pgf sel, 'L', "Linearization different from concrete for " ++ l)

duplicateTest = (nonDup, 'D', "Duplicate changesets")
  where nonDup (T _ m) = all nonDupRevision (elems m)
        nonDupRevision css = all (==1) $ map length $ groupByField revision css



{-
--
-- Diff command 
--
		


doPurge [inPath,outPath] = do
    TB (base,ts) <- readTB inPath
    let ts' = map purge ts
        tb' = TB (base,ts')
    putStrLn $ "Purged " ++ show (length ts) ++ " entries"
    savePrettyTB tb' outPath
    return True


doEdit args = do
    (opts,[inPath]) <- compileOpts "edit" [pathOpt, langOpt] args
    TB (base,tb) <- readTB inPath
    Just pgfPath <- completePath opts base
    pgf <- readPGF pgfPath
    let sel = getSelector opts
        false = const False
        contains p = isInTree (mkCId p)
        (fpred,out) = case args of
                    []           -> (false, Nothing)
                    [outPath]    -> (false, Just outPath)
                    [p, "-"]     -> (contains p, Nothing)
                    [p, outPath] -> (contains p, Just outPath)
    tb' <- inspectAll pgf sel fpred tb
    case out of
        Just path -> savePrettyTB (TB (base,tb')) path
        Nothing   -> putStrLn $ pp_treebank (TB (base,tb'))
    return True

doLinearize args = do
    (opts,inPath:args') <- compileOpts "linearize" [pathOpt,langOpt,revOpt] args
    TB (base,ts) <- readTB inPath
    Just pgfPath <- completePath opts base
    pgf <- readPGF pgfPath
    let lang:_ = languages opts
        sel = case beforeRevision opts of
                Nothing -> Sel lang 0
                Just r  -> Sel lang r 
        newTB = let
                        ts' = map (insertLin pgf lang rev) ts
                in TB (base,ts')
        save = case args' of
                []        -> putStrLn . pp_treebank
                [outPath] -> (\tb -> savePrettyTB tb outPath)
    save newTB
    putStrLn $ show (length ts) ++ " linearized."
    return True


doMaxParameter param [mValue,inPath] = do
    TB (base,ts) <- readTB inPath
    let mv = read mValue
        ts' = filter ((>mv) . param) ts
    mapM_ (putStrLn . show) ts'





doEdit, doLinearize, doValidate, doDiff, doPurge, doEmit :: [String] -> IO Bool
doMaxParameter :: (TreebankEntry -> Int) -> [String] -> IO ()



-}