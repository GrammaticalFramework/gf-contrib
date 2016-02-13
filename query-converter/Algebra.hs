module Algebra where

import Relation
import Data.List
import Data.Char
import qualified Data.Map as M
import AbsRelAlgebra
import PrintRelAlgebra

--------------

prRel :: Rel -> String
prRel = unwords . lines . printTree -- remove newlines due to latex braces

prRelLatex :: Rel -> String
prRelLatex = unlines . map mkLine . zip [0..] . splitToLines [] . concatMap words . lines . printTree 
 where
  splitToLines l s = case s of   -- split at each operator
    o : ws | operator o -> (if null l then [] else [unwords (reverse l)]) ++ splitToLines [o] ws
    w : ws | ident w    -> splitToLines (mbox w:l) ws
    w : ws              -> splitToLines (w:l) ws
    _                   -> [unwords (reverse l)]
  operator o = elem o ["(\\sigma_{","(\\pi_{","(\\rho_{","(\\gamma_{","(\\tau_{","(\\delta"]
  ident w = length w > 1 && (isLetter (head w) || head w == '(' && ident (tail w))
  mbox w = "\\mbox{" ++ w ++ "}"
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
  RSelect cond rel     -> let tab = (evalRel env rel) in select (evalCond tab cond) tab ---- TODO: push select lower
  RProject exps rel    -> genProject [(\tab t -> evalExp tab t e, printTree e) | e <- exps] (evalRel env rel)
  RRename ren rel      -> let tab = (evalRel env rel) in rename (evalRenaming tab ren) tab 
  RCartesian rela relb -> cartesian (evalRel env rela) (evalRel env relb)      -- assumes names are distinct
  RUnion rela relb     -> Relation.union (evalRel env rela) (evalRel env relb)
  RIntersect rela relb -> Relation.intersect (evalRel env rela) (evalRel env relb)
  RExcept rela relb    -> Relation.subtract (evalRel env rela) (evalRel env relb)
  RJoin rela relb      -> naturalJoin (evalRel env rela) (evalRel env relb)
  RThetaJoin ra cnd rb -> let tab = cartesian (evalRel env ra) (evalRel env rb) in select (evalCond tab cnd) tab ---- TODO: push select
  RSort ids rel        -> sortby (map ident2id ids) (evalRel env rel)
  RDistinct rel        -> distinct (evalRel env rel)
  RGroup ids ags rel   -> groupAggregate (map ident2id ids) (map evalAggregation ags) (evalRel env rel)

evalRenaming :: Table -> Renaming -> [Id]
evalRenaming rel ren = case ren of
  RRelation r      -> map (qualify (ident2id r)) (attributes rel) -- qualify all names  ---- no change of rel name
  RAttributes r ls -> map ident2id ls                 -- all attributes must be changed ---- no change of rel name
  RReplace a0 b0   -> let [a,b] = map ident2id [a0,b0] in map (\x -> if x==b then a else x) (attributes rel)   -- rename one attr

evalAggregation :: Aggregation -> ([Value] -> Value, (Id,Id))
evalAggregation (AgFun fun arg exp) = case (fun,exp) of
  (_,EIdent val) -> (evalFunction fun, (ident2id arg,ident2id val))
  _ -> (evalFunction fun, (ident2id arg,  printTree exp)) ---- can only be EAggr

evalFunction :: Function -> [Value] -> Value
evalFunction f = case f of
  FAvg -> avgAggr
  FSum -> sumAggr
  FMax -> maxAggr
  FMin -> minAggr
  FCount -> countAggr

selectl :: Cond -> Table -> Table
selectl cond t = select (evalCond t cond) t

evalCond :: Table -> Cond -> Tuple -> Bool
evalCond tb c t = case c of
  CAnd a b -> evalCond tb a t && evalCond tb b t
  COr  a b -> evalCond tb a t || evalCond tb b t
  CNot a   -> not (evalCond tb a t)
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
  EQIdent q i -> lookTupleValue (tindex tb) t (ident2id i) ---- qualify?
--  EFloat d
  EAggr fun id -> case (fun,id) of
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


