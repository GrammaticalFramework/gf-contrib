concrete Limit1Fin of Limit1 =
GroundFin ** Limit1I with
(Lexicon = LexiconFin),
(Math = MathFin) **
open
	(P = ParadigmsFin),
	SyntaxFin,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn ; --P.mkAdv [];
		TAbove		=> byRight ; --_Adv ;
		TBelow		=> byLeft ; --_Adv ;
		TBothSides	=> byBothSides } ; --_Adv };
}