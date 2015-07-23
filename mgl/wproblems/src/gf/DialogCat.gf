concrete DialogCat of Dialog =
AllProblemsCat **
DialogI - [Define, verb_me, tell_me]
with
	(Syntax = SyntaxCat),
	(Cat = CatCat),
	(Symbolic = SymbolicCat) **
open
	IdiomCat,
	ParadigmsCat,
	(B = BeschCat),
	(I = IrregCat),
	ExtraCat,
	LexiconCat
in {
flags coding = utf8 ;
oper
	aboutP     : Prep = mkPrep "sobre" ;
	again_Adv  : Adv  = ParadigmsCat.mkAdv "altre cop" ;
	compatible_A2 : A2 = mkA2 (mkA "compatible") with_Prep ;
	help_V     : V = mkV "ajudar" ;
	define_V   : V = mkV "definir" ;
	denote_V   : V = mkV "denotar" ;
	consider_V : V = mkV "considerar" ;
	assign_V   : V = mkV "assignar" ;
	partite_V  : V = mkV "repartir" ;
	collect_V  : V = mkV "recollir" ; 
	variable_N : N = femN (mkN "variable") ;
	example_N  : N = mkN "exemple" ;
	equation_N : N = femN (mkN "equació") ;
	right_A    : A = mkA "correcte" ;
	related_A  : A = mkA "relacionat" ;
	giveV3     : V3 = give_V3 ;
	know_V3    : V3 = dirV3 saberV from_Prep ;
	tell_V3    : V3 = dirV3 I.dir_V aboutP ;
	try_V      : V  = mkV "provar" ;
	followV    : V  = reflV (mkV (B.servir_101 "seguir")) ;
oper
	itNP : NP = mkNP (ProDrop it_Pron) ;

	youNP : NP = mkNP (ProDrop youSg_Pron) ;

	nothing_known : Cl =
		let we: NP = mkNP (ProDrop we_Pron);
			aixo: NP = mkNP (mkPN "això") ;
			subject: CN = mkCN (mkN "tema" masculine)
		in mkCl we (mkVP know_V3 nothing_NP aixo) ;

	verb_2me : V3 -> NP -> Utt = \v,np -> mkUtt (mkImp (mkVP v i_NP np)) ;

	verb_me : V3 -> NP -> Utt = \v,np -> mkUtt (mkImp (mkVP v np i_NP)) ;

	tell_me : NP -> Utt = \np -> verb_2me talk_V3 np ;

lin
	Define v am = let 
			vNP : NP = symb v ; 
			denoteV3 : V3 = dirV3 denote_V by8means_Prep
		in mkUtt (mkImp (mkVP denoteV3 am vNP)) ;
}