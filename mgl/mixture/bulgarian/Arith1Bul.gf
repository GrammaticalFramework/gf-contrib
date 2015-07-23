concrete Arith1Bul of Arith1 =
GroundBul **
Arith1I - [root] with
	(Lexicon = LexiconBul),
	(Syntax = SyntaxBul),
	(Symbolic = SymbolicBul),
	(Math = MathBul) **
open MathBul, LexiconBul in 
{
	lin root x k	= mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x ;  
}
