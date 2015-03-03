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
queryXPath xp doc = queryElem xp (xdata doc) where
  queryElem xp xd@(XE name_ attrs_ elems) = case xp of
    XPRoot axis_ elem_ cond_ -> XPElements elems




data XPValue = XPElements [XElement] | XPAttributes [String]
  deriving Show

prXPValue :: XPValue -> String
prXPValue v = case v of
  XPElements es -> unlines $ concatMap prXElement es
  XPAttributes vs -> unwords vs

