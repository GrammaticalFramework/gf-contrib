concrete Arith1Spa of Arith1 =
GroundSpa **
Arith1I - [root, minus, divide]
with
	(Lexicon = LexiconSpa),
	(Syntax = SyntaxSpa),
	(Math = MathSpa)
 **
{
lin 	
root x k  	= mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x ;  
	
minus n1 n2  	= mkMathObj (DefEntreCN difference_CN (coordList (mkNP and_Conj) n1.v n2.v)) (L.minus n1.s n2.s) n1 n2 ; 

divide n1 n2 	= mkMathObj (DefEntreCN quotient_CN (both_and n1.v n2.v)) (L.divide n1.s n2.s) n1 n2 ; 
}


