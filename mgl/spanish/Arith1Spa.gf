concrete Arith1Spa of Arith1 =
GroundSpa **
Arith1I - [root, minus, divide]
with
	(Lexicon = LexiconSpa),
	(Syntax = SyntaxSpa),
	(Symbolic = SymbolicSpa),
	(Math = MathSpa) **
{
lin 	
   	root 		= DefGenCNidxRev root_CN ;	
	minus n1 n2  	= DefEntreCN difference_CN (coordList (mkNP and_Conj) n1 n2) ; 
	divide n1 n2 	= DefEntreCN quotient_CN (both_and n1 n2) ; 
}

