incomplete concrete AmountI of Amount =
	ClassI, ScalarI ** 
--open 
--	Prelude
--in 
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


lin
	gen c k = mkNP k c ;

	some c = mkNP somePl_Det c ;

	unknown c = mkNP aSg_Det (qtyOf c) ;

	avar v c = let cv : Card = symb v
			in mkNP (mkDet cv) c ;

	aplus  ams = mkNP and_Conj ams ;

	atimes k a = let  det : NP = mkNP (mkDet k) ;
			  in mkNP times_Conj det a ;

	BaseAmount  = mkListNP ; 
	ConsAmount  = mkListNP ;
	
	-- BaseClass c d  = mkListNP (sgNP c) (sgNP d) ;
	-- ConsClass c cs = mkListNP (sgNP c) cs ;

--lin
--	twice  = predetNP "twice"  ;
--	thrice = predetNP "thrice" ;
}
