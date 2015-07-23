module Main where
import System.IO.Error
import PGF
import System (getArgs)
import Fold (fold)

eng, latex :: Language

om = "OpenMath" 
Just eng = readLanguage $ om ++ "Eng"
Just latex = readLanguage $ om ++ "LaTeX"

main :: IO ()
main = do
  gr     <- readPGF $ om ++ ".pgf"
  catId:_ <- getArgs
  loop (transfer gr catId)

loop :: (String -> [String]) -> IO ()
loop trans = do
  s <- try getLine
  case s of
    Left e  -> if isEOFError e
                 then return ()
                 else ioError e
    Right s -> do
                 putStrLn . unlines $ trans s
                 loop trans

transfer :: PGF  -> String -> String -> [String]
transfer gr catId s =
    case parse gr eng cat s1 of
      []     -> ["No parse"]
      ts     -> map linFold ts
  where Just cat = readType catId
        linFold t = linearize gr latex (fold t)
        s1 = (unwords . lexer) s

lexer :: String -> [String]
lexer s = concat $ map (split ',') (words s)
  where split c w = 
          case reverse w of
            d:ws | d == c -> [reverse ws, [c]]
            _     -> [w]
           