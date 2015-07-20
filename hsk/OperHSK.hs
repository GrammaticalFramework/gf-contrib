import Data.Char
import Data.List

quote s = "\"" ++ s ++ "\""
unquote = tail . init

fromTabs = map (getSep '\t') . lines
toTabs = unlines . map (blocks2sep "\t")

getSep :: Eq a => a -> [a] -> [[a]]
getSep sep xs = case break (==sep) xs of
  (x1,_:x2) -> x1 : getSep sep x2
  (x1,[]) -> x1 : []

blocks2sep :: String -> [String] -> String
blocks2sep sep = concat . intersperse sep

-- get cat from lexical fun, e.g. cat "in_vain_Adv" = "Adv" 
cat :: String -> String
cat = reverse . takeWhile (/='_') . reverse

uncat :: String -> String
uncat = unscore .
        reverse . dropWhile (flip elem "_1234") . dropWhile (/='_') . reverse

unscore = map (\c -> if c=='_' then ' ' else c)

mkLin cat s = "mk" ++ cat ++ " " ++ quote s

line2rules (chi:pin:ws:_) =
  let fs = filter (elem '_') (words ws) in
  [[f,cat f,chi,pin,uncat f] | f <- fs]

absRules rs = [unwords ["fun",f,":",c,";"] | f:c:_ <- rs]
chiRules rs = [unwords ["lin",f,"=",mkLin c chi,";"] | f:c:chi:_ <- rs]
pinRules rs = [unwords ["lin",f,"=",mkLin c pin,";"] | f:c:_:pin:_ <- rs]
engRules rs = [unwords ["lin",f,"=",mkLin c eng,";"] | f:c:_:_:eng:_ <- rs]




{-
  cs <- readFile "hsk1.txt" >>= return . fromTabs
  let rs = concatMap line2rules cs
  putStrLn $ toTabs rs
  putStrLn $ unlines $ absRules rs
-}

{-
  hs <- readFile "hsk2.txt" >>= return . fromTabs
  let pmap = Data.Map.fromList [(c,head (words p)) | c:p:_ <- hs]
  let pin w = case w of '"':_ -> maybe w quote (Data.Map.lookup (tail (init w)) pmap) ; _ -> w
  gf <- readFile "Hsk2Chi.gf" >>= return . lines
  let pgf = map (unwords . map pin . words) gf
  writeFile "Hsk2Pinyin.gf" $ unlines pgf
-}
