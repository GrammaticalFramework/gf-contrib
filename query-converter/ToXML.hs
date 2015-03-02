module ToXML where

import qualified Relation as R

data XElement = XE {tag :: R.Id, attributes :: [(R.Id,String)], children :: [XElement]}
  deriving Show

prXElement :: XElement -> String
prXElement = pr 0 where
  pr i e = unlines $ map (indent i) $
    if null (children e) 
      then
        [prOnlyTag (tag e) (attributes e)]
      else
        prTag (tag e) (attributes e) :
        map (pr (i+1)) (children e) ++
        [prEndTag (tag e)]

prTag :: R.Id -> [(R.Id,String)] -> String
prTag t ats = "<" ++ unwords (t:[x++"="++ show v | (x,v) <- ats]) ++ ">"

prEndTag t = prTag ("/" ++ t) []

prOnlyTag :: R.Id -> [(R.Id,String)] -> String
prOnlyTag t ats = "<" ++ unwords (t:[x++"="++ show v | (x,v) <- ats]) ++ " />"

indent i s = replicate (2*i) ' ' ++ s

