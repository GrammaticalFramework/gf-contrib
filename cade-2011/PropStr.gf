concrete PropStr of Prop = open Prelude in {

lincat
  Prop = Str ;
  Atom = Bool => Str ;
  Pred1,
  Pred2,
  Var,
  Conj
    = Str ;
  Ind = {s : Str ; isSymbolic : Bool} ;
  Fun1 = {s,v : Str} ;
  Fun2 = {s,v : Str} ;

lin
  PAtom a = a ! True ;
  PNeg p = "it is not the case that" ++ p ;
  PConj c p q = p ++ c ++ q ;
  PImpl a b = "if" ++ a ++ "then" ++ b ;
  PUniv v p = "for all" ++ v ++ "," ++ p ;
  PExist v p = "there exists a" ++ v ++ "such that" ++ p ;

  APred1 p x = \\b => x.s ++ "is" ++ not b ++ p ;
  APred2 p x y = \\b => x.s ++ "is" ++ not b ++ p ++ "to" ++ y.s ;

  IVar x = {s = x ; isSymbolic = True} ;
  IFun1 f x = {
    s = case x.isSymbolic of {
          True  => app1 f.s x.s | "the" ++ f.v ++ "of" ++ x.s ; -- preferred symbolic, allowed verbal
          False => "the" ++ f.v ++ "of" ++ x.s
          } ;
    isSymbolic = x.isSymbolic
    } ;
  IFun2 f x y = {
    s = case <x.isSymbolic,y.isSymbolic> of {
          <True,True>  => app2 f.s x.s y.s | "the" ++ f.v ++ "of" ++ x.s ++ "and" ++ y.s ;
          _ => "the" ++ f.v ++ "of" ++ x.s ++ "and" ++ y.s
          } ;
    isSymbolic = x.isSymbolic
    } ;

  VString s = s.s ;

  CAnd = "and" ;
  COr = "or" ;

-- supplementary

lincat
  Kind = Number => Str ;
  [Prop],
  [Pred1], 
  [Ind] 
    = {hd,tl : Str} ;
  [Var]
    = {hd,tl : Str ; n : Number} ;

lin
  AKind p x = \\b => x.s ++ "is" ++ not b ++ "a" ++ p ! Sg ;

  PConjs c ps = ps.hd ++ c ++ ps.tl ;
  PUnivs vs k p = "for all" ++ k ! Pl ++ vs.hd ++ vs.tl ++ "," ++ p ;
  PExists vs k p = 
    case vs.n of {
      Sg => "there exists a" ++ k ! Sg ;
      Pl => "there exist" ++ k ! Pl
      }
      ++ vs.hd ++ vs.tl ++ "such that" ++ p ;

  PNegAtom a = a ! False ;

  BaseProp a b = mkList a b ;
  ConsProp a as = mkList (comma a as.hd) as.tl ;

  BaseVar a = mkList a [] ** {n = Sg} ;
  ConsVar a as = mkList (comma a as.hd) as.tl ** {n = Pl} ;

  BaseInd a b = mkList a.s b.s ;
  ConsInd a as = mkList (comma a.s as.hd) as.tl ;

  BasePred1 a b = mkList a b ;
  ConsPred1 a as = mkList (comma a as.hd) as.tl ;

lin
  ConjPred1 c ps = ps.hd ++ c ++ ps.tl ;

  APredColl f ps = \\b => ps.hd ++ "and" ++ ps.tl ++ "are" ++ not b ++ f ;
  APredRefl f x  = \\b => x.s ++ "is" ++ not b ++ f ++ "to itself" ;

  IFunC f ps = {s = "the" ++ f.v ++ "of" ++ ps.hd ++ "and" ++ ps.tl ; isSymbolic = False} ;

  IUniv k = {s = "every" ++ k ! Sg ; isSymbolic = False} ;
  IExist k = {s = "some" ++ k ! Sg ; isSymbolic = False} ;

  ConjInd c ps = {s = ps.hd ++ c ++ ps.tl ; isSymbolic = False} ;

  ModKind k m = \\n => m ++ k ! n ;

  PartPred f y = f ++ "to" ++ y.s ;

-- test lexicon

lin
  Vertical = "vertical" ;
  Horizontal = "horizontal" ;
  Parallel = "parallel" ;
  Equal = "equal" ;
  Line = noun "line" ;
  Point = noun "point" ;
  Centre = mkFun1 "centre" ;
  Intersection = mkFun2 "intersection" ;

  Set k = \\n => noun "set" ! n ++ "of" ++ k ! Pl ;

  Even = "even" ;
  Odd = "odd" ;
  Square = mkFun1 "square" ;
  Sum = mkFun2 "sum" ;
  Product = mkFun2 "product" ;
  Nat = noun "number" ;

  IInt i = {s = i.s ; isSymbolic = True} ;

param
  Number = Sg | Pl ;

oper
  mkList : Str -> Str -> {hd,tl : Str} = \hd,tl -> {hd = hd ; tl = tl} ;
  comma : Str -> Str -> Str = \x,y -> x ++ "," ++ y ;

  not : Bool -> Str = \b -> if_then_else Str b [] "not" ;

  noun : Str -> Number => Str = \s -> table {Sg => s ; Pl => s + "s"} ;

oper 
  app1 : Str -> Str -> Str = \f,x -> "\\" ++ f ++ "{" ++ x ++ "}" ; 
  app2 : Str -> Str -> Str -> Str = \f,x,y -> "\\" ++ f ++ "{" ++ x ++ "}" ++ "{" ++ y ++ "}" ; 

  mkFun1, mkFun2 : Str -> {s,v : Str} = \s -> {s,v = s} ;

}
