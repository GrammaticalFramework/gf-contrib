concrete AmountGer of Amount =
	ClassGer, ScalarGer ** 
AmountI -[unknown]
with 
	(Symbolic = SymbolicGer)
**
open 
	ConstructorsGer,
	Prelude,
	StructuralGer,
	IrregGer,
	(P = ParadigmsGer) 
--        MorphoGer   --for PAgNone
in 
{
--oper   --compilation error
--	qtyOf : CN -> CN = \c -> 
--		let 
--			undet : A = P.mkA "unbestimmt" ;
--			qty = P.mkN ("Menge" | "Nummer" "Nummern" P.feminine) ;
--			uqty : CN = mkCN undet qty 
--		in mkCN (P.mkN2 uqty) (mkNP aPl_Det c) ;

--lin   
--        twice_Predet  = {s = \\_,_,_ => "zwei Mal" ; c = noCase ; a = PAgNone} ;
--        thrice_Predet = {s = \\_,_,_ => "drei Mal" ; c = noCase ; a = PAgNone} ;

--	twice  = mkNP twice_Predet ;
--	thrice = mkNP only_Predet ;
}


