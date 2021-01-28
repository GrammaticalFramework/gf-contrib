{-# LANGUAGE PackageImports #-}
{-# LANGUAGE GADTs #-}
{-# OPTIONS_GHC -fglasgow-exts #-}

module TransProp where

import qualified "gf" PGF (Tree, showExpr)
import Prop   -- generated from GF

transfer :: Mode -> PGF.Tree -> PGF.Tree
transfer m = gf . trans . fg where
  trans = case m of
    MNone       -> id
    MMinimalize -> minimalizeP . normalizeP
    MNormalize  -> normalizeP 
    MOptimize   -> optimizeP

data Mode = MNone | MOptimize | MMinimalize | MNormalize deriving Show

noFreeVars :: PGF.Tree -> Bool
noFreeVars = null . freeVarsP . fg
  where
    freeVarsP :: GProp -> [GVar]
    freeVarsP = freeVars

-- we want:
-- it is not the case that x is horizontal and x is vertical ->
-- x is not horizontal and vertical

optimizeP :: GProp -> GProp
optimizeP = optimize

optimize :: forall c. Tree c -> Tree c
optimize t = case t of
  GPNeg (GPAtom a) -> GPNegAtom a
  GPConj co p q -> aggregate co $ optimize $ mergeConj co p q
  GPConjs co p -> aggregate co $ optimize p
  GAPred2 f x y | x == y -> GAPredRefl f x  ---- and no insitu quant in x
  GAPred2 f x y -> GAPred1 (GPartPred f y) x
  GPUniv x (GPImpl (GPAtom (GAKind k (GIVar y))) p) | y == x -> 
    let (km,pm) = getKindMod x k p in optimize $ GPUnivs (GListVar [x]) km pm
  GPExist x (GPConj GCAnd (GPAtom (GAKind k (GIVar y))) p) | y == x -> 
    optimize $ GPExists (GListVar [x]) k p
  GPUnivs  (GListVar [x]) k p -> inSitu GPUnivs  (GIUniv k)  k x $ optimize p 
  GPExists (GListVar [x]) k p -> inSitu GPExists (GIExist k) k x $ optimize p 
  _ -> composOp optimize t

-- assumes everything inside is binary conjunctions
mergeConj :: GConj -> GProp -> GProp -> GListProp
mergeConj co p q = GListProp (getConj p ++ getConj q)
 where
  getConj :: GProp -> [GProp]
  getConj p = case p of
    GPConj ko p1 p2 | ko == co -> getConj p1 ++ getConj p2
    _ -> [p]

aggregate :: GConj -> GListProp -> GProp
aggregate co p@(GListProp ps) = case getPreds ps of
  Just (fs,xs@(x:_)) | all (== x) xs -> GPAtom (GAPred1 (GConjPred1 co (GListPred1 fs)) x)
  Just (fs@(f:_),xs) | all (== f) fs -> GPAtom (GAPred1 f (GConjInd co (GListInd xs)))
  _ -> GPConjs co p

inSitu :: (GListVar -> GKind -> GProp -> GProp) -> GInd -> GKind -> GVar -> GProp -> GProp
inSitu quant qp k x b = case b of
  GPAtom (GAPred1 (GPartPred f y) z)              -> inSitu quant qp k x (GPAtom (GAPred2 f z y))
  GPAtom (GAPred1 f y)   | y == vx                -> GPAtom (GAPred1 f qp)
  GPAtom (GAPred1 f (GIFun1 h y))   | y == vx     -> GPAtom (GAPred1 f (GIFun1 h qp))
  GPAtom (GAKind  f y)   | y == vx                -> GPAtom (GAKind f qp)
  GPAtom (GAPredRefl f z)| z == vx                -> GPAtom (GAPredRefl f qp)
  GPAtom (GAPred2 f z y) | y == vx && notFree x z -> GPAtom (GAPred2 f z qp)
  GPAtom (GAPred2 f z y) | z == vx && notFree x y -> GPAtom (GAPred2 f qp y)
  _ -> quant (GListVar [x]) k b
 where 
  vx = GIVar x

getKindMod :: GVar -> GKind -> GProp -> (GKind,GProp)
getKindMod x k p = case p of
  GPImpl (GPAtom (GAPred1 q y)) p' | y == GIVar x -> (GModKind k q, p')
  _ -> (k,p)

-- for all line x , x is vertical or x is horizontal
-- every line is vertical or horizontal

getPreds :: [GProp] -> Maybe ([GPred1],[GInd])
getPreds = fmap unzip . mapM getPred where
  getPred :: GProp -> Maybe (GPred1,GInd)
  getPred p = case p of
    GPAtom (GAPred1 f x) ->  return (f,x)
    _ -> Nothing


-- this applies to a normalized Prop and makes it binary
minimalizeP :: GProp -> GProp
minimalizeP p = case p of
  GPConjs co (GListProp ps) -> foldl1 (GPConj co) (map minimalizeP ps)
  GPUnivs (GListVar xs) k b -> 
    foldl (flip GPUniv) 
          (GPImpl (foldl1 (GPConj GCAnd) [minKind k x | x <- xs]) (minimalizeP b)) 
          xs
  GPExists (GListVar xs) k b -> 
    foldl (flip GPExist) 
          (GPConj GCAnd (foldl1 (GPConj GCAnd) [minKind k x | x <- xs]) (minimalizeP b)) 
          xs
  _ -> p
 where
  minKind :: GKind -> GVar -> GProp
  minKind k x = case k of
    GModKind b f -> GPConj GCAnd (minKind b x) (GPAtom (GAPred1 f (GIVar x)))
    _ -> (GPAtom (GAKind k (GIVar x)))

normalizeP :: GProp -> GProp
normalizeP = iProp
 
iProp :: GProp -> Prop
iProp p = case p of
  GPNegAtom a -> GPNeg (iAtom a)
  GPAtom a -> iAtom a
  GPConjs co (GListProp ps) -> GPConjs co (GListProp (map iProp ps))
  GPUnivs xs k b -> GPUnivs xs k (iProp b)
  GPExists xs k b -> GPExists xs k (iProp b)
  _ -> p

iAtom :: GAtom -> Prop
iAtom a = case a of
  GAKind  f x    -> iInd x (\i -> GPAtom (GAKind f i))
  GAPred1 f x    -> iInd x (iPred1 f)
  GAPred2 f x y  -> iInd x (\u -> iInd y (\v -> iPred2 f u v))
  GAPredRefl f x -> iInd x (\u -> iPred2 f u u)

iPred1 :: GPred1 -> Ind -> Prop
iPred1 f i = case f of
  GConjPred1 co (GListPred1 fs) -> GPConjs co (GListProp [iPred1 g i | g <- fs]) 
  GPartPred f y -> iPred2 f i y
  _ -> GPAtom (GAPred1 f i)

iPred2 :: GPred2 -> Ind -> Ind -> Prop
iPred2 f i j = case f of
  _ -> GPAtom (GAPred2 f i j)

iInd :: GInd -> (Ind -> Prop) -> Prop
iInd q f = case q of
  GIUniv  k -> let x = newVar 1 in GPUnivs  (GListVar [x]) k (f (GIVar x))
  GIExist k -> let x = newVar 2 in GPExists (GListVar [x]) k (f (GIVar x))
  GIFun1 g r -> iInd r (\x -> f (GIFun1 g x)) 
  GIFun2 g r s -> iInd r (\x -> iInd s (\y -> f (GIFun2 g x y))) 
  GIFunC g (GListInd rs) -> wind rs (\x y -> f (GIFun2 g x y)) where
    wind qs h = case qs of
      [r,s] -> iInd r (\x -> iInd s (\y -> h x y))
      r :ss -> iInd r (\x -> wind ss (\y z -> h (GIFun2 g x y) z)) 
  GConjInd co (GListInd rs) -> wind rs (\x y -> GPConj co (f x) (f y)) where
    wind qs h = case qs of
      [r,s] -> iInd r (\x -> iInd s (\y -> h x y))
      r :ss -> iInd r (\x -> wind ss (\y z -> GPConj co (GPConj co (f x) (f y)) (f z)))
  GIVar _  -> f q
  GIInt _  -> f q
--  _ -> error $ "ind not covered: " ++ PGF.showExpr [] (gf q)



type Prop = GProp
type Ind = GInd

newVar i = GVString (GString ("x" ++ show i)) ---

freeVars :: Tree a -> [GVar]
freeVars t = [x | x@(GVString _) <- freeVarsM t]
 where
  freeVarsM :: forall a. Tree a -> [GVar]
  freeVarsM t = case t of
    GPUniv x p -> filter (/= x) $ freeVarsM p
    GPExist x p -> filter (/= x) $ freeVarsM p
    GPUnivs (GListVar xs) k p -> freeVarsM k ++ filter (flip notElem xs) (freeVarsM p)
    GPExists (GListVar xs) k p -> freeVarsM k ++ filter (flip notElem xs) (freeVarsM p)
    GVString _ -> [t]
    _ -> composOpMPlus freeVarsM t

notFree :: GVar -> Tree a -> Bool
notFree x t = notElem x (freeVars t)

--composOpMPlus :: (Compos t, MonadPlus m) => (forall a. t a -> m b) -> t c -> m b
--composOpM :: (Compos t, Monad m) => (forall a. t a -> m (t a)) -> t c -> m (t c)

