concrete WPProblemGer of WPProblem = AmountGer ** 
WPProblemI 
with
	(Syntax = SyntaxGer)
**
open
	(P = ParadigmsGer),
	IdiomGer,
	IrregGer
in
{
oper
	own_V : V = (haben_V | P.mkV "besitzen") ;
	denote_V2 = P.mkV2 (P.mkV "bedeuten") ;
}
