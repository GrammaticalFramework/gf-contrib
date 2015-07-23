concrete ScalarGer of Scalar =
	ScalarI 
with
	(Syntax = SyntaxGer),
	(Symbolic = SymbolicGer)		
**
open
	ConstructorsGer,
	CombinatorsGer,
	(P = ParadigmsGer),
	(S = StructuralGer),
	ResGer
in {
oper
    less_or_equal : NP -> AP = \np -> mkAP (P.mkA  "wenig oder gleich" "weniger oder gleich" "am wenigsten oder gleich") np ;
    equalA  : A = P.mkA "gleich" ;

    plus_Conj     	  = {s1 = [] ; s2 = "plus" ; n = Sg} ;
    times_Conj    	  = {s1 = [] ; s2 = "mal" ; n = Sg} ;
    minus_Conj    	  = {s1 = [] ; s2 = "minus" ; n = Sg} ;
}

