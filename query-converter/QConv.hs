module Main where

import SQLCompiler ---- Converter
import Algebra
import OptimizeAlgebra
import Design (file2ER)
import Fundep (prRelationInfo,pRelation,prRelation,normalizeBCNF,normalize3NF,normalize4NF)
import ToXML (prDatabaseXML)
import XPath (execQueryXPath)

import LexMinSQL
import ParMinSQL
import PrintMinSQL
import AbsMinSQL

import ErrM
import Viewer

import System.IO ( stdin, stdout, hFlush, hGetContents )
import System.Environment ( getArgs, getProgName )
import System.Exit ( exitFailure, exitSuccess )
import System.Process
import Data.Char

main = do
  putStrLn helpMsg
  writeFile "qconv-history.tmp" ""
  env <- loop initSEnv
  return ()

loop env = do
  putStr "qconv=# "
  hFlush stdout
  s <- getLine
  appendFile "qconv-history.tmp" s
  case words s of
    "q":[]        -> return env
    "i":file:_ -> do
       s <- readFile file
       env' <- runSQLScript env s
       loop env'
    "d":file:_ -> do
      file2ER file
      loop env
    "f":file:_ -> do
      rel <- readFile file >>= return . pRelation . lines
      putStrLn $ prRelationInfo rel
      loop env
    "n":file:_ -> do
      rel@(_,(_,mvds)) <- readFile file >>= return . pRelation . lines
      putStrLn "3NF decomposition (experimental feature):"
      let rels = normalize3NF rel
      putStrLn $ unlines $ map (\ (i,r) -> i : ". " ++ prRelation r) (zip ['1'..] rels)
      putStrLn "BCNF decomposition:"
      let rels = normalizeBCNF rel
      putStrLn $ unlines $ map (\ (i,r) -> i : ". " ++ prRelation r) (zip ['1'..] rels)
      if null mvds
         then return ()
         else do
           putStrLn "4NF decomposition (experimental feature):"
           let rels = normalize4NF rel
           putStrLn $ unlines $ map (\ (i,r) -> i : ". " ++ prRelation r) (zip ['1'..] rels)
      loop env
    "h":[] -> do
      putStrLn helpMsg
      loop env
    "a":ws -> do
      alg2latex env (takeWhile (/=';') (unwords ws)) 
      loop env
    "x":ws@(_:_) -> do
      execQueryXPath "QConvData" env (unwords ws)
      loop env
    "x":_ -> do
      putStrLn $ prDatabaseXML "QConvData" env
      loop env
    _ -> do
      env' <- runSQLScript env s
      loop env'

runSQLScript :: SEnv -> String -> IO Env
runSQLScript env s = case pScript (preprocSQL (myLexer s)) of
  Ok c -> transScript env c
  Bad s -> putStrLn s >> return env    

-- convert keywords to upper case, idents to lower case

preprocSQL :: [Token] -> [Token]
preprocSQL = map prep where
  prep t = case t of 
    PT p (TV s) -> 
            let us =  map toUpper s 
            in case treeFind us resWords of 
              Just u -> PT p u
              _ -> PT p (TV (map toLower s))
    _ -> t
  treeFind s N = Nothing
  treeFind s (B a t left right) | s < a  = treeFind s left
                                | s > a  = treeFind s right
                                | s == a = Just t

alg2latex :: SEnv -> String -> IO ()
alg2latex env s = case pQuery (preprocSQL (myLexer s)) of
  Bad s -> putStrLn s
  Ok c -> do
    let rel = transQuery c
    let orel = pushSelect env rel
    let cs = printSQL c
    let ks = prKeywordRel rel
    let kos = prKeywordRel orel
    let s = prRelLatex rel
    let os = prRelLatex orel
    putStrLn ks
    if rel /= orel then putStrLn kos else return ()
    writeFile mintex $ unlines [
      "\\batchmode",
      "\\documentclass[12pt]{article}",
      "\\begin{document}",
      "",
      "\\noindent",
      "Source:",
      "",
      "\\begin{verbatim}",
      cs,
      "\\end{verbatim}",
      "",
      "",
      "\\noindent",
      "Original query:",
      "",
      "\\noindent",
      "\\begin{multline}",
      s,
      "\\end{multline}",
      "",
      "\\noindent",
      "Optimized query:",
      "",
      "\\noindent",
      "\\begin{multline}",
      os,
      "\\end{multline}",
      "",
      "\\end{document}"
      ]
    system "pdflatex qconv-latex-tmp.tex > //dev//null"
    system $ viewer ++ " qconv-latex-tmp.pdf"
    return ()

printSQL :: Query -> String
printSQL = unwords . map addNewline . words . printTree
  where
    addNewline w = if elem w ["FROM","WHERE","GROUP","HAVING","ORDER"] then '\n':w else w
 
mintex = "qconv-latex-tmp.tex"

helpMsg = unlines $ [
  "Query converter v0.1 (A. Ranta 2015). Commands:",
  "  <SQL>     = run  SQL command ",        
  "  a <SQL>   = show algebra for sql query", 
  "  i <File>  = read SQL, run commands",
  "  d <File>  = read design, show E-R, schema, English",
  "  f <File>  = read relation, analyse dependencies and keys",
  "  n <File>  = read relation, normalize to BCNF and 4NF",
  "  x <XPath> = run xpath query",
  "  x         = print database in xml",
  "  h         = help", 
  "  q         = quit"
  ]

