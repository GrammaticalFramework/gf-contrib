concrete AmountEng of Amount =
	ClassEng, ScalarEng ** 
AmountI
with 
	(Symbolic = SymbolicEng)
**
open 
	ConstructorsEng,
	Prelude,
	StructuralEng,
	IrregEng,
	(P = ParadigmsEng)
in {
oper
	qtyOf : CN -> CN = \c -> 
		let 
			undet : A = P.mkA "undetermined" ;
			qty = P.mkN ("quantity" | "number") ;
			uqty : CN = mkCN undet qty 
		in mkCN (P.mkN2 uqty) (mkNP aPl_Det c) ;
}
