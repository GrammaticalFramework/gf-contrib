{-# LANGUAGE GADTs #-}

module Relation2XML where

import AbsXML

import qualified Relation as R
import qualified Algebra as A

import Data.List
import Data.Char (isSpace)
import qualified Data.Map as M

type Id = R.Id --- = String

env2document :: Id -> A.Env -> Document
env2document name env = database2document name [it | it <- M.assocs (A.tables env)]

-- conversion from tables to XML

database2document :: Id -> [(Id,R.Table)] -> Document
database2document name tables = DXML
   HVersion
   (DTDDecl id defs)
   (ETag (STTag id []) (concat elems) (ETTag id))
  where
   id = Ident name
   defs = docClause : concat dtds
   (dtds,elems) = unzip $ map (uncurry (table2xml False)) tables
   docClause = DElement id (RStar (foldl1 RAlt [RIdent e | DElement e _ <- concat dtds]))

-- for each table, create one element type, and for each tuple, an element of that type
table2xml :: Bool -> Id -> R.Table -> ([Definition], [Element])
table2xml qualif tname table = (
  [
   DElement tid REmpty,                                             --- all data is in attributes
   DAttlist tid [AAttr (Ident a) ACData ReqRequired | a <- labels]  ---- TODO ID, IDREF
  ],
  [
   EEmpty (ETEmpty tid [AValue (Ident a) (unqValue v) | (a,v) <- zip labels tuple])
     | tuple <- R.tdata table 
  ]
  )
 where
   tid = Ident tname
   labels = [if qualif then (tname ++ "_" ++ l) else l | l <- R.tlabels table]
   unqValue v = case v of
     R.VString s -> s -- to remove ' quotes
     _ -> R.prValue v
