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
	bin_over  x y = mkNP x (mkAdv by8agent_Prep y) ;
}

