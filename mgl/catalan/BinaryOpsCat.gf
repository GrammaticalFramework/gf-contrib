concrete BinaryOpsCat of BinaryOps =
GroundCat **
BinaryOpsI - [bin_over] 
with
	(Lexicon = LexiconCat),
	(Syntax = SyntaxCat),
	(Symbolic = SymbolicCat),
	(Math = MathCat) **
{
lin
	bin_over  x y = mkNP x (mkAdv between_Prep y) ;
}

