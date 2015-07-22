 concrete Set1Ger of Set1 =
 GroundGer ** Set1I -[setdiff, map , adverbSet]
 with
 (Lexicon = LexiconGer),
 (Syntax = SyntaxGer),
 (Symbolic = SymbolicGer),
 (Math = MathGer) **
{
lin
	setdiff a b = mkMathObj (mkNP (mkNP the_Det difference_CN) (mkAdv between_Prep (both_and a.v b.v))) (L.setdiff a.s b.s) a b ; 

	map vars type set = mkMathObj (adverbNP (rangeOver vars set.v) (setOfForm type.v)) (L.map vars type.s set.s) type set ;

oper
	adverbSet : MathObj -> MathVar -> MathObj = \set,vars ->
              mkNP thePl_Det (apposCN element_CN (adverbNP ((prepAdv in_Prep) set) (useVar vars)));
}
