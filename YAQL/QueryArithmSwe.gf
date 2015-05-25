--# -path=.:alltenses

concrete QueryArithmSwe of QueryArithm = 
  YAQLSwe - [TPast,QPWho,QPWhos,QAdv,QAdvEntity,MAssert] ** 
   open SyntaxSwe, ParadigmsSwe, SymbolicSwe, BuildQuerySwe, (L = LexiconSwe), Prelude in {

flags coding = utf8 ;

lincat
  MathFunction = F1 ;
  Entities = NP ;
lin
  KNumber = mkCN (mkN "tal" "tal") ;
  EInteger i = symb i ;
  ENumeral n = mkNP (mkDet <lin Numeral n : Numeral>) ;  --- TODO: eins
  PEven = adjectiveProperty (mkA "jämn") ;
  POdd = adjectiveProperty (mkA "udda") ;
  PPrime = nounProperty (mkCN (mkN "primtal" "primtal")) ;
  RDivisible = adjectiveRelation (mkA "delbar") (mkPrep "med") ;
  RSmaller = comparativeRelation L.small_A ;
  RGreater = comparativeRelation L.big_A ;

  ESum xs = mkNP the_Det (mkCN (mkN2 (mkN "Summa")) xs) ;
  EProduct xs = mkNP the_Det (mkCN (mkN2 (mkN "produkt" "produkter")) xs) ;
  ESquare = {cn = mkCN (mkN "kvadrat" "kvadrater") ; prep = possess_Prep} ;
  ESquareRoot = {cn = mkCN (mkN "kvadratrot" "kvadratrötter") ; prep = possess_Prep} ;
  EFactorial = {cn = mkCN (mkN "fakultet" "fakultäter") ; prep = possess_Prep} ;

  FMathFunction f = f ;
  EMathFunction func term = mkNP the_Det (mkCN func.cn (SyntaxSwe.mkAdv func.prep term)) ; --- thePl_Det for plural term

  EsTwo  x y = mkNP and_Conj x y ;
  EsCons x y = mkNP and_Conj x y ;
  EsFromTo k x y = mkNP thePl_Det (mkCN (mkCN k (SyntaxSwe.mkAdv from_Prep x)) (SyntaxSwe.mkAdv to_Prep y)) ;
  EsAllKind k = mkNP all_Predet (mkNP aPl_Det k) ;
}