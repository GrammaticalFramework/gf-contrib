module Main where

import PGF

import Database.HDBC
import Database.HDBC.PostgreSQL (connectPostgreSQL)

import qualified Data.ByteString as B
import Data.ByteString.Char8 (unpack)

postgresParameters = "host=localhost dbname=countries"
pgfName = "Countries"
cncEng = cncLang pgfName "Eng"
cncSQL = cncLang pgfName "SQL"

cncLang name lang = maybe undefined id (readLanguage (name ++ lang))


main = do
  conn <- connectPostgreSQL postgresParameters
  pgf <- readPGF (pgfName ++ ".pgf")
  loop conn pgf cncEng


loop conn pgf lang = do
  putStr "# "
  input <- getLine
  case input of
    "q" -> do
       putStrLn "bye"
       disconnect conn
       return ()
    'l':' ':lang -> do
      putStrLn ("set language to: " ++ lang)
      loop conn pgf (cncLang pgfName lang) 
    _ -> do
      let trees = parse pgf lang (startCat pgf) input
      case trees of
        tree:_ -> process conn (linearize pgf cncSQL tree) 
        _ -> putStrLn ("cannot parse: " ++ input)
      loop conn pgf lang


process conn string = do
  statement <- prepare conn string
  execute statement []
  results <- fetchAllRows statement
  mapM_ (putStrLn . row2string) results


row2string sbs = unwords [unpack b | SqlByteString b <- sbs] 


