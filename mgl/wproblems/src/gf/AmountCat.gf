concrete AmountCat of Amount =
ClassCat, ScalarCat ** 
AmountI with 
	(Syntax = SyntaxCat), ---- AR
	(Symbolic = SymbolicCat) **
open 
	ConstructorsCat,
	Prelude,
	StructuralCat,
	IrregCat,
	ParadigmsCat
in {
oper
	times_Prep         = mkPrep "cops" ;
	{-
	undetermined_A : A = mkA "undetermined" ;
	quantity_N     : N = mkN ("quantity" | "number") ;
	undet_quantity_N2 : N2
					   = mkN2 (mkCN undetermined_A quantity_N) ; 
	-}

}
