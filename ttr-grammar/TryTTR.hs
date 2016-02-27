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
parseFile p file = readFile file >>= parse p 

parse :: ParseFun a -> String -> IO a
parse p s = case p (myLLexer s) of
  Ok a -> return a
  Bad s -> putStrLn s >>= undefined
  
main :: IO ()
main = do
  args <- getArgs
  case args of
    ["-tex",f] -> parseFile pText f >>= putStrLn . printLatex
    ["-nocheck",f] -> do
      TJments js <- parseFile pText f
      let sig = getSig js
      loop (sig,([],[]))
    [f] -> do
      text <- parseFile pText f
      case checkText text of
        Ok env -> loop env
        Bad s -> putStrLn s
    [] -> loop ([],([],[]))
    _ -> putStrLn "usage: ttr (-tex|-nocheck) <file>?"

loop :: TCEnv -> IO ()
loop env@(defs,_) = do
  putStr "TTR> "
  s <- getLine
  case s of
    _ | all isSpace s -> loop env
    _ -> do
      e <- parse pExp s
      let ev = eval "-s" (defs,[]) e
      case ev of
        Ok v -> putStrLn $ printVal v
        Bad msg -> putStrLn msg
      loop env

