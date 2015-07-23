concrete Limit1Ron of Limit1 =
GroundRon ** Limit1I with
(Lexicon = LexiconRon),
(Math = MathRon) **
open
	ParadigmsRon,
	(C = SyntaxRon),
	Prelude
in {
oper
	limitAdv : Tends => CnCn = let 
		fromAdv : Str -> C.CN -> C.CN = \s,cn -> C.mkCN cn (mkAdv ("din " ++ s)) ;
	in  table {
		TNone		=> \cn -> cn ;
		TAbove		=> fromAdv ["sus"] ;
		TBelow		=> fromAdv ["jos"] ;
		TBothSides	=> fromAdv ["ambele părți"] };
}