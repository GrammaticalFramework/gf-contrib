concrete ElementsSwe of Elements = CatSwe ** ElementsI
with (Syntax = SyntaxSwe) ** open (P = ParadigmsSwe) in {

	lin

		emptyS = mkS (mkCl emptyNP emptyVP) ;
		emptyQS = mkQS (mkCl emptyNP emptyVP) ;
		emptyNP = mkNP (P.mkN []) ;
		emptyVP = mkVP (P.mkV []) ;
		emptyAdv = P.mkAdv [] ;

}
