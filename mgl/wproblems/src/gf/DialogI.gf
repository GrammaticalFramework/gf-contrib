incomplete concrete DialogI of Dialog =
	AllProblemsI **
open
	Syntax,
	Cat,
	Symbolic
in {
lincat
	Command     = Utt ;
	Fact 		= Utt ; 
	Feedback	= Text ;
oper
	posUtt : Cl -> Utt = mkUtt ;
	negUtt : Cl -> Utt = \cl -> mkUtt (mkS negativePol cl) ; 
	--butPosPhr : Cl -> Phr = \cl -> mkPhr otherwise_PConj (mkUtt (mkS cl)) ;
	define_V2   : V2 = mkV2 define_V ; 
	consider_V2 : V2 = mkV2 consider_V ;
	assign_V3   : V3 = dirV3 assign_V to_Prep ;
	partite_V2  : V2 = mkV2 partite_V ;
	collect_V2  : V2 = mkV2 collect_V ; 
	variable_CN : CN = mkCN variable_N ;
	example_CN : CN = mkCN example_N ;
	mass : CN -> NP = \cn -> mkNP aPl_Det cn ;
	equation_CN : CN = mkCN equation_N ;

	verb_me : V3 -> NP -> Utt = \v,np -> mkUtt (mkImp (mkVP v i_NP np)) ;
	tell_me : NP -> Utt = \np -> verb_me tell_V3 np ;


lin
	Help = mkUtt (mkImp help_V) ;
	Example = let
			an_example:NP = mkNP a_Det example_CN ;
		in  verb_me giveV3 an_example ;

	TellAmount = tell_me ;
	TellVar v  = tell_me (symb v) ;
	Define v am = 
		uttImpP3 (symb v) (mkVP denote_V2 am) ; -- as in CommandsEng

	Assert = mkUtt ;
	AssertEq = mkUtt ;

	just ans 	= mkText (mkPhr ans) ;
	but ans     = mkText (mkPhr but_PConj ans) ;
	instead ans = mkText (mkPhr otherwise_PConj ans) ;

	combine = mkText ;

oper
	must_do : VP -> Utt = \vp ->
		posUtt (mkCl youNP (mkVP must_VV vp)) ;

	equation_saying : S -> CN = \s -> let 
			eq_RS : RS = mkRS (mkRCl which_RP say_VS s) ;
		in mkCN equation_CN eq_RS ;

lin
	TryAgain = let
			try_Utt : Utt = mkUtt (mkImp (mkVP (mkVP try_V) again_Adv))
		in mkText (mkPhr try_Utt please_Voc) ;

	Ok   = mkUtt (mkCl itNP right_A) ;
	None = posUtt nothing_known ;

	MustDefine am =  let
			def_vp: VP = mkVP assign_V3 (mkNP a_Det variable_CN) am 
			-- alternative: def_vp : VP = mkVP define_V2 am
		in  mkText (must_do def_vp) ;

	MustPartite am = let
			partite_vp: VP = mkVP partite_V2 am
		in mkText (must_do partite_vp) ;

	{- MustGather am = let
			concerning : NP -> Adv = \np -> SyntaxEng.mkAdv (mkPrep "concerning") np ;
			eqs_about : NP = mkNP (mkNP aPl_Det equation_CN) (concerning am) ;
			collect_vp: VP = mkVP collect_V2 eqs_about
		in mkText (must_do collect_vp) ;
	-}

	MustWriteEq aeq = let
			write_eq : VP = mkVP write_V2 (mkNP aSg_Det (equation_saying aeq))
		in mkText (must_do write_eq) ;

	AlreadyDefined v am = let
			denotes :VP = mkVP denote_V2 am ;
			v_NP : NP = symb v ;
			already_var : NP = mkNP v_NP already_Adv
		in posUtt (mkCl already_var denotes) ;

	PartitionNotSubclass c d = 
		negUtt (mkCl (mass c) (mass d)) ;

	PartitionEmpty =
		negUtt (ExistNP (mkNP nothing_NP here_Adv)) ;
	
	PartitionSuperClass c d = let
			isSuper:Utt = posUtt (mkCl (mass d) (mass c)) ;
		in isSuper ;
		{-	
			notSub :Phr = negPhr (mkCl (mass c) (mkNP always_AdV (mass d))) 
			in mkText notSub (mkText isSuper) ;
		-}

	PartitionUnrelated p q = 
		let related : A = mkA "related" ;
			pq : NP = mkNP and_Conj (mkListNP p q)
		in negUtt (mkCl pq (mkAP related)) ;

	PartitionNotCovers c = let
			consider_vp : VP = mkVP consider_V2 (mass c)
		in must_do consider_vp ;

oper	
	it_is_not : AP -> Text = \ap -> 
		 mkText (negUtt (mkCl itNP ap)) ;

	it_is_not_compatible_with : NP -> Text = \np ->
		it_is_not (mkAP compatible_A2 np) ;

lin
	MEquationIncompatible ps =
		it_is_not_compatible_with (mkNP and_Conj ps) ;
			--equ : NP = mkNP the_Art (equation_saying (mkS and_Conj eqs)) ; 
		
	AEquationIncompatible p = 
		it_is_not_compatible_with p ;

	EquationNotEntailed =
		mkText (negUtt (mkCl itNP followV)) ;

	EquationInconsistent =
		let consistent : A = mkA "consistent"
		in it_is_not (mkAP consistent) ;

	

}