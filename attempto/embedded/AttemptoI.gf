incomplete concrete AttemptoI of Attempto = SymbolsC, Numeral ** open
Syntax,
Symbolic,
Prelude,
LexAttempto
in {

lincat CN_ACE = Syntax.CN ;
lincat NP_ACE = Syntax.NP ;
lincat Card_ACE = Syntax.Card ;
--lincat Numeral = Syntax.Numeral ;
lincat PN_ACE = Syntax.PN ;
lincat A_ACE = Syntax.A ;
lincat A2_ACE = Syntax.A2 ;
lincat AP_ACE = Syntax.AP ;
lincat RS_ACE = Syntax.RS ;
lincat Pron_ACE = Syntax.Pron ;
lincat Prep_ACE = Syntax.Prep ;
lincat S_ACE = Syntax.S ;
lincat VP_ACE = Syntax.VP ;
lincat V_ACE = Syntax.V ;
lincat VS_ACE = Syntax.VS ;
lincat V2_ACE = Syntax.V2 ;
lincat V3_ACE = Syntax.V3 ;
lincat Adv_ACE = Syntax.Adv ;
lincat Conj_ACE = Syntax.Conj ;
lincat IP_ACE = Syntax.IP ;
lincat IAdv_ACE = Syntax.IAdv ;
lincat QS_ACE = Syntax.QS ;
lincat Text_ACE = Syntax.Text ;
lincat RP_ACE = Syntax.RP ;

lincat MCN_ACE = Syntax.CN ;
lincat PP = Syntax.Adv ;

lin aNP_ACE = mkNP a_Art ;
lin theNP_ACE = mkNP the_Art ;
lin cardNP_ACE d = mkNP d ;
lin noNP_ACE = mkNP no_Quant ;
lin everyNP_ACE = mkNP every_Det ;
lin eachNP_ACE = mkNP each_Det ;
lin notEveryNP_ACE cn = mkNP not_Predet (mkNP every_Det cn) ;
lin notEachNP_ACE cn = mkNP not_Predet (mkNP each_Det cn) ;
lin theCollNP_ACE = mkNP the_Art plNum ;
lin someCollNP_ACE = mkNP somePl_Det ;
lin allCollNP_ACE cn = mkNP all_Predet (mkNP a_Art plNum cn) ;

lin noCollNP_ACE = mkNP no_Quant plNum ;
lin eachTheNP_ACE cn = eachOf (mkNP the_Art plNum cn) ;
lin eachSomeNP_ACE cn = eachOf (mkNP somePl_Det cn) ;
lin eachNumNP_ACE ca cn = eachOf (mkNP ca cn) ;

lin someMassNP_ACE = mkNP someSg_Det ;
lin allMassNP_ACE cn = mkNP all_Predet (mkNP cn) ;

lin noMassNP_ACE = mkNP no_Quant ;
lin notAllMassNP_ACE cn = mkNP not_Predet (mkNP all_Predet (mkNP cn)) ;

---lin one_Card = mkCard n1_Numeral ;
---lin two_Card = mkCard n2_Numeral ;
---lin five_Card = mkCard n5_Numeral ;
---lin ten_Card = mkCard n10_Numeral ;

lin pnNP_ACE = mkNP ;
lin intNP_ACE = symb ;
lin floatNP_ACE = symb ;

lin it_NP_ACE = mkNP it_Pron ;
lin he_NP_ACE = mkNP he_Pron ;
lin she_NP_ACE = mkNP she_Pron ;
lin he_she_NP_ACE = mkNP slash_Conj (mkNP he_Pron) (mkNP she_Pron) ;
lin they_NP_ACE = mkNP they_Pron ;

lin conjNP_ACE = mkNP and_Conj ;
lin adjCN_ACE = mkCN ;

--lin someone_NP_ACE : NP_ACE ;
lin somebody_NP_ACE = Syntax.somebody_NP ;
lin something_NP_ACE = Syntax.something_NP ;
--lin noone_NP_ACE : NP_ACE ;
lin nobody_NP_ACE = Syntax.nobody_NP ;
lin nothing_NP_ACE = Syntax.nothing_NP ;
--lin not_everyoneNP_ACE : NP_ACE ;
lin not_everybodyNP_ACE = mkNP not_Predet Syntax.everybody_NP ;
lin not_everythingNP_ACE = mkNP not_Predet Syntax.everything_NP ;

lin at_leastNP_ACE ca = mkNP (mkCard at_least_AdN ca) ;
lin not_at_leastNP_ACE ca cn = mkNP not_Predet (mkNP (mkCard at_least_AdN ca) cn) ;
lin at_mostNP_ACE ca = mkNP (mkCard at_most_AdN ca) ;
lin not_at_mostNP_ACE ca cn = mkNP not_Predet (mkNP (mkCard at_most_AdN ca) cn) ;
lin more_thanNP_ACE ca = mkNP (mkCard (mkAdN more_CAdv) ca) ;
lin not_more_thanNP_ACE ca cn = mkNP not_Predet (mkNP (mkCard (mkAdN more_CAdv) ca) cn) ;

lin nothing_butNP_ACE cn = mkNP nothing_NP (mkAdv except_Prep (mkNP a_Art plNum cn)) ;
lin nothing_butMassNP_ACE cn = mkNP nothing_NP (mkAdv except_Prep (mkNP cn)) ;
lin nobody_butNP_ACE pn = mkNP nobody_NP (mkAdv except_Prep (mkNP pn)) ;
lin no_butNP_ACE cn pn = mkNP (mkNP no_Quant plNum cn) (mkAdv except_Prep (mkNP pn)) ;

lincat Unit = CN ;

lin unitNP_ACE = mkNP ;
lin unit_ofNP_ACE ca u cn = mkNP (mkNP ca u) (mkAdv part_Prep (mkNP a_Art plNum cn)) ;
lin unit_ofMassNP_ACE ca u cn = mkNP (mkNP ca u) (mkAdv part_Prep (mkNP cn)) ;

lin apposVarCN_ACE cn v = mkCN cn (symb v) ;

lin termNP_ACE x = symb (ss x.s) ;

-- 2.2.1


lin adjCN_ACE = mkCN ;
lin positAP_ACE = mkAP ;
lin comparAP_ACE = Syntax.comparAP ;
lin superlAP_ACE a = mkAP (mkOrd a) ;


-- 2.2.2

lin relCN_ACE = mkCN ;
lin relNP_ACE = mkNP ;

lin andRS_ACE = mkRS and_Conj ;
lin orRS_ACE = mkRS or_Conj ;
lin eachRP_ACE = mkRP part_Prep (mkNP each_Det) Syntax.which_RP ;

lin suchCN_ACE cn s = mkCN (mkAP (mkAP such_A) s) cn ;

lin predRS_ACE rp vp = mkRS (mkRCl rp vp) ;
lin slashRS_ACE rp np v2 = mkRS (mkRCl rp np v2) ;
lin which_RP_ACE = Syntax.which_RP ;

-- 2.2.4

lin genNP_ACE = genitiveNP ;
lin ofCN_ACE cn np = mkCN cn (mkAdv possess_Prep np) ;
lin genOwnNP_ACE np cn = genitiveNP np (mkCN own_A cn) ;

-- 2.3.1

lin vpS_ACE np vp = mkS (mkCl np vp) ;
lin neg_vpS_ACE np vp = mkS negativePol (mkCl np vp) ;

lin not_provably_vpS_ACE np vp = mkS negativePol (mkCl np (mkVP vp provably_Adv)) ;

lin vVP_ACE = mkVP ;
lin vsVP_ACE = mkVP ;
lin v2VP_ACE = mkVP ;
lin v3VP_ACE = mkVP ;

-- 2.3.2

lin apVP_ACE = mkVP ;
lin compVP_ACE a np = mkVP (mkAP a np) ;
lin as_asVP_ACE ap np = mkVP (mkAP as_CAdv ap np) ; -- John is as rich as Mary
lin more_thanVP_ACE ap np = mkVP (mkAP more_CAdv ap np) ;

---- John is as fond-of Mary as of Sue
---- John is more fond-of Mary than of Sue

--lincat [PP] = Adv ;

--lin BasePP p = p ;

lin ppVP_ACE = mkVP ;

lin prepPP = mkAdv ;
lin advPP p = p ;

-- 2.3.5

lin canVP_ACE = mkVP can_VV ;
lin mustVP_ACE = mkVP must_VV ;

lin have_toVP_ACE = mkVP have_VV ;

-- 2.4

lin modVP_ACE = mkVP ;

-- 3.2

lin thereNP_ACE np = mkS (mkCl np) ;


-- 3.3

lin formulaS_ACE f = symb (lin Symb (ss f.s)) ;

-- 3.4.1

lin coordS_ACE = mkS ;

lin and_Conj_ACE = Syntax.and_Conj ;
lin or_Conj_ACE = Syntax.or_Conj ;
lin commaAnd_Conj_ACE = comma_and_Conj ;
lin commaOr_Conj_ACE = comma_or_Conj ;

-- 3.4.3

lin for_everyS_ACE cn = mkS (mkAdv for_Prep (mkNP every_Det cn)) ;
lin for_eachS_ACE cn = mkS (mkAdv for_Prep (mkNP each_Det cn)) ;
lin for_each_ofS_ACE card cn =
  mkS (mkAdv for_Prep (eachOf (mkNP card cn))) ;
lin for_allMassS_ACE cn =
  mkS (mkAdv for_Prep (mkNP all_Predet (mkNP cn))) ;

-- 3.4.4

lin if_thenS_ACE = mkS if_then_Conj ;

lin falseS_ACE s = mkS (adj_thatCl false_A s) ;
lin not_provableS_ACE s = mkS negativePol (adj_thatCl provable_A s) ;
lin possibleS_ACE s = mkS (adj_thatCl possible_A s) ;
lin not_possibleS_ACE s = mkS negativePol (adj_thatCl possible_A s) ;
lin necessaryS_ACE s = mkS (adj_thatCl necessary_A s) ;
lin not_necessaryS_ACE s = mkS negativePol (adj_thatCl necessary_A s) ;


-- 3.5

lin npQS_ACE np vp = mkQS (mkCl np vp) ;
lin ipQS_ACE ip vp = mkQS (mkQCl ip vp) ;
lin iadvQS_ACE iadv np vp = mkQS (mkQCl iadv (mkCl np vp)) ;

lin where_IAdv_ACE = Syntax.where_IAdv ;
lin when_IAdv_ACE = Syntax.when_IAdv ;
lin whoSg_IP_ACE = Syntax.whoSg_IP ;
lin whoPl_IP_ACE = Syntax.whoPl_IP ;

lin there_ipQS_ACE ip = mkQS (mkQCl ip) ; ---- who is there, not there is who
lin whoseIP_ACE = mkIP whose_IDet ;

-- 3.6

lin np_impVP_ACE np vp = mkText (mkPhr (mkUtt (mkImp vp)) (mkVoc np)) exclMarkPunct ;
---- John, go to the bank!


lin sText_ACE = mkText ;
lin qsText_ACE = mkText ;


--- more

lin npVP_ACE = mkVP ;
lin impVP_ACE vp = mkText (mkImp vp) ;
lin numeralCard_ACE n = mkCard <lin Numeral n : Numeral> ;
lin digitsCard_ACE n = mkCard <lin Digits n : Digits> ;
lin have_V2_ACE = Syntax.have_V2 ;
lin v2_byVP_ACE v2 np = mkVP (passiveVP v2) (mkAdv by8agent_Prep np) ;

}



