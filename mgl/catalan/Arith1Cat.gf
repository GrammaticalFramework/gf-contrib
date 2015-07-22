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
	root = DefGenCNidxRev root_CN ;	
	minus n1 n2 = DefEntreCN difference_CN (coordList (mkNP and_Conj) n1 n2) ; 
}

