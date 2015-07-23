concrete Set1Spa of Set1 =
GroundSpa ** Set1I - [setdiff]
with
(Lexicon = LexiconSpa),
(Syntax = SyntaxSpa),
(Math = MathSpa)**
{
lin
	setdiff a b = DefEntreCN difference_CN (both_and a b) ;
}
