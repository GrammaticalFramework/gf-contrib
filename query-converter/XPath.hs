{-# LANGUAGE GADTs #-}

module XPath where

import ValidateXML 

import AbsXML
import ParXML
import LexXML

import ErrM
import qualified Data.Map as M

execXPath :: String -> [Document] -> IO () 
execXPath s docs = putStrLn $ case pXPath (myLexer s) of
  Ok x  -> prXPValue $ queryXPath x docs
  Bad s -> s

queryXPath :: XPath -> [Document] -> XPValue
queryXPath xp docs = getXPValues $ concatMap (pathsXPath xp) [el | DXML _ _ el <- docs] 

getXPValues = XPElements ----

data XPValue = XPElements [Element] | XPAttributes [String]
  deriving Show

prXPValue :: XPValue -> String
prXPValue v = case v of
  XPElements es -> unlines $ map printXML es
  XPAttributes vs -> unwords vs

children :: Element -> [Element]
children = contentsElement

descendants :: Element -> [Element]
descendants e = case children e of
  ce@(_:_) -> ce ++ concatMap descendants ce
  _ -> []

matchXPath :: XPath -> Element -> [Element]
matchXPath xp el = case xp of
  XPCont axis item cond xp2 -> case axis of
    XAPlain -> concatMap (match item cond) $ concatMap (matchXPath xp2) (nexts item el)
    XADesc  -> concatMap (matchXPath (XPCont XAPlain item cond xp2)) (el : descendants el)
  XPEnd -> [el]
  XPAlt xp1 xp2 -> matchXPath xp1 el ++ matchXPath xp2 el
 where
   match :: XItem -> XCond -> Element -> [Element]
   match item cond el = case item of
     XIElem t -> if typeElement el == t then [el] else []
     XIAttr a -> [EData (WIdent (Ident s)) | (b,s) <- attributesElement el, b == a]
     _ -> [] ---- TODO
   nexts :: XItem -> Element -> [Element]
   nexts item el = case item of
     XIElem t -> if typeElement el == t then children el else []
     XIAny    -> children el
     _ -> [] ---- TODO



---- only works for plain elements so far
pathsXPath :: XPath -> Element -> [Element]
pathsXPath xp elm = case (xp,elm) of
  (XPCont axis_ item cond_ XPEnd, ETag (STTag name attrs_) elems_ _) -> case item of
    XINone               -> [elm]
    XIElem i | i == name -> [elm]
    XIAttr i             -> [EData (WIdent (Ident s)) | AValue a s <- attrs_, a == i]  ---- EData encoding attribute value
    _ -> []
  (XPCont axis_ item cond_ xp2, ETag (STTag name attrs_) elems _) -> case item of
    XINone               -> concat [vs | el <- elems, vs <- [pathsXPath xp2 el]]
    XIElem i | i == name -> concat [vs | el <- elems, vs <- [pathsXPath xp2 el]]
    _ -> []
  (XPEnd,_) -> [elm]
