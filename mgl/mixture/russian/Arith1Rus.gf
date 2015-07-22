concrete Arith1Rus of Arith1 =
GroundRus **
Arith1I - [root] with
	(Lexicon = LexiconRus),
	(Syntax = SyntaxRus),
	(Symbolic = SymbolicRus),
	(Math = MathRus) **
--open MathRus, LexiconRus in 
{
	lin root x k  	= mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x ;
}
