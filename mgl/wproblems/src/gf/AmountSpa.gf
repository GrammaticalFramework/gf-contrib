concrete AmountSpa of Amount =
ClassSpa, ScalarSpa ** 
AmountI with 
	(Syntax = SyntaxSpa),
	(Symbolic = SymbolicSpa) **
open 
	ConstructorsSpa,
	Prelude,
	StructuralSpa,
	IrregSpa,
	ParadigmsSpa
in {
oper
	times_Prep         = mkPrep "veces" ;
	{-
	undetermined_A : A = mkA "indeterminado" ;
	quantity_N     : N = mkN ("cantidad" | "número") ;
	undet_quantity_N2 : N2
		= mkN2 (mkCN undetermined_A quantity_N) ; 
	-}

}
