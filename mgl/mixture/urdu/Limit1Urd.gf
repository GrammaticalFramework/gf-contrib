concrete Limit1Urd of Limit1 =
GroundUrd ** Limit1I with
(Lexicon = LexiconUrd),
(Math = MathUrd) **
open
	ParadigmsUrd,
	(C = ConstructorsUrd),
	Prelude
in {
 oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn;
		TAbove		=> byRight ;
		TBelow		=> byLeft ;
		TBothSides	=> byBothSides };
		
}