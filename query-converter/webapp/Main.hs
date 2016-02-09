{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad
import Data.List (intercalate)
import JavaScript.JQuery hiding (filter)
import JavaScript.JQuery.Internal
import Data.Default
import qualified Data.Text as T
import Data.JSString (pack, unpack, JSString)
import ParMinSQL (pTable, myLexer)
import AbsMinSQL
import LexMinSQL
import Data.Char (toUpper)
import ErrM
import Converter
import PrintRelAlgebra
import Algebra
import Fundep


main = ready $ void $ do
    select "#press" >>= click onClick def



onClick :: Event -> IO ()
onClick _ = do
    clear
    input <- select "#in" >>= getVal
    let normalizedSql = preprocSQL (myLexer (unpack input))
    case pTable normalizedSql of
        Bad msg -> do
            print msg
            let rel = pRelation (lines (unpack input))
            -- putStrLn $ prRelationInfo rel
            relationInfo rel
        Ok v -> void $ do
            mkSqlBox "Input" $ unwords (map prToken normalizedSql)
            let math = prRel $ transTable v
            mkMathBox "Relational algebra" math
    typeset ".math"

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

    -- putStrLn $ prRelationInfo rel
fundep2latex :: [Fundep] -> String
fundep2latex [] = "\\emptyset"
fundep2latex fundeps = "\\begin{align}" ++ intercalate "\\\\" (map one fundeps) ++ "\\end{align}"
  where
    one :: Fundep -> String
    one (left, right) = intercalate "," left ++ " \\rightarrow " ++ right

multidep2latex :: [Multidep] -> String
multidep2latex [] = "\\emptyset"
multidep2latex mdeps = align $ map one mdeps
  where
    one :: Multidep -> String
    one (left, right) = intercalate "," left ++ " \\twoheadrightarrow " ++ intercalate "," right

align :: [String] -> String
align s = "\\begin{align}" ++ intercalate "\\\\" s ++ "\\end{align}"

keys2latex = align . map (("&("++) . (++")") . intercalate ",")



relationInfo :: Relation -> IO ()
relationInfo rel@(attrs,(fundeps,mvds)) = void $ do
    mkMathBox "Attributes" (intercalate "," attrs)
    mkMathBox "Keys" $
        keys2latex (keys rel)
    mkMathBox "Functional dependencies" $
        fundep2latex fundeps
    mkMathBox "Multivalued dependencies" $
        multidep2latex mvds
    mkMathBox "A minimal basis of functional dependencies:" $
        fundep2latex (basisFundep rel)
    mkMathBox "Derived functional dependencies" $
        fundep2latex (filter (flip notElem fundeps) (closureFundep rel))
    mkMathBox "Superkeys" $
        keys2latex (superkeys rel)
    mkMathBox "3NF violations" $
        fundep2latex (violate3NF rel)
    mkMathBox "BCNF violations" $
        fundep2latex (violateBCNF rel)
    mkMathBox "4NF violations" $
        multidep2latex (violate4NF rel)

foreign import javascript unsafe "MathJax.Hub.Queue(['Typeset',MathJax.Hub,$1])();"
    typeset :: JSString -> IO ()


foreign import javascript unsafe
  "$($1).each(function(i, block) {hljs.highlightBlock(block);})"
  highlight :: JSString -> IO ()

clear :: IO JQuery
clear = select "#output-area *" >>= remove


mkBox :: String -> String -> String -> IO JQuery
mkBox title cls content = select "#output-area" >>= append box
  where
    box = pack $ unlines
        [ "<div class=box>"
        , "<h2>" ++ title ++ "</h2>"
        , "<div class=\"box-content " ++ cls ++"\">"
        , content
        , "</div>"
        , "</div>"
        ]

mkMathBox :: String -> String -> IO JQuery
mkMathBox title math = do
    b <- mkBox title "math" $ "\\[" ++ math ++ "\\]"
    return b

mkSqlBox :: String -> String -> IO JQuery
mkSqlBox title sql = do
    b <- mkBox title "" $ "<pre><code class=sql>" ++ sql ++ "</code></pre>"
    highlight "pre code"
    return b
