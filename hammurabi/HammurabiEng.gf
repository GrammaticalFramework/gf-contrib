concrete HammurabiEng of Hammurabi = NumeralEng **
  open SyntaxEng, (I=IrregEng), (C=ConstructorsEng),
       ParadigmsEng, (S=SentenceEng), (L=LexiconEng), ExtraEng, Prelude in {
    lincat
	Law = S ;
	Action = V2 ;
	Item   = NP ;
	Person = CN ;
	Object = N2 ;
	Quantity = Det ;

    lin
        FreeMan  = mkCN (mkA "free") L.man_N ;
	Commoner = mkCN (mkN "commoner") ;
	Slave    = mkCN (mkN "slave") ;
        King     = mkCN (mkN "king") ;
        Eye      = mkN2 "eye" ;
        Bone     = mkN2 "bone" ;


        Poss obj person = defnt (mkCN obj (indef person)) ;
        Det obj = mkNP the_Det (mkCN obj) ;

        DigQ dig = mkDet <dig : Digits> ;
        NumQ num = mkDet <num : Numeral> ;

        Strike = mkV2 I.hit_V ;
        Break  = L.break_V2 ;


        EyeForEye  = \action,agent,patient,object ->
        let
          patObj : NP = xOf object patient ;
          agObj  : NP = xOfPron object he_Pron ;
	  condition   : S = mkS (mkCl (indef agent) (mkVP action patObj)) ;
	  consequence : S = mkS (mkCl agObj (mkVP shall_VV (passiveVP action)))
	in
	  S.ExtAdvS (C.mkAdv if_Subj condition) consequence ;

	HitForHit  = \action,agent,patient ->
        let
	  condition   : S = mkS (mkCl (indef agent) (mkVP action (indef patient))) ;
	  consequence : S = mkS (mkCl he_NP (mkVP shall_VV (passiveVP action)))
	in
	  S.ExtAdvS (C.mkAdv if_Subj condition) consequence ;

	ShallPay = \action,agent,obj,quantity ->
        let
	  condition   : S = mkS (mkCl (indef agent) (mkVP action obj)) ;
	  consequence : S = mkS (mkCl he_NP
                                      (mkVP shall_VV
                                           (mkVP pay_V2 (mkNP quantity (mkCN mina silver)))))
	in
	  S.ExtAdvS (C.mkAdv if_Subj condition) consequence ;

    oper
        -- Ancient unit of weight and currency https://en.wikipedia.org/wiki/Mina_(unit)
        mina = mkN2 "mina" ;


        indef : CN -> NP = mkNP a_Quant ;
        defnt : CN -> NP = mkNP the_Quant ;
	pay_V2  = mkV2 "pay" ;
	silver  = mkNP (mkN "silver") ;
        xOf : N2 -> CN -> NP = \obj,pers ->
          defnt (mkCN obj (indef pers)) ;
        xOfPron : N2 -> Pron -> NP = \obj,they ->
          mkNP they (mkCN obj) ;


} ;
