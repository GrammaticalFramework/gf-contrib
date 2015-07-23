concrete DialogSpa of Dialog =
AllProblemsSpa **
DialogI - [Define, verb_me, tell_me]
with
	(Syntax = SyntaxSpa),
	(Cat = CatSpa),
	(Symbolic = SymbolicSpa) **
open
	IdiomSpa,
	LexiconSpa,
	IrregSpa,
	ExtraSpa,
	ParadigmsSpa
in {
flags coding = utf8 ;
oper
	aboutP : Prep = mkPrep "acerca de" ;
	again_Adv : Adv = ParadigmsSpa.mkAdv "otra vez" ;
	compatible_A2 : A2 = mkA2 (mkA "compatible") with_Prep ;
	help_V     : V = mkV "ayudar" ;
	define_V   : V = mkV "definir" ;
	denote_V   : V = mkV "denotar" ;
	consider_V : V = mkV "considerar" ;
	assign_V   : V = mkV "asignar" ;
	partite_V  : V = mkV "repartir" ;
	collect_V  : V = mkV "reunir" ; 
	variable_N : N = femN (mkN "variable") ;
	example_N  : N = mkN "ejemplo" ;
	equation_N : N = femN (mkN "ecuación") ;
	right_A    : A = mkA "correcto" ;
	related_A  : A = mkA "relacionado" ;
	giveV3    : V3 = give_V3 ;
	know_V3   : V3 = dirV3 (mkV "saber") aboutP ;
	tell_V3   : V3 = dirV3 decir_V aboutP ; 
	try_V     : V  = probar_V ;
	followV   : V  = reflV seguir_V ; 
	-- uttImpP3 : NP -> VP -> Utt = ImpP3 ;
oper
	youNP : NP = mkNP (ProDrop youSg_Pron) ;
	itNP : NP = mkNP (ProDrop it_Pron) ;

	nothing_known : Cl =
		let we: NP = mkNP (ProDrop we_Pron);
			esto: NP = mkNP (mkPN "esto") ;
			subject: CN = mkCN (mkN "tema" masculine)
		in mkCl we (mkVP know_V3 nothing_NP esto) ;

	verb_me : V3 -> NP -> Utt = \v,np -> mkUtt (mkImp (mkVP v np i_NP)) ;
	verb_2me : V3 -> NP -> Utt = \v,np -> mkUtt (mkImp (mkVP v i_NP np)) ;
	tell_me : NP -> Utt = \np -> verb_2me talk_V3 np ;

lin
	Define v am = let 
			vNP : NP = symb v ; 
			denoteV3 : V3 = dirV3 denote_V by8means_Prep
		in mkUtt (mkImp (mkVP denoteV3 am vNP)) ;


}