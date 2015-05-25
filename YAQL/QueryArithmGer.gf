--# -path=.:present

concrete QueryArithmGer of QueryArithm = 
  YAQLGer - [TPast,QPWho,QPWhos,QAdv,QAdvEntity,MAssert] ** 
   open SyntaxGer, ParadigmsGer, SymbolicGer, BuildQueryGer, Prelude in {

flags coding = utf8 ;

lincat
  MathFunction = F1 ;
  Entities = NP ;
lin
  KNumber = mkCN (mkN "Zahl" "Zahlen" feminine) ;
  EInteger i = symb i ;
  ENumeral n = mkNP (mkDet <lin Numeral n : Numeral>) ;  --- TODO: eins
  PEven = adjectiveProperty (mkA "gerade") ;
  POdd = adjectiveProperty (mkA "ungerade") ;
  PPrime = adjectiveProperty (mkA "unteilbar") ;
  RDivisible = adjectiveRelation (mkA "teilbar") (mkPrep "durch" accusative) ;
  RSmaller = comparativeRelation (mkA "klein") ;
  RGreater = comparativeRelation (mkA "gross" "grösser" "grösst") ;

  ESum xs = mkNP the_Det (mkCN (mkN2 (mkN "Summe")) xs) ;
  EProduct xs = mkNP the_Det (mkCN (mkN2 (mkN "Produkt" "Produkte" neuter)) xs) ;
  ESquare = {cn = mkCN (mkN "Quadrat" "Quadrate" neuter) ; prep = possess_Prep} ;
  ESquareRoot = {cn = mkCN (mkN "Quadratwurzel" "Quadratwurzeln" feminine) ; prep = possess_Prep} ;
  EFactorial = {cn = mkCN (mkN "Fakultät" "Fakultäten" feminine) ; prep = possess_Prep} ;

  FMathFunction f = f ;
  EMathFunction func term = mkNP the_Det (mkCN func.cn (SyntaxGer.mkAdv func.prep term)) ; --- thePl_Det for plural term

  EsTwo  x y = mkNP and_Conj x y ;
  EsCons x y = mkNP and_Conj x y ;
  EsFromTo k x y = mkNP thePl_Det (mkCN (mkCN k (SyntaxGer.mkAdv from_Prep x)) (SyntaxGer.mkAdv to_Prep y)) ;
  EsAllKind k = mkNP all_Predet (mkNP aPl_Det k) ;
}