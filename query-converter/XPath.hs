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
queryXPath xp docs = getXPValues $ concatMap (matchXPath xp) [el | DXML _ _ el <- docs] 

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
    XAPlain -> concatMap (matchXPath xp2) $ nexts item cond el 
    XADesc  -> concatMap (matchXPath (XPCont XAPlain item cond xp2)) $ el : descendants el
  XPEnd -> [el]
  XPAlt xp1 xp2 -> matchXPath xp1 el ++ matchXPath xp2 el
 where
   nexts :: XItem -> XCond -> Element -> [Element]
   nexts item cond el = case item of
     XIElem t -> if typeElement el == t then [el] else []
     XIAttr a -> [EData (WIdent (Ident s)) | (b,s) <- attributesElement el, b == a]
     XIAny    -> children el
     _ -> [] ---- TODO
---- TODO some mismatch of levels

