concrete BinaryOpsSpa of BinaryOps =
GroundSpa **
BinaryOpsI - [bin_over]  
with
	(Lexicon = LexiconSpa),
	(Syntax = SyntaxSpa),
	(Symbolic = SymbolicSpa),
	(Math = MathSpa) **
{
lin 	 
	bin_over  x y = mkNP x (mkAdv between_Prep y) ;
}

