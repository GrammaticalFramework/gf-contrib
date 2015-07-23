concrete Nums1Ger of Nums1 =
GroundGer ** Nums1I - [nums1_rational]
with
(Lexicon = LexiconGer),
(Syntax = SyntaxGer),
(Symbolic = SymbolicGer),
(Math = MathGer) 
**
{
lin
	nums1_rational num den = mkMathObj (DefSgNP (modCN (apposCN fraction_CN num.v) ((prepAdv through_Prep) den.v))) (L.nums1_rational num.s den.s) num den ;
	--nums1_rational = apposA "durch" ;  --x durch y
}


