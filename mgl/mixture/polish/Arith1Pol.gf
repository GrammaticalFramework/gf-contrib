concrete Arith1Pol of Arith1 =
GroundPol **
Arith1I - [root] with
	(Lexicon = LexiconPol),
	(Syntax = SyntaxPol),
	(Symbolic = SymbolicPol),
	(Math = MathPol) **
open MathPol, LexiconPol in 
{
	lin root x k = mkMathObj(DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x  ;
}
