concrete Integer1Eng of Integer1 =
GroundEng ** Integer1I -[quotient]
with
(Cat = CatEng),
(Syntax = SyntaxEng), 
(Lexicon = LexiconEng),
(Math = MathEng)** 
open
	MathEng, LexiconEng  
in 
{
lin
	quotient dd dv = mkMathObj (DefGenCN integer_division_CN (mkNP dd.v (mkAdv by8agent_Prep dv.v))) ;
}
