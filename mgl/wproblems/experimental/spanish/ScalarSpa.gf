concrete ScalarSpa of Scalar =
	ScalarI 
with
	(Syntax = SyntaxSpa),
	(Symbolic = SymbolicSpa)		
**
open
	ConstructorsSpa,
	CombinatorsSpa,
	(P = ParadigmsSpa),
	(S = StructuralSpa),
	(CR = CommonRomance)
in {
oper
    less_or_equal : NP -> AP = \np -> mkAP (P.mkA  "menos o el mismo número de" "menos o el mismo número de") np ;
    equalA  : A = P.mkA "el mismo número de" ;

        plus_Conj     = {s1 = [] ; s2 = "más" ; n = CR.Sg} ; 
	times_Conj    = {s1 = [] ; s2 = "por" ; n = CR.Sg} ;  
	minus_Conj    = {s1 = [] ; s2 = "menos" ; n = CR.Sg} ; 
}

