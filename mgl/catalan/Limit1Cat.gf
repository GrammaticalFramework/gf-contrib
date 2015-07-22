concrete Limit1Cat of Limit1 =
GroundCat ** Limit1I with
(Lexicon = LexiconCat),
(Math = MathCat) **
open
	ParadigmsCat,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn;
		TAbove		=> byRight ;
		TBelow		=> byLeft ;
		TBothSides	=> byBothSides };
}