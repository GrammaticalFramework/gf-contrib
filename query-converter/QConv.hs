module Main where

import SQLCompiler ---- Converter
import Algebra
import OptimizeAlgebra
import Design (file2ER)
import Fundep (prRelationInfo,pRelation,prNormalizations)
import Relation2XML (env2document)
import AbsXML
import XPath (execXPath)
import ValidateXML

import MinSQL

import ErrM
import Viewer

import System.IO ( stdout, hFlush) -- , stdin, hGetContents
--import System.Environment ( getArgs, getProgName )
--import System.Exit ( exitFailure, exitSuccess )
import System.Process
--import Data.Char

main = do
  putStrLn helpMsg
  writeFile "qconv-history.tmp" ""
  env <- loop initQEnv
  return ()

type QEnv = (SEnv, [AbsXML.Document])
initQEnv = (initSEnv,[])

loop env@(senv, xmls) = do
  putStr "qconv=# "
  hFlush stdout
  s <- getLine
  appendFile "qconv-history.tmp" s
  case words s of
    "q":[]        -> return env
    "i":file:_ -> do
       s <- readFile file
       senv' <- runSQLScript senv s
       loop (senv', xmls)
    "d":file:_ -> do
      file2ER file
      loop env
    "f":file:_ -> do
      rs <- readFile file >>= return . lines
      case pRelation rs of
        Left  rel -> putStrLn $ prRelationInfo rel
        Right msg -> putStrLn $ msg
      loop env
    "n":file:_ -> do
      rs <- readFile file >>= return . lines
      case pRelation rs of
        Left (rel@(_,(_,mvds))) -> do
            sequence [do
              putStrLn hdr
              putStrLn output
                      | (hdr,output) <- prNormalizations rel]
            return ()
        Right msg -> putStrLn msg
      loop env
    "h":[] -> do
      putStrLn helpMsg
      loop env
    "a":ws -> do
      alg2latex senv (takeWhile (/=';') (unwords ws)) 
      loop env
    "xp":ws@(_:_) -> do
      execXPath (unwords ws) xmls
      loop env
    "x":_ -> do
      let xml = env2document "QConvData" senv
      putStrLn $ printXML xml
      loop (senv,xml:xmls)
    "ix":file:_ -> do
      xml <- getXML file
      loop (senv, xml : xmls)
    _ -> do
      senv' <- runSQLScript senv s
      loop (senv',xmls)

runSQLScript :: SEnv -> String -> IO Env
runSQLScript env s = case parseScript s of
  Ok c -> transScript env c
  Bad s -> putStrLn s >> return env    

alg2latex :: SEnv -> String -> IO ()
alg2latex env s = case parseQuery s of
  Bad s -> putStrLn s
  Ok c -> do
    let rel = transQuery c
    let orel = pushSelect env rel
    let cs = printSQL c
----    let ks = prKeywordRel rel
----    let kos = prKeywordRel orel
    let s = prRelLatex rel
    let os = prRelLatex orel
----    putStrLn ks
----    if rel /= orel then putStrLn kos else return ()
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
 
mintex = "qconv-latex-tmp.tex"

helpMsg = unlines $ [
  "Query converter v0.1 (A. Ranta 2015). Commands:",
  "  <SQL>      = run  SQL command ",        
  "  a  <SQL>   = show algebra for sql query", 
  "  i  <File>  = read SQL, run commands",
  "  d  <File>  = read design, show E-R, schema, English",
  "  f  <File>  = read relation, analyse dependencies and keys",
  "  n  <File>  = read relation, normalize to BCNF and 4NF",
  "  ix <File>  = read XML file to an XML document",
  "  x          = convert current SQLdatabase to an xml document",
  "  xp <XPath> = run xpath query, using current XML documents",
  "  h          = help", 
  "  q          = quit"
  ]

