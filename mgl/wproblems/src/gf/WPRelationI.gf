incomplete concrete WPRelationI of WPRelation =
	WPProblemI **
open
	Syntax in
{
oper
	qclPred : IP -> NP -> QS =
		\ip,np -> mkQS (mkQCl ip (mkClSlash np own_V2)) ;

lin -- own
	E1owns obj am = mkS (mkCl obj own_V2 am) ;
	P1owns obj cl = let
			cnThat : CN = mkCN cl (mkRS (mkRCl thatRP obj own_V2)) ;
---- subjunction that! AR  cnThat : CN = mkCN cl (mkSC (mkS (mkCl obj haveV))) ;
		in mkNP thePl_Det cnThat ;
	Q1owns obj cl = let
			howm : IP = mkIP how8many_IDet cl
		in qclPred howm obj ;

lin -- isin
	isin ob1 ob2 = mkS (mkCl ob1 (min ob2)) ;
	E2isin am ob = mkS (exist (mkNP am (min ob))) ;
-- Q2isin cl ob = mkQS (mymkQCl (howm cl) (min ob)) ;
-- Q2isin cl ob = mkQS (mkQCl (mkIP (howm cl) (min ob))) ;
	Q2isin cl ob = mkQS (mkQCl (howm cl) (min ob)) ;
	P2isin cl ob = mkNP (defClass cl) (min ob) ;
	C2isin cl am = mkNP (defClass cl) (min am) ;
}