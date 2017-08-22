concrete HammurabiEng of Hammurabi =
  open GrammarEng, SyntaxEng, (I=IrregEng), (C=ConstructorsEng),
       ParadigmsEng, (S=SentenceEng), (L=LexiconEng), ExtraEng, Prelude in {
    lincat
	Law = S ; 
	Action = V2 ;
	Item   = NP ;
	Person = CN ;
	Object = N2 ;
	Quantity = N2 ;

    lin 
        FreeMan  = mkCN (mkA "free") L.man_N ;
	Commoner = mkCN (mkN "commoner") ;
	Slave    = mkCN (mkN "slave") ;
        King     = mkCN (mkN "king") ;
        Eye      = mkN2 "eye" ;
        Bone     = mkN2 "bone" ;
        
        n_mana   = mkN2 ["3 mina"] ;

        Poss obj person = defnt (mkCN obj (indef person)) ;        
--        Det = mkNP the_Art ;

        Strike = mkV2 I.hit_V ;
        Break  = L.break_V2 ;


        EyeForEye  = \action,agent,patient,object ->
        let                    
          patObj : NP = xOf object patient ;
          agObj  : NP = xOfPron object he_Pron; --kaikki miehiä kuitenkin. Olisi toki helppo valita agentin sukupuolen mukaan.
	  condition   : S = mkS (mkCl (indef agent) (mkVP action patObj)) ;
	  consequence : S = mkS (mkCl agObj (mkVP shall_VV (passiveVP action)))
	in
	  ExtAdvS (C.mkAdv if_Subj condition) consequence ;

	HitForHit  = \action,agent,patient ->
        let
	  condition   : S = mkS (mkCl (indef agent) (mkVP action (indef patient))) ;
	  consequence : S = mkS (mkCl he_NP (mkVP shall_VV (passiveVP action)))
	in
	  ExtAdvS (C.mkAdv if_Subj condition) consequence ;

	ShallPay = \action,agent,obj ->
        let
	  condition   : S = mkS (mkCl (indef agent) (mkVP action obj)) ;
	  consequence : S = mkS (mkCl he_NP (mkVP shall_VV (mkVP pay_V2 (mkNP (mkCN n_mana silver)))))
	in
	  ExtAdvS (C.mkAdv if_Subj condition) consequence ;

    oper
        indef : CN -> NP = mkNP a_Quant ;
        defnt : CN -> NP = mkNP the_Quant ;
	pay_V2  = mkV2 "pay" ;
	silver  = mkNP (mkN "silver") ;
	he_NP = mkNP he_Pron ;
        xOf : N2 -> CN -> NP = \obj,pers ->
          defnt (mkCN obj (indef pers)) ;
        xOfPron : N2 -> Pron -> NP = \obj,they ->
          mkNP they (mkCN obj) ;
	
} ;

