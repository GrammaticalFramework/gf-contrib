concrete ScalarSpa of Scalar =
ScalarI with
	(Syntax = SyntaxSpa),
	(Symbolic = SymbolicSpa),
	(Symbol = SymbolSpa)
 **
open
	--ConstructorsSpa,
	--CombinatorsSpa,
	Prelude,
	(P = ParadigmsSpa),
	(S = StructuralSpa)
in {
flags coding = utf8 ;
oper
	sum_N    = P.mkN "suma" ;
    equalA   = P.mkA "igual" ;
    small_equal_A = P.mkA  "MENOR O IGUAL QUE" "menor o igual que" ;

    --binOp s = P.mkConj s ;
    binOp : Str -> SS -> SS -> SS = \s,x,y ->
    	{s= x.s ++ s ++ y.s} ;

    minus_Str = "minus" ;
    plus_Str  = "más" ;
    times_Str = "por" ;
}
