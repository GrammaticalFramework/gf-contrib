{-# LANGUAGE GADTs #-}
module Main where

import TTR2Latex
import Evaluate
import TypeCheck

import LexTTR
import ParTTR
import PrintTTR
import AbsTTR

import ErrM

import System.IO ( stdin, stdout, hFlush, hGetContents )
import System.Environment ( getArgs, getProgName )
import System.Exit ( exitFailure, exitSuccess )
import System.Process
import Data.Char


type ParseFun a = [Token] -> Err a

myLLexer = myLexer

parseFile :: ParseFun a -> FilePath -> IO a
parseFile p file = readFile file >>= parse p (error "no parse")

parse :: ParseFun a -> a -> String -> IO a
parse p d s = case p (myLLexer s) of
  Ok a -> return a
  Bad s -> putStrLn s >> return d

type TTREnv = (Evaluate.Sig, TCEnv)
initTTREnv = ([], initTCEnv)
  
main :: IO ()
main = do
  args <- getArgs
  case args of
    ["-tex",f] -> parseFile pText f >>= putStrLn . printLatex
    ["-nocheck",f] -> do
      TJments js <- parseFile pText f
      let eenv = Evaluate.getSig js
      loop (eenv,initTCEnv)
    [f] -> do
      text@(TJments js) <- parseFile pText f
      case checkText text of
        Ok tcenv -> do
          let eenv = Evaluate.getSig js
          loop (eenv,tcenv)
        Bad s -> putStrLn s
    [] -> loop initTTREnv
    _ -> putStrLn "usage: ttr (-tex|-nocheck)? <file>?"

loop :: TTREnv -> IO ()
loop env@(eenv,tcenv) = do
  putStr "TTR> "
  s <- getLine
  case s of
    _ | all isSpace s -> loop env
    '?':cs -> do
      e <- parse pExp (EId (Id "?")) cs
      case inferExp tcenv (desugar e) >>= whnf tcenv of
        Ok ty -> putStrLn $ TypeCheck.printVal ty
        Bad s -> putStrLn s
      loop env
    '!':cs -> do
      j <- parse pJment (JIn (EInt 0) (EId (Id "Int"))) cs
      case checkJment tcenv (desugar j) of
        Ok _  -> putStrLn $ "OK"
        Bad s -> putStrLn s
      loop env
    "q" -> putStrLn "Bye" >> return ()
    "h" -> putStrLn helpMsg >> loop env
    _ -> do
      e <- parse pExp (EId (Id "?")) s
      putStrLn $ showEvalExp eenv e
      loop env

helpMsg = unlines [
  "? <Exp>    infer type of expression"
 ,"! <Jment>  check judgement"
 ,"<Exp>      evaluate expression"
 ,"q          quit"
 ,"h          print this help message"
  ]

