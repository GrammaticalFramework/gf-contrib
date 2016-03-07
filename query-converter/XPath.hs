{-# LANGUAGE GADTs #-}

module XPath where

import ValidateXML 

import AbsXML
import ParXML
import LexXML

import ErrM
import Data.Char (isDigit)

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
    XAPlain -> nexts xp2 item cond el
    XADesc  -> concatMap (matchXPath (XPCont XAPlain item cond xp2)) $ el : descendants el
 where
   matches el xp2 els = case xp2 of
     XPEnd -> [el]
     _ -> concatMap (matchXPath xp2) els
   nexts :: XPath -> XItem -> XCond -> Element -> [Element]
   nexts xp2 item cond el = appCond cond $ case item of
     XIElem t -> case xp2 of
       XPCont XAPlain (XIAttr a) _ XPEnd | (typeElement el == t) -> [EData (WIdent (Ident s)) | (b,s) <- attributesElement el, b == a]
       XPCont XAPlain XIAnyAt    _ XPEnd | (typeElement el == t) -> [EData (WIdent (Ident s)) | (b,s) <- attributesElement el]
       _ | (typeElement el == t) -> matches el xp2 (children el)
       _ -> []
     XIAttr a -> [EData (WIdent (Ident s)) | (b,s) <- attributesElement el, b == a]
     XIAnyAt  -> [EData (WIdent (Ident s)) | (b,s) <- attributesElement el]
     XIAny    -> matches el xp2 (children el)
     XINone   -> matches el xp2 (children el) --- can only appear last in a path, but the syntax is more liberal

   -- the rest is about conditions
   appCond :: XCond -> [Element] -> [Element]
   appCond cond els = case cond of
     XCOrd i     -> take 1 $ drop (fromInteger i - 1) els  -- [1] selects the first one
     XCOp x op y -> [el | el <- els, matchOp op (valExp el x) (valExp el y)] 
     _ -> els
   matchOp :: XOp -> String -> String -> Bool
   matchOp op = case op of
     XOEq  -> (==)
     XONEq -> (/=)
     XOLt  -> numOp (<) (<)
     XOGt  -> numOp (>) (>)
     XOLEq -> numOp (<=) (<=)
     XOGEq -> numOp (>=) (>=)
   valExp :: Element -> XExp -> String
   valExp el exp = case exp of
     XEIdent a -> head $ [s | (b,s) <- attributesElement el, b == a]
     XEInt i   -> show i
     XEStr s   -> s
   numOp :: (Int -> Int -> Bool) -> (String -> String -> Bool) -> String -> String -> Bool
   numOp op sop x y
     | all isDigit (x++y) = op (read x) (read y)
     | otherwise = sop x y

---- TODO conditions

