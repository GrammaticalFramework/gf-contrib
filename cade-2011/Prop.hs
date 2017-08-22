{-# OPTIONS_GHC -fglasgow-exts #-}
module Prop where

import Control.Monad.Identity
import Data.Monoid
import PGF hiding (Tree)
import qualified PGF
----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> PGF.Tree
  fg :: PGF.Tree -> a

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

instance Gf GFloat where
  gf (GFloat x) = mkDouble x
  fg t =
    case unDouble t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

type GAtom = Tree GAtom_
data GAtom_
type GConj = Tree GConj_
data GConj_
type GFun1 = Tree GFun1_
data GFun1_
type GFun2 = Tree GFun2_
data GFun2_
type GInd = Tree GInd_
data GInd_
type GKind = Tree GKind_
data GKind_
type GListInd = Tree GListInd_
data GListInd_
type GListPred1 = Tree GListPred1_
data GListPred1_
type GListProp = Tree GListProp_
data GListProp_
type GListVar = Tree GListVar_
data GListVar_
type GPred1 = Tree GPred1_
data GPred1_
type GPred2 = Tree GPred2_
data GPred2_
type GProp = Tree GProp_
data GProp_
type GVar = Tree GVar_
data GVar_
type GString = Tree GString_
data GString_
type GInt = Tree GInt_
data GInt_
type GFloat = Tree GFloat_
data GFloat_

data Tree :: * -> * where
  GAKind :: GKind -> GInd -> Tree GAtom_
  GAPred1 :: GPred1 -> GInd -> Tree GAtom_
  GAPred2 :: GPred2 -> GInd -> GInd -> Tree GAtom_
  GAPredColl :: GPred2 -> GListInd -> Tree GAtom_
  GAPredRefl :: GPred2 -> GInd -> Tree GAtom_
  GCAnd :: Tree GConj_
  GCOr :: Tree GConj_
  GCentre :: Tree GFun1_
  GSquare :: Tree GFun1_
  GIntersection :: Tree GFun2_
  GProduct :: Tree GFun2_
  GSum :: Tree GFun2_
  GConjInd :: GConj -> GListInd -> Tree GInd_
  GIExist :: GKind -> Tree GInd_
  GIFun1 :: GFun1 -> GInd -> Tree GInd_
  GIFun2 :: GFun2 -> GInd -> GInd -> Tree GInd_
  GIFunC :: GFun2 -> GListInd -> Tree GInd_
  GIInt :: GInt -> Tree GInd_
  GIUniv :: GKind -> Tree GInd_
  GIVar :: GVar -> Tree GInd_
  GLine :: Tree GKind_
  GModKind :: GKind -> GPred1 -> Tree GKind_
  GNat :: Tree GKind_
  GPoint :: Tree GKind_
  GSet :: GKind -> Tree GKind_
  GListInd :: [GInd] -> Tree GListInd_
  GListPred1 :: [GPred1] -> Tree GListPred1_
  GListProp :: [GProp] -> Tree GListProp_
  GListVar :: [GVar] -> Tree GListVar_
  GConjPred1 :: GConj -> GListPred1 -> Tree GPred1_
  GEven :: Tree GPred1_
  GHorizontal :: Tree GPred1_
  GOdd :: Tree GPred1_
  GPartPred :: GPred2 -> GInd -> Tree GPred1_
  GVertical :: Tree GPred1_
  GEqual :: Tree GPred2_
  GParallel :: Tree GPred2_
  GPAtom :: GAtom -> Tree GProp_
  GPConj :: GConj -> GProp -> GProp -> Tree GProp_
  GPConjs :: GConj -> GListProp -> Tree GProp_
  GPExist :: GVar -> GProp -> Tree GProp_
  GPExists :: GListVar -> GKind -> GProp -> Tree GProp_
  GPImpl :: GProp -> GProp -> Tree GProp_
  GPNeg :: GProp -> Tree GProp_
  GPNegAtom :: GAtom -> Tree GProp_
  GPUniv :: GVar -> GProp -> Tree GProp_
  GPUnivs :: GListVar -> GKind -> GProp -> Tree GProp_
  GVString :: GString -> Tree GVar_
  GString :: String -> Tree GString_
  GInt :: Int -> Tree GInt_
  GFloat :: Double -> Tree GFloat_

instance Eq (Tree a) where
  i == j = case (i,j) of
    (GAKind x1 x2,GAKind y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GAPred1 x1 x2,GAPred1 y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GAPred2 x1 x2 x3,GAPred2 y1 y2 y3) -> and [ x1 == y1 , x2 == y2 , x3 == y3 ]
    (GAPredColl x1 x2,GAPredColl y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GAPredRefl x1 x2,GAPredRefl y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GCAnd,GCAnd) -> and [ ]
    (GCOr,GCOr) -> and [ ]
    (GCentre,GCentre) -> and [ ]
    (GSquare,GSquare) -> and [ ]
    (GIntersection,GIntersection) -> and [ ]
    (GProduct,GProduct) -> and [ ]
    (GSum,GSum) -> and [ ]
    (GConjInd x1 x2,GConjInd y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GIExist x1,GIExist y1) -> and [ x1 == y1 ]
    (GIFun1 x1 x2,GIFun1 y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GIFun2 x1 x2 x3,GIFun2 y1 y2 y3) -> and [ x1 == y1 , x2 == y2 , x3 == y3 ]
    (GIFunC x1 x2,GIFunC y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GIInt x1,GIInt y1) -> and [ x1 == y1 ]
    (GIUniv x1,GIUniv y1) -> and [ x1 == y1 ]
    (GIVar x1,GIVar y1) -> and [ x1 == y1 ]
    (GLine,GLine) -> and [ ]
    (GModKind x1 x2,GModKind y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GNat,GNat) -> and [ ]
    (GPoint,GPoint) -> and [ ]
    (GSet x1,GSet y1) -> and [ x1 == y1 ]
    (GListInd x1,GListInd y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GListPred1 x1,GListPred1 y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GListProp x1,GListProp y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GListVar x1,GListVar y1) -> and [x == y | (x,y) <- zip x1 y1]
    (GConjPred1 x1 x2,GConjPred1 y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GEven,GEven) -> and [ ]
    (GHorizontal,GHorizontal) -> and [ ]
    (GOdd,GOdd) -> and [ ]
    (GPartPred x1 x2,GPartPred y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GVertical,GVertical) -> and [ ]
    (GEqual,GEqual) -> and [ ]
    (GParallel,GParallel) -> and [ ]
    (GPAtom x1,GPAtom y1) -> and [ x1 == y1 ]
    (GPConj x1 x2 x3,GPConj y1 y2 y3) -> and [ x1 == y1 , x2 == y2 , x3 == y3 ]
    (GPConjs x1 x2,GPConjs y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GPExist x1 x2,GPExist y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GPExists x1 x2 x3,GPExists y1 y2 y3) -> and [ x1 == y1 , x2 == y2 , x3 == y3 ]
    (GPImpl x1 x2,GPImpl y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GPNeg x1,GPNeg y1) -> and [ x1 == y1 ]
    (GPNegAtom x1,GPNegAtom y1) -> and [ x1 == y1 ]
    (GPUniv x1 x2,GPUniv y1 y2) -> and [ x1 == y1 , x2 == y2 ]
    (GPUnivs x1 x2 x3,GPUnivs y1 y2 y3) -> and [ x1 == y1 , x2 == y2 , x3 == y3 ]
    (GVString x1,GVString y1) -> and [ x1 == y1 ]
    (GString x, GString y) -> x == y
    (GInt x, GInt y) -> x == y
    (GFloat x, GFloat y) -> x == y
    _ -> False

instance Gf GAtom where
  gf (GAKind x1 x2) = mkApp (mkCId "AKind") [gf x1, gf x2]
  gf (GAPred1 x1 x2) = mkApp (mkCId "APred1") [gf x1, gf x2]
  gf (GAPred2 x1 x2 x3) = mkApp (mkCId "APred2") [gf x1, gf x2, gf x3]
  gf (GAPredColl x1 x2) = mkApp (mkCId "APredColl") [gf x1, gf x2]
  gf (GAPredRefl x1 x2) = mkApp (mkCId "APredRefl") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AKind" -> GAKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "APred1" -> GAPred1 (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "APred2" -> GAPred2 (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "APredColl" -> GAPredColl (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "APredRefl" -> GAPredRefl (fg x1) (fg x2)


      _ -> error ("no Atom " ++ show t)

instance Gf GConj where
  gf GCAnd = mkApp (mkCId "CAnd") []
  gf GCOr = mkApp (mkCId "COr") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "CAnd" -> GCAnd 
      Just (i,[]) | i == mkCId "COr" -> GCOr 


      _ -> error ("no Conj " ++ show t)

instance Gf GFun1 where
  gf GCentre = mkApp (mkCId "Centre") []
  gf GSquare = mkApp (mkCId "Square") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Centre" -> GCentre 
      Just (i,[]) | i == mkCId "Square" -> GSquare 


      _ -> error ("no Fun1 " ++ show t)

instance Gf GFun2 where
  gf GIntersection = mkApp (mkCId "Intersection") []
  gf GProduct = mkApp (mkCId "Product") []
  gf GSum = mkApp (mkCId "Sum") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Intersection" -> GIntersection 
      Just (i,[]) | i == mkCId "Product" -> GProduct 
      Just (i,[]) | i == mkCId "Sum" -> GSum 


      _ -> error ("no Fun2 " ++ show t)

instance Gf GInd where
  gf (GConjInd x1 x2) = mkApp (mkCId "ConjInd") [gf x1, gf x2]
  gf (GIExist x1) = mkApp (mkCId "IExist") [gf x1]
  gf (GIFun1 x1 x2) = mkApp (mkCId "IFun1") [gf x1, gf x2]
  gf (GIFun2 x1 x2 x3) = mkApp (mkCId "IFun2") [gf x1, gf x2, gf x3]
  gf (GIFunC x1 x2) = mkApp (mkCId "IFunC") [gf x1, gf x2]
  gf (GIInt x1) = mkApp (mkCId "IInt") [gf x1]
  gf (GIUniv x1) = mkApp (mkCId "IUniv") [gf x1]
  gf (GIVar x1) = mkApp (mkCId "IVar") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjInd" -> GConjInd (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "IExist" -> GIExist (fg x1)
      Just (i,[x1,x2]) | i == mkCId "IFun1" -> GIFun1 (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "IFun2" -> GIFun2 (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "IFunC" -> GIFunC (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "IInt" -> GIInt (fg x1)
      Just (i,[x1]) | i == mkCId "IUniv" -> GIUniv (fg x1)
      Just (i,[x1]) | i == mkCId "IVar" -> GIVar (fg x1)


      _ -> error ("no Ind " ++ show t)

instance Gf GKind where
  gf GLine = mkApp (mkCId "Line") []
  gf (GModKind x1 x2) = mkApp (mkCId "ModKind") [gf x1, gf x2]
  gf GNat = mkApp (mkCId "Nat") []
  gf GPoint = mkApp (mkCId "Point") []
  gf (GSet x1) = mkApp (mkCId "Set") [gf x1]

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Line" -> GLine 
      Just (i,[x1,x2]) | i == mkCId "ModKind" -> GModKind (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "Nat" -> GNat 
      Just (i,[]) | i == mkCId "Point" -> GPoint 
      Just (i,[x1]) | i == mkCId "Set" -> GSet (fg x1)


      _ -> error ("no Kind " ++ show t)

instance Gf GListInd where
  gf (GListInd [x1,x2]) = mkApp (mkCId "BaseInd") [gf x1, gf x2]
  gf (GListInd (x:xs)) = mkApp (mkCId "ConsInd") [gf x, gf (GListInd xs)]
  fg t =
    GListInd (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseInd" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsInd" -> fg x1 : fgs x2


      _ -> error ("no ListInd " ++ show t)

instance Gf GListPred1 where
  gf (GListPred1 [x1,x2]) = mkApp (mkCId "BasePred1") [gf x1, gf x2]
  gf (GListPred1 (x:xs)) = mkApp (mkCId "ConsPred1") [gf x, gf (GListPred1 xs)]
  fg t =
    GListPred1 (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BasePred1" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsPred1" -> fg x1 : fgs x2


      _ -> error ("no ListPred1 " ++ show t)

instance Gf GListProp where
  gf (GListProp [x1,x2]) = mkApp (mkCId "BaseProp") [gf x1, gf x2]
  gf (GListProp (x:xs)) = mkApp (mkCId "ConsProp") [gf x, gf (GListProp xs)]
  fg t =
    GListProp (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseProp" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsProp" -> fg x1 : fgs x2


      _ -> error ("no ListProp " ++ show t)

instance Gf GListVar where
  gf (GListVar [x1]) = mkApp (mkCId "BaseVar") [gf x1]
  gf (GListVar (x:xs)) = mkApp (mkCId "ConsVar") [gf x, gf (GListVar xs)]
  fg t =
    GListVar (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1]) | i == mkCId "BaseVar" -> [fg x1]
      Just (i,[x1,x2]) | i == mkCId "ConsVar" -> fg x1 : fgs x2


      _ -> error ("no ListVar " ++ show t)

instance Gf GPred1 where
  gf (GConjPred1 x1 x2) = mkApp (mkCId "ConjPred1") [gf x1, gf x2]
  gf GEven = mkApp (mkCId "Even") []
  gf GHorizontal = mkApp (mkCId "Horizontal") []
  gf GOdd = mkApp (mkCId "Odd") []
  gf (GPartPred x1 x2) = mkApp (mkCId "PartPred") [gf x1, gf x2]
  gf GVertical = mkApp (mkCId "Vertical") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjPred1" -> GConjPred1 (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "Even" -> GEven 
      Just (i,[]) | i == mkCId "Horizontal" -> GHorizontal 
      Just (i,[]) | i == mkCId "Odd" -> GOdd 
      Just (i,[x1,x2]) | i == mkCId "PartPred" -> GPartPred (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "Vertical" -> GVertical 


      _ -> error ("no Pred1 " ++ show t)

instance Gf GPred2 where
  gf GEqual = mkApp (mkCId "Equal") []
  gf GParallel = mkApp (mkCId "Parallel") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Equal" -> GEqual 
      Just (i,[]) | i == mkCId "Parallel" -> GParallel 


      _ -> error ("no Pred2 " ++ show t)

instance Gf GProp where
  gf (GPAtom x1) = mkApp (mkCId "PAtom") [gf x1]
  gf (GPConj x1 x2 x3) = mkApp (mkCId "PConj") [gf x1, gf x2, gf x3]
  gf (GPConjs x1 x2) = mkApp (mkCId "PConjs") [gf x1, gf x2]
  gf (GPExist x1 x2) = mkApp (mkCId "PExist") [gf x1, gf x2]
  gf (GPExists x1 x2 x3) = mkApp (mkCId "PExists") [gf x1, gf x2, gf x3]
  gf (GPImpl x1 x2) = mkApp (mkCId "PImpl") [gf x1, gf x2]
  gf (GPNeg x1) = mkApp (mkCId "PNeg") [gf x1]
  gf (GPNegAtom x1) = mkApp (mkCId "PNegAtom") [gf x1]
  gf (GPUniv x1 x2) = mkApp (mkCId "PUniv") [gf x1, gf x2]
  gf (GPUnivs x1 x2 x3) = mkApp (mkCId "PUnivs") [gf x1, gf x2, gf x3]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "PAtom" -> GPAtom (fg x1)
      Just (i,[x1,x2,x3]) | i == mkCId "PConj" -> GPConj (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "PConjs" -> GPConjs (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "PExist" -> GPExist (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "PExists" -> GPExists (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "PImpl" -> GPImpl (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "PNeg" -> GPNeg (fg x1)
      Just (i,[x1]) | i == mkCId "PNegAtom" -> GPNegAtom (fg x1)
      Just (i,[x1,x2]) | i == mkCId "PUniv" -> GPUniv (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "PUnivs" -> GPUnivs (fg x1) (fg x2) (fg x3)


      _ -> error ("no Prop " ++ show t)

instance Gf GVar where
  gf (GVString x1) = mkApp (mkCId "VString") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "VString" -> GVString (fg x1)


      _ -> error ("no Var " ++ show t)


instance Compos Tree where
  compos r a f t = case t of
    GAKind x1 x2 -> r GAKind `a` f x1 `a` f x2
    GAPred1 x1 x2 -> r GAPred1 `a` f x1 `a` f x2
    GAPred2 x1 x2 x3 -> r GAPred2 `a` f x1 `a` f x2 `a` f x3
    GAPredColl x1 x2 -> r GAPredColl `a` f x1 `a` f x2
    GAPredRefl x1 x2 -> r GAPredRefl `a` f x1 `a` f x2
    GConjInd x1 x2 -> r GConjInd `a` f x1 `a` f x2
    GIExist x1 -> r GIExist `a` f x1
    GIFun1 x1 x2 -> r GIFun1 `a` f x1 `a` f x2
    GIFun2 x1 x2 x3 -> r GIFun2 `a` f x1 `a` f x2 `a` f x3
    GIFunC x1 x2 -> r GIFunC `a` f x1 `a` f x2
    GIInt x1 -> r GIInt `a` f x1
    GIUniv x1 -> r GIUniv `a` f x1
    GIVar x1 -> r GIVar `a` f x1
    GModKind x1 x2 -> r GModKind `a` f x1 `a` f x2
    GSet x1 -> r GSet `a` f x1
    GConjPred1 x1 x2 -> r GConjPred1 `a` f x1 `a` f x2
    GPartPred x1 x2 -> r GPartPred `a` f x1 `a` f x2
    GPAtom x1 -> r GPAtom `a` f x1
    GPConj x1 x2 x3 -> r GPConj `a` f x1 `a` f x2 `a` f x3
    GPConjs x1 x2 -> r GPConjs `a` f x1 `a` f x2
    GPExist x1 x2 -> r GPExist `a` f x1 `a` f x2
    GPExists x1 x2 x3 -> r GPExists `a` f x1 `a` f x2 `a` f x3
    GPImpl x1 x2 -> r GPImpl `a` f x1 `a` f x2
    GPNeg x1 -> r GPNeg `a` f x1
    GPNegAtom x1 -> r GPNegAtom `a` f x1
    GPUniv x1 x2 -> r GPUniv `a` f x1 `a` f x2
    GPUnivs x1 x2 x3 -> r GPUnivs `a` f x1 `a` f x2 `a` f x3
    GVString x1 -> r GVString `a` f x1
    GListInd x1 -> r GListInd `a` foldr (a . a (r (:)) . f) (r []) x1
    GListPred1 x1 -> r GListPred1 `a` foldr (a . a (r (:)) . f) (r []) x1
    GListProp x1 -> r GListProp `a` foldr (a . a (r (:)) . f) (r []) x1
    GListVar x1 -> r GListVar `a` foldr (a . a (r (:)) . f) (r []) x1
    _ -> r t

class Compos t where
  compos :: (forall a. a -> m a) -> (forall a b. m (a -> b) -> m a -> m b)
         -> (forall a. t a -> m (t a)) -> t c -> m (t c)

composOp :: Compos t => (forall a. t a -> t a) -> t c -> t c
composOp f = runIdentity . composOpM (Identity . f)

composOpM :: (Compos t, Monad m) => (forall a. t a -> m (t a)) -> t c -> m (t c)
composOpM = compos return ap

composOpM_ :: (Compos t, Monad m) => (forall a. t a -> m ()) -> t c -> m ()
composOpM_ = composOpFold (return ()) (>>)

composOpMonoid :: (Compos t, Monoid m) => (forall a. t a -> m) -> t c -> m
composOpMonoid = composOpFold mempty mappend

composOpMPlus :: (Compos t, MonadPlus m) => (forall a. t a -> m b) -> t c -> m b
composOpMPlus = composOpFold mzero mplus

composOpFold :: Compos t => b -> (b -> b -> b) -> (forall a. t a -> b) -> t c -> b
composOpFold z c f = unC . compos (\_ -> C z) (\(C x) (C y) -> C (c x y)) (C . f)

newtype C b a = C { unC :: b }
