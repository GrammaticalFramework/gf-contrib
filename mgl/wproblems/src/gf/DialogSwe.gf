concrete DialogSwe of Dialog =
AllProblemsSwe **
DialogI with
	(Cat = CatSwe),
	(Syntax = SyntaxSwe),
	(Symbolic = SymbolicSwe) **
open
	IdiomSwe,
	LexiconSwe,
	ParadigmsSwe
in {
flags coding = utf8 ;
oper
	compatible_A2 : A2 = mkA2 (mkA "kompatibel") with_Prep ;
	help_V     : V = mkV "help" ;
	define_V   : V = mkV "definiera" ;
	denote_V   : V = mkV "beteckna" ;
	consider_V : V = mkV "betrakta" ;
	--divide_V   : V = mkV "DIVIDE" ;
	assign_V   : V = mkV "tilldela" ;
	partite_V  : V = mkV "dela" ;
	collect_V  : V = mkV "samla" ; 
	variable_N : N = mkN "variable" "variabler" ;
	example_N  : N = mkN "exempel" "exempel" ;
	equation_N : N = mkN "ekvation" "ekvationer" ;
	right_A    : A = mkA "rätt" ; ---- höger? ;
	related_A  : A = mkA "relaterad" ;
	giveV3     : V3  = mkV3 (mkV "ge" "gav" "givit") ; 
	tell_V3    : V3 = mkV3 "berätta" ;
	try_V      : V  = mkV "försöka" "försöker" "försöka" "försökte" "försökt" "försökt"  ;
	followV    : V  = mkV "FOLLOW" ;




oper
	youNP : NP = you_NP ;
	itNP : NP = it_NP ;
	aboutP  : Prep = mkPrep "om" ;
	again_Adv : Adv = ParadigmsSwe.mkAdv "igen" ;

	nothing_known : Cl =
		mkCl nothing_NP (mkVP (passiveVP know_V2) (Syntax.mkAdv aboutP it_NP)) ;

	uttImpP3 : NP -> VP -> Utt = \np, vp ->
		mkUtt
			(mkImp 
				(mkVP (mkV2V (mkV "låter") (mkPrep [])(mkPrep [])) np vp)) ;
}