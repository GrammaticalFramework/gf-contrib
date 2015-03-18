module Fundep where

-- straightforward, unoptimized algorithms for functional dependencies and normal forms
-- work fine for relations with any reasonable number of attributes

type Attr     = String
type Fundep   = ([Attr], Attr)
type Multidep = ([Attr], [Attr])
type Relation = ([Attr], ([Fundep],[Multidep]))

-- the closure of attrs in allAttrs, given deps
closure :: Relation -> [Attr] -> [Attr]
closure (allAttrs, (deps,_)) attrs = iter attrs where
  iter xs = let xs2 = add xs in if xs2 == xs then xs else iter xs2
  add  xs = xs ++ [a | a <- allAttrs, not (elem a xs), follows deps xs a]

-- whether a is determined by xs, given deps
follows :: [Fundep] -> [Attr] -> Attr -> Bool
follows deps xs a = or [all (flip elem xs) args | (args,b) <- deps, b == a]

-- the transitive closure of functional dependencies
closureFundep :: Relation -> [Fundep]
closureFundep rel@(allAttrs,(deps,_)) = [(xs, a) | xs <- subsets allAttrs, a <- closure rel xs, notElem a xs] 

-- attrs is a superkey, if allAttrs is included in the closure of attrs
isSuperkey :: Relation -> [Attr] -> Bool
isSuperkey rel@(allAttrs, (deps,_)) attrs = all (flip elem (closure rel attrs)) allAttrs

-- attrs is a key, if it is a superkey
--                    and any list where any of its attributes is removed is no longer a superkey  
isKey :: Relation -> [Attr] -> Bool
isKey rel@(allAttrs,(deps,_)) attrs = isSuperkey rel attrs
                               && not (any (isSuperkey rel) [filter (/=a) attrs | a <- attrs])

-- find all subsets to test e.g. what keys there are
subsets :: [Attr] -> [[Attr]]
subsets attrs = map concat (sequence [[[],[a]] | a <- attrs])

-- all superkeys
superkeys :: Relation -> [[Attr]]
superkeys rel@(allAttrs, (deps,_)) = [attrs | attrs <- subsets allAttrs, isSuperkey rel attrs]

-- all keys
keys :: Relation -> [[Attr]]
keys rel@(allAttrs,(deps,_)) = [attrs | attrs <- superkeys rel, isKey rel attrs]

-- an attribute is prime if it belongs to some key
isPrime :: Relation -> Attr -> Bool
isPrime rel attr = elem attr (concat (keys rel))

-- find violations of the Boyce-Codd Normal Form
violateBCNF :: Relation -> [Fundep]
violateBCNF rel@(_,(deps,_)) = [dep | dep@(args,val) <- closureFundep rel, not (isSuperkey rel args)]

-- check if a relation is in the Boyce-Codd Normal Form
isBCNF :: Relation -> Bool
isBCNF rel = null (violateBCNF rel)

-- find violations of the Third Normal Form
violate3NF :: Relation -> [Fundep]
violate3NF rel@(_,(deps,_)) =
  [dep | dep@(args,val) <- closureFundep rel, not (isSuperkey rel args || isPrime rel val)]

-- check if a relation is in the Third Normal Form
is3NF :: Relation -> Bool
is3NF rel = null (violateBCNF rel)

-- find violations of the Fourth Normal Form
violate4NF :: Relation -> [Multidep]
violate4NF rel@(_,(deps,mvds)) = [dep |
  dep@(xs,ys) <- mvds ++ [(xs,[y]) | (xs,y) <- closureFundep rel], not (isSuperkey rel xs)]

-- check if a relation is in the Fourth Normal Form
is4NF :: Relation -> Bool
is4NF rel = null (violate4NF rel)

-- bring relation to BCNF
normalizeBCNF :: Relation -> [Relation]
normalizeBCNF rel = case violateBCNF rel of
  [] -> [rel]
  f:fs -> concatMap normalizeBCNF (decompose f rel)
 where
  decompose (xs,a) rel@(attrs,(fundeps,_)) =
    let 
      cxs = closure rel xs
      noncxs = filter (\a -> notElem a cxs || elem a xs) attrs
    in [restrictRel rel cxs, restrictRel rel noncxs]

-- "projection of dependencies", works if calculated on the closure of dependencies
restrictRel :: Relation -> [Attr] -> Relation
restrictRel rel@(_,(fundeps,mvds)) attrs =
  (attrs,
   ([(xs,a)  | (xs,a)  <- closureFundep rel,    all (flip elem attrs) (a:xs)],
    [(xs,ys) | (xs,ys) <- closureMultidep rel,  all (flip elem attrs) (ys ++ xs)])) 

-- bring relation to 4NF
normalize4NF :: Relation -> [Relation]
normalize4NF rel = case violate4NF rel of
  [] -> [rel]
  f:fs -> concatMap normalize4NF (decompose f rel)
 where
  decompose (xs,ys) rel@(attrs,(fundeps,_)) =
    let 
      xys = xs ++ ys
      nonxys = xs ++ filter (\a -> notElem a (xs ++ ys)) attrs
    in [restrictRel rel xys, restrictRel rel nonxys]

closureMultidep :: Relation -> [Multidep]
closureMultidep rel@(_,(fundeps,mvds)) = mvds ---- TODO


------------ printing and parsing

-- get a relation from a list of lines: the attribute list plus a list of functional dependencies
pRelation :: [String] -> Relation
pRelation (s:ss) = (words s, (concatMap pDeps ss, concatMap pMultideps ss))

-- get a set of fundeps from a string of the form "A B C -> D E" ; spaces around elements required
pDeps :: String -> [Fundep]
pDeps s = case break (=="->") (words s) of
  (args@(_:_), _:vals@(_:_)) -> [(args,val) | val <- vals]
  _ -> []

-- get a set of fundeps from a string of the form "A B C ->> D E" ; spaces around elements required
pMultideps :: String -> [Multidep]
pMultideps s = case break (=="->>") (words s) of
  (args@(_:_), _:vals@(_:_)) -> [(args,vals)]
  _ -> []

prFundep :: Fundep -> String
prFundep (xs,a) = unwords (xs ++ ["->", a])

prMultidep :: Multidep -> String
prMultidep (xs,ys) = unwords (xs ++ ["->>"] ++ ys)

prRelation :: Relation -> String
prRelation (attrs,(fundeps,mvds)) = unlines [
  "Attributes:",
  unwords attrs,
  "",
  "Functional dependencies:",
  if null fundeps then "none" else unlines (map prFundep fundeps),
  if null mvds then ""
               else unlines ("Multivalued dependencies:": map prMultidep mvds ++ [""])
  ]

prRelationInfo :: Relation -> String
prRelationInfo rel@(attrs,(fundeps,mvds)) = unlines [
  prRelation rel,
  "Derived functional dependencies:",
  unlines (map prFundep (filter (flip notElem fundeps) (closureFundep rel))),
  "Superkeys:",
  unlines (map unwords (superkeys rel)),
  "Keys:",
  unlines (map unwords (keys rel)),
  "3NF violations:",
  unlines (map prFundep (violate3NF rel)),
  "BCNF violations:",
  case violateBCNF rel of
    [] -> "none"
    vs -> unlines (map prFundep vs),
  "4NF violations:",
  case violate4NF rel of
    [] -> "none"
    vs -> unlines (map prMultidep vs)
  ]
