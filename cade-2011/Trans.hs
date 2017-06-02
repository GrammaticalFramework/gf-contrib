module Main where

import PGF
import TransProp

main = do
  pgf <- readPGF "Prop.pgf"
  interact (doTrans pgf)

doTrans pgf s = case parseAllLang pgf (startCat pgf) s of 
  (l,ts):_ -> unlines [display m l u | t <- ts, noFreeVars t, (u,m) <- transfers t]
  _ -> "no parse"
 where
   display m l u = unlines $ (show m ++ ":") : 
     showExpr [] u : [s | la <- languages pgf, let s = linearize pgf la u]
---     showExpr [] u : [s | la <- languages pgf, ss <- tabularLinearizes pgf la u, (_,s) <- ss]
   transfers t = [(transfer m t,m) | m <- [MNone, MOptimize, MNormalize, MMinimalize]]
