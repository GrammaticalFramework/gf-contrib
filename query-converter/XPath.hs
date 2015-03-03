module XPath where

import AbsXPath
import ToXML
import qualified Algebra as A

import ParXPath
import LexXPath
import ErrM
import qualified Data.Map as M

execQueryXPath :: Id -> A.Env -> String -> IO () 
execQueryXPath dbname env s = putStrLn $ case pXPath (myLexer s) of
  Ok x  -> prXPValue $ queryXPath x (database2xdocument dbname [it | it <- M.assocs (A.tables env)])
  Bad s -> s


queryXPath :: XPath -> XDocument -> XPValue
queryXPath xp doc = getXPValues $ pathsXPath xp (xdata doc) 

getXPValues = XPElements ----

---- only works for plain elements so far
pathsXPath :: XPath -> XElement -> [XElement]
pathsXPath xp elm = case (xp,elm) of
  (XPCont axis_ item cond_ XPEnd, XE name attrs_ elems_) -> case item of
    XINone                       -> [elm]
    XIElem (Ident i) | i == name -> [elm]
    XIAttr (Ident i)             -> [XData s | (a,s) <- attrs_, a == i] ---- XData
    _ -> []
  (XPCont axis_ item cond_ xp2, XE name attrs_ elems) -> case item of
    XINone                       -> concat [vs | el <- elems, vs <- [pathsXPath xp2 el]]
    XIElem (Ident i) | i == name -> concat [vs | el <- elems, vs <- [pathsXPath xp2 el]]
    _ -> []
  (XPEnd,_) -> [elm]

data XPValue = XPElements [XElement] | XPAttributes [String]
  deriving Show

prXPValue :: XPValue -> String
prXPValue v = case v of
  XPElements es -> unlines $ concatMap prXElement es
  XPAttributes vs -> unwords vs

