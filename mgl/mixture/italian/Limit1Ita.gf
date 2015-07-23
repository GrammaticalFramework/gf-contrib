concrete Limit1Ita of Limit1 =
GroundIta ** Limit1I with
(Lexicon = LexiconIta),
(Math = MathIta) **
open
	ParadigmsIta,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn ;
		TAbove		=> byRight ;
		TBelow		=> byLeft ;
		TBothSides	=> byBothSides };
}
