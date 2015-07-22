{-# LANGUAGE  RecordWildCards, TupleSections #-}
module SageSide (
    SageT, Expr, SageCx(..),
    initSage,
    evaluateIn,
    localSage) where
import SageService ( evaluateBlock, SageHost(SgHt) )
import IPython ( Expr, Variable, Dict(Dict) )
import Control.Monad.State.Strict
import qualified Data.Map as M
import Data.Maybe ( catMaybes, listToMaybe )
import Data.List ( intercalate )


load :: String -> Expr
load  path =  "load " ++ (fullpath path) 
  where
        fullpath p = "SAGE_ROOT + '/devel/sage/sage/" ++ p ++ "'"


data SageCx = SageCx {
    host :: String,
    sverbosity :: Int }


type SageEnv = Maybe String
type SageState a = State SageEnv a -- Stack of environments: Top is most recent.
type SageT = StateT SageEnv IO

initSage :: SageEnv
withHost :: SageCx -> [Expr] -> SageT [Expr]
evaluateIn :: SageCx -> Expr ->  SageT (Maybe Expr)

initSage = Nothing -- no stored GfContext 

evaluateIn sage expr = do
    results <- withHost sage [expr]
    return $ listToMaybe (reverse results)

withHost SageCx{..} exprs = do
        mEnv <- get
        let pre = case mEnv of
                Nothing -> loadExp:exprs
                Just env -> loadExp:insertEnv env:exprs
            cmds = pre ++ [extractEnv]
        resps <- lift $ evaluateBlock sageCx cmds
        if null resps
            then error $ "Evaluation of " ++ show exprs ++ " failed"
            else do
                put $ Just (last resps)
                return $ filter (/="None") (init resps)
  where
    sageCx = case break (==':') host of
        (h,':':p) -> SgHt h (Just $ read p) "none"
        (h,"")    -> SgHt h Nothing "none"
    loadExp = load "nlgf/prelude.sage"
    insertEnv env = "GfContext.restore(" ++ env ++ ")"
    extractEnv = "GfContext.save()"


localSage :: SageCx
localSage = SageCx  "localhost:8888" 3


test1 :: IO ()
test1 = do
    evalStateT repl initSage
  where
    host = localSage
    repl = do
        l <- lift $ putStr "> " >> getLine
        r <- evaluateIn host l
        lift $ print r
        repl


test2 :: IO ()
test2 = do
    res <- evalStateT (mapM (withHost host) [
            ["Assign('x', '5')", "Assign('z', 'x + 1')"],
            ["Assign('y', 'factorial(z)')"],
            ["Compute('y', 'Num')"]]) initSage
    print res
    -- mapM_ (\s -> putStrLn $ "Got " ++  s) res
  where
    host = localSage
        
    

