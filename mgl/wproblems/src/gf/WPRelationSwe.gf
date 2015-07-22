concrete WPRelationSwe of WPRelation =
	WPProblemSwe **
open
	SyntaxSwe,
	IdiomSwe,
	ParadigmsSwe,
	IrregSwe in
{

flags coding = utf8 ;

oper
	haveV : V = lin V have_V2 | mkV "äger" ;
	ownV2 : V2 = mkV2 haveV ;
	qclPred : IP -> NP -> QS =
		\ip,np -> mkQS (mkQCl ip (mkClSlash np ownV2)) ;

lin -- own
	E1owns obj am = mkS (mkCl obj ownV2 am) ;
	P1owns obj cl = let
			cnThat : CN =  mkCN cl (mkRS (mkRCl which_RP obj (mkV2 haveV))) ;
		in mkNP thePl_Det cnThat ;
	Q1owns obj cl = let
			howm : IP = mkIP how8many_IDet cl
		in qclPred howm obj ;

lin -- isin
	isin ob1 ob2 = mkS (mkCl ob1 (min ob2)) ;
	E2isin am ob = mkS (ExistNP (mkNP am (min ob))) ;
	Q2isin cl ob = mkQS (mkQCl (howm cl) (min ob)) ;
	P2isin cl ob = mkNP (defClass cl) (min ob) ;
	C2isin cl am = mkNP (defClass cl) (min am) ;
}