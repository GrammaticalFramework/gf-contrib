concrete ElementsEng of Elements = CatEng ** ElementsI
with (Syntax = SyntaxEng) ** open (P = ParadigmsEng) in {

	lin

		emptyS = mkS (mkCl emptyNP emptyVP) ;
		emptyNP = mkNP (P.mkN []) ;
		emptyVP = mkVP (P.mkV []) ;
		emptyAdv = P.mkAdv [] ;

}
