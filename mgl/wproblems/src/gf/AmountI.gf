incomplete concrete AmountI of Amount =
	ClassI,
	ScalarI **
open
	Syntax in
{
lincat
	Amount = NP ;
	[Amount] = ListNP ;
oper
	plNP : CN -> NP = \cn -> mkNP aPl_Det cn ;
	sgNP : CN -> NP = \cn -> mkNP aSg_Det cn ;
--	predetNP : Str -> NP -> NP = \s,np ->
--		let pdet : Predet = ss s
--		in mkNP pdet np ;
	{-
		qtyOf : CN -> CN = \c -> 
			mkCN undet_quantity_N2 (mkNP aPl_Det c) ;
	-}
lin
	gen c k = mkNP k c ;

	some c = mkNP somePl_Det c ;

	-- unknown c = mkNP aSg_Det (qtyOf c) ;

	avar v c = let cv : Card = symb v
			in mkNP (mkDet cv) c ;

	aplus  ams = mkNP and_Conj ams ;

	atimes k a = let
			knp : NP = mkNP (mkDet k)
		in mkNP knp (Syntax.mkAdv times_Prep a) ;
	
	BaseAmount  = mkListNP ; 
	ConsAmount  = mkListNP ;
	
	-- BaseClass c d  = mkListNP (sgNP c) (sgNP d) ;
	-- ConsClass c cs = mkListNP (sgNP c) cs ;

--lin
--	twice  = predetNP "twice"  ;
--	thrice = predetNP "thrice" ;
}
