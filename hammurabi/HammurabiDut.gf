concrete HammurabiDut of Hammurabi = NumeralDut **
  open SyntaxDut, (C=ConstructorsDut), (S=SentenceDut),
       ParadigmsDut, (I=IrregDut), (L=LexiconDut), Prelude in {
    lincat
	Law = S ;
	Action = V2 ;
	Item   = NP ;
	Person = CN ;
	Object = N2 ;
	Quantity = Det ;

    lin
        FreeMan  = mkCN (mkA "vrij") L.man_N ;
	Commoner = mkCN (mkN "boer") ;
	Slave    = mkCN (mkN "slaaf") ;
        King     = mkCN (mkN "koning") ;
        Eye      = mkN2 (mkN "oog") ;
        Bone     = mkN2 L.bone_N ;

        Poss obj person = defnt (mkCN obj (indef person)) ;
        Any obj = mkNP the_Det (mkCN obj somebody_NP) ;

        Strike = mkV2 (mkV "sla" "slaat" "slaan" "sloeg" "sloegen" "geslagen") ;
        Break  = L.break_V2 ;

        DigQ dig = mkDet <dig : Digits> ;
        NumQ num = mkDet <num : Numeral> ;

        EyeForEye  = \action,agent,patient,object ->
        let
          patObj : NP = xOf object patient ;
          agObj  : NP = xOfPron object he_Pron;
	  condition   : S = mkS (mkCl (indef agent) (mkVP action patObj)) ;
	  consequence : S = mkS (mkCl agObj (passiveVP action))
	in
	  S.ExtAdvS (C.mkAdv if_Subj condition) consequence ;

	HitForHit  = \action,agent,patient ->
        let
	  condition   : S = mkS (mkCl (indef agent) (mkVP action (indef patient))) ;
	  consequence : S = mkS (mkCl he_NP (passiveVP action))
	in
	  S.ExtAdvS (C.mkAdv if_Subj condition) consequence ;

	ShallPay = \action,agent,obj,quantity ->
        let
	  condition   : S = mkS (mkCl (indef agent) (mkVP action obj)) ;
	  consequence : S = mkS futureTense (mkCl he_NP (mkVP pay_V2 (mkNP quantity (mkCN mina silver))))
	in
	  S.ExtAdvS (C.mkAdv if_Subj condition) consequence ;

    oper
        -- Ancient unit of weight and currency https://en.wikipedia.org/wiki/Mina_(unit)
        mina = mkN2 (mkN "mina") (mkPrep []) ;

        indef : CN -> NP = mkNP a_Quant ;
        defnt : CN -> NP = mkNP the_Quant ;
	pay_V2  = mkV2 "betalen" ;
	silver  = mkNP (mkN "zilver") ;
	he_NP = mkNP he_Pron ;
        xOf : N2 -> CN -> NP = \obj,pers ->
          defnt (mkCN obj (indef pers)) ;
        xOfPron : N2 -> Pron -> NP = \obj,they ->
          mkNP they (mkCN obj) ;

} ;
