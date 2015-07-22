concrete Limit1Spa of Limit1 =
GroundSpa ** Limit1I with
(Lexicon = LexiconSpa),
(Math = MathSpa) **
open
	ParadigmsSpa,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn ;
		TAbove		=> byRight ;
		TBelow		=> byLeft ;
		TBothSides	=> byBothSides };
}