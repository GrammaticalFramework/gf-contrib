module Main where

import Converter
import Algebra
import Design (file2ER)

import LexMinSQL
import ParMinSQL
import PrintMinSQL
import AbsMinSQL

import ErrM

import System.IO ( stdin, stdout, hFlush, hGetContents )
import System.Environment ( getArgs, getProgName )
import System.Exit ( exitFailure, exitSuccess )
import System.Process
import Data.Char

main = do
  putStrLn helpMsg
  writeFile "minsql-history.tmp" ""
  env <- loop initSEnv
  return ()

loop env = do
  putStr "minsql=# "
  hFlush stdout
  s <- getLine
  appendFile "minsql-history.tmp" s
  case words s of
    "q":[]        -> return env
    "i":file:_ -> do
       s <- readFile file
       env' <- runSQLScript env s
       loop env'
    "d":file:_ -> do
      file2ER file
      loop env
    "h":[] -> do
      putStrLn helpMsg
      loop env
    "a":ws -> do
      alg2latex env (takeWhile (/=';') (unwords ws)) 
      loop env
    _ -> do
      env' <- runSQLScript env s
      loop env'

runSQLScript :: SEnv -> String -> IO Env
runSQLScript env s = case pScript (preprocSQL (myLexer s)) of
  Ok c -> transScript env c
  Bad s -> putStrLn s >> return env    

-- convert keywords to upper case

preprocSQL :: [Token] -> [Token]
preprocSQL = map prep where
  prep t = case t of 
    PT p (TV s) -> 
            let us =  map toUpper s 
            in case treeFind us resWords of 
              Just u -> PT p u
              _ -> t
    _ -> t
  treeFind s N = Nothing
  treeFind s (B a t left right) | s < a  = treeFind s left
                                | s > a  = treeFind s right
                                | s == a = Just t

alg2latex :: SEnv -> String -> IO ()
alg2latex env s = case pTable (preprocSQL (myLexer s)) of
  Bad s -> putStrLn s
  Ok c -> do
    let rel = transTable c
    let s = prRel rel
    writeFile mintex $ unlines [
      "\\batchmode",
      "\\documentclass[12pt]{article}",
      "\\begin{document}",
      "",
      "\\Large",
      "\\[",
      s,
      "\\]",
      "",
      "\\end{document}"
      ]
    system "pdflatex minsql-latex-tmp.tex > //dev//null"
    system "open minsql-latex-tmp.pdf"
    return ()

mintex = "minsql-latex-tmp.tex"

helpMsg = "a <SQL> = show algebra ; d <File> = read design ; i <File> = read SQL ; h = help ; q = quit ; <SQL> = run sql"

