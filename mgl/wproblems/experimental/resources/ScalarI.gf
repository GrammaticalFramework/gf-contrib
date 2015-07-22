incomplete concrete ScalarI of Scalar =
{
lincat
	Scalar = Numeral ;
	Variable = Symb ;
	Number = NP ;
	[Number] = ListNP ;
	Equation = S ;
oper
--	mkBin : Str -> NP -> NP -> NP = \s,x,y -> mkNP x (mkAdv (P.mkPrep s) y) ;

	var : Str -> Symb =
		\s -> mkSymb ("$" + s + "$"| s);

    less_than = S.less_CAdv ; 				--: NP -> AP = \np -> mkAP (P.mkA "small" "less" "least" "less") np ;
    equal_to  : NP -> AP = \np -> mkAP (P.mkA2 equalA S.to_Prep) np ;
    combineAP : (_,_:NP -> AP) -> NP -> AP =\f,g,np -> coord S.or_Conj (f np) (g np) ;


lin
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
	n100  = mkNumeral (mkSub1000 n1_Unit) ;
	n300  = mkNumeral (mkSub1000 n3_Unit) ;
	{- n260  = mkNumeral (mkSub1000 n2_Unit (tenfoldSub100 n6_Unit)) ;
	   See: http://tfs.cc/trac/ticket/11 -}

	fromInt n = symb n ;
}
