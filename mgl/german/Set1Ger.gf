 concrete Set1Ger of Set1 =
 GroundGer ** Set1I -[setdiff, map , adverbSet]
 with
 (Lexicon = LexiconGer),
 (Syntax = SyntaxGer),
 (Symbolic = SymbolicGer),
 (Math = MathGer) **
{
lin
	setdiff a b = mkNP (mkNP the_Det difference_CN) (mkAdv between_Prep (both_and a b)) ; 

	map vars type set = adverbNP (rangeOver vars set) (setOfForm type) ;

oper
	adverbSet : MathObj -> MathVar -> MathObj = \set,vars ->
              mkNP thePl_Det (apposCN element_CN (adverbNP ((prepAdv in_Prep) set) (useVar vars)));
}
