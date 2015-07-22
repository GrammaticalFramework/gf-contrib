--# -path=.:present:../german:../abstract:../resources
concrete AmountGer of Amount =
	ClassGer, ScalarGer ** 
open 
	ConstructorsGer,
	SymbolicGer,
	(S = SymbolGer),
	(P = ParadigmsGer),
	Prelude,
	StructuralGer,
	IrregGer,
        MorphoGer   --for PAgNone
 in 
{
lincat
	Amount = NP ;
	[Amount] = ListNP ;
oper
	plNP : CN -> NP = \cn -> mkNP aPl_Det cn ;
	sgNP : CN -> NP = \cn -> mkNP aSg_Det cn ;
     
lin   
        twice_Predet  = {s = \\_,_,_ => "zwei Mal" ; c = noCase ; a = PAgNone} ;
        thrice_Predet = {s = \\_,_,_ => "drei Mal" ; c = noCase ; a = PAgNone} ;

lin
	gen c k = mkNP k c ;

	some c = mkNP somePl_Det c ;

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
--	twice  = mkNP twice_Predet ;
--	thrice = mkNP only_Predet ;
}
