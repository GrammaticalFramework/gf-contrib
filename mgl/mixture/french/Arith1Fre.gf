concrete Arith1Fre of Arith1 =
GroundFre **
Arith1I - [root]
with
	(Lexicon = LexiconFre),
	(Syntax = SyntaxFre),
	(Symbolic = SymbolicFre),
	(Math = MathFre) **
{
	lin root  x k	= mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x ;
}
