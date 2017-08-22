abstract Prop = {

flags startcat = Prop ;

cat
  Prop ;
  Atom ;
  Pred1 ;
  Pred2 ;
  Ind ;
  Var ;
  Fun1 ;
  Fun2 ;
  Conj ;

fun
  PAtom  : Atom  -> Prop ;
  PNeg   : Prop  -> Prop ;
  PConj  : Conj  -> Prop -> Prop -> Prop ;
  PImpl  : Prop  -> Prop -> Prop ;

  PUniv  : Var -> Prop -> Prop ;
  PExist : Var -> Prop -> Prop ;

  IVar   : Var -> Ind ;

  APred1 : Pred1 -> Ind -> Atom ;
  APred2 : Pred2 -> Ind -> Ind -> Atom ;

  IFun1  : Fun1 -> Ind -> Ind ;
  IFun2  : Fun2 -> Ind -> Ind -> Ind ;

  VString : String -> Var ;

  CAnd, COr : Conj ;

-- supplementary

cat
  Kind ;
  [Prop] {2} ;
  [Var] {1} ;
  [Ind] {2} ;
  [Pred1] {2} ;

fun
  PConjs  : Conj  -> [Prop] -> Prop ;
  PUnivs  : [Var] -> Kind -> Prop -> Prop ;
  PExists : [Var] -> Kind -> Prop -> Prop ;

  PNegAtom  : Atom -> Prop ;

  ConjPred1 : Conj -> [Pred1] -> Pred1 ;

  APredColl : Pred2 -> [Ind] -> Atom ;

  APredRefl : Pred2 -> Ind -> Atom ;

  IFunC  : Fun2 -> [Ind] -> Ind ;

  AKind  : Kind  -> Ind -> Atom ;

  IUniv  : Kind -> Ind ;
  IExist : Kind -> Ind ;

  ConjInd : Conj -> [Ind] -> Ind ;

  ModKind : Kind -> Pred1 -> Kind ;

  PartPred : Pred2 -> Ind -> Pred1 ; -- partial application: equal -> equal to y

-- test lexicon: geometry

fun
  Vertical, Horizontal : Pred1 ;
  Parallel, Equal : Pred2 ;
  Line, Point : Kind ;
  Centre : Fun1 ;
  Intersection : Fun2 ;  

  Set : Kind -> Kind ;

-- test lexicon: arithmetic

  Even, Odd    : Pred1 ;
  Nat          : Kind ;
  Square       : Fun1 ;
  Sum, Product : Fun2 ;
  IInt         : Int -> Ind ;

}
