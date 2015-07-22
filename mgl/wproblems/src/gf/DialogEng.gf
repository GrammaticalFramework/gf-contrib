concrete DialogEng of Dialog =
AllProblemsEng **
DialogI with
	(Syntax = SyntaxEng),
	(Cat = CatEng),
	(Symbolic = SymbolicEng) **
	--(Symbol = SymbolEng) **
open
	IdiomEng,
	LexiconEng,
	ParadigmsEng,
	(I=IrregEng)
in {
oper
	compatible_A2 : A2 = mkA2 "compatible" with_Prep ;
	help_V     : V = mkV "help" ;
	define_V   : V = mkV "define" ;
	denote_V   : V = mkV "denote" ;
	consider_V : V = mkV "consider" ;
	assign_V   : V = mkV "assign" ;
	partite_V  : V = mkV "split" ;
	collect_V  : V = mkV "collect" ; 
	variable_N : N =  mkN "variable" ;
	example_N  : N = mkN "example" ;
	equation_N : N = mkN "equation" ;
	right_A    : A = mkA "right" ;
	related_A  : A = mkA "related" ;
	giveV3     : V3  = mkV3 (mkV "give" "gave" "given") ; -- not the one at LexiconEng
	tell_V3    : V3  = mkV3 I.tell_V aboutP;
	try_V      : V 	 = mkV "try" ;
	followV    : V   = mkV "follow" ;
	again_Adv  : Adv = ParadigmsEng.mkAdv "again" ;

oper
	youNP : NP = you_NP ;
	itNP : NP = it_NP ;
oper
	uttImpP3 : NP -> VP -> Utt = ImpP3 ; -- as in CommandsEng
	nothing_known : Cl =
		mkCl nothing_NP (mkVP (passiveVP know_V2) (SyntaxEng.mkAdv aboutP it_NP)) ;

	
}