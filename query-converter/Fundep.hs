module Fundep where

import qualified Data.List as L

-- straightforward, unoptimized algorithms for functional dependencies and normal forms
-- works fine for relations with a reasonable number of attributes

type Attr     = String
type Fundep   = ([Attr], Attr)
type Multidep = ([Attr], [Attr])
type Relation = ([Attr], ([Fundep],[Multidep]))

-- the closure of attrs in allAttrs, given deps
closure :: Relation -> [Attr] -> [Attr]
closure (allAttrs, (deps,_)) attrs = iter attrs where
  iter xs = let xs2 = add xs in if xs2 == xs then xs else iter xs2
  add  xs = xs ++ [a | a <- allAttrs, not (elem a xs), follows deps xs a]

-- a is a subset of b, if all elements of a occur in b
subset :: Eq a => [a] -> [a] -> Bool
subset a b = all (\x -> elem x b) a

-- a and b are equal as sets
equalSets :: Eq a => [a] -> [a] -> Bool
equalSets a b = subset a b && subset b a

-- whether a is determined by xs, given deps
follows :: [Fundep] -> [Attr] -> Attr -> Bool
follows deps xs a = or [subset args xs | (args,b) <- deps, b == a]

-- the transitive closure of functional dependencies
closureFundep :: Relation -> [Fundep]
closureFundep rel@(allAttrs,(deps,_)) = [(xs, a) | xs <- subsets allAttrs, a <- closure rel xs, notElem a xs]

-- one minimal basis of functional dependencies FD has the FD in its closure but no smaller one does
-- algorithm from http://stackoverflow.com/questions/10284004/minimal-cover-and-functional-dependencies
basisFundep :: Relation -> [Fundep]
basisFundep rel@(allAttrs,(fundeps,mvds)) = pruneDeps [] $ pruneAttrs [] $ nontrivials
  where
    nontrivials = [fd | fd <- fundeps, not (isTrivialFundep rel fd)]

    pruneAttrs earlier fds = case fds of
      fd@(xs,a) : fdd ->    -- minimize fd's one by one
        let fd_ = head $ [fd_ | fd_@(xs_,_) <- weakenings fd,                      -- the smallest replacing fd
                              elem a (closure (relWith (fd:fdd ++ earlier)) xs_)]  -- from which a (RHS) can be derived
                        ++ [error $ "cannot minimize FD " ++ show fd]              --- should only happen if rel spec is wrong
        in  pruneAttrs (fd_:earlier) fdd                                           -- move to next fd, this change in place
      _ -> earlier                  -- when you are done, you have an attribute-pruned set

    pruneDeps earlier fds = case fds of
      fd@(xs,a) : fdd -> if   elem a (closure (relWith (earlier ++ fdd)) xs) -- if fd is redundant
                         then pruneDeps earlier      fdd                     -- drop it and consider next fd
                         else pruneDeps (fd:earlier) fdd                     -- else keep it and consider next fd
      _ -> earlier

    weakenings (xs,a) = tail $ L.sortBy (\ (u,_) (v,_) -> compare (length u) (length v)) [(x,a) | x <- subsets xs] -- tail leaves out []

    relWith fds = (allAttrs,(fds,mvds))
    
-- attrs is a superkey, if allAttrs is included in the closure of attrs
isSuperkey :: Relation -> [Attr] -> Bool
isSuperkey rel@(allAttrs, (deps,_)) attrs = subset allAttrs (closure rel attrs)

-- attrs is a key, if it is a superkey
--                    and any list where any of its attributes is removed is no longer a superkey  
isKey :: Relation -> [Attr] -> Bool
isKey rel@(allAttrs,(deps,_)) attrs = isSuperkey rel attrs
                               && not (any (isSuperkey rel) [filter (/=a) attrs | a <- attrs])

-- find all subsets to test e.g. what keys there are
subsets :: [a] -> [[a]]
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

-- an FD X ->> A is trivial if A is an element of X
isTrivialFundep :: Relation -> Fundep -> Bool
isTrivialFundep rel@(attrs,_) fd@(xs,a) = elem a xs

-- find violations of the Boyce-Codd Normal Form
violateBCNF :: Relation -> [Fundep]
violateBCNF rel@(_,(deps,_)) = [dep |
  dep@(args,val) <- closureFundep rel,
  not (isTrivialFundep rel dep),
  not (isSuperkey rel args)]

-- check if a relation is in the Boyce-Codd Normal Form
isBCNF :: Relation -> Bool
isBCNF rel = null (violateBCNF rel)

-- find violations of the Third Normal Form
violate3NF :: Relation -> [Fundep]
violate3NF rel@(_,(deps,_)) =
  [dep | dep@(args,val) <- closureFundep rel, not (isSuperkey rel args || isPrime rel val)]

-- check if a relation is in the Third Normal Form
is3NF :: Relation -> Bool
is3NF rel = null (violate3NF rel)

-- find violations of the Fourth Normal Form
violate4NF :: Relation -> [Multidep]
violate4NF rel@(_,(deps,mvds)) = [dep |
  dep@(xs,ys) <- mvds ++ [(xs,[y]) | (xs,y) <- closureFundep rel],
  not (isSuperkey rel xs),
  not (isTrivialMultidep rel dep)]

-- an MVD X ->> Y is trivial if Y includes X or if X,Y include all the attributes 
isTrivialMultidep :: Relation -> Multidep -> Bool
isTrivialMultidep rel@(attrs,_) mvd@(xs,ys) =
  subset ys xs || subset attrs (xs ++ ys)

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
   ([(xs,a)  | (xs,a)  <- closureFundep rel,    subset (a:xs) attrs],
    [(xs,ys) | (xs,ys) <- closureMultidep rel,  subset (ys ++ xs) attrs])) 

-- bring relation to 3NF
normalize3NF :: Relation -> [Relation]
normalize3NF rel@(attrs,(fundeps,_)) =
  if is3NF rel
    then [rel]
    else [restrictRel rel ats | ats <- keyrels ++ signatures]
  where
    basis = basisFundep rel
    groups = L.groupBy (\ (xs,_) (ys,_) -> equalSets xs ys) basis
    signatures = [ L.nub (xs ++ map snd gs) | gs@((xs,_):_) <- groups ]
    relkeys = keys rel
    keyrels = if any (\s -> any (\k -> subset k s) relkeys) signatures then [] else [head relkeys]

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
prRelation rel@(attrs,(fundeps,mvds)) = unlines [
  "Attributes:",
  unwords attrs,
  "Keys:",
  unlines (map unwords (keys rel)),
  "Functional dependencies:",
  if null fundeps then "none" else unlines (map prFundep fundeps),
  if null mvds then ""
               else unlines ("Multivalued dependencies:": map prMultidep mvds ++ [""])
  ]

prRelationInfo :: Relation -> String
prRelationInfo rel@(attrs,(fundeps,mvds)) = unlines [
  prRelation rel,
  "A minimal basis of functional dependencies:",
  unlines (map prFundep (basisFundep rel)),
----  "Derived functional dependencies:",
----  unlines (map prFundep (filter (flip notElem fundeps) (closureFundep rel))),
----  "Superkeys:",
----  unlines (map unwords (superkeys rel)),
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
