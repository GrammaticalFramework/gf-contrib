incomplete concrete ScalarI of Scalar =
open
  Syntax,
  Prelude,
  Symbolic in 
{
lincat
	Scalar = Card ; -- Numeral ;
	Variable = Symb ;
	Number = SS ;
	-- [Number] = ListNP ;
	Equation = S ;
	[Equation] = ListS ;
oper
--	mkBin : Str -> NP -> NP -> NP = \s,x,y -> mkNP x (mkAdv (P.mkPrep s) y) ;

	var : Str -> Symb =
		\s -> mkSymb ("$" + s + "$"| s);


	less_or_equal : NP -> AP = \np -> mkAP small_equal_A np ;
    less_than = S.less_CAdv ; 				--: NP -> AP = \np -> mkAP (P.mkA "small" "less" "least" "less") np ;
    equal_to  : NP -> AP = \np -> mkAP (P.mkA2 equalA S.to_Prep) np ;
    combineAP : (_,_:NP -> AP) -> NP -> AP =\f,g,np -> coord S.or_Conj (f np) (g np) ;




lin
	isEq n m = mkS (mkCl (symb n) (equal_to (symb m))) ;
	isLe n m = mkS (mkCl (symb n) (less_or_equal (symb m))) ;
	--areEq ns = mkS (mkCl (mkNP S.and_Conj ns) equalA) ;

lin
	nplus   = binOp plus_Str ;   
	ntimes  = binOp times_Str ;  
	nminus  = binOp minus_Str ;  
	{- nsum ns  = let
			sum : CN = mkCN sum_N ; 
			of_nums : Adv = mkAdv possess_Prep (mkNP and_Conj ns) 
		in mkNP the_Art (mkCN sum of_nums) ;
	-}
lin
	a = var "x" ;
	b = var "y" ;
	c = var "z" ;
	d = var "d" ;
	e = var "e" ;
	j = var "j" ;
	k = var "k" ;
	l = var "l" ;

	var2num v = v ; -- symb v.s ;

	--BaseNumber = mkListNP ;
	--ConsNumber = mkListNP ;

oper
	fromUnit : Unit -> Card = \u -> mkCard (mkNumeral u) ;
lin
	n1    = fromUnit n1_Unit ;
	n2    = fromUnit n2_Unit ;
	n3    = fromUnit n3_Unit ;
	n4    = fromUnit n4_Unit ;
	n5    = fromUnit n5_Unit ;
	n6    = fromUnit n6_Unit ;
	n7    = fromUnit n7_Unit ;
	n8    = fromUnit n8_Unit ;
	n9    = fromUnit n9_Unit ;
	n100  = mkCard (mkNumeral (mkSub1000 n1_Unit)) ;
	n300  = mkCard (mkNumeral (mkSub1000 n3_Unit)) ;
	{- n260  = mkNumeral (mkSub1000 n2_Unit (tenfoldSub100 n6_Unit)) ;
	   See: http://tfs.cc/trac/ticket/11 -}

	fromInt n = n ;

	toScalar n = symb n ; -- Waiting to fix http://tfs.cc/trac/ticket/32
}
