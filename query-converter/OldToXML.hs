module ToXML where

import qualified Relation as R
import qualified Algebra as A

import Data.List
import Data.Char (isSpace)
import qualified Data.Map as M

type Id = R.Id --- = String

prDatabaseXML :: Id -> A.Env -> String
prDatabaseXML name env = prXDocument $ database2xdocument name [it | it <- M.assocs (A.tables env)]

-- conversion from tables to XML

database2xdocument :: Id -> [(Id,R.Table)] -> XDocument
database2xdocument name tables = XDoc 
   name
   (Just (docClause : concat dtds))
   (XE name [] (concat elems))
  where
   (dtds,elems) = unzip $
     map (uncurry (table2xml False)) tables -- don't qualify attribute names: all CDATA
   docClause = DElement name (XStar (XUnion [XId e | DElement e _ <- concat dtds]))

-- for each table, create one element type, and for each tuple, an element of that type
table2xml :: Bool -> Id -> R.Table -> ([DTDClause], [XElement])
table2xml qualif tname table = (
  [
   DElement tname XEMPTY,                               --- all data is in attributes
   DAttlist tname [(a,(CDATA,REQUIRED)) | a <- labels]  --- more distinctions possible
  ],[
   XE tname [(a, (unqValue v)) | (a,v) <- zip labels tuple] [] | tuple <- R.tdata table 
  ]
  )
 where
   labels = [if qualif then (tname ++ "_" ++ l) else l | l <- R.tlabels table]
   unqValue v = case v of
     R.VString s -> s -- to remove ' quotes
     _ -> R.prValue v

-- XML documents

data XDocument = XDoc {name :: Id, mdtd :: Maybe [DTDClause], xdata :: XElement}
  deriving Show
  --- not using DTD as arg guarantees that document name equals dtd name
  -- just one top-level element, wrapped in <name>

prXDocument :: XDocument -> String
prXDocument d = unlines $ filter (not . all isSpace) $ 
  ("<?xml version=\"1.0\" encoding=\"utf-8\" standalone=" ++ quote standalone ++ "?>") :
  maybe [] (\cls -> prDTD (DTD nam cls)) (mdtd d) ++
  prXElement (xdata d)
 where
   standalone = maybe "yes" (const "no") (mdtd d)
   nam = name d
   
-- XML elements

data XElement =
   XData String
 | XE Id [(Id,String)] [XElement]
  deriving Show

prXElement :: XElement -> [String]
prXElement = pr 0 where
  pr i e = map (indent i) $ case e of
    XData s -> [s]
    XE tag attrs [] -> [prOnlyTag tag attrs]
    XE tag attrs children ->
        prTag tag attrs :
        concatMap (pr (i+1)) children ++
        [prEndTag tag]

prTag :: R.Id -> [(R.Id,String)] -> String
prTag t ats = "<" ++ unwords (t:[x++"="++ show v | (x,v) <- ats]) ++ ">"

prEndTag t = prTag ("/" ++ t) []

prOnlyTag :: R.Id -> [(R.Id,String)] -> String
prOnlyTag t ats = "<" ++ unwords (t:[x++"="++ show v | (x,v) <- ats]) ++ " />"

indent i s = replicate (2*i) ' ' ++ s

-- DTD

data DTD = DTD {doctype :: Id, clauses :: [DTDClause]}
  deriving Show

data DTDClause =
   DElement Id XEType
 | DAttlist Id [(Id,(XAType,XAStatus))]
  deriving Show

data XEType =
   XId Id
 | XPCDATA
 | XEMPTY
 | XProduct [XEType] --- 2 or more
 | XUnion [XEType] --- 2 or more
 | XStar XEType
 | XPlus XEType
 | XOpt XEType
  deriving (Eq,Show)

data XAType = CDATA | ID
  deriving (Eq,Show) --- no pr needed

data XAStatus = REQUIRED | IMPLIED
  deriving (Eq,Show) --- no pr needed

prDTD :: DTD -> [String]
prDTD dtd = 
  ("<!DOCTYPE " ++ doctype dtd ++ " [") :
  map (indent 1) (concat [prDTDClause c | c <- clauses dtd]) ++
  ["]>"]

prDTDClause :: DTDClause -> [String]
prDTDClause c = case c of
  DElement e typ -> ["<!ELEMENT " ++ e ++ " " ++ prXEType typ ++ ">"]
  DAttlist a adefs -> 
    ("<!ATTLIST " ++ a) :
    map (indent 2) ([unwords [a,show ty, "#"++show st] | (a,(ty,st)) <- adefs] ++ [">"])

prXEType :: XEType -> String
prXEType t = case t of
  XId i -> i
  XPCDATA -> "#PCDATA"
  XEMPTY -> "EMPTY"
  XProduct ts -> "(" ++ concat (intersperse  ", " (map prXEType ts)) ++ ")"
  XUnion   ts -> "(" ++ concat (intersperse " | " (map prXEType ts)) ++ ")"
  XStar    ty -> prXEType ty ++ "*"

-- auxiliaries

quote s = "\"" ++ s ++ "\"" --- escapes?







