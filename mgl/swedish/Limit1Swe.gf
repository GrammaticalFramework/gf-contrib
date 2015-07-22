concrete Limit1Swe of Limit1 =
GroundSwe ** Limit1I with
(Lexicon = LexiconSwe),
(Math = MathSwe) **
open
	ParadigmsSwe,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn;
		TAbove		=> byRight ;
		TBelow		=> byLeft ;
		TBothSides	=> byBothSides };
}