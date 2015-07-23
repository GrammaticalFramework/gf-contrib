concrete ScalarEng of Scalar =
ScalarI with
	(Syntax = SyntaxEng),
	(Symbolic = SymbolicEng) **
open
	--ConstructorsEng,
	--CombinatorsEng,
	Prelude,
	(P = ParadigmsEng),
	(S = StructuralEng)
in {
oper
	sum_N    = P.mkN "sum" ;
    equalA   = P.mkA "equal" ;
    small_equal_A = P.mkA  "small or equal" "less or equal" ;

    --binOp s = P.mkConj s ;
    binOp : Str -> SS -> SS -> SS = \s,x,y ->
    	{s= x.s ++ s ++ y.s} ;

    minus_Str = "minus" ;
    plus_Str = "plus" ;
    times_Str = "times" ;
}
