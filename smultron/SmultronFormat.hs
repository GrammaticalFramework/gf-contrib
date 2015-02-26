module SmultronFormat(readXML) where

import Text.XML.Light
import Data.Maybe
import qualified Data.Tree as T

data Word     = W  {id :: Id, word :: String, pos :: Tag} deriving Show
data PhrTag   = Ph {idPh :: Id, cat :: Tag, tags :: [Id]} deriving Show
data Sentence = Sent {rootS :: Id, words :: [Word], info :: [PhrTag], ws :: Int} deriving Show
type Tag      = String
type Id       = String

simpleName s = QName s Nothing Nothing


mkSentence :: Element -> Sentence
mkSentence e = Sent root words_ phrtags_ (length words_)
    where graph = findElements (simpleName "graph") e
          Just root = head $ map (findAttr (simpleName "root")) graph

          ts         = (findElements (simpleName "t")) e     --[Element]
          word_attrs = map (findAttr (simpleName "word")) ts --[Maybe String]
          id_attrs   = map (findAttr (simpleName "id")) ts   --[Maybe Id]
          pos_attrs  = map (findAttr (simpleName "pos")) ts  --[Maybe Tag]
          mkWord (Just i) (Just w) (Just p) = W i w p
          mkWord _i _w _p = error "mkWord: found Nothing"

          words_ = zipWith3 mkWord id_attrs word_attrs pos_attrs
          
          nts = findElements (simpleName "nt") e --[Element]
          idph_attrs = map (findAttr (simpleName "id")) nts   --[Maybe Id]
          cat_attrs =  map (findAttr (simpleName "cat")) nts  --[Maybe String]
          edges = map (findElements (simpleName "edge")) nts  --[[Element]]
          idref_attrs =  (map . map) (findAttr (simpleName "idref")) edges --[[Maybe Id]]

          mkPhrTag (Just i) (Just c) ts = Ph i c (catMaybes ts)
          mkPhrTag _i _c _ts = error "mkPhrTag: found Nothing"
          
          phrtags_ = zipWith3 mkPhrTag idph_attrs cat_attrs idref_attrs



readXML fname = do source <- readFile fname
                   let content = parseXML source
                       ss = concatMap (findElements $ simpleName "s") (onlyElems content)
                   return $ map (toTree . mkSentence) ss


toTree :: Sentence -> T.Tree String
toTree s@(Sent root ws inf _) = toTree' root s

toTree' :: String -> Sentence -> T.Tree String
toTree' nr s@(Sent root ws inf _) = 
     case (lookup' nr ws,lookup'' nr inf) of
       (Just w,_) -> putWord w
       (_,Just p) -> putPhrase p
       _          -> error $ "Error in toTree' "++show nr++" could not be found"
  where putWord (W i w p)    = T.Node p [T.Node w []]
        putPhrase (Ph i c t) = T.Node c
                                $ map (\next -> toTree' next s) t

        lookup' y (w@(W x _ _):xs) | y ==x     = Just w
                                   | otherwise = lookup' y xs
        lookup' y [] = Nothing

        lookup'' y (w@(Ph x _ _):xs) | y ==x     = Just w
                                     | otherwise = lookup'' y xs
        lookup'' y [] = Nothing
