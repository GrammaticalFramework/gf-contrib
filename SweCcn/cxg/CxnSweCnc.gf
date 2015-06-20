--# -path=translator:swedish

concrete CxnSweCnc of CxnSweAbs = GrammarSwe, LexiconSwe, DictSwe **
open SyntaxSwe, ExtensionsSwe, ParadigmsSwe, CxnSweRes in {

	flags coding = utf8 ;

	lin

		--
		-- VP
		--

		behöva_något_till_något_1 np_1 np_2 = mkVP (mkVP (mkV2 (mkV "behöver")) np_1) (SyntaxSwe.mkAdv (mkPrep "till") np_2) ;
		behöva_något_till_något_2 np_1 vp = variants {} ;

		börja_på_verksamhet np = mkVP (mkV2 (mkV "börjar") (mkPrep "på")) np ;

		--deontiska_hjälpverb_passiv

		deponens_absolut v = mkVP (suffixV v "s") ;

		deponens_intransitiv_1 v adv = mkVP (mkVP (suffixV v "s")) adv ;
		deponens_intransitiv_2 v = mkVP (suffixV v "s") ;

		deponens_medial v = mkVP (suffixV v "s") ;

		deponens_reciprok v = mkVP (suffixV v "s") ;

		det_är_AP_med_NP v ap np = mkVP (mkVP (mkVA v) ap) (SyntaxSwe.mkAdv (mkPrep "med") np) ;

		Fokuserande_satsadverbial_bara vp = mkVP (mkAdV "bara") vp ;

		få_resultativ_agentiv np vp = mkVP (mkV2A (mkV "få" "måste" "få" "fick" "måst" "måst")) np (PresPartAP vp) ;

		få_resultativ_ofrivillig np vp = mkVP (mkV2A (mkV "få" "måste" "få" "fick" "måst" "måst")) np (PresPartAP vp) ;

		ge_NP_på_båten_1 np = mkVP (mkVP (mkV2 (irregV "ge" "gav" "givit")) np) (SyntaxSwe.mkAdv (mkPrep "på") (mkNP theSg_Det (regGenN "båt" utrum))) ;
		ge_NP_på_båten_2 np = mkVP (mkVP (mkV2 (irregV "ge" "gav" "givit")) np) (SyntaxSwe.mkAdv (mkPrep "på") (mkNP thePl_Det (regGenN "båt" utrum))) ;

		gå_en_NP_1 cn = mkVP (mkV2 (irregV "gå" "gick" "gått")) (mkNP aSg_Det cn) ;
		gå_en_NP_2 cn = mkVP (mkV2 (irregV "gå" "gick" "gått")) (mkNP cn) ;

		--gå_och_V_durativ

		gå_och_V_oväntat vp = variants {} ;

		göra_en_X_person n = mkVP (mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord")) (mkNP aSg_Det n) ;

		göra_NP_plats pn = mkVP (mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord")) (mkNP pn) ;

		göra_sig_AdvP adv = mkVP (mkVP (reflV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord"))) adv ;

		göra_anaforisk = mkVP (mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord")) (mkNP it_Pron) ;

		ha_det_AdvP adv = mkVP (mkVP (mkV2 (mkV "ha" "har" "ha" "hade" "haft" "havd")) (mkNP it_Pron)) adv ;

		ha_med_Y_att_göra_1 pron np_2 = variants {} ;
		ha_med_Y_att_göra_2 np_2 = variants {} ;
		ha_med_Y_att_göra_3 pron np_2 = variants {} ;
		ha_med_Y_att_göra_4 np_2 = mkVP (mkVV (mkV "ha" "har" "ha" "hade" "haft" "havd")) (mkVP (mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord" | mkV "skaffa") (mkPrep "med")) np_2) ;

		hjälpverb_med_riktningsadverbial adv = mkVP (mkVP (mkV "vilja" "vill" "vilj" "ville" "velat" "velad" | mkV "skolar")) adv ;

		hålla_naket_N cn = mkVP (mkV2 (irregV "hålla" "höll" "hållit")) (mkNP cn) ;

		hålla_på_prog_1 vp = mkVP (mkVV (partV (irregV "hålla" "höll" "hållit") (toStr (mkPrep "på")))) vp ;
		hålla_på_prog_2 vp = variants {} ;

		hålla_på_punkt vp = mkVP (mkVV (partV (irregV "hålla" "höll" "hållit") (toStr (mkPrep "på")))) vp ;

		indirekt_kausativ_bort v np = mkVP (mkV2 (partV v "bort")) np ;

		intransitiv_verba_iväg_1 v adv = mkVP (mkVP (partV v "iväg")) adv ;
		intransitiv_verba_iväg_2 v = mkVP (partV v "iväg") ;

		komma_att_resultat vp = mkVP (mkVV (irregV "komma" "kom" "kommit")) vp ;

		komma_NP_till_godo np = mkVP (mkVP (mkV2 (irregV "komma" "kom" "kommit")) np) (SyntaxSwe.mkAdv (mkPrep "till") (mkNP (mkN "del" "delen" "delar" "delarna" | mkN "undsättning" ))) ;

		--låta_sig_verbas

		lägga_upp_NP np = mkVP (mkV2 (irregV "lägga" "lade" "lagt") (mkPrep "upp")) np ;

		N_vägra n = mkVP (prefixV (toStr n) (mkV "vägra")) ;

		objektsundertryckande_reflexiv v = mkVP (reflV v) ;

		om_jag_så_ska pron vp = variants {} ;

		passivV_som_AP_NP_1 v ap = variants {} ;
		passivV_som_AP_NP_2 v np = variants {} ;

		progpart_add vp v = mkVP vp (GerundAdv (mkVP v)) ;

		progpart_sätt vp v = mkVP vp (GerundAdv (mkVP v)) ;

		pseudosamordning v vp = variants {} ;

		pseudosamordning_vara vp = variants {} ;

		reciprok_refl v = mkVP (reflV v) ;

		--redupl_VP_1
		redupl_VP_2 vp = variants {} ;

		reflexiv_resultativ v ap = mkVP (mkVA (reflV v)) ap ;

		SI_refl v = mkVP (reflV v) ;

		skapa_en_adjektivare_NP_1 a cn = mkVP (mkV2 (mkV "skapa")) (mkNP aSg_Det (mkCN (comparAP a) cn)) ;
		skapa_en_adjektivare_NP_2 a cn = mkVP (mkV2 (mkV "skapa")) (mkNP aPl_Det (mkCN (comparAP a) cn)) ;
		skapa_en_adjektivare_NP_3 a cn = mkVP (mkV2 (mkV "skapa")) (mkNP (mkCN (comparAP a) cn)) ;

		snacka_NP_1 cn = mkVP (mkV2 (mkV "snacka" | regV "prata" | regV "tala")) (mkNP aSg_Det cn) ;
		snacka_NP_2 cn = mkVP (mkV2 (mkV "snacka" | regV "prata" | regV "tala")) (mkNP aPl_Det cn) ;
		snacka_NP_3 cn = mkVP (mkV2 (mkV "snacka" | regV "prata" | regV "tala")) (mkNP cn) ;

		snacka_NP_emfas_1 ap cn = mkVP (mkV2 (mkV "snacka" | regV "prata")) (mkNP aSg_Det (mkCN ap cn)) ;
		snacka_NP_emfas_2 ap cn = mkVP (mkV2 (mkV "snacka" | regV "prata")) (mkNP aPl_Det (mkCN ap cn)) ;
		snacka_NP_emfas_3 ap cn = mkVP (mkV2 (mkV "snacka" | regV "prata")) (mkNP (mkCN ap cn)) ;
		snacka_NP_emfas_4 cn = mkVP (mkV2 (mkV "snacka" | regV "prata")) (mkNP aSg_Det cn) ;
		snacka_NP_emfas_5 cn = mkVP (mkV2 (mkV "snacka" | regV "prata")) (mkNP aPl_Det cn) ;
		snacka_NP_emfas_6 cn = mkVP (mkV2 (mkV "snacka" | regV "prata")) (mkNP cn) ;

		stå_som_negativ_NP_1 cn = variants {} ;
		stå_som_negativ_NP_2 cn = variants {} ;
		stå_som_negativ_NP_3 cn = variants {} ;

		sätta_upp_mål_1 cn = mkVP (mkV2 (partV (irregV "sätta" "satte" "satt") "upp")) (mkNP aSg_Det cn) ;
		sätta_upp_mål_2 cn = mkVP (mkV2 (partV (irregV "sätta" "satte" "satt") "upp")) (mkNP aPl_Det cn) ;
		sätta_upp_mål_3 cn = mkVP (mkV2 (partV (irregV "sätta" "satte" "satt") "upp")) (mkNP cn) ;

		ta_del_av_NP np = mkVP (mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") (toStr (mkPrep "del"))) (mkPrep "av")) np ;

		ta_NP_med_jämnmod_1 cn cn = mkVP (mkVP (mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen")) (mkNP theSg_Det cn)) (SyntaxSwe.mkAdv (mkPrep "med") (mkNP aSg_Det cn)) ;
		ta_NP_med_jämnmod_2 cn cn = mkVP (mkVP (mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen")) (mkNP thePl_Det cn)) (SyntaxSwe.mkAdv (mkPrep "med") (mkNP aSg_Det cn)) ;
		ta_NP_med_jämnmod_3 cn cn = mkVP (mkVP (mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen")) (mkNP theSg_Det cn)) (SyntaxSwe.mkAdv (mkPrep "med") (mkNP aPl_Det cn)) ;
		ta_NP_med_jämnmod_4 cn cn = mkVP (mkVP (mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen")) (mkNP thePl_Det cn)) (SyntaxSwe.mkAdv (mkPrep "med") (mkNP aPl_Det cn)) ;
		ta_NP_med_jämnmod_5 cn cn = mkVP (mkVP (mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen")) (mkNP theSg_Det cn)) (SyntaxSwe.mkAdv (mkPrep "med") (mkNP cn)) ;
		ta_NP_med_jämnmod_6 cn cn = mkVP (mkVP (mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen")) (mkNP thePl_Det cn)) (SyntaxSwe.mkAdv (mkPrep "med") (mkNP cn)) ;

		ta_sig_Det_NP_1 cn = mkVP (mkV2 (reflV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen"))) (mkNP aSg_Det cn) ;
		ta_sig_Det_NP_2 cn = mkVP (mkV2 (reflV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen"))) (mkNP aPl_Det cn) ;
		ta_sig_Det_NP_3 cn = mkVP (mkV2 (reflV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen"))) (mkNP cn) ;

		trans_refl v = mkVP (reflV v) ;

		transitiv_resultativ v np ap = mkVP (mkV2A v) np ap ;

		ute_och_verbar vp = variants {} ;

		V_av_NP v cn = mkVP (mkV2 v (mkPrep "av")) (mkNP cn) ;

		v_och_v v = variants {} ;

		V_PcP_1 v vp = mkVP (mkVP v) (GerundAdv vp) ;
		V_PcP_2 v ap = mkVP (mkVA v) ap ;

		V_refl_rörelse v adv = mkVP (mkVP (reflV v)) adv ;

		--V_som_particip

		V_vad_som_helst v = mkVP (mkV2 v) (mkNP (mkPN "vad som helst" neutrum)) ;

		vara_AP_av_sig ap = variants {} ;

		--vara_beredd_på_VP

		vara_vid_liv cn = mkVP (mkV2 (mkV "vara") (mkPrep "vid")) (mkNP cn) ;

		verba_av_sig v = mkVP (reflV (partV v (toStr (mkPrep "av")))) ;

		verba_av_sig_frigöra v = mkVP (reflV (partV v (toStr (mkPrep "av")))) ;

		verba_av_sig_transitiv_1 v np = mkVP (mkV2 (reflV (partV v (toStr (mkPrep "av"))))) np ;
		verba_av_sig_transitiv_2 v = mkVP (reflV (partV v (toStr (mkPrep "av")))) ;

		verba_efter_sig_städa v pron = mkVP (mkV2 v (mkPrep "efter")) (mkNP pron) ;

		verba_in_sig_ingå v = mkVP (mkV2 (reflV (partV v (toStr (mkPrep "in"))))) (mkNP (mkN "själv" utrum | mkN [])) ;

		verba_in_sig_skydd v = mkVP (reflV (partV v (toStr (mkPrep "in")))) ;

		--verba_lagom

		verba_loss v = mkVP (partV v (toStr (mkPrep "loss"))) ;

		verba_ner_sig_minska v = mkVP (reflV (partV v (toStr (mkPrep "ner")))) ;

		verba_ner_sig_resultat v = mkVP (reflV (partV v (toStr (mkPrep "ner")))) ;

		verba_ner_sig_smuts v = mkVP (reflV (partV v (toStr (mkPrep "ner")))) ;

		verba_ner_sig_sänka_rang v = mkVP (reflV (partV v (toStr (mkPrep "ner")))) ;

		verba_om_reciprok v = mkVP (mkVP (partV v (toStr (mkPrep "om")))) (mkAdv "varandra") ;

		verba_pa_forts v = mkVP (partV v (toStr (mkPrep "på"))) ;

		verba_skiten_ur_sig_1 v = variants {} ;
		verba_skiten_ur_sig_2 v = variants {} ;

		--verba_som_en_X_verbar

		verba_så_det_verbar vp_1 vp_1 = variants {} ;

		verba_till_sig_erhålla v np = mkVP (mkV2 (reflV (partV v (toStr (mkPrep "till"))))) np ;

		verba_till_sig_process v = mkVP (reflV (partV v (toStr (mkPrep "till")))) ;

		verba_till_sig_process_agens v = mkVP (reflV (partV v (toStr (mkPrep "till")))) ;

		verba_till_sig_rörelse v np = mkVP (mkV2 (reflV (partV v (toStr (mkPrep "till"))))) np ;

		verba_upp_sig_alstra v = mkVP (reflV (partV v (toStr (mkPrep "upp")))) ;

		verba_upp_sig_attityd v = mkVP (reflV (partV v (toStr (mkPrep "upp")))) ;

		verba_upp_sig_försköna v = mkVP (reflV (partV v (toStr (mkPrep "upp")))) ;

		verba_upp_sig_höja_rang v = mkVP (reflV (partV v (toStr (mkPrep "upp")))) ;

		verba_upp_sig_upplösa v = mkVP (reflV (partV v (toStr (mkPrep "upp")))) ;

		verba_ur_sig_prata v = mkVP (reflV (partV v (toStr (mkPrep "ur")))) ;

		verba_ur_sig_produktion v np = mkVP (mkV2 (reflV (partV v (toStr (mkPrep "ur"))))) np ;

		x_städa_1 n = mkVP (prefixV (toStr n) (mkV "städar")) ;
		x_städa_2 a = mkVP (prefixV (toStr a) (mkV "städar")) ;

		--
		-- NP
		--

		--Adj_men_dock

		--Adj_attribut_efter

		apposition np_1 np_2 = variants {} ;

		container_comp n n = variants {} ;

		curling_cx n n = variants {} ;

		--det_Adj_i_NP_1
		--det_Adj_i_NP_2

		--det_Adj_i_S_InfP_1
		--det_Adj_i_S_InfP_2

		--egennamn_den_adjektiv

		Egennamn_på_NP pn pn = variants {} ;

		--en_NP_kort_1
		--en_NP_kort_2
		--en_NP_kort_3

		--en_tids_aktivitet_1
		--en_tids_aktivitet_2
		--en_tids_aktivitet_3
		--en_tids_aktivitet_4
		--en_tids_aktivitet_5
		--en_tids_aktivitet_6
		--en_tids_aktivitet_7
		--en_tids_aktivitet_8
		--en_tids_aktivitet_9

		--exklamativ_vilken

		Flerledad_fras_predikativ_själv_1 vp = variants {} ;
		Flerledad_fras_predikativ_själv_2 ap = variants {} ;

		indefinit_nominalfras_generisk_1 n = variants {} ;
		indefinit_nominalfras_generisk_2 n = variants {} ;
		indefinit_nominalfras_generisk_3 n = variants {} ;

		indefinit_nominalfras_genre_regelverk_1 n = variants {} ;
		indefinit_nominalfras_genre_regelverk_2 n = variants {} ;
		indefinit_nominalfras_genre_regelverk_3 n = variants {} ;

		indefinit_nominalfras_subjekt_1 cn = variants {} ;
		indefinit_nominalfras_subjekt_2 cn = variants {} ;
		indefinit_nominalfras_subjekt_3 cn = variants {} ;

		--inte_vilken_NP_som_helst

		--kalenderplacering_NP_dåtid_1
		--kalenderplacering_NP_dåtid_2

		--kalenderplacering_NP_framtid_1
		--kalenderplacering_NP_framtid_2
		--kalenderplacering_NP_framtid_3

		--Klockslag_1
		--Klockslag_2
		--Klockslag_3
		--Klockslag_4

		--kollektiviserande_genitiv

		--lite_av_en_NP_1
		--lite_av_en_NP_2
		--lite_av_en_NP_3
		--lite_av_en_NP_4

		--multiplicering_dimension

		--mycket_X_och_lite_Y

		--nominal_bisats_som_attribut_1
		--nominal_bisats_som_attribut_2

		--NP_definit_possessiv_1
		--NP_definit_possessiv_2

		--NP_ensam

		--NP_ensam_predikativt_attribut

		NP_för_NP np = variants {} ;

		--NP_i_genitiv_skalangivelse

		--NP_i_genitiv_tidsangivelse

		--NP_med_sina_NP

		NP_som_AP np = variants {} ;

		--om_inte_wh_sats_1
		--om_inte_wh_sats_2

		Predikativt_attribut_particip np v adv = variants {} ;

		proportion_per_1 cn n = variants {} ;
		proportion_per_2 cn n = variants {} ;
		proportion_per_3 cn n = variants {} ;
		proportion_per_4 cn n = variants {} ;
		proportion_per_5 cn n = variants {} ;
		proportion_per_6 cn n = variants {} ;

		--samordning_grundtal_distributiv

		--själva_NP_n_1
		--själva_NP_n_2

		som_helst_neg_1 pron cn = variants {} ;
		som_helst_neg_2 pron cn = variants {} ;
		som_helst_neg_3 pron cn = variants {} ;
		--som_helst_neg_4
		--som_helst_neg_5
		--som_helst_neg_6

		som_NP_1 cn = variants {} ;
		som_NP_2 cn = variants {} ;
		som_NP_3 cn = variants {} ;

		--unikhet_1
		--unikhet_2
		--unikhet_3
		--unikhet_4

		--vad_som_attribut_1
		--vad_som_attribut_2
		--vad_som_attribut_3

		vilken_NP_som_helst pron np = variants {} ;

		--världens_alla_hörn

		--x_som_x

		--
		-- S
		--

		--bara_desiderativ

		--det_står_ligger_eller_finns_en_NP_på_plats_1
		--det_står_ligger_eller_finns_en_NP_på_plats_2
		--det_står_ligger_eller_finns_en_NP_på_plats_3

		det_verbas_passiv pron v = variants {} ;

		--direktiv_huvudsats_konsekvens

		--direktiv_sats_pseudosamordning

		--en_adjektivare_NP_neg_S_VP_1
		--en_adjektivare_NP_neg_S_VP_2
		--en_adjektivare_NP_neg_S_VP_3
		--en_adjektivare_NP_neg_S_VP_4
		--en_adjektivare_NP_neg_S_VP_5
		--en_adjektivare_NP_neg_S_VP_6

		exklamativ_adv_pn_1 adv np = variants {} ;
		exklamativ_adv_pn_2 pron np = variants {} ;
		exklamativ_adv_pn_3 adv sc = variants {} ;
		exklamativ_adv_pn_4 pron sc = variants {} ;

		--för_varje_X_som_V

		--generaliserande_bisats_koncessiv

		--givet_att_X

		--Instruerande_passiv_1
		--Instruerande_passiv_2
		--Instruerande_passiv_3

		--kontrasterande_satsfogning

		--men_V_då

		NP_NP np_1 np_2 = variants {} ;

		NP_PcP_1 np vp = variants {} ;
		NP_PcP_2 np ap = variants {} ;

		--om_desiderativ

		--passiv_1
		--passiv_2

		pred_som_1 ap pron = variants {} ;
		pred_som_2 np pron = variants {} ;

		reaktiv_dubbel_aux v = variants {} ;

		som_vore_1 np ap = variants {} ;
		som_vore_2 np adv = variants {} ;
		som_vore_3 np np = variants {} ;

		--Tala_om_NP

		--tänk_om_suppositiv

		--tänk_interjektion

		X_går_före_Y np_1 np_2 = variants {} ;

		--X_så_länge_inte_Y_polaritet_1
		--X_så_länge_inte_Y_polaritet_2

		--x_är_ys_z

}
