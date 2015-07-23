concrete Arith1Eng of Arith1 =
GroundEng ** 
Arith1I  - [unary_minus] 
with
(Lexicon = LexiconEng),
(Syntax = SyntaxEng),
(Math = MathEng) **
open
	(P = ParadigmsEng)
in
{
oper
	minus_N : N = P.mkN "minus" "minus" ;
lin
	unary_minus x = mkMathObj (mkNP (mkCN minus_N x.v)) (L.unary_minus x.s) x ;
} 
