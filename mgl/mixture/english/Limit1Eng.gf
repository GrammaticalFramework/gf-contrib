concrete Limit1Eng of Limit1 =
GroundEng ** Limit1I with
(Lexicon = LexiconEng),
(Math = MathEng) **
open
	ParadigmsEng,
	(C = ConstructorsEng),
	Prelude
in {
oper
	limitAdv : Tends => CnCn = 
		table {
		TNone		=> \cn -> cn ;
		TAbove		=> fromAdv "above" ;
		TBelow		=> fromAdv "below" ;
		TBothSides	=> fromAdv ["both sides"] };
}
