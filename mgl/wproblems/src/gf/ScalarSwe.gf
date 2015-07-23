concrete ScalarSwe of Scalar =
ScalarI with
	(Syntax = SyntaxSwe),
	(Symbolic = SymbolicSwe),
	(Symbol = SymbolSwe)
 **
open
	--ConstructorsSwe,
	--CombinatorsSwe,
	Prelude,
	(P = ParadigmsSwe),
	(S = StructuralSwe)
in {

flags coding = utf8 ;
oper
	sum_N    = P.mkN "summa" ;
    equalA   = P.mkA "lika" ;
    small_equal_A = P.mkA "leq" ; ---- "small or equal" "less or equal" ; 
       ---- should be A2, or maybe VPSlash? AR

    --binOp s = P.mkConj s ;
    binOp : Str -> SS -> SS -> SS = \s,x,y ->
    	{s= x.s ++ s ++ y.s} ;

    minus_Str = "minus" ;
    plus_Str = "plus" ;
    times_Str = "gånger" ;
}
