concrete Arith1Eng of Arith1 =
GroundEng ** 
  Arith1I  - [unary_minus]
with
 (Lexicon = LexiconEng),
 (Syntax = SyntaxEng),
 (Symbolic = SymbolicEng),
 (Math = MathEng) **
open
	ParadigmsEng
in
{
lin
	unary_minus ob =
        let opposite: CN = mkCN additive_A inverse_N
        in DefGenCN opposite ob ;
} 
