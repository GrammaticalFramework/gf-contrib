module Info where
import Data.List
import Treebank

type TreeBank = [TreebankEntry]

allRevs :: TreeBank -> [Int]
allLangs :: TreeBank -> Int -> [ISOLang]
allSources :: TreeBank -> Int -> ISOLang -> [(String, Int)]

allRevs tb = sort . nub . concat . map revs $ tb
allLangs tb r = nub $ [l | t <- tb, l <- langs t, not $ null $ changesets t (Sel (l,mrev))]
  where mrev = Just r

allSources tb r lang = [(head g, length g) | g <- group authors]
  where sel = Sel (lang,Nothing)
        authors = sort [author cs |  t <- tb, cs <- changesets t sel, revision cs == r]
       


info :: TreeBank -> IO ()
info tb = do
    mapM_ prRev (allRevs tb)
  where
    prRev r = do
        putStrLn $ "Revision " ++ (show r) ++ ":"
        mapM_ (prLang r) (allLangs tb r)
    prLang r l = do
        putStrLn $ " Language " ++ (show l) ++ ": " ++ (concat $ intersperse ", " sources)
      where sources = [a ++ " (" ++ (show n) ++ ")" | (a,n) <- allSources tb r l]

