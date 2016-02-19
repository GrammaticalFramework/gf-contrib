{-# LANGUAGE GADTs, KindSignatures, DataKinds #-}
module Algebra where

import Relation
import Data.List
import Data.Char
import qualified Data.Map as M
import AbsRelAlgebra
import PrintRelAlgebra
import qualified PrintKeywordRelAlgebra as KW

--------------

prRel :: Rel -> String
prRel = unwords . lines . printTree -- remove newlines due to latex braces

-- print in the keyword notation
prKeywordRel :: Rel -> String
prKeywordRel = unwords . lines . KW.printTree -- remove newlines due to latex braces

prRelLatex :: Rel -> String
prRelLatex = unlines . map mkLine . zip [0..] . splitToLines [] . concatMap words . lines . printTree 
 where
  splitToLines l s = case s of   -- split at each operator
    o : ws | operator o -> (if null l then [] else [unwords (reverse l)]) ++ splitToLines [o] ws
    w : ws | ident w    -> splitToLines (mbox w:l) ws
    w : ws              -> splitToLines (w:l) ws
    _                   -> [unwords (reverse l)]
  operator o = elem o ["\\sigma_{","\\pi_{","\\rho_{","\\gamma_{","\\tau_{"] ----,"\\delta"]
  ident w = length w > 1 && (isLetter (head w) || head w == '(' && ident (tail w))
  mbox w = w ---- "\\mbox{" ++ w ++ "}"
  mkLine (i,l) = "\\mbox{\\hspace{" ++ show (6*i) ++ "mm}} " ++ l ++ "\\\\"

ident2id :: Ident -> Id
ident2id (Ident x) = x
  
--------------

data Env = Env {
  tables     :: M.Map Id Table,
  views      :: M.Map Id Rel,
  assertions :: M.Map Id Assertion,
  triggers   :: M.Map Id Trigger
  }

type Assertion = M.Map Id Table -> Bool ----
type Trigger   = Env -> Env ----

initEnv :: Env
initEnv = Env M.empty M.empty M.empty M.empty

lookEnv :: Env -> Id -> Table
lookEnv env x = case M.lookup x (tables env) of
  Just t -> t
  _ -> case M.lookup x (views env) of
    Just v -> evalRel env v 
    _ -> error $ "table not found: " ++ x

evalRel :: Env -> Rel -> Table
evalRel env r = case r of
  RTable i             -> lookEnv env (ident2id i)
  RSelect cond rel     -> let tab = (evalRel env rel) in select (evalCond env cond tab) tab
  RProject projs rel   -> genProject (map (evalProjection env) projs) (evalRel env rel)
  RRename ren rel      -> let tab = (evalRel env rel) in rename (evalRenaming tab ren) tab 
  RCartesian rela relb -> cartesian (evalRel env rela) (evalRel env relb)      -- assumes names are distinct
  RUnion rela relb     -> Relation.union (evalRel env rela) (evalRel env relb)
  RIntersect rela relb -> Relation.intersect (evalRel env rela) (evalRel env relb)
  RExcept rela relb    -> Relation.subtract (evalRel env rela) (evalRel env relb)
  RNaturalJoin rela relb -> naturalJoin (evalRel env rela) (evalRel env relb)
  RThetaJoin ra cnd rb -> let tab = cartesian (evalRel env ra) (evalRel env rb) in select (evalCond env cnd tab) tab
  RSort sortexps rel   -> sortby (map (evalSortExp env) sortexps) (evalRel env rel)
  RDistinct rel        -> distinct (evalRel env rel)
  RGroup ids ags rel   -> groupAggregate (map ident2id ids) (map evalAggregation ags) (evalRel env rel)

evalProjection :: Env -> Projection -> (Table -> Tuple -> Value, Id)
evalProjection env p = case p of
  PExp e      -> (\tab t -> evalExp tab t (projectionExp e), printTree e)
  PRename e i -> (\tab t -> evalExp tab t (projectionExp e), ident2id i)

projectionExp :: Exp -> Exp
projectionExp e = case e of
  EAggr _ _ _ -> EIdent (Ident (printTree e))  -- just select the aggregated value, don't aggregate again
  _ -> e

evalRenaming :: Table -> Renaming -> [Id]
evalRenaming rel ren = case ren of
  RRelation r      -> map (qualify (ident2id r)) (attributes rel) -- qualify all names  ---- no change of rel name
  RAttributes r ls -> map ident2id ls                 -- all attributes must be changed ---- no change of rel name

evalAggregation :: Aggregation -> ([Value] -> Value, (Id,Id))
evalAggregation a = case a of
  ARename fun dist arg (EIdent val) -> (evalFunction fun, (ident2id arg,  ident2id val))
  ARename fun dist arg exp          -> (evalFunction fun, (ident2id arg,  printTree exp)) --- can only be EAggr
  AApp    fun dist arg              -> (evalFunction fun, (ident2id arg,  printTree (EAggr fun dist arg))) ---- TODO: interpret dist 
  
evalFunction :: Function -> [Value] -> Value
evalFunction f = case f of
  FAvg -> avgAggr
  FSum -> sumAggr
  FMax -> maxAggr
  FMin -> minAggr
  FCount -> countAggr

evalCond :: Env -> Cond -> Table -> Tuple -> Bool
evalCond env c tb t = case c of
  CAnd a b -> evalCond env a tb t && evalCond env b tb t
  COr  a b -> evalCond env a tb t || evalCond env b tb t
  CNot a   -> not (evalCond env a tb t)
  CEq x y  -> evalExp tb t x == evalExp tb t y
  CNEq x y -> evalExp tb t x /= evalExp tb t y
  CLt x y  -> evalExpInt tb t x < evalExpInt tb t y
  CGt x y  -> evalExpInt tb t x > evalExpInt tb t y
  CLike x y -> matchLike (evalExpString tb t x) (evalExpString tb t y)

evalExp :: Table -> Tuple -> Exp -> Value
evalExp tb t e = case e of
  EInt i    -> VInt i
  EFloat i  -> VFloat i
  EString s -> VString s
  EIdent l  -> lookTupleValue (tindex tb) t (ident2id l) 
  EQIdent q i -> lookTupleValue (tindex tb) t (qualify (ident2id q) (ident2id i)) ----
--  EFloat d
  EAggr fun dist id -> case (fun,id) of  ---- TODO: interpret dist
    (FCount, Ident "*") -> countAggr $ tdata tb  -- COUNT(*) special case
    _ -> aggregate (evalFunction fun) (ident2id id) tb
  EAdd x y -> case (eval x, eval y) of
    (VInt m, VInt n) -> VInt (m+n)
    _ -> VError $ "illegal addition " ++ show e
--  ESub x y
--  EMul x y
--  EDiv x y
 where
  eval = evalExp tb t

evalExpInt :: Table -> Tuple -> Exp -> Integer
evalExpInt tb t e = case evalExp tb t e of
  VInt i -> i
  v -> error $ "not an integer value " ++ show v

evalExpString :: Table -> Tuple -> Exp -> String
evalExpString tb t e = case evalExp tb t e of
  VString s -> s
  v -> error $ "not a string value " ++ show v

evalSortExp :: Env -> SortExp -> (Table -> Tuple -> Value, Bool)
evalSortExp env se = case se of
  SEAsc e  -> (\tb t -> evalExp tb t e, False) -- the default
  SEDesc e -> (\tb t -> evalExp tb t e, True)
  


-- string matching

matchLike :: String -> String -> Bool
matchLike str patt = case (str,patt) of
  (c:cs, d:ds) | c==d -> matchLike cs ds
  (c:cs, '_':ds)      -> matchLike cs ds
  (c:cs, '[':ds)      -> case break (==']') ds of 
                           (m:a:'-':b:[],_:ds2) | elem m "!^" -> notElem c [a..b] && matchLike cs ds2 -- [!a-b]ds2  ---- can we have [a-chij] ?
                           (  a:'-':b:[],_:ds2)               -> elem    c [a..b] && matchLike cs ds2 -- [a-b]ds2
                           (m:ds1,_:ds2) | elem m "!^"        -> notElem c ds1    && matchLike cs ds2 -- [!abc]ds2
                           (ds1,_:ds2)                        -> elem    c ds1    && matchLike cs ds2 -- [abc]ds2
                           (_,  [])                           -> c == '['         && matchLike cs ds  -- [ds2, no closing bracket ---- is this allowed?
  (_,    '%':ds)      -> any (\s -> matchLike s ds) (tails str) ---- can be inefficient
  ([],[])             -> True
  _                   -> False 


