concrete WPProblemEng of WPProblem = AmountEng ** 
WPProblemI 
with
	(Syntax = SyntaxEng)
**
open
	(P = ParadigmsEng),
	IdiomEng,
	IrregEng
in
{
oper
	own_V : V = (have_V | P.mkV "own") ;
	denote_V2 = P.mkV2 (P.mkV "denote") ;
}
