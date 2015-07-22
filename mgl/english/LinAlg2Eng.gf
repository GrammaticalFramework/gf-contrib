concrete LinAlg2Eng of LinAlg2 =
GroundEng ** LinAlg2I -[matrix, matrix_base]
with
(Lexicon = LexiconEng),
(Syntax = SyntaxEng),
(Symbolic = SymbolicEng),
(Math = MathEng) **
open
	ParadigmsEng,
	MathEng, LexiconEng  
in 
{
lin
	matrix terms = DefNPconsisting_of matrix_CN (andNP terms) ;
        matrix_base = DefNPconsisting_of matrix_CN ;
oper
	DefNPconsisting_of : CN -> MathObj -> MathObj = \mat, rc -> 
       	DefSgNP (mkCN mat (prepAdv (mkPrep ["consisting of"]) rc)) ;  -- "the mat(rix) consisting of rc(row/column)"
}
