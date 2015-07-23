concrete Set1Eng of Set1 =
GroundEng ** Set1I - [adverbSet, map]--, set]
with
(Lexicon = LexiconEng),
(Syntax = SyntaxEng),
(Symbolic = SymbolicEng),
(Math = MathEng) **
open
	ParadigmsEng
in
{
lin
     	map vars type set = adverbNP (rangeOver vars set) (setOfForm type) ;

oper
	adverbSet : MathObj -> MathVar -> MathObj = \set,vars ->
              DefGenCN set_CN (adverbNP ((prepAdv (mkPrep ["ranging in"])) set) (useVar vars)); 

--    old definition        DefGenCN set_CN (adverbNP (prepAdv my_possess_Prep set) (massPl (mkCN element_N (useVar vars)))) ; 

}

