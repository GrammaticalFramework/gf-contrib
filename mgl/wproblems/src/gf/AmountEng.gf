concrete AmountEng of Amount =
ClassEng, ScalarEng ** 
AmountI with 
	(Syntax = SyntaxEng), ---- AR
	(Symbolic = SymbolicEng) **
open 
	ConstructorsEng,
	Prelude,
	StructuralEng,
	IrregEng,
	ParadigmsEng
in {
oper
	times_Prep         = mkPrep "times" ;
	{-
	undetermined_A : A = mkA "undetermined" ;
	quantity_N     : N = mkN ("quantity" | "number") ;
	undet_quantity_N2 : N2
					   = mkN2 (mkCN undetermined_A quantity_N) ; 
	-}

}
