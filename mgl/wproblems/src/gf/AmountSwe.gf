concrete AmountSwe of Amount =
	ClassSwe, ScalarSwe ** 
AmountI with 
    (Syntax = SyntaxSwe),
	(Symbolic = SymbolicSwe)
**
open 
	ConstructorsSwe,
	Prelude,
	StructuralSwe,
	IrregSwe,
	(P = ParadigmsSwe)
in {
oper
	times_Prep = P.mkPrep "gånger" ;
}
