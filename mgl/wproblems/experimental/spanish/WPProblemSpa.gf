concrete WPProblemSpa of WPProblem = AmountSpa ** 
WPProblemI 
with
	(Syntax = SyntaxSpa)
**
open
	(P = ParadigmsSpa),
	IdiomSpa,
	IrregSpa
in
{
oper
	own_V : V = (tener_V | P.mkV "poseer") ;
	denote_V2 = P.mkV2 (P.mkV "indicar") ;
}
