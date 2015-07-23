concrete ScalarGer of Scalar =
ScalarI with
	--ConstructorsGer,
	--CombinatorsGer,
	(Syntax = SyntaxGer),
	(Symbolic = SymbolicGer),
	(Symbol = SymbolGer) **
open
	(P = ParadigmsGer),
	-- SymbolGer, SymbolicGer,
	(S = StructuralGer),
        --(X = ConstructX), --for less_or_equal
     ResGer
in {

lincat
	Scalar = Numeral ;
	Variable = Symb ;
	Number = NP ;
	[Number] = ListNP ;
	Equation = S ;
oper
--	mkBin : Str -> NP -> NP -> NP = \s,x,y -> mkNP x (mkAdv (P.mkPrep s P.accusative) y) ;


	var : Str -> Symb =
		\s -> mkSymb ("$" + s + "$"| s);

    less_than = S.less_CAdv ;                  						   -- : NP -> AP = \np -> mkAP (P.mkA "small" "less" "least" "less") np ;
    small_equal_A =  P.mkA  "wenig oder gleich" "weniger oder gleich" "am wenigsten oder gleich"  ;
                                       										  --: CAdv = X.mkCAdv "weniger oder gleich" "als" ; 
    equalA  : A = P.mkA "gleich" ;
    equal_to  : NP -> AP = \np -> mkAP (P.mkA2 equalA S.to_Prep) np ;
    combineAP : (_,_:NP -> AP) -> NP -> AP =\f,g,np -> coord S.or_Conj (f np) (g np) ;

 
    plus_Conj     	  = {s1 = [] ; s2 = "plus" ; n = Sg} ;
    times_Conj    	  = {s1 = [] ; s2 = "mal" ; n = Sg} ;
    minus_Conj    	  = {s1 = [] ; s2 = "minus" ; n = Sg} ;

{- lin
	isEq n m = mkS (mkCl n (equal_to m)) ;
	isLe n m = mkS (mkCl n (less_or_equal m)) ;
	areEq ns = mkS (mkCl (mkNP S.and_Conj ns) equalA) ;

lin
	nplus   = mkNP plus_Conj ;       -- mkBin "plus" ;
	ntimes  = mkNP times_Conj ;      -- mkBin "times" ;
	nminus  = mkNP minus_Conj ;      -- mkBin "minus" ;	

lin
	a = var "a" ;
	b = var "b" ;
	c = var "c" ;
	d = var "d" ;
	e = var "e" ;
	j = var "j" ;
	k = var "k" ;
	l = var "l" ;

	var2num v = symb v.s ;

	BaseNumber = mkListNP ;
	ConsNumber = mkListNP ;


	n1    = mkNumeral n1_Unit ;
	n2    = mkNumeral n2_Unit ;
	n3    = mkNumeral n3_Unit ;
	n4    = mkNumeral n4_Unit ;
	n5    = mkNumeral n5_Unit ;
	n6    = mkNumeral n6_Unit ;
	n7    = mkNumeral n7_Unit ;

	fromInt n = symb n ;
-}
}
