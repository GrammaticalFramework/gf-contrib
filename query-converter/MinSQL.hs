module MinSQL( module AbsMinSQL,
               parseScript, parseQuery, printSQL
             ) where

import AbsMinSQL

import Data.Char(toLower, toUpper)
import LexMinSQL(Token(..), Tok(..), BTree(..), resWords)
import ParMinSQL(myLexer, pQuery, pScript)
import PrintMinSQL(printTree)

parseScript = pScript . preprocSQL . myLexer
parseQuery  = pQuery  . preprocSQL . myLexer

printSQL :: Query -> String
printSQL = unwords . map addNewline . words . printTree
  where
    addNewline w = if elem w ["FROM","WHERE","GROUP","HAVING","ORDER"] then '\n':w else w

-- | Convert keywords to upper case, idents to lower case
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
