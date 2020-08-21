--# -path=.:akkadian

concrete HammurabiAkk of Hammurabi = NumeralEng ** -- Not used in this grammar, just needs to be there to work properly
  open GrammarAkk, SyntaxAkk, (S=SyntaxAkk), ParadigmsAkk, Prelude in {
  flags coding=utf8;
    lincat
	Law = S ;
	Action = V2 ;
	Item   = NP ;
	Person = NP ;
	Object = N ;
	Quantity = ModP ;

    lin
        FreeMan  = mkNP (mkN "awiilum") ;
	Commoner = mkNP (mkN "muškeenum") ;
	Slave    = mkNP (mkN "waradum") ;
        King     = mkNP (mkN "šarrum") ;
        Eye      = mkN "iinum" ;
        Bone     = mkN "esemtum" ;

        Poss obj pers = mkNP (mkCN (mkMod pers) obj) ;
        Det = mkNP sg_Det ;

        DigQ dig = lin ModP {s = "42"} ; -- A complete hack, ignore
        NumQ num = lin ModP {s = "5"} ; -- likewise

        Strike = mkV2 "mhs" "a-a" ;
        Break  = mkV2 "šbr" "e-i" ;

        EyeForEye  = \action,agent,patient,object ->
        let
          patObj = Poss object patient ;
          agObj  = Poss object agent ;
	  condition   : S = mkCondS (mkCl agent (mkVP action patObj)) ;
	  consequence : S = mkS (mkPassCl agObj action)
	in
	  mkS if_Conj condition consequence ;

	HitForHit  = \action,agent,patient ->
        let
	  condition   : S = mkCondS (mkCl agent (mkVP action patient)) ;
	  consequence : S = mkS (mkPassCl agent action)
	in
	  mkS if_Conj condition consequence ;

	ShallPay = \action,agent,obj,_q ->
        let
	  condition   : S = mkCondS (mkCl agent (mkVP action obj)) ;
	  consequence : S = mkS (ProDrop agent (mkVP pay_V2 silver))
	in
	  mkS if_Conj condition consequence ;

    oper
        mkCondS : Cl -> S = UseCl Perfect ;
        mkPassCl : NP -> V -> Cl = mkCl ;
	pay_V2  = mkV2 "šql" "a-a" ;
	silver  = mkNP (mkN "kaspum") ;
} ;
