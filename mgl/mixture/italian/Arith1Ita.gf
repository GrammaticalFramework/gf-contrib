concrete Arith1Ita of Arith1 =
GroundIta **
Arith1I - [root] with
	(Lexicon = LexiconIta),
	(Syntax = SyntaxIta),
	(Symbolic = SymbolicIta),
	(Math = MathIta) **
open MathIta, LexiconIta in 
{
	lin root x k	= mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x ;
}
