concrete ScalarCat of Scalar =
ScalarI with
	(Syntax = SyntaxCat),
	(Symbolic = SymbolicCat),
	(Symbol = SymbolCat)
 **
open
	--ConstructorsCat,
	--CombinatorsCat,
	Prelude,
	(P = ParadigmsCat),
	(S = StructuralCat)
in {
flags coding = utf8 ;
oper
	sum_N    = P.mkN "suma" ;
    equalA   = P.mkA "igual" ;
    small_equal_A = P.mkA  "" "menor o igual que" ;

    --binOp s = P.mkConj s ;
    binOp : Str -> SS -> SS -> SS = \s,x,y ->
    	{s= x.s ++ s ++ y.s} ;

    minus_Str = "menys" ;
    plus_Str  = "més" ;
    times_Str = "per" ;
}
