abstract CxnSweAbs = Grammar, Lexicon, DictSweAbs ** {

	flags coding = utf8 ;

	fun

		--
		-- VP
		--

		-- behöva_något_till_något: [behöva..1 NP,,1 till..1 NP,,2|VP]
		-- rewritten as [behöva,,V NP,,1 till,,Prep NP,,2] | [behöva,,V NP,,1 till,,Prep VP]
		-- e.g. 'behöver mat till festen'

		behöva_något_till_något_1 : NP -> NP -> VP ;
		behöva_något_till_något_2 : NP -> VP -> VP ;


		-- börja_på_verksamhet: [börja..1 på..1 NP]
		-- rewritten as [börja,,V på,,Prep NP]
		-- e.g. 'börja på Chalmers'

		börja_på_verksamhet : NP -> VP ;


		-- deontiska_hjälpverb.passiv: NP [V VP,,pass]
		-- rewritten as [V VP,,pass]
		-- e.g. 'Bilen behöver lagas'

		deontiska_hjälpverb_passiv : V -> VP -> VP ;


		-- deponens.absolut: NP [V - "s"]
		-- rewritten as [V - s,,Str]
		-- e.g. 'Sluta retas!'

		deponens_absolut : V -> VP ;


		-- deponens.intransitiv: NP [V - "s" (PP|AdvP)]
		-- rewritten as [V - s,,Str Adv] | [V - s,,Str]
		-- e.g. 'vintern nalkas'

		deponens_intransitiv_1 : V -> Adv -> VP ;
		deponens_intransitiv_2 : V -> VP ;


		-- deponens.medial: NP [V - "s"]
		-- rewritten as [V - s,,Str]
		-- e.g. 'Datorer åldras snabbt'

		deponens_medial : V -> VP ;


		-- deponens.reciprok: NP,,pl [V - "s"]
		-- rewritten as [V - s,,Str]
		-- e.g. 'Vi ses snart!'

		deponens_reciprok : V -> VP ;


		-- det_är_AP_med_NP: "det" [V AP med NP]
		-- rewritten as [V AP med,,Prep NP]
		-- e.g. 'Det är gott med choklad, det låter roligt med fotboll, det verkar svårt med relationer'

		det_är_AP_med_NP : V -> AP -> NP -> VP ;


		-- Fokuserande_satsadverbial.bara: [bara..1 VP]
		-- rewritten as [bara,,Str VP]
		-- e.g. 'Hon bara reste sig upp när hon var ca 10 månader .'

		Fokuserande_satsadverbial_bara : VP -> VP ;


		-- få_resultativ.agentiv: [få..0 NP PcP]
		-- rewritten as [få,,V NP PcP,,pres]
		-- e.g. 'fick gräsmattan klippt'

		få_resultativ_agentiv : NP -> VP -> VP ;


		-- få_resultativ.ofrivillig: [få..1 NP PcP]
		-- rewritten as [få,,V NP PcP,,pres]
		-- e.g. 'fick plånboken stulen'

		få_resultativ_ofrivillig : NP -> VP -> VP ;


		-- ge_NP_på_båten: [ge..1 NP på..1 "båten"]
		-- rewritten as [ge,,V NP på,,Prep theSg_Det båt,,N] | [ge,,V NP på,,Prep thePl_Det båt,,N]
		-- e.g. 'Ge konservatismen på båten.'

		ge_NP_på_båten_1 : NP -> VP ;
		ge_NP_på_båten_2 : NP -> VP ;


		-- gå_en_NP: [gå..1 NP,,sg,indef]
		-- rewritten as [gå,,V aSg_Det CN] | [gå,,V CN]
		-- e.g. 'gå en kurs'

		gå_en_NP_1 : CN -> VP ;
		gå_en_NP_2 : CN -> VP ;


		-- gå_och_V.durativ: [gå..3 och..1 VP]
		-- rewritten as [gå,,VP,,perf/pret and_Conj VP,,perf/pret]
		-- e.g. 'Jag har gått och väntat på vintern i år.'

		gå_och_V_durativ : VP -> VP ;


		-- gå_och_V.oväntat: [gå..3 och..1 VP]
		-- rewritten as [gå,,V and_Conj VP]
		-- e.g. 'Hon har gått och gift sig.'

		gå_och_V_oväntat : VP -> VP ;


		-- göra_en_X.person: [göra..1 en..2 N,,prop]
		-- rewritten as [göra,,V aSg_Det N]
		-- e.g. 'göra en Carola'

		göra_en_X_person : N -> VP ;


		-- göra_NP-plats: [göra..1 NP,,prop]
		-- rewritten as [göra,,V PN]
		-- e.g. 'Vi skulle göra Grekland tillsammans.'

		göra_NP_plats : PN -> VP ;


		-- göra_sig_AdvP: NP [göra..1 Pn,,refl AdvP]
		-- rewritten as [göra,,V refl_Pron Adv]
		-- e.g. 'Fåtöljen gör sig bra i hörnet'

		göra_sig_AdvP : Adv -> VP ;


		-- göra.anaforisk: NP [göra..1 "det"]
		-- rewritten as [göra,,V it_Pron]
		-- e.g. 'Gillar du bullar? - Ja, det gör jag.'

		göra_anaforisk : VP ;


		-- ha_det_AdvP: [ha..1 det..0 AdvP]
		-- rewritten as [ha,,V it_Pron Adv]
		-- e.g. 'Vi hade det bra hela sommaren.'

		ha_det_AdvP : Adv -> VP ;


		-- ha_med_Y_att_göra: NP,,1 [[ha..1,,fin (Pn) med..1 NP,,2 att..1 göra..1|skaffa..1] | [ha..1,,fin (Pn) att..1 göra..1|skaffa..1 med..1 NP,,2]]
		-- rewritten as [ha,,V,,fin Pron med,,Prep NP,,2 göra|skaffa,,V,,inf] | [ha,,V,,fin med,,Prep NP,,2 göra|skaffa,,V,,inf] | [ha,,V,,fin Pron göra|skaffa,,V,,inf med,,Prep NP,,2] | [ha,,V,,fin göra|skaffa,,V,,inf med,,Prep NP,,2]
		-- e.g. 'Dessa eftertaxeringar har med skalbolagsaffärerna att göra.'

		ha_med_Y_att_göra_1 : Pron -> NP -> VP ;
		ha_med_Y_att_göra_2 : NP -> VP ;
		ha_med_Y_att_göra_3 : Pron -> NP -> VP ;
		ha_med_Y_att_göra_4 : NP -> VP ;


		-- hjälpverb_med_riktningsadverbial: [måste..1|vilja..1|skola..4 AdvP|PP]
		-- rewritten as [måste|vilja|skola,,V,,pres/pret Adv]
		-- e.g. 'Vi ska till stan'

		hjälpverb_med_riktningsadverbial : Adv -> VP ;


		-- hålla_naket_N: [hålla..4 NP,,naken]
		-- rewritten as [hålla,,V CN]
		-- e.g. 'hålla tal'

		hålla_naket_N : CN -> VP ;


		-- hålla_på.prog: [hålla_på..2 att..1 VP,,inf] | [hålla_på..2 och..1 VP]
		-- rewritten as [hålla,,V på,,Prep VP,,inf] | [hålla,,V på,,Prep and_Conj VP]
		-- e.g. 'håller på att skriva'

		hålla_på_prog_1 : VP -> VP ;
		hålla_på_prog_2 : VP -> VP ;


		-- hålla_på.punkt: [hålla_på..1 att..1 VP,,inf]
		-- rewritten as [hålla,,V på,,Prep VP,,inf]
		-- e.g. 'höll på att snubbla'

		hålla_på_punkt : VP -> VP ;


		-- indirekt_kausativ_bort: [V bort..1 NP]
		-- rewritten as [V bort,,Str NP]
		-- e.g. 'springa bort semesterkulan'

		indirekt_kausativ_bort : V -> NP -> VP ;


		-- intransitiv_verba_iväg: [VP iväg..1 (PP)]
		-- rewritten as [V iväg,,Str Adv] | [V iväg,,Str]
		-- e.g. 'kuta iväg'

		intransitiv_verba_iväg_1 : V -> Adv -> VP ;
		intransitiv_verba_iväg_2 : V -> VP ;


		-- komma_att.resultat: [komma..1,,pret/sup att..1 VP]
		-- rewritten as [komma,,V,,pret/sup VP]
		-- e.g. 'kom att bli den bästa genom tiderna'

		komma_att_resultat : VP -> VP ;


		-- komma_NP_till_godo: [komma..1 NP till..1 "godo"|"del"|undsättning..1]
		-- rewritten as [komma,,V NP till,,Prep godo|del|undsättning,,N]
		-- e.g. 'del av vinsten har kommit samhället till del'

		komma_NP_till_godo : NP -> VP ;


		-- låta_sig_verbas: [låta..1 Pn,,refl VP,,pass,inf]
		-- rewritten as [låta,,V refl_Pron VP,,pass,inf]
		-- e.g. 'låta sig luras, låta sig bli lurad'

		låta_sig_verbas : VP -> VP ;


		-- lägga_upp_NP: [lägga..2 upp..1 NP]
		-- rewritten as [lägga,,V upp,,Prep NP]
		-- e.g. 'lägga upp en plan'

		lägga_upp_NP : NP -> VP ;


		-- N-vägra: [N + vägra..1]V
		-- rewritten as [N + vägra,,V]
		-- e.g. 'vapenvägra'

		N_vägra : N -> VP ;


		-- objektsundertryckande_reflexiv: NP,,i [V Pn,,refl]
		-- rewritten as [V refl_Pron]
		-- e.g. 'meddela sig via mobilen'

		objektsundertryckande_reflexiv : V -> VP ;


		-- om_jag_så_ska: S [om..2 Pn så..1 VP]
		-- rewritten as [if_Subj Pron så,,Str VP]
		-- e.g. 'om jag så ska göra det själv'

		om_jag_så_ska : Pron -> VP -> VP ;


		-- passivV_som_AP/NP: [V,,pass som..1 AP|NP]
		-- rewritten as [V,,pass which_RP AP] | [V,,pass which_RP NP]
		-- e.g. 'betraktas som tråkig'

		passivV_som_AP_NP_1 : V -> AP -> VP ;
		passivV_som_AP_NP_2 : V -> NP -> VP ;


		-- progpart_add: NP [VP Pc,,pres]
		-- rewritten as [VP Pc,,pres]
		-- e.g. 'Hon gick sjungande'

		progpart_add : VP -> V -> VP ;


		-- progpart_sätt: [VP Pc,,pres]
		-- rewritten as [VP Pc,,pres]
		-- e.g. 'Han kom gående'

		progpart_sätt : VP -> V -> VP ;


		-- pseudosamordning: [V och..1 VP]
		-- rewritten as [V and_Conj VP]
		-- e.g. 'De står och tittar'

		pseudosamordning : V -> VP -> VP ;


		-- pseudosamordning.vara: [vara..1 och..1 VP]
		-- rewritten as [vara,,V and_Conj VP]
		-- e.g. 'är och handlar'

		pseudosamordning_vara : VP -> VP ;


		-- reciprok_refl: NP,,i [V Pn,,refl]
		-- rewritten as [V refl_Pron]
		-- e.g. 'De förlovade sig'

		reciprok_refl : V -> VP ;


		-- redupl_VP: [VP,,= och..1 VP,,= (och..1 VP,,=)] | [VP,,= , VP,,= , (VP,,=)]
		-- rewritten as [VP,,= and_Conj och|empty,,Konj VP,,=] | [VP,,= , ,]
		-- e.g. 'Han bara sover och sover och sover'

		redupl_VP_1 : VP -> VP ;
		redupl_VP_2 : VP -> VP ;


		-- reflexiv_resultativ: [V Pn,,refl AP]
		-- rewritten as [V refl_Pron AP]
		-- e.g. 'supa sig full'

		reflexiv_resultativ : V -> AP -> VP ;


		-- SI_refl: NP,,i [V Pn,,refl]
		-- rewritten as [V refl_Pron]
		-- e.g. 'beklaga sig'

		SI_refl : V -> VP ;


		-- skapa_en_adjektivare_NP: [skapa..1 Det,,indef Adj,,komp NP]
		-- rewritten as [skapa,,V aSg_Det A,,komp CN] | [skapa,,V aPl_Det A,,komp CN] | [skapa,,V A,,komp CN]
		-- e.g. 'Skapa en bättre värld'

		skapa_en_adjektivare_NP_1 : A -> CN -> VP ;
		skapa_en_adjektivare_NP_2 : A -> CN -> VP ;
		skapa_en_adjektivare_NP_3 : A -> CN -> VP ;


		-- snacka_NP: [snacka..1|prata..1|tala..1 NP,,indef]
		-- rewritten as [snacka|prata|tala,,V aSg_Det CN] | [snacka|prata|tala,,V aPl_Det CN] | [snacka|prata|tala,,V CN]
		-- e.g. 'Vi ses och pratar skolminnen.'

		snacka_NP_1 : CN -> VP ;
		snacka_NP_2 : CN -> VP ;
		snacka_NP_3 : CN -> VP ;


		-- snacka_NP.emfas: [snacka..1|prata..1 (AP) NP,,indef]
		-- rewritten as [snacka|prata,,V aSg_Det AP CN] | [snacka|prata,,V aPl_Det AP CN] | [snacka|prata,,V AP CN] | [snacka|prata,,V aSg_Det CN] | [snacka|prata,,V aPl_Det CN] | [snacka|prata,,V CN]
		-- e.g. 'Vi snackar riktigt tunga favoriter.'

		snacka_NP_emfas_1 : AP -> CN -> VP ;
		snacka_NP_emfas_2 : AP -> CN -> VP ;
		snacka_NP_emfas_3 : AP -> CN -> VP ;
		snacka_NP_emfas_4 : CN -> VP ;
		snacka_NP_emfas_5 : CN -> VP ;
		snacka_NP_emfas_6 : CN -> VP ;


		-- stå_som_negativ_NP: [stå..1 som..1 NP,,indef]
		-- rewritten as [stå,,V that_Subj aSg_Det CN] | [stå,,V that_Subj aPl_Det CN] | [stå,,V that_Subj CN]
		-- e.g. 'stå som ett fån'

		stå_som_negativ_NP_1 : CN -> VP ;
		stå_som_negativ_NP_2 : CN -> VP ;
		stå_som_negativ_NP_3 : CN -> VP ;


		-- sätta_upp_mål: NP [sätta..1 upp..1 NP,,indef]
		-- rewritten as [sätta,,V upp,,Str aSg_Det CN] | [sätta,,V upp,,Str aPl_Det CN] | [sätta,,V upp,,Str CN]
		-- e.g. 'sätta upp regler'

		sätta_upp_mål_1 : CN -> VP ;
		sätta_upp_mål_2 : CN -> VP ;
		sätta_upp_mål_3 : CN -> VP ;


		-- ta_del_av_NP: [ta..1 del..1,,sg,indef av..1 NP]
		-- rewritten as [ta,,V del,,Prep,,sg,indef av,,Prep NP]
		-- e.g. 'ta del av informationen'

		ta_del_av_NP : NP -> VP ;


		-- ta_NP_med_jämnmod: [ta..1 NP,,def med..1 NP,,indef]
		-- rewritten as [ta,,V theSg_Det CN med,,Prep aSg_Det CN] | [ta,,V thePl_Det CN med,,Prep aSg_Det CN] | [ta,,V theSg_Det CN med,,Prep aPl_Det CN] | [ta,,V thePl_Det CN med,,Prep aPl_Det CN] | [ta,,V theSg_Det CN med,,Prep CN] | [ta,,V thePl_Det CN med,,Prep CN]
		-- e.g. 'tar beslutet med jämnmod'

		ta_NP_med_jämnmod_1 : CN -> CN -> VP ;
		ta_NP_med_jämnmod_2 : CN -> CN -> VP ;
		ta_NP_med_jämnmod_3 : CN -> CN -> VP ;
		ta_NP_med_jämnmod_4 : CN -> CN -> VP ;
		ta_NP_med_jämnmod_5 : CN -> CN -> VP ;
		ta_NP_med_jämnmod_6 : CN -> CN -> VP ;


		-- ta_sig_Det_NP: [ta..1 Pn,,refl Det,,indef NP]
		-- rewritten as [ta,,V refl_Pron aSg_Det CN] | [ta,,V refl_Pron aPl_Det CN] | [ta,,V refl_Pron CN]
		-- e.g. 'Ebba kanske tar sig en smygcigg när ingen ser.'

		ta_sig_Det_NP_1 : CN -> VP ;
		ta_sig_Det_NP_2 : CN -> VP ;
		ta_sig_Det_NP_3 : CN -> VP ;


		-- trans_refl: NP,,i [V Pn,,refl]
		-- rewritten as [V refl_Pron]
		-- e.g. 'Han tvättar sig'

		trans_refl : V -> VP ;


		-- transitiv_resultativ: [VP NP AP]
		-- rewritten as [V NP AP]
		-- e.g. 'måla huset grönt'

		transitiv_resultativ : V -> NP -> AP -> VP ;


		-- ute_och_verbar: [ute..4 och..1 VP]
		-- rewritten as [ute,,Str and_Conj VP]
		-- e.g. 'Hon är ute och springer'

		ute_och_verbar : VP -> VP ;


		-- V_av_NP: [V av..1 NP,,naken]
		-- rewritten as [V av,,Prep CN]
		-- e.g. 'dö av skam'

		V_av_NP : V -> CN -> VP ;


		-- v_och_v: [V,,= och..1 V,,=]
		-- rewritten as [V,,= and_Conj]
		-- e.g. 'går och går'

		v_och_v : V -> VP ;


		-- V_PcP: [V PcP|AP]
		-- rewritten as [V PcP,,pres] | [V AP]
		-- e.g. 'Maskarna ligger hopkurade'

		V_PcP_1 : V -> VP -> VP ;
		V_PcP_2 : V -> AP -> VP ;


		-- V_refl.rörelse: NP,,i [V Pn,,refl PP|AdvP]
		-- rewritten as [V refl_Pron Adv]
		-- e.g. 'ålade sig fram'

		V_refl_rörelse : V -> Adv -> VP ;


		-- V_som_particip: [V som..2 PcP,,perf]
		-- rewritten as [V,,pres/pret that_Subj PcP,,perf]
		-- e.g. 'stod som förstummad'

		V_som_particip : V -> VP -> VP ;


		-- V_vad_som_helst: [V vad_som_helst..1]
		-- rewritten as [V vad_som_helst,,PN]
		-- e.g. 'ta vad som helst'

		V_vad_som_helst : V -> VP ;


		-- vara_AP_av_sig: NP,,i [vara..1 AP av..1 Pn,,i]
		-- rewritten as [vara,,V AP av,,Prep refl_Pron]
		-- e.g. 'Han är glad av sig'

		vara_AP_av_sig : AP -> VP ;


		-- vara_beredd_på_VP: [vara..1 beredd..1 (på..1) VP,,inf]
		-- rewritten as [vara,,V beredd,,A på|empty,,Prep VP,,inf]
		-- e.g. 'vara beredd på att jobba hårt'

		vara_beredd_på_VP : VP -> VP ;


		-- vara_vid_liv: [vara..1 vid..1 NP,,naken]
		-- rewritten as [vara,,V vid,,Prep CN]
		-- e.g. 'Han är vid medvetande'

		vara_vid_liv : CN -> VP ;


		-- verba_av_sig: [V av..1 Pn,,refl]
		-- rewritten as [V av,,Prep refl_Pron]
		-- e.g. 'klä av sig'

		verba_av_sig : V -> VP ;


		-- verba_av_sig.frigöra: [VP av..1 Pn,,refl]
		-- rewritten as [V av,,Prep refl_Pron]
		-- e.g. 'snacka av sig'

		verba_av_sig_frigöra : V -> VP ;


		-- verba_av_sig.transitiv: [V av..1 Pn,,refl (NP)]
		-- rewritten as [V av,,Prep refl_Pron NP] | [V av,,Prep refl_Pron]
		-- e.g. 'ta av sig skorna'

		verba_av_sig_transitiv_1 : V -> NP -> VP ;
		verba_av_sig_transitiv_2 : V -> VP ;


		-- verba_efter_sig.städa: [VP efter..1 Pn]
		-- rewritten as [V efter,,Prep Pron]
		-- e.g. ''

		verba_efter_sig_städa : V -> Pron -> VP ;


		-- verba_in_sig.ingå: [V in..1 Pn,,refl (själv..3)]
		-- rewritten as [V in,,Prep refl_Pron själv|empty,,N]
		-- e.g. 'De köpte in sig i företaget'

		verba_in_sig_ingå : V -> VP ;


		-- verba_in_sig.skydd: [V in..1 Pn,,refl]
		-- rewritten as [V in,,Prep refl_Pron]
		-- e.g. 'Hon tvålade in sig'

		verba_in_sig_skydd : V -> VP ;


		-- verba_lagom: [V,,imp lagom..1]
		-- rewritten as [V,,imp lagom,,Str]
		-- e.g. 'Skryt lagom, du!'

		verba_lagom : V -> VP ;


		-- verba_loss: NP [VP loss..1]
		-- rewritten as [V loss,,Prep]
		-- e.g. 'shoppa loss'

		verba_loss : V -> VP ;


		-- verba_ner_sig.minska: [V ner..1 Pn,,refl]
		-- rewritten as [V ner,,Prep refl_Pron]
		-- e.g. 'Han har lugnat ner sig'

		verba_ner_sig_minska : V -> VP ;


		-- verba_ner_sig.resultat: [V ner..1 Pn,,refl]
		-- rewritten as [V ner,,Prep refl_Pron]
		-- e.g. 'Han har dekat ner sig'

		verba_ner_sig_resultat : V -> VP ;


		-- verba_ner_sig.smuts: [V ner..1 Pn,,refl]
		-- rewritten as [V ner,,Prep refl_Pron]
		-- e.g. 'Han sölade ner sig'

		verba_ner_sig_smuts : V -> VP ;


		-- verba_ner_sig.sänka_rang: [V ner..1 Pn,,refl]
		-- rewritten as [V ner,,Prep refl_Pron]
		-- e.g. 'Byta ner sig från MC till moppe'

		verba_ner_sig_sänka_rang : V -> VP ;


		-- verba_om.reciprok: [V om..1 varandra..1]
		-- rewritten as [V om,,Prep varandra,,Adv]
		-- e.g. 'Vi ringer om varann hela tiden'

		verba_om_reciprok : V -> VP ;


		-- verba_pa.forts: [V på..4]
		-- rewritten as [V på,,Prep]
		-- e.g. 'Vi kämpar på'

		verba_pa_forts : V -> VP ;


		-- verba_skiten_ur_sig: [V "skiten"|"livet" ur..1 Pn,,refl]
		-- rewritten as [V theSg_Det skit|liv,,N ur,,Prep refl_Pron] | [V thePl_Det skit|liv,,N ur,,Prep refl_Pron]
		-- e.g. 'Inget slår att köra skiten ur sig. De jagar livet ur sig.'

		verba_skiten_ur_sig_1 : V -> VP ;
		verba_skiten_ur_sig_2 : V -> VP ;


		-- verba_som_en_X_verbar: NP,,1 [VP,,1 som..2 NP,,2 VP,,2]
		-- rewritten as [VP,,2,pres that_Subj NP,,2,indef VP,,2,pres]
		-- e.g. 'Det smakade som en stia luktar'

		verba_som_en_X_verbar : VP -> NP -> VP -> VP ;


		-- verba_så_det_verbar: NP [VP,,1 så..4 det..0 VP,,2]
		-- rewritten as [VP,,1 så,,Str it_Pron VP,,1]
		-- e.g. 'Hon bromsade så det skrek om däcken'

		verba_så_det_verbar : VP -> VP -> VP ;


		-- verba_till_sig.erhålla: [V till..1 Pn,,refl NP]
		-- rewritten as [V till,,Prep refl_Pron NP]
		-- e.g. 'tjata till sig en ny jacka'

		verba_till_sig_erhålla : V -> NP -> VP ;


		-- verba_till_sig.process: [V till..1 Pn,,refl]
		-- rewritten as [V till,,Prep refl_Pron]
		-- e.g. 'jäsa till sig'

		verba_till_sig_process : V -> VP ;


		-- verba_till_sig.process_agens: [V till..1 Pn,,refl]
		-- rewritten as [V till,,Prep refl_Pron]
		-- e.g. 'tuffa till sig'

		verba_till_sig_process_agens : V -> VP ;


		-- verba_till_sig.rörelse: [V till..1 Pn,,refl NP]
		-- rewritten as [V till,,Prep refl_Pron NP]
		-- e.g. 'kalla till sig eleverna'

		verba_till_sig_rörelse : V -> NP -> VP ;


		-- verba_upp_sig.alstra: [V upp..1 Pn,,refl]
		-- rewritten as [V upp,,Prep refl_Pron]
		-- e.g. 'stressa upp sig'

		verba_upp_sig_alstra : V -> VP ;


		-- verba_upp_sig.attityd: [V upp..1 Pn,,refl]
		-- rewritten as [V upp,,Prep refl_Pron]
		-- e.g. 'mopsa upp sig'

		verba_upp_sig_attityd : V -> VP ;


		-- verba_upp_sig.försköna: [V upp..1 Pn,,refl]
		-- rewritten as [V upp,,Prep refl_Pron]
		-- e.g. 'piffa upp sig'

		verba_upp_sig_försköna : V -> VP ;


		-- verba_upp_sig.höja_rang: [V upp..1 Pn,,refl]
		-- rewritten as [V upp,,Prep refl_Pron]
		-- e.g. 'seeda upp sig'

		verba_upp_sig_höja_rang : V -> VP ;


		-- verba_upp_sig.upplösa: [V upp..1 Pn,,refl]
		-- rewritten as [V upp,,Prep refl_Pron]
		-- e.g. 'luckra upp sig'

		verba_upp_sig_upplösa : V -> VP ;


		-- verba_ur_sig.prata: [V ur..1 Pn,,refl]
		-- rewritten as [V ur,,Prep refl_Pron]
		-- e.g. 'Vilken kommentar han slängde ur sig'

		verba_ur_sig_prata : V -> VP ;


		-- verba_ur_sig.produktion: [V ur..1 Pn,,refl NP]
		-- rewritten as [V ur,,Prep refl_Pron NP]
		-- e.g. 'De vräker ur sig 150 titlar om året'

		verba_ur_sig_produktion : V -> NP -> VP ;


		-- x-städa: [N|Adj + städa..1]V
		-- rewritten as [N + städa,,V] | [A + städa,,V]
		-- e.g. 'storstäda'

		x_städa_1 : N -> VP ;
		x_städa_2 : A -> VP ;


		--
		-- NP
		--

		-- Adj_men_dock: [AP men..1 dock..1 NP]
		-- rewritten as [AP men,,Conj dock,,Str NP]
		-- e.g. 'Det skapar ett litet men dock hopp om att förslaget kan dras tillbaka.'

		Adj_men_dock : AP -> NP -> NP ;


		-- Adj-attribut_efter: [Pn AP]
		-- rewritten as [Pron,,neutr,sg AP,,neutr,sg]
		-- e.g. 'något blått'

		Adj_attribut_efter : Pron -> AP -> NP ;


		-- apposition: [NP,,1 , NP,,2]
		-- rewritten as [NP,,1 , NP,,2]
		-- e.g. 'Ulf Olsson, kommunstyrelsens ordförande'

		apposition : NP -> NP -> NP ;


		-- container_comp: [N + N]N
		-- rewritten as [N + N]
		-- e.g. 'mjölkpaket'

		container_comp : N -> N -> NP ;


		-- curling-cx: [N + N]N
		-- rewritten as [N + N]
		-- e.g. 'curlingmamma'

		curling_cx : N -> N -> NP ;


		-- det_Adj_i_NP: ["det" AP i..2 NP,,def]
		-- rewritten as [det,,Det AP i,,Prep theSg_Det CN] | [det,,Det AP i,,Prep thePl_Det CN]
		-- e.g. 'det ljusa i situationen'

		det_Adj_i_NP_1 : AP -> CN -> NP ;
		det_Adj_i_NP_2 : AP -> CN -> NP ;


		-- det_Adj_i_S/InfP: ["det" AP i..2 att..1 VP,,inf|S,,sub]
		-- rewritten as [det,,Det AP i,,Prep VP,,inf] | [det,,Det AP i,,Prep SC,,sub]
		-- e.g. 'det geniala i att pizzeriorna tillhandahåller plastbestick'

		det_Adj_i_S_InfP_1 : AP -> VP -> NP ;
		det_Adj_i_S_InfP_2 : AP -> SC -> NP ;


		-- egennamn_den_adjektiv: [N,,prop den..1 Adj]
		-- rewritten as [PN den,,Al A]
		-- e.g. 'Ivan den förskräcklige'

		egennamn_den_adjektiv : PN -> A -> NP ;


		-- Egennamn_på_NP: [NP,,prop på..1 NP]
		-- rewritten as [PN på,,Prep PN]
		-- e.g. 'Bosse på gitarr och Stina på bas.'

		Egennamn_på_NP : PN -> PN -> NP ;


		-- en_NP_kort: [R,,G N,,indef kort..5]
		-- rewritten as [Num,,G aSg_Det N kort,,Str] | [Num,,G aPl_Det N kort,,Str] | [Num,,G N kort,,Str]
		-- e.g. 'en stol kort'

		en_NP_kort_1 : Num -> N -> NP ;
		en_NP_kort_2 : Num -> N -> NP ;
		en_NP_kort_3 : Num -> N -> NP ;


		-- en_tids_aktivitet: [Det NP,,gen NP,,indef]
		-- rewritten as [aSg_Det NP,,gen aSg_Det CN] | [aPl_Det NP,,gen aSg_Det CN] | [NP,,gen aSg_Det CN] | [aSg_Det NP,,gen aPl_Det CN] | [aPl_Det NP,,gen aPl_Det CN] | [NP,,gen aPl_Det CN] | [aSg_Det NP,,gen CN] | [aPl_Det NP,,gen CN] | [NP,,gen CN]
		-- e.g. 'en veckas semester'

		en_tids_aktivitet_1 : NP -> CN -> NP ;
		en_tids_aktivitet_2 : NP -> CN -> NP ;
		en_tids_aktivitet_3 : NP -> CN -> NP ;
		en_tids_aktivitet_4 : NP -> CN -> NP ;
		en_tids_aktivitet_5 : NP -> CN -> NP ;
		en_tids_aktivitet_6 : NP -> CN -> NP ;
		en_tids_aktivitet_7 : NP -> CN -> NP ;
		en_tids_aktivitet_8 : NP -> CN -> NP ;
		en_tids_aktivitet_9 : NP -> CN -> NP ;


		-- exklamativ.vilken: [vilken..1 NP]
		-- rewritten as [vilken,,Pron NP]
		-- e.g. 'vilket härligt väder!'

		exklamativ_vilken : NP -> NP ;


		-- Flerledad_fras_predikativ.själv: [själv..1 PcP|AP]
		-- rewritten as [själv,,N PcP,,pres] | [själv,,N AP]
		-- e.g. 'Stina, själv överraskad, tackade ja.'

		Flerledad_fras_predikativ_själv_1 : VP -> NP ;
		Flerledad_fras_predikativ_själv_2 : AP -> NP ;


		-- indefinit_nominalfras.generisk: [N,,indef]
		-- rewritten as [aSg_Det N] | [aPl_Det N] | [N]
		-- e.g. 'Bil är dyrt'

		indefinit_nominalfras_generisk_1 : N -> NP ;
		indefinit_nominalfras_generisk_2 : N -> NP ;
		indefinit_nominalfras_generisk_3 : N -> NP ;


		-- indefinit_nominalfras.genre_regelverk: [N,,indef]
		-- rewritten as [aSg_Det N] | [aPl_Det N] | [N]
		-- e.g. 'Den som tillfogar annan person kroppsskada'

		indefinit_nominalfras_genre_regelverk_1 : N -> NP ;
		indefinit_nominalfras_genre_regelverk_2 : N -> NP ;
		indefinit_nominalfras_genre_regelverk_3 : N -> NP ;


		-- indefinit_nominalfras.subjekt: [NP,,indef] VP
		-- rewritten as [aSg_Det CN] | [aPl_Det CN] | [CN]
		-- e.g. 'Bil är ett nödvändigt ont'

		indefinit_nominalfras_subjekt_1 : CN -> NP ;
		indefinit_nominalfras_subjekt_2 : CN -> NP ;
		indefinit_nominalfras_subjekt_3 : CN -> NP ;


		-- inte_vilken_NP_som_helst: [inte..1 vilken..1 NP som..3 helst]
		-- rewritten as [inte,,Neg vilken,,Pron NP that_Subj gärna,,Str]
		-- e.g. 'Svensson är inte vilken skojare som helst'

		inte_vilken_NP_som_helst : NP -> NP ;


		-- kalenderplacering_NP.dåtid: [förra..1 NP,,def]
		-- rewritten as [förra,,Pron theSg_Det CN] | [förra,,Pron thePl_Det CN]
		-- e.g. 'förra veckan'

		kalenderplacering_NP_dåtid_1 : CN -> NP ;
		kalenderplacering_NP_dåtid_2 : CN -> NP ;


		-- kalenderplacering_NP.framtid: [nästa..1 NP,,indef]
		-- rewritten as [nästa,,Pron aSg_Det CN] | [nästa,,Pron aPl_Det CN] | [nästa,,Pron CN]
		-- e.g. 'nästa år'

		kalenderplacering_NP_framtid_1 : CN -> NP ;
		kalenderplacering_NP_framtid_2 : CN -> NP ;
		kalenderplacering_NP_framtid_3 : CN -> NP ;


		-- Klockslag: [NP|R,,G i..2|över..1 (halv..2) NP|R,,G]
		-- rewritten as [NP i|över,,Prep halv|empty,,A NP] | [Num,,G i|över,,Prep halv|empty,,A NP] | [NP i|över,,Prep halv|empty,,A Num,,G] | [Num,,G i|över,,Prep halv|empty,,A Num,,G]
		-- e.g. 'Klockan är fem över halv tre.'

		Klockslag_1 : NP -> NP -> NP ;
		Klockslag_2 : Num -> NP -> NP ;
		Klockslag_3 : NP -> Num -> NP ;
		Klockslag_4 : Num -> Num -> NP ;


		-- kollektiviserande_genitiv: [N,,prop,gen]
		-- rewritten as [N,,prop,gen]
		-- e.g. 'Vi ska på fest hos Svenssons'

		kollektiviserande_genitiv : N -> NP ;


		-- lite_av_en_NP: [lite..2 av..1 Det NP,,sg,indef] | ["något" av..1 Det NP,,sg,indef]
		-- rewritten as [lite,,Pron av,,Prep Det,,sg,indef aSg_Det CN] | [lite,,Pron av,,Prep Det,,sg,indef CN] | [något,,Pron av,,Prep Det,,sg,indef aSg_Det CN] | [något,,Pron av,,Prep Det,,sg,indef CN]
		-- e.g. 'lite av en spjuver'

		lite_av_en_NP_1 : Det -> CN -> NP ;
		lite_av_en_NP_2 : Det -> CN -> NP ;
		lite_av_en_NP_3 : Det -> CN -> NP ;
		lite_av_en_NP_4 : Det -> CN -> NP ;


		-- multiplicering_dimension: [R,,G "gånger" R,,G ("gånger" R,,G) NP]
		-- rewritten as [Num,,G gånger,,Conj Num,,G gånger|empty,,Konj R,,G NP]
		-- e.g. 'två gånger tre centimeter'

		multiplicering_dimension : Num -> Num -> NP -> NP ;


		-- mycket_X_och_lite_Y: [mycket..1 N,,1 och..1 lite..1 N,,2]
		-- rewritten as [mycket,,A N,,1 and_Conj lite,,A N,,2]
		-- e.g. 'mycket snack och lite verkstad'

		mycket_X_och_lite_Y : N -> N -> NP ;


		-- nominal_bisats_som_attribut: [NP,,def S,,sub]
		-- rewritten as [theSg_Det CN SC,,sub] | [thePl_Det CN SC,,sub]
		-- e.g. 'den glada nyheten att norden nu har två länder som kan spela fotboll'

		nominal_bisats_som_attribut_1 : CN -> SC -> NP ;
		nominal_bisats_som_attribut_2 : CN -> SC -> NP ;


		-- NP_definit.possessiv: [[Pn,,poss|NP,,gen] N,,indef]
		-- rewritten as [Pron,,poss] | [NP,,gen]
		-- e.g. 'hennes bror'

		NP_definit_possessiv_1 : Pron -> NP ;
		NP_definit_possessiv_2 : NP -> NP ;


		-- NP_ensam: [NP ensam..1]
		-- rewritten as [NP ensam,,A]
		-- e.g. 'finansministern ensam  representerar en stor del av marknaden'

		NP_ensam : NP -> NP ;


		-- NP_ensam.predikativt_attribut: [NP ensam..1]
		-- rewritten as [NP ensam,,A]
		-- e.g. 'Stina ensam tar över'

		NP_ensam_predikativt_attribut : NP -> NP ;


		-- NP_för_NP: [NP,,= för..1 NP,,=]
		-- rewritten as [NP,,= för,,Prep]
		-- e.g. 'dag för dag'

		NP_för_NP : NP -> NP ;


		-- NP_i_genitiv.skalangivelse: [NP,,indef,gen NP]
		-- rewritten as [NP,,indef,gen NP]
		-- e.g. 'Tio meters höjd'

		NP_i_genitiv_skalangivelse : NP -> NP -> NP ;


		-- NP_i_genitiv.tidsangivelse: [NP,,indef,gen NP]
		-- rewritten as [NP,,indef,gen NP]
		-- e.g. 'tre  veckors semester.'

		NP_i_genitiv_tidsangivelse : NP -> NP -> NP ;


		-- NP_med_sina_NP: [NP,,1 med Pn,,poss NP,,2 (och NP,,3)]
		-- rewritten as [NP,,1 med,,Prep Pron,,poss NP,,2 och|empty,,Konj NP,,3]
		-- e.g. 'Alingsås med sina caféer'

		NP_med_sina_NP : NP -> Pron -> NP -> NP ;


		-- NP_som_AP: [lite..1 NP]
		-- rewritten as [lite,,Str NP]
		-- e.g. 'Det här låter lite sommar'

		NP_som_AP : NP -> NP ;


		-- om_inte.wh-sats: S_interrog. [om..3 inte..1 NP] | S_interrog. [om..3 inte..1 AP]
		-- rewritten as [if_Subj inte,,Neg NP] | [if_Subj inte,,Neg AP]
		-- e.g. 'vem passar bäst om inte Karin'

		om_inte_wh_sats_1 : NP -> NP ;
		om_inte_wh_sats_2 : AP -> NP ;


		-- Predikativt_attribut.particip: [NP Pc PP]
		-- rewritten as [NP Pc,,pres Adv]
		-- e.g. 'en diktsamling skriven av Munro'

		Predikativt_attribut_particip : NP -> V -> Adv -> NP ;


		-- proportion_per: [NP,,indef per..1 N,,sg,indef]
		-- rewritten as [aSg_Det CN per,,Prep aSg_Det N] | [aPl_Det CN per,,Prep aSg_Det N] | [CN per,,Prep aSg_Det N] | [aSg_Det CN per,,Prep N] | [aPl_Det CN per,,Prep N] | [CN per,,Prep N]
		-- e.g. '10 kr per kilo'

		proportion_per_1 : CN -> N -> NP ;
		proportion_per_2 : CN -> N -> NP ;
		proportion_per_3 : CN -> N -> NP ;
		proportion_per_4 : CN -> N -> NP ;
		proportion_per_5 : CN -> N -> NP ;
		proportion_per_6 : CN -> N -> NP ;


		-- samordning_grundtal.distributiv: [R,,G,= och..1 R,,G,=]
		-- rewritten as [Num,,G,= and_Conj]
		-- e.g. 'två och två'

		samordning_grundtal_distributiv : Num -> NP ;


		-- själva_NP:n: ["själva" NP,,def]
		-- rewritten as [själv,,Pron,,def theSg_Det CN] | [själv,,Pron,,def thePl_Det CN]
		-- e.g. 'själva taket'

		själva_NP_n_1 : CN -> NP ;
		själva_NP_n_2 : CN -> NP ;


		-- som_helst.neg: [Pn som..3 helst NP,,indef] | [inte..1 Pn som..3 helst NP,,indef]
		-- rewritten as [Pron as_CAdv helst,,Str aSg_Det CN] | [Pron as_CAdv helst,,Str aPl_Det CN] | [Pron as_CAdv helst,,Str CN] | [inte,,Neg Pron as_CAdv helst,,Str aSg_Det CN] | [inte,,Neg Pron as_CAdv helst,,Str aPl_Det CN] | [inte,,Neg Pron as_CAdv helst,,Str CN]
		-- e.g. 'inga som helst problem'

		som_helst_neg_1 : Pron -> CN -> NP ;
		som_helst_neg_2 : Pron -> CN -> NP ;
		som_helst_neg_3 : Pron -> CN -> NP ;
		som_helst_neg_4 : Pron -> CN -> NP ;
		som_helst_neg_5 : Pron -> CN -> NP ;
		som_helst_neg_6 : Pron -> CN -> NP ;


		-- som_NP: [som..2 NP,,indef]
		-- rewritten as [that_Subj aSg_Det CN] | [that_Subj aPl_Det CN] | [that_Subj CN]
		-- e.g. 'Jag hittade som små stenar'

		som_NP_1 : CN -> NP ;
		som_NP_2 : CN -> NP ;
		som_NP_3 : CN -> NP ;


		-- unikhet: [Det,,def enda..1 (N) S,,rel]
		-- rewritten as [theSg_Det enda,,Pron N SC,,rel] | [thePl_Det enda,,Pron N SC,,rel] | [theSg_Det enda,,Pron SC,,rel] | [thePl_Det enda,,Pron SC,,rel]
		-- e.g. 'Den enda som är odödlig'

		unikhet_1 : N -> SC -> NP ;
		unikhet_2 : N -> SC -> NP ;
		unikhet_3 : SC -> NP ;
		unikhet_4 : SC -> NP ;


		-- vad_som_attribut: [vad..1 NP,,indef] S
		-- rewritten as [vad,,Pron aSg_Det CN] | [vad,,Pron aPl_Det CN] | [vad,,Pron CN]
		-- e.g. 'vad kläder han hittade'

		vad_som_attribut_1 : CN -> NP ;
		vad_som_attribut_2 : CN -> NP ;
		vad_som_attribut_3 : CN -> NP ;


		-- vilken_NP_som_helst: [Pn NP som..3 "helst"]
		-- rewritten as [Pron NP that_Subj helst,,Str]
		-- e.g. 'vilket schampo som helst'

		vilken_NP_som_helst : Pron -> NP -> NP ;


		-- världens_alla_hörn: [NP,,def,gen "alla" hörn..1]
		-- rewritten as [NP,,def,gen all,,Pron,,pl hörn,,NP,,pl]
		-- e.g. 'världens alla hörn'

		världens_alla_hörn : NP -> NP ;


		-- x_som_x: [NP,,indef,= som..2 NP,,indef,=]
		-- rewritten as [NP,,indef,= that_Subj]
		-- e.g. 'bil som bil'

		x_som_x : NP -> NP ;


		--
		-- S
		--

		-- bara.desiderativ: [bara..2 S]
		-- rewritten as [bara,,Subj SC]
		-- e.g. 'Bara det inte regnar!'

		bara_desiderativ : SC -> SC ;


		-- det_står_ligger_eller_finns_en_NP_på_plats: ["det" V NP,,indef PP|AdvP]
		-- rewritten as [det,,Pron V aSg_Det CN Adv] | [det,,Pron V aPl_Det CN Adv] | [det,,Pron V CN Adv]
		-- e.g. 'det står en bil på gatan, det låg en plånbok på bordet, det finns mat hemma'

		det_står_ligger_eller_finns_en_NP_på_plats_1 : V -> CN -> Adv -> SC ;
		det_står_ligger_eller_finns_en_NP_på_plats_2 : V -> CN -> Adv -> SC ;
		det_står_ligger_eller_finns_en_NP_på_plats_3 : V -> CN -> Adv -> SC ;


		-- det_verbas.passiv: [Pn V,,pass]
		-- rewritten as [Pron V,,pass]
		-- e.g. 'det skämtas  och pratas i det lilla väntrummet'

		det_verbas_passiv : Pron -> V -> SC ;


		-- direktiv_huvudsats.konsekvens: [S,,imp och..1 S]
		-- rewritten as [SC,,imp and_Conj SC]
		-- e.g. 'Ge dem kärlek, och du får kärlek tillbaka.'

		direktiv_huvudsats_konsekvens : SC -> SC -> SC ;


		-- direktiv_sats.pseudosamordning: ["Ta" och..1 S,,imp]
		-- rewritten as [ta,,V,,imp and_Conj SC,,imp]
		-- e.g. 'Ta och  kika på det här'

		direktiv_sats_pseudosamordning : SC -> SC ;


		-- en_adjektivare_NP_neg-S/VP: [en..2 Adj,,komp NP S|VP]
		-- rewritten as [en,,Det A,,komp aSg_Det CN SC] | [en,,Det A,,komp aPl_Det CN SC] | [en,,Det A,,komp CN SC] | [en,,Det A,,komp aSg_Det CN VP] | [en,,Det A,,komp aPl_Det CN VP] | [en,,Det A,,komp CN VP]
		-- e.g. 'en tråkigare blogg får man leta efter'

		en_adjektivare_NP_neg_S_VP_1 : A -> CN -> SC -> SC ;
		en_adjektivare_NP_neg_S_VP_2 : A -> CN -> SC -> SC ;
		en_adjektivare_NP_neg_S_VP_3 : A -> CN -> SC -> SC ;
		en_adjektivare_NP_neg_S_VP_4 : A -> CN -> VP -> SC ;
		en_adjektivare_NP_neg_S_VP_5 : A -> CN -> VP -> SC ;
		en_adjektivare_NP_neg_S_VP_6 : A -> CN -> VP -> SC ;


		-- exklamativ.adv/pn: [Adv|Pn NP] (S) | [Adv|Pn S]
		-- rewritten as [Adv NP] | [Pron NP] | [Adv SC] | [Pron SC]
		-- e.g. 'Vilken snygg kjol!'

		exklamativ_adv_pn_1 : Adv -> NP -> SC ;
		exklamativ_adv_pn_2 : Pron -> NP -> SC ;
		exklamativ_adv_pn_3 : Adv -> SC -> SC ;
		exklamativ_adv_pn_4 : Pron -> SC -> SC ;


		-- för_varje_X_som_V: [för..2 varje..1|var..1 NP,,indef,sg som..3 VP]
		-- rewritten as [för,,Subj varje|var,,Pron NP,,indef,sg that_Subj VP]
		-- e.g. 'för varje år som går'

		för_varje_X_som_V : NP -> VP -> SC ;


		-- generaliserande_bisats.koncessiv: [Pn,,wh NP än..1 VP] S
		-- rewritten as [Pron,,wh NP än,,Str VP]
		-- e.g. 'vad ni än gör'

		generaliserande_bisats_koncessiv : Pron -> NP -> VP -> SC ;


		-- givet_att_X: [givet..1 att..2 S,,sub]
		-- rewritten as [givet,,Prep att,,Subj SC,,sub]
		-- e.g. 'Jag tror att vi kan sitta ute ikväll, givet att vädret inte försämras.'

		givet_att_X : SC -> SC ;


		-- Instruerande_passiv: [VP,,inf,pass AP|PcP|PP]
		-- rewritten as [VP,,inf,pass AP] | [VP,,inf,pass PcP,,pres] | [VP,,inf,pass Adv]
		-- e.g. 'Serveras kyld'

		Instruerande_passiv_1 : VP -> AP -> SC ;
		Instruerande_passiv_2 : VP -> VP -> SC ;
		Instruerande_passiv_3 : VP -> Adv -> SC ;


		-- kontrasterande_satsfogning: [medan..2 S,,sub,1 (så..4) S,,sub,2]
		-- rewritten as [medan,,Subj SC,,sub,1 så|empty,,Subj SC,,sub,2]
		-- e.g. 'Medan de gamla affischerna är bra, är de nya intressanta'

		kontrasterande_satsfogning : SC -> SC -> SC ;


		-- men_V_då: [men..1 VP,,imp då..1]
		-- rewritten as [men,,Subj VP,,imp då,,Str]
		-- e.g. 'Men sluta då!'

		men_V_då : VP -> SC ;


		-- NP_NP: [NP,,1 NP,,2]
		-- rewritten as [NP,,1 NP,,2]
		-- e.g. 'Min son en tjuv?'

		NP_NP : NP -> NP -> SC ;


		-- NP_PcP: [NP PcP|AP]
		-- rewritten as [NP PcP,,pres] | [NP AP]
		-- e.g. 'Rökning förbjuden'

		NP_PcP_1 : NP -> VP -> SC ;
		NP_PcP_2 : NP -> AP -> SC ;


		-- om.desiderativ: [om..2 S,,sub]
		-- rewritten as [if_Subj SC,,sub]
		-- e.g. 'Om vi ändå kunde åka på semester!'

		om_desiderativ : SC -> SC ;


		-- passiv: [NP VP,,pass (PP)]
		-- rewritten as [NP VP,,pass Adv] | [NP VP,,pass]
		-- e.g. 'maten åts upp'

		passiv_1 : NP -> VP -> Adv -> SC ;
		passiv_2 : NP -> VP -> SC ;


		-- pred_som: [AP|NP som..1 Pn vara..1|bli..1] S
		-- rewritten as [AP that_Subj Pron vara|bli,,V] | [NP that_Subj Pron vara|bli,,V]
		-- e.g. 'Smart som hon är'

		pred_som_1 : AP -> Pron -> SC ;
		pred_som_2 : NP -> Pron -> SC ;


		-- reaktiv_dubbel_aux: [V,,= V,,=] ... men..1 S
		-- rewritten as [V,,=]
		-- e.g. 'Kan kan jag väl'

		reaktiv_dubbel_aux : V -> SC ;


		-- som_vore: [som..2 "vore" NP AP|AdvP|NP]
		-- rewritten as [that_Subj vore,,V NP AP] | [that_Subj vore,,V NP Adv] | [that_Subj vore,,V NP NP]
		-- e.g. 'som vore den av is'

		som_vore_1 : NP -> AP -> SC ;
		som_vore_2 : NP -> Adv -> SC ;
		som_vore_3 : NP -> NP -> SC ;


		-- Tala_om_NP: [snacka..1|tala..1|prata..1 om..1 NP]
		-- rewritten as [snacka|prata|tala,,V,,imp om,,Prep NP]
		-- e.g. 'Snacka om otur!'

		Tala_om_NP : NP -> SC ;


		-- tänk_om.suppositiv: ["tänk" om..2|ifall..1 S,,sub]
		-- rewritten as [tänk,,V,,imp om|ifall,,Subj SC,,sub]
		-- e.g. 'Tänk om jag hade en miljon.'

		tänk_om_suppositiv : SC -> SC ;


		-- tänk.interjektion: ["Tänk" S]
		-- rewritten as [tänka,,V,,imp SC]
		-- e.g. 'Tänk, här sprang barnen och lekte.'

		tänk_interjektion : SC -> SC ;


		-- X_går_före_Y: [NP,,1 "går" före..1 NP,,2]
		-- rewritten as [NP,,1 går,,V,,pres före,,Prep NP,,2]
		-- e.g. 'jobb går före nöje'

		X_går_före_Y : NP -> NP -> SC ;


		-- X_så_länge_inte_Y.polaritet: (neg) [S,,1 så_länge..1 S,,2] | (neg) [så_länge..1 S,,2 S,,1]
		-- rewritten as [SC,,1 så_länge,,Subj SC,,2] | [så_länge,,Subj SC,,2 SC,,1]
		-- e.g. 'Det funkar så länge ingen anmäler.'

		X_så_länge_inte_Y_polaritet_1 : SC -> SC -> SC ;
		X_så_länge_inte_Y_polaritet_2 : SC -> SC -> SC ;


		-- x_är_ys_z: [NP,,1 vara..1 NP,,gen,2 NP,,3]
		-- rewritten as [NP,,1 vara,,V NP,,gen,2 NP,,3]
		-- e.g. 'Ronaldo är Portugals Zlatan'

		x_är_ys_z : NP -> NP -> NP -> SC ;


}
