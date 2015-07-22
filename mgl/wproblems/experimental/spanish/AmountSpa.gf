concrete AmountSpa of Amount =
	ClassSpa, ScalarSpa ** 
AmountI - [unknown]
with 
	(Symbolic = SymbolicSpa)
**
open 
	ConstructorsSpa,
	Prelude,
	StructuralSpa,
	IrregSpa,
	(P = ParadigmsSpa) 
--        MorphoSpa   --for PAgNone
in 
{
{- oper
	qtyOf : CN -> CN = \c -> 
		let 
			undet : A = P.mkA "indeterminado" ;
			qty = P.mkN ("cantidad" | "número") ;
			uqty : CN = mkCN undet qty 
		in mkCN (P.mkN2 uqty) (mkNP aPl_Det c) ;
-}
--lin   
--	twice_Predet  = {s = \\a,c => prepCase c ++ "el doble" ; c = Nom ; a = PNoAg} ;
--      thrice_Predet = {s = \\a,c => prepCase c ++ "el triple" ; c = Nom ; a = PNoAg} ;

--	twice  = mkNP twice_Predet ;
--	thrice = mkNP only_Predet ;
}

