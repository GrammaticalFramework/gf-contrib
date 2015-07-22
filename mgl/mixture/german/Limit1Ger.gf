concrete Limit1Ger of Limit1 =
GroundGer ** Limit1I with
(Lexicon = LexiconGer),
(Math = MathGer) **
open
	ParadigmsGer,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn;
		TAbove		=> byRight ;
		TBelow		=> byLeft ;
		TBothSides	=> byBothSides };
}
