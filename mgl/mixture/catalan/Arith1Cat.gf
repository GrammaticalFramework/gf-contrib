concrete Arith1Cat of Arith1 =
GroundCat **
Arith1I - [root, minus] 
with
	(Lexicon = LexiconCat),
	(Syntax = SyntaxCat),
	(Symbolic = SymbolicCat),
	(Math = MathCat)  **
{
oper 
	DefEntreCN : CN -> MathObj -> MathObj 
		= \noun,obj -> 
			mkNP the_Art (modCN noun (mkAdv between_Prep obj)) ;   

lin 	
	root x k = mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x  ;	
	minus n1 n2 = mkMathObj (DefEntreCN difference_CN (coordList (mkNP and_Conj) n1.v n2.v)) (L.minus n1.s n2.s) n1 n2 ; 
}

