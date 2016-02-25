module Main where

import TTR2Latex

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

type Verbosity = Int

putStrV :: Verbosity -> String -> IO ()
putStrV v s = if v > 1 then putStrLn s else return ()

runFile :: Verbosity -> ParseFun Text -> FilePath -> IO ()
runFile v p f = readFile f >>= run v p

run :: Verbosity -> ParseFun Text -> String -> IO ()
run v p s = let ts = myLLexer s in case p ts of
           Bad s    -> do putStrLn "\nParse              Failed...\n"
                          putStrV v "Tokens:"
                          putStrV v $ show ts
                          putStrLn s
                          exitFailure
           Ok  tree -> do --putStrLn "\nParse Successful!"
                          showTree v tree
                          exitSuccess


showTree :: Int -> Text -> IO ()
showTree v tree
 = do
--      putStrV v $ "\n[Abstract Syntax]\n\n" ++ show tree
--      putStrV v $ "\n[Linearized tree]\n\n" ++ transText tree
      putStrLn "\\documentstyle{article}"
      putStrLn "\\begin{document}"
      putStrLn $ transText tree
      putStrLn "\\end{document}"

main :: IO ()
main = do args <- getArgs
          case args of
            [] -> hGetContents stdin >>= run 2 pText
            "-s":fs -> mapM_ (runFile 0 pText) fs
            fs -> mapM_ (runFile 0 pText) fs









{--
type TEnv = () ----
initTEnv = () ----

main = do
----  putStrLn helpMsg
  env <- loop initTEnv
  return ()

loop env = do
  putStr "TTR> "
  hFlush stdout
  s <- getLine
  case words s of
    _ -> do
      env' <- runTTR env s
      loop env'

runSQLScript :: SEnv -> String -> IO Env
runSQLScript env s = case pScript (preprocSQL (myLexer s)) of
  Ok c -> transScript env c
  Bad s -> putStrLn s >> return env    

-}

