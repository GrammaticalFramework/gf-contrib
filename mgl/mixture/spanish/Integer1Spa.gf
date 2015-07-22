concrete Integer1Spa of Integer1 =
GroundSpa ** Integer1I -[quotient]
with
(Lexicon = LexiconSpa),
(Syntax = SyntaxSpa), 
(Math = MathSpa) **
{
lin
	quotient dd dv = mkMathObj (mkNP (DefGenCN integer_division_CN dd.v) (mkAdv between_Prep dv.v)) ;
}
