--# -path=.:present

concrete PropFre of Prop = PropI - [PUnivs,IUniv]  with 
  (Syntax = SyntaxFre), 
  (Symbolic = SymbolicFre), 
  (Sentence = SentenceFre)
   ** open (P = ParadigmsFre), IrregFre, Prelude, ExtraFre in {

flags coding = utf8 ;

-- exception

lin
  PUnivs vs k p = 
    {s = ExtAdvS (mkAdv for_Prep (mkNP all_Predet (mkNP thePl_Det (mkCN k vs)))) p.s ; c = False} ;

  IUniv k = {s = mkNP tout_Det k ; isSymbolic = False} ;

-- instance of interface

oper
  case_N = P.mkN "cas" ;
  such_A = P.mkA "tel" ;
  then_Adv = P.mkAdv "alors" ;
  element_N = P.mkN "élément" ;
  set_N2 = P.mkN2 (P.mkN "ensemble" P.masculine) possess_Prep ;
  hold_V = P.mkV valoir_V2 ;

  singular = P.singular ; ---

-- test lexicon

lin
  Vertical = mkAP (P.mkA "vertical") ;
  Horizontal = mkAP (P.mkA "horizontal") ;
  Parallel = P.mkA2 (P.mkA "parallèle") to_Prep ;
  Equal = P.mkA2 (P.mkA "égal") P.dative ;
  Line = mkCN (P.mkN "ligne") ;
  Point = mkCN (P.mkN "point") ;
  Centre = mkFun1 "centre" (P.mkN "centre" P.masculine) possess_Prep ;
  Intersection = mkFun2 "intersection" (P.mkN "intersection" P.feminine) possess_Prep ;

  Set k = mkCN set_N2 (mkNP a_Art plNum k) ; 

  Even = mkAP (P.mkA "pair") ;
  Odd = mkAP (P.mkA "impair") ;
  Square = mkFun1 "square" (P.mkN "carré") possess_Prep ;
  Sum = mkFun2 "sum" (P.mkN "somme") possess_Prep ;
  Product = mkFun2 "product" (P.mkN "produit") possess_Prep ;
  Nat = mkCN (P.mkN "entier") ;

oper
  mkFun1, mkFun2 : Str -> N -> Prep -> {s : Symb ; v : N2} = \s,n,p -> 
    {s = mkSymb ("\\" + s) ; v = P.mkN2 n p} ;

}
