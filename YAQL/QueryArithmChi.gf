--# -path=.:alltenses

concrete QueryArithmChi of QueryArithm = 
  YAQLChi - [TPast,QPWho,QPWhos,QAdv,QAdvEntity,MAssert] ** 
   open SyntaxChi, ParadigmsChi, SymbolicChi, BuildQueryChi, Prelude in {

lincat
  MathFunction = F1 ;
  Entities = NP ;
lin
  KNumber = mkCN (mkN "number") ;
  EInteger i = symb i ;
  ENumeral n = SyntaxChi.mkNP (SyntaxChi.mkDet <lin Numeral n : Numeral>) ;
  PEven = adjectiveProperty (mkA "even") ;
  POdd = adjectiveProperty (mkA "odd") ;
  PPrime = adjectiveProperty (mkA "prime") ;
  RDivisible = adjectiveRelation (mkA "divisible") (mkPrep "by") ;
  RSmaller = comparativeRelation (mkA "small") ;
  RGreater = comparativeRelation (mkA "great") ;

  ESum xs = SyntaxChi.mkNP the_Det (mkCN (mkN2 "sum") xs) ;
  EProduct xs = SyntaxChi.mkNP the_Det (mkCN (mkN2 "product") xs) ;
  ESquare = {cn = mkCN (mkN "square") ; prep = possess_Prep} ;
  ESquareRoot = {cn = mkCN (mkN "square root") ; prep = possess_Prep} ;
  EFactorial = {cn = mkCN (mkN "factorial") ; prep = possess_Prep} ;

  FMathFunction f = f ;
  EMathFunction func term = SyntaxChi.mkNP the_Det (mkCN func.cn (SyntaxChi.mkAdv func.prep term)) ; --- thePl_Det for plural term

  EsTwo  x y = SyntaxChi.mkNP and_Conj x y ;
  EsCons x y = SyntaxChi.mkNP and_Conj x y ;
  EsFromTo k x y = SyntaxChi.mkNP thePl_Det (mkCN (mkCN k (SyntaxChi.mkAdv from_Prep x)) (SyntaxChi.mkAdv to_Prep y)) ;
  EsAllKind k = SyntaxChi.mkNP all_Predet (SyntaxChi.mkNP aPl_Det k) ;
}