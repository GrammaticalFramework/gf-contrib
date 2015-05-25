--# -path=.:alltenses

concrete QueryArithmEng of QueryArithm = 
  YAQLEng - [TPast,QPWho,QPWhos,QAdv,QAdvEntity,MAssert] ** 
   open SyntaxEng, ParadigmsEng, SymbolicEng, BuildQueryEng, Prelude in {

lincat
  MathFunction = F1 ;
  Entities = NP ;
lin
  KNumber = mkCN (mkN "number") ;
  EInteger i = symb i ;
  ENumeral n = mkNP (mkDet (lin Numeral n)) ;
  PEven = adjectiveProperty (mkA "even") ;
  POdd = adjectiveProperty (mkA "odd") ;
  PPrime = adjectiveProperty (mkA "prime") ;
  RDivisible = adjectiveRelation (mkA "divisible") (mkPrep "by") ;
  RSmaller = comparativeRelation (mkA "small") ;
  RGreater = comparativeRelation (mkA "great") ;

  ESum xs = mkNP the_Det (mkCN (mkN2 (mkN "sum")) xs) ;
  EProduct xs = mkNP the_Det (mkCN (mkN2 (mkN "product")) xs) ;
  ESquare = {cn = mkCN (mkN "square") ; prep = possess_Prep} ;
  ESquareRoot = {cn = mkCN (mkN "square root") ; prep = possess_Prep} ;
  EFactorial = {cn = mkCN (mkN "factorial") ; prep = possess_Prep} ;

  FMathFunction f = f ;
  EMathFunction func term = mkNP the_Det (mkCN func.cn (SyntaxEng.mkAdv func.prep term)) ; --- thePl_Det for plural term

  EsTwo  x y = mkNP and_Conj x y ;
  EsCons x y = mkNP and_Conj x y ;
  EsFromTo k x y = mkNP thePl_Det (mkCN (mkCN k (SyntaxEng.mkAdv from_Prep x)) (SyntaxEng.mkAdv to_Prep y)) ;
  EsAllKind k = mkNP all_Predet (mkNP aPl_Det k) ;
}