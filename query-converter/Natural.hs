module Natural where

import Relation
import Data.List
import qualified Data.Map as M
import AbsRelAlgebra
import PrintRelAlgebra
import Design (uncamel)

queryRel :: Rel -> String
queryRel r = unwords $ ["show", "me"] ++ transRel r

-- invariant: transRel produces a plural CN, because table names are ones 
transRel :: Rel -> [String]
transRel r = case r of
  RTable i             -> ["all"] ++ cnIdent i
  RSelect cond rel     -> tr rel ++ ["where"] ++ transCond cond
  RProject exps rel    -> conj (map transExp exps) ++ ["of"] ++ tr rel
  RRename ren rel      -> tr rel ----
  RCartesian rela relb -> tr rela ++ ["and"] ++ tr relb
  RUnion rela relb     -> ["all","objects","that","are"]        ++ tr rela ++ ["or"] ++ tr relb
  RIntersect rela relb -> ["all","objects","that","are","both"] ++ tr rela ++ ["and"] ++ tr relb
  RExcept rela relb    -> ["all","objects","that","are"]        ++ tr rela ++ ["but","not"] ++ tr relb
  RJoin rela relb      -> ["objects","that","are","combined","from"] ++ tr rela ++ ["and"] ++ tr relb
  RThetaJoin ra cnd rb -> tr ra ++ ["and"] ++ tr rb ++ ["such","that"] ++ transCond cnd 
  RSort ids rel        -> tr rel ++ ["ordered","by"] ++ conj (map npIdent ids)
  RDistinct rel        -> ["all","distinct","objects","among"] ++ tr rel
  RGroup ids ags rel   -> conj (map plnpIdent ids ++ map transAggregation ags) ++ ["of"] ++ tr rel
 where
  tr = transRel

-- singular NP
transAggregation :: Aggregation -> [String]
transAggregation (AgFun fun arg _) = case arg of
  Ident "*" -> ["the"] ++ transFunction fun
  _ -> ["the"] ++ transFunction fun ++ ["of"] ++ plnpIdent arg

-- singular NP
npIdent :: Ident -> [String]
npIdent (Ident x) = ["the"] ++ uncam x

-- plural NP
plnpIdent :: Ident -> [String]
plnpIdent (Ident x) = ["the"] ++ plural (uncam x)

-- singular CN
cnIdent :: Ident -> [String]
cnIdent (Ident x) = uncam x

-- plural CN
plcnIdent :: Ident -> [String]
plcnIdent (Ident x) = plural (uncam x)

-- singular CN
transFunction :: Function -> [String]
transFunction f = case f of
  FAvg -> ["average"]
  FSum -> ["sum"]
  FMax -> ["maximum"]
  FMin -> ["minimum"]
  FCount -> ["number"]

-- S
transCond :: Cond -> [String]
transCond c = case c of
  CAnd a b -> transCond a ++ ["and"] ++ transCond b
  COr  a b -> transCond a ++ ["and"] ++ transCond b
  CNot a   -> ["it is not the case that"] ++ transCond a
  CEq x y  -> transExp x ++ ["is"] ++ transExp y
  CNEq x y -> transExp x ++ ["is not"] ++ transExp y
  CLt x y  -> transExp x ++ ["is less than"] ++ transExp y
  CGt x y  -> transExp x ++ ["is greater than"] ++ transExp y
  CLike x y -> transExp x ++ ["is like"] ++ transExp y ----

transExp :: Exp -> [String]
transExp e = case e of
  EInt i -> [show i]
  EString s -> [s]
  EIdent l -> npIdent l
--  EFloat d
--  EAggr fun id
  EAdd x y -> ["the sum of"] ++ transExp x ++ ["and"] ++ transExp y
--  ESub x y
--  EMul x y
--  EDiv x y

conj = concat . intersperse ["and"] ----

uncam = words . uncamel 

--- "smart paradigm"
plural ws = case ws of
  n:"of":xs -> plural [n] ++ ["of"] ++ xs
  _ -> init ws ++ [pl (last ws)]
 where
   pl w = case reverse w of
     's':_ -> w ++ "es"
     'y':v:_ | elem v "aeou" -> w ++ "s"
     'y':cs -> init w ++ "ies"
     _ -> w ++ "s"

