concrete Nums1Cat of Nums1 =
GroundCat **
Nums1I - [nums1_rational]  with
	(Lexicon = LexiconCat),
	(Syntax = SyntaxCat),
	(Symbolic = SymbolicCat),
	(Math = MathCat)  **
{
lin	
	nums1_rational num den = mkMathObj (mkNP (DefGenCN fraction_CN num.v) (prepAdv between_Prep den.v)) (L.nums1_rational num.s den.s) num den ;
}
