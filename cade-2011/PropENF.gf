--# -path=.:present

-- full English; PropEng is by a functor

concrete PropENF of Prop = open 
  SyntaxEng, 
  (P = ParadigmsEng), 
  SymbolicEng, 
  SymbolEng,
  (Lang = LangEng),
  Prelude in {

lincat
  Prop = S ;
  Atom = Cl ;
  Pred1 = AP ;
  Pred2 = A2 ;
  Var = Symb ;
  Conj = SyntaxEng.Conj ;
  Ind  = NP ; --- {s : NP ; isSymbolic : Bool} ;
  Fun1 = {s : Symb ; v : N2} ;
  Fun2 = {s : Symb ; v : N2} ;

lin
  PAtom = mkS ;
  PNeg p =  
    Lang.SSubjS
      (mkS negativePol (mkCl 
        (mkVP (mkNP the_Quant case_N)))) that_Subj p ; 
  PConj = mkS ;
  PImpl p q = mkS (mkAdv if_Subj p) (mkS then_Adv q) ;
  PUniv v p = mkS (mkAdv for_Prep (mkNP all_Predet (mkNP (SymbPN v)))) p ;
  PExist v p = 
    mkS (mkCl (mkNP a_Quant (mkCN (mkCN element_N (mkNP (SymbPN v))) (mkAP (mkAP such_A) p)))) ;
  APred1 f x = mkCl x f ;
  APred2 f x y = mkCl x f y ;

  IVar x = mkNP (SymbPN x) ; -- {s = symb x ; isSymbolic = True} ;

  IFun1 f = app f.v ; 
  IFun2 f = app f.v ; 

{- ---
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
-}

  VString s = mkSymb s.s ;

  CAnd = and_Conj ;
  COr = or_Conj ;

-- supplementary

lincat
  Kind = CN ;
  [Prop] = [S] ;
  [Pred1] = [AP] ;
  [Ind] = [NP] ;
  [Var] = NP ;

lin
  AKind k x = mkCl x k ;

  PConjs = mkS ;
  PUnivs vs k p = 
    mkS (mkAdv for_Prep (mkNP all_Predet (mkNP aPl_Det (mkCN k vs)))) p ;
  PExists vs k p =
    mkS (mkCl (mkNP a_Quant (mkCN (mkCN k vs) (mkAP (mkAP such_A) p)))) ;
  PNegAtom = mkS negativePol ;

  BaseProp = mkListS ;
  ConsProp = mkListS ;

  BaseVar x = mkNP (SymbPN x) ;
  ConsVar x xs = mkNP and_Conj (mkListNP (mkNP (SymbPN x)) xs) ;

  BaseInd = mkListNP ;
  ConsInd = mkListNP ;

  BasePred1 = mkListAP ;
  ConsPred1 = mkListAP ;

lin
  ConjPred1 = mkAP ;

  APredColl f ps = mkCl (mkNP and_Conj ps) (mkAP f) ;
  APredRefl f x = mkCl x (reflAP f) ;

  IFunC f xs = app f.v (mkNP and_Conj xs) ; 

  IUniv = mkNP every_Det ;
  IExist = mkNP someSg_Det ;

  ConjInd = mkNP ;

  ModKind k m = mkCN m k ;

  PartPred = mkAP ; 

  IInt i = symb i.s ; -- {s = i.s ; isSymbolic = True} ;


oper
  app1 : Str -> Str -> Str = \f,x -> "\\" ++ f ++ "{" ++ x ++ "}" ; 
  app2 : Str -> Str -> Str -> Str = \f,x,y -> "\\" ++ f ++ "{" ++ x ++ "}" ++ "{" ++ y ++ "}" ; 

  mkFun1, mkFun2 : Str -> {s : Symb ; v : N2} = \s -> {s = mkSymb s ; v = P.mkN2 (P.mkN s)} ;

-- instance of interface

oper
  case_N = P.mkN "case" ;
  such_A = P.mkA "such" ;
  then_Adv = P.mkAdv "then" ;
  element_N = P.mkN "element" ;
  set_N2 = P.mkN2 (P.mkN "set") ;


-- test lexicon

lin
  Vertical = mkAP (P.mkA "vertical") ;
  Horizontal = mkAP (P.mkA "horizontal") ;
  Parallel = P.mkA2 (P.mkA "parallel") to_Prep ;
  Equal = P.mkA2 (P.mkA "equal") to_Prep ;
  Line = mkCN (P.mkN "line") ;
  Point = mkCN (P.mkN "point") ;
  Centre = mkFun1 "centre" ;
  Intersection = mkFun2 "intersection" ;

  Set k = mkCN set_N2 (mkNP a_Art plNum k) ; 

  Even = mkAP (P.mkA "even") ;
  Odd = mkAP (P.mkA "odd") ;
  Square = mkFun1 "square" ;
  Sum = mkFun2 "sum" ;
  Product = mkFun2 "product" ;
  Nat = mkCN (P.mkN "number") ;

}
