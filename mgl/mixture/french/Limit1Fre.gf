 concrete Limit1Fre of Limit1 =
 GroundFre ** Limit1I with
 (Lexicon = LexiconFre),
 (Math = MathFre) **
 open
	 ParadigmsFre,
	 Prelude
 in {
 oper
	 limitAdv : Tends => CnCn = table {
		 TNone		=> \cn -> cn ;
		 TAbove		=> byRight ;
		 TBelow		=> byLeft ;
		 TBothSides	=> byBothSides };
 }
