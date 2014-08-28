import Prelude hiding (lex)
import Data.List (intersperse)
import Data.String.Utils (replace)
import System.Environment (getProgName, getArgs)
import System.IO (hFlush, stdout)
import PGF

{-|
   Test parser with custom lexers for Mlt and MltX (character-lexing).
   Usage:
>   $ runghc parse.hs MltX
>   > intom tħobbu lil ommu
>   (i n t o m | t ħ o b b u | l i l | o m m u)
>   Pred (UsePron youPl_Pron) Love (Person he_Pron Mother)
-}

main :: IO ()
main = do
  pgf <- readPGF "Love.pgf"
  args <- getArgs
  let lang = case head args of
        "Eng"  -> (languages pgf) !! 0
        "Mlt"  -> (languages pgf) !! 1
        "MltX" -> (languages pgf) !! 2
  putStr "> " >> hFlush stdout
  s <- getLine :: IO String
  let (Just typ) = readType "Comment"
  let lexed = lex lang s
  putStrLn $ "("++lexed++")"
  let trees = parse pgf lang typ lexed
  if null trees
    then putStrLn "NO PARSE"
    else mapM_ (putStrLn . showExpr []) trees

-- | Lexers for different concrete syntaxes
lex :: Language -> String -> String
lex lang = case showLanguage lang of
  "LoveEng"  -> id
  "LoveMlt"  -> suffixes ["ni","i","ok","u","ha","na","kom","hom"]
  "LoveMltX" -> intersperse ' ' . replace " " "|"

-- | Unbind given suffixes in a string
suffixes :: [String] -> String -> String
suffixes sfxs inn =
  init $ foldl (\str sfx -> replace (sfx++" ") (" &+ "++sfx++" ") str) (inn++" ") sfxs
