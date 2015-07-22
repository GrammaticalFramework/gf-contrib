concrete BinaryOpsGer of BinaryOps =
GroundGer **
BinaryOpsI - [bin_over] 
with
	(Lexicon = LexiconGer),
	(Syntax = SyntaxGer),
	(Symbolic = SymbolicGer),
	(Math = MathGer) **
{
lin 	 
	bin_over  x y = mkMathObj (mkNP x.v (mkAdv by8agent_Prep y.v)) (L.bin_plus x.s y.s) x y ;
}

