concrete Arith1Fre of Arith1 =
GroundFre **
Arith1I - [root]
with
	(Lexicon = LexiconFre),
	(Syntax = SyntaxFre),
	(Symbolic = SymbolicFre),
	(Math = MathFre) **
{
oper 
	DefEntreCN : CN -> MathObj -> MathObj 
		= \noun,obj -> 
			mkNP the_Art (modCN noun (mkAdv between_Prep obj)) ;   

lin 	
	root = DefGenCNidxRev root_CN ;
}
