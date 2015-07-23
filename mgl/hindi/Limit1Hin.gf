concrete Limit1Hin of Limit1 =
GroundHin ** Limit1I with
(Lexicon = LexiconHin),
(Math = MathHin) **
open
	ParadigmsHin,
	(C = ConstructorsHin),
	Prelude
in {
 oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn;
		TAbove		=> byRight ;
		TBelow		=> byLeft ;
		TBothSides	=> byBothSides };
		
}