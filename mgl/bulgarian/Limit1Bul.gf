concrete Limit1Bul of Limit1 =
GroundBul ** Limit1I with
(Lexicon = LexiconBul),
(Math = MathBul) **
open
	SyntaxBul,
	ParadigmsBul,
	Prelude
in {
oper
	limitAdv : Tends => CnCn = table {
		TNone		=> \cn -> cn;
		TAbove		=> \cn -> mkCN cn byRight_Adv ;
		TBelow		=> \cn -> mkCN cn byLeft_Adv ;
		TBothSides	=> \cn -> mkCN cn byBothSides_Adv };
}
