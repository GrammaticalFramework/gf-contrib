concrete ScalarEng of Scalar =
	ScalarI 
with
	(Syntax = SyntaxEng),
	(Symbolic = SymbolicEng)		
 **
open
	ConstructorsEng,
	CombinatorsEng,
	(P = ParadigmsEng),
	(S = StructuralEng)
in {
oper
        less_or_equal : NP -> AP = \np -> mkAP (P.mkA  "small or equal" "less or equal") np ;
        equalA  : A = P.mkA "equal" ;

        plus_Conj     = P.mkConj "plus" ;
	times_Conj    = P.mkConj "times"  ;
	minus_Conj     = P.mkConj "minus"  ;

}
