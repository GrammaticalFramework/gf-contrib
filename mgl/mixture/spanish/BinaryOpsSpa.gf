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
	bin_over  x y = mkMathObj (mkNP x.v (mkAdv between_Prep y.v)) (L.bin_over x.s y.s) x y ; 
}

