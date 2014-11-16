concrete TargetsSwe of TargetsSweAbs = CatSwe ** open ParadigmsSwe, IrregSwe, StructuralSwe in {

	flags coding = utf8 ;

	lin

		glömma_V2_Abandonment = mkV2 (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") ;
		glömma_kvar_V2_Abandonment = mkV2 (partV (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") "kvar") ;
		lämna_V2_Abandonment = mkV2 (regV "lämnar") ;
		överge_V2_Abandonment = mkV2 (mkV "överge" "överger" "överge" "övergav" "övergett" "övergiven") ;
		lämna_kvar_V2_Abandonment = mkV2 (partV (regV "lämnar") "kvar") ;

		drälla_V_Abounding_with = mkV "dräller" ;
		myllra_V_Abounding_with = mkV "myllrar" ;
		svämma_över_V_Abounding_with = partV (mkV "svämma") "över" ;
		vimla_V_Abounding_with = mkV "vimlar" ;

		grädda_V_Absorb_heat = mkV "gräddar" ;
		koka_V_Absorb_heat = mkV "kokar" ;
		puttra_V_Absorb_heat = mkV "puttrar" ;
		sjuda_V_Absorb_heat = irregV "sjuda" "sjöd" "sjudit" ;
		steka_V_Absorb_heat = mkV "steker" ;

		misshandla_V2_Abusing = mkV2 (mkV "misshandlar") ;

		åstadkomma_V2_Accomplishment = mkV2 (mkV "åstadkomma" "åstadkom" "åstadkommit") ;
		genomföra_V2_Accomplishment = mkV2 (mkV "genomföra" "genomförde" "genomfört") ;

		mynta_V2_Achieving_first = mkV2 (mkV "myntar") ;
		uppfinna_V2_Achieving_first = mkV2 (irregV "uppfinna" "uppfann" "uppfunnit") ;
		upptäcka_VS_Achieving_first = mkVS (mkV "upptäcker") ;

		absolvera_V2_Activity_finish = mkV2 (mkV "absolverar") ;
		fullgöra_V2_Activity_finish = mkV2 (mkV "fullgöra" "fullgjorde" "fullgjort") ;

		fortfara_VV_Activity_ongoing = mkVV (mkV "fortfara" "fortfor" "fortfarit") ;
		fortsätta_VV_Activity_ongoing = mkVV (mkV "fortsätta" "fortsätter" "fortsätt" "fortsatte" "fortsatt" "fortsatt") ;

		frysa_V2_Activity_pause = mkV2 (irregV "frysa" "frös" "frusit") ;

		bereda_sig_V_Activity_prepare = reflV (mkV "bereda" "beredde" "berett") ;
		förbereda_V_Activity_prepare = mkV "förbereder" ;
		förbereda_sig_V_Activity_prepare = reflV (mkV "förbereder") ;

		återuppta_V2_Activity_resume = mkV2 (mkV "återuppta" "återupptar" "återuppta" "återupptog" "återupptagit" "återupptagen") ;

		börja_V_Activity_start = mkV "börjar" ;
		börja_V2_Activity_start = mkV2 (mkV "börjar") ;
		inleda_V2_Activity_start = mkV2 (mkV "inleda" "inledde" "inlett") ;
		begynna_VV_Activity_start = mkVV (mkV "begynna" "begynte" "begynt") ;
		börja_VV_Activity_start = mkVV (mkV "börjar") ;
		ge_sig_på_VV_Activity_start = mkVV (partV (reflV (irregV "ge" "gav" "givit")) "på") ;
		komma_VV_Activity_start = mkVV (irregV "komma" "kom" "kommit") ;
		uppta_V2_Activity_start = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		avsluta_V2_Activity_stop = mkV2 (mkV "avslutar") ;
		lägga_ner_V2_Activity_stop = mkV2 (partV (irregV "lägga" "lade" "lagt") "ner") ;
		stoppa_V2_Activity_stop = mkV2 (mkV "stoppar") ;
		ställa_in_V2_Activity_stop = mkV2 (partV (mkV "ställer") "in") ;
		inhibera_V2_Activity_stop = mkV2 (mkV "inhiberar") ;
		seponera_V2_Activity_stop = mkV2 (mkV "seponerar") ;
		sätta_V2_Activity_stop = mkV2 (irregV "sätta" "satte" "satt") ;

		lägga_ihop_V2_Adding_up = mkV2 (partV (irregV "lägga" "lade" "lagt") "ihop") ;
		räkna_ihop_V2_Adding_up = mkV2 (partV (regV "räkna") "ihop") ;
		räkna_samman_V2_Adding_up = mkV2 (partV (regV "räkna") "samman") ;

		anföra_V2_Adducing = mkV2 (mkV "anföra" "anförde" "anfört") ;
		åberopa_V2_Adducing = mkV2 (mkV "åberopar") ;
		andra_V2_Adducing = mkV2 (mkV "andra" "andrar" "andra" "androg" "andragit" "andragen") ;

		ställa_om_V_Adjusting = partV (mkV "ställer") "om" ;
		ställa_in_V2_Adjusting = mkV2 (partV (mkV "ställer") "in") ;
		kalibrera_V2_Adjusting = mkV2 (mkV "kalibrerar") ;

		anta_V2_Adopt_selection = mkV2 (mkV "anta" "antar" "anta" "antog" "antagit" "antagen") ;
		inta_V2_Adopt_selection = mkV2 (mkV "inta" "intar" "inta" "intog" "intagit" "intagen") ;
		omfamna_V2_Adopt_selection = mkV2 (mkV "omfamnar") ;
		adoptera_V2_Adopt_selection = mkV2 (mkV "adopterar") ;

		eftermogna_V_Aging = mkV "eftermognar" ;
		mogna_V_Aging = mkV "mognar" ;

		avböja_VV_Agree_or_refuse_to_act = mkVV (mkV "avböjer") ;
		vägra_VV_Agree_or_refuse_to_act = mkVV (mkV "vägra") ;

		bruka_V2_Agriculture = mkV2 (mkV "brukar") ;
		kultivera_V2_Agriculture = mkV2 (mkV "kultiverar") ;

		rikta_V2_Aiming = mkV2 (mkV "riktar") ;
		rikta_in_V2_Aiming = mkV2 (partV (mkV "riktar") "in") ;

		ackumulera_V2_Amassing = mkV2 (mkV "ackumulerar") ;
		hamstra_V2_Amassing = mkV2 (mkV "hamstrar") ;

		belöpa_sig_V_Amounting_to = reflV (mkV "belöpa" "belöpte" "belupit") ;

		baka_V2_Apply_heat = mkV2 (mkV "bakar") ;
		koka_V2_Apply_heat = mkV2 (mkV "kokar") ;
		koka_upp_V2_Apply_heat = mkV2 (partV (mkV "kokar") "upp") ;
		sjuda_V2_Apply_heat = mkV2 (irregV "sjuda" "sjöd" "sjudit") ;
		steka_V2_Apply_heat = mkV2 (mkV "steker") ;

		ackreditera_V2_Appointing = mkV2 (mkV "ackrediterar") ;

		arrangera_V2_Arranging = mkV2 (mkV "arrangera") ;
		lägga_upp_V2_Arranging = mkV2 (partV (irregV "lägga" "lade" "lagt") "upp") ;

		ankomma_V_Arriving = mkV "ankomma" "ankom" "ankommit" ;
		anlända_V_Arriving = mkV "anländer" ;
		komma_V_Arriving = irregV "komma" "kom" "kommit" ;
		landa_V_Arriving = mkV "landar" ;
		smita_in_V_Arriving = partV (irregV "smita" "smet" "smitit") "in" ;

		kongressa_V_Assemble = mkV "kongressar" ;
		sammanträda_V_Assemble = mkV "sammanträda" "sammanträdde" "sammanträtt" ;

		bedöma_V2_Assessing = mkV2 (mkV "bedömer") ;
		estimera_V2_Assessing = mkV2 (mkV "estimerar") ;
		evaluera_V2_Assessing = mkV2 (mkV "evaluerar") ;
		ranka_V2_Assessing = mkV2 (mkV "rankar") ;
		vikta_V2_Assessing = mkV2 (mkV "viktar") ;
		övervärdera_V2_Assessing = mkV2 (mkV "övervärderar") ;

		hjälpa_V2_Assistance = mkV2 (mkV "hjälper") ;
		stödja_V2_Assistance = mkV2 (mkV "stödjer") ;
		tjäna_V2_Assistance = mkV2 (mkV "tjänar") ;
		hjälpa_V2V_Assistance = mkV2V (mkV "hjälper") ;

		gottgöra_V2_Atonement = mkV2 (mkV "gottgöra" "gottgjorde" "gottgjort") ;
		sona_V2_Atonement = mkV2 (mkV "sonar") ;

		bränna_fast_V2_Attaching = mkV2 (partV (mkV "bränner") "fast") ;
		fästa_V2_Attaching = mkV2 (mkV "fästa" "fäster" "fäst" "fäste" "fäst" "fäst") ;
		förtöja_V2_Attaching = mkV2 (mkV "förtöja" "förtöjde" "förtöjt") ;
		haka_fast_V2_Attaching = mkV2 (partV (mkV "hakar") "fast") ;
		montera_V2_Attaching = mkV2 (mkV "monterar") ;
		säkra_V2_Attaching = mkV2 (mkV "säkrar") ;
		koppla_ihop_V2_Attaching = mkV2 (partV (mkV "kopplar") "ihop") ;
		slå_fast_V2_Attaching = mkV2 (partV (irregV "slå" "slog" "slagit") "fast") ;
		slå_på_V2_Attaching = mkV2 (partV (irregV "slå" "slog" "slagit") "på") ;

		angripa_V2_Attack = mkV2 (irregV "angripa" "angrep" "angripit") ;
		ge_sig_på_V2_Attack = mkV2 (partV (reflV (irregV "ge" "gav" "givit")) "på") ;

		anstränga_sig_V_Attempt = reflV (mkV "anstränger") ;
		bjuda_till_V_Attempt = partV (irregV "bjuda" "bjöd" "bjudit") "till" ;
		anstränga_sig_VV_Attempt = mkVV (reflV (mkV "anstränger")) ;
		försöka_VV_Attempt = mkVV (mkV "försöker") ;

		undvika_V2_Avoiding = mkV2 (mkV "undvika" "undvek" "undvikit") ;
		undgå_VV_Avoiding = mkVV (mkV "undgå" "undgick" "undgått") ;
		undvika_VV_Avoiding = mkVV (mkV "undvika" "undvek" "undvikit") ;

		veta_V_Awareness = mkV "veta" "vet" "vet" "visste" "vetat" "visst" ;
		ana_V2_Awareness = mkV2 (mkV "ana") ;
		känna_V2_Awareness = mkV2 (irregV "känna" "kände" "känt") ;
		tro_VS_Awareness = mkVS (mkV "tror") ;
		veta_VS_Awareness = mkVS (mkV "veta" "vet" "vet" "visste" "vetat" "visst") ;
		föreställa_sig_VV_Awareness = mkVV (reflV (mkV "föreställa")) ;

		-- No target for Be_in_agreement_on_assessment

		klå_V2_Beat_opponent = mkV2 (mkV "klå") ;
		slå_V2_Beat_opponent = mkV2 (irregV "slå" "slog" "slagit") ;
		slå_ner_V2_Beat_opponent = mkV2 (partV (irregV "slå" "slog" "slagit") "ner") ;
		slå_ut_V2_Beat_opponent = mkV2 (partV (irregV "slå" "slog" "slagit") "ut") ;
		spöa_V2_Beat_opponent = mkV2 (mkV "spöa") ;
		ta_V2_Beat_opponent = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;

		tiga_V_Become_silent = irregV "tiga" "teg" "tigit" ;

		göra_sig_V_Becoming = reflV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		utfalla_V_Becoming = mkV "utfalla" "utföll" "utfallit" ;

		ansluta_sig_V_Becoming_a_member = reflV (mkV "ansluta" "anslöt" "anslutit") ;
		inträda_V_Becoming_a_member = mkV "inträda" "inträdde" "inträtt" ;
		gå_in_i_V2_Becoming_a_member = mkV2 (partV (partV (irregV "gå" "gick" "gått") "in") "i") ;
		gå_med_i_V2_Becoming_a_member = mkV2 (partV (partV (irregV "gå" "gick" "gått") "med") "i") ;

		märka_V2_Becoming_aware = mkV2 (mkV "märker") ;
		varsna_V2_Becoming_aware = mkV2 (mkV "varsnar") ;
		upptäcka_VS_Becoming_aware = mkVS (mkV "upptäcker") ;

		soltorka_V_Becoming_dry = mkV "soltorkar" ;
		torka_V_Becoming_dry = regV "torka" ;
		torka_bort_V_Becoming_dry = partV (regV "torka") "bort" ;
		torka_in_V_Becoming_dry = partV (regV "torka") "in" ;
		torka_upp_V_Becoming_dry = partV (regV "torka") "upp" ;
		torka_ut_V_Becoming_dry = partV (regV "torka") "ut" ;

		dela_sig_V_Becoming_separated = reflV (mkV "delar") ;
		smula_sig_V_Becoming_separated = reflV (mkV "smular") ;

		dirigera_V2_Behind_the_scenes = mkV2 (mkV "dirigerar") ;
		filmatisera_V2_Behind_the_scenes = mkV2 (mkV "filmatiserar") ;
		komponera_V2_Behind_the_scenes = mkV2 (mkV "komponerar") ;
		producera_V2_Behind_the_scenes = mkV2 (mkV "producera") ;

		hålla_ihop_V_Being_attached = partV (irregV "hålla" "höll" "hållit") "ihop" ;

		föda_V2_Being_born = mkV2 (mkV "föda" "födde" "fött") ;

		jobba_V_Being_employed = mkV "jobbar" ;

		ligga_V_Being_located = irregV "ligga" "låg" "legat" ;
		sitta_V_Being_located = irregV "sitta" "satt" "suttit" ;
		stå_V_Being_located = irregV "stå" "stod" "stått" ;
		vara_V_Being_located = mkV "vara" ;

		belägra_V2_Besieging = mkV2 (mkV "belägrar") ;
		omringa_V2_Besieging = mkV2 (mkV "omringar") ;
		ringa_V2_Besieging = mkV2 (mkV "ringa") ;

		embarkera_V2_Board_vehicle = mkV2 (mkV "embarkerar") ;

		leda_V_Body_movement = mkV "leda" "ledde" "lett" ;
		röra_V_Body_movement = mkV "röra" "rörde" "rört" ;
		vicka_V_Body_movement = mkV "vickar" ;

		bravera_V_Bragging = mkV "braverar" ;
		skryta_V_Bragging = irregV "skryta" "skröt" "skrutit" ;

		inhalera_V2_Breathing = mkV2 (mkV "inhalerar") ;

		bära_upp_V2_Bringing = mkV2 (partV (irregV "bära" "bar" "burit") "upp") ;
		forsla_in_V2_Bringing = mkV2 (partV (mkV "forslar") "in") ;
		köra_V2_Bringing = mkV2 (mkV "köra" "körde" "kört") ;

		anlägga_V2_Building = mkV2 (mkV "anlägga" "anlade" "anlagt") ;
		bygga_V2_Building = mkV2 (mkV "bygger") ;
		bygga_om_V2_Building = mkV2 (partV (mkV "bygger") "om") ;
		göra_V2_Building = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		montera_V2_Building = mkV2 (mkV "monterar") ;
		sätta_ihop_V2_Building = mkV2 (partV (irregV "sätta" "satte" "satt") "ihop") ;
		timra_V2_Building = mkV2 (mkV "timrar") ;
		uppföra_V2_Building = mkV2 (mkV "uppföra" "uppförde" "uppfört") ;
		sätta_samman_V2_Building = mkV2 (partV (irregV "sätta" "satte" "satt") "samman") ;

		drulla_V_Bungling = mkV "drullar" ;
		ramla_runt_V_Bungling = partV (mkV "ramlar") "runt" ;
		schabbla_bort_V2_Bungling = mkV2 (partV (mkV "schabblar") "bort") ;

		föra_V2_Carry_goods = mkV2 (mkV "föra" "förde" "fört") ;
		saluföra_V2_Carry_goods = mkV2 (mkV "saluföra" "saluförde" "salufört") ;

		råka_illa_ut_V_Catastrophe = partV (partV (mkV "råka") "illa") "ut" ;
		råka_ut_V_Catastrophe = partV (mkV "råka") "ut" ;
		drabba_V2_Catastrophe = mkV2 (mkV "drabbar") ;

		kategorisera_V2_Categorization = mkV2 (mkV "kategoriserar") ;

		leda_V_Causation = mkV "leda" "ledde" "lett" ;
		väcka_V2_Causation = mkV2 (mkV "väcker") ;
		åsamka_V2_Causation = mkV2 (mkV "åsamkar") ;
		göra_V2_Causation = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		framkalla_V2_Causation = mkV2 (mkV "framkallar") ;
		förorsaka_V2_Causation = mkV2 (mkV "förorsaka") ;
		orsaka_V2_Causation = mkV2 (mkV "orsakar") ;
		utlösa_V2_Causation = mkV2 (mkV "utlöser") ;
		få_V2V_Causation = mkV2V (mkV "få" "måste" "få" "fick" "måst" "måst") ;
		komma_V2V_Causation = mkV2V (irregV "komma" "kom" "kommit") ;

		förändra_V2_Cause_change = mkV2 (mkV "förändras") ;
		göra_V2_Cause_change = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		omdana_V2_Cause_change = mkV2 (mkV "omdanar") ;
		ändra_V2_Cause_change = mkV2 (mkV "ändrar") ;
		omvandla_V2_Cause_change = mkV2 (mkV "omvandlar") ;
		omändra_V2_Cause_change = mkV2 (mkV "omändrar") ;

		lösa_V2_Cause_change_of_consistency = mkV2 (mkV "löser") ;
		reda_ut_V2_Cause_change_of_consistency = mkV2 (partV (mkV "reda" "redde" "rett") "ut") ;
		lösa_upp_V2_Cause_change_of_consistency = mkV2 (partV (mkV "löser") "upp") ;
		mjuka_upp_V2_Cause_change_of_consistency = mkV2 (partV (mkV "mjukar") "upp") ;

		frysa_V2_Cause_change_of_phase = mkV2 (irregV "frysa" "frös" "frusit") ;
		smälta_V2_Cause_change_of_phase = mkV2 (mkV "smälta" "smälter" "smält" "smälte" "smält" "smält") ;
		tina_V2_Cause_change_of_phase = mkV2 (mkV "tinar") ;
		tina_upp_V2_Cause_change_of_phase = mkV2 (partV (mkV "tinar") "upp") ;
		djupfrysa_V2_Cause_change_of_phase = mkV2 (mkV "djupfryser") ;
		förgasa_V2_Cause_change_of_phase = mkV2 (mkV "förgasar") ;
		förånga_V2_Cause_change_of_phase = mkV2 (mkV "förångar") ;

		befästa_V2_Cause_change_of_strength = mkV2 (mkV "befästa" "befäster" "befäst" "befäste" "befäst" "befäst") ;
		förstärka_V2_Cause_change_of_strength = mkV2 (mkV "förstärker") ;
		försvaga_V2_Cause_change_of_strength = mkV2 (mkV "försvaga") ;
		aggravera_V2_Cause_change_of_strength = mkV2 (mkV "aggraverar") ;

		missfirma_V2_Cause_emotion = mkV2 (mkV "missfirmar") ;
		smickra_V2_Cause_emotion = mkV2 (mkV "smickrar") ;
		smäda_V2_Cause_emotion = mkV2 (mkV "smäda") ;

		droppa_V2_Cause_fluidic_motion = mkV2 (mkV "droppar") ;
		skvalpa_ut_V2_Cause_fluidic_motion = mkV2 (partV (mkV "skvalpar") "ut") ;
		slå_V2_Cause_fluidic_motion = mkV2 (irregV "slå" "slog" "slagit") ;
		slå_på_V2_Cause_fluidic_motion = mkV2 (partV (irregV "slå" "slog" "slagit") "på") ;
		slå_ut_V2_Cause_fluidic_motion = mkV2 (partV (irregV "slå" "slog" "slagit") "ut") ;
		strila_V2_Cause_fluidic_motion = mkV2 (mkV "strilar") ;
		tappa_V2_Cause_fluidic_motion = mkV2 (mkV "tappa") ;

		hugga_V_Cause_harm = irregV "hugga" "högg" "huggit" ;
		daska_till_V2_Cause_harm = mkV2 (partV (mkV "daskar") "till") ;
		golva_V2_Cause_harm = mkV2 (mkV "golvar") ;
		hugga_V2_Cause_harm = mkV2 (irregV "hugga" "högg" "huggit") ;
		klå_upp_V2_Cause_harm = mkV2 (partV (mkV "klå") "upp") ;
		knäa_V2_Cause_harm = mkV2 (mkV "knäar") ;
		slå_V2_Cause_harm = mkV2 (irregV "slå" "slog" "slagit") ;
		slå_ner_V2_Cause_harm = mkV2 (partV (irregV "slå" "slog" "slagit") "ner") ;
		smocka_till_V2_Cause_harm = mkV2 (partV (mkV "smockar") "till") ;
		sparka_V2_Cause_harm = mkV2 (mkV "sparkar") ;
		spöa_V2_Cause_harm = mkV2 (mkV "spöa") ;
		spöa_upp_V2_Cause_harm = mkV2 (partV (mkV "spöa") "upp") ;
		slåss_V2_Cause_harm = mkV2 (mkV "slåss" "slåss" "slåss" "slogs" "slagits" "slagen") ;

		banka_V_Cause_impact = mkV "bankar" ;
		drämma_V2_Cause_impact = mkV2 (mkV "drämmer") ;
		slå_V2_Cause_impact = mkV2 (irregV "slå" "slog" "slagit") ;
		daska_till_V2_Cause_impact = mkV2 (partV (mkV "daskar") "till") ;
		drämma_till_V2_Cause_impact = mkV2 (partV (mkV "drämmer") "till") ;
		slå_ihop_V2_Cause_impact = mkV2 (partV (irregV "slå" "slog" "slagit") "ihop") ;
		köra_V2_Cause_impact = mkV2 (mkV "köra" "körde" "kört") ;

		röra_V_Cause_motion = mkV "röra" "rörde" "rört" ;
		toppa_V_Cause_motion = mkV "toppar" ;
		flytta_V2_Cause_motion = mkV2 (mkV "flyttar") ;
		skjuta_ut_V2_Cause_motion = mkV2 (partV (irregV "skjuta" "skjöt" "skjutit") "ut") ;
		släpa_V2_Cause_motion = mkV2 (mkV "släpar") ;
		bogsera_V2_Cause_motion = mkV2 (mkV "bogserar") ;
		fira_ner_V2_Cause_motion = mkV2 (partV (mkV "firar") "ner") ;
		kasta_V2_Cause_motion = mkV2 (regV "kasta") ;
		skjuta_iväg_V2_Cause_motion = mkV2 (partV (irregV "skjuta" "skjöt" "skjutit") "iväg") ;
		toppa_V2_Cause_motion = mkV2 (mkV "toppar") ;
		nicka_V2_Cause_motion = mkV2 (mkV "nickar") ;
		rulla_V2_Cause_motion = mkV2 (mkV "rullar") ;
		skjuta_V2_Cause_motion = mkV2 (irregV "skjuta" "skjöt" "skjutit") ;
		toppa_V3_Cause_motion = mkV3 (mkV "toppar") ;
		hala_V2_Cause_motion = mkV2 (mkV "halar") ;
		hissa_V2_Cause_motion = mkV2 (mkV "hissar") ;

		förena_V2_Cause_to_amalgamate = mkV2 (mkV "förenar") ;
		kombinera_V2_Cause_to_amalgamate = mkV2 (mkV "kombinerar") ;
		bunta_ihop_V2_Cause_to_amalgamate = mkV2 (partV (mkV "buntar") "ihop") ;

		föna_V2_Cause_to_be_dry = mkV2 (mkV "fönar") ;
		hässja_V2_Cause_to_be_dry = mkV2 (mkV "hässjar") ;
		torka_V2_Cause_to_be_dry = mkV2 (regV "torka") ;
		torktumla_V2_Cause_to_be_dry = mkV2 (mkV "torktumlar") ;
		ugnstorka_V2_Cause_to_be_dry = mkV2 (mkV "ugnstorkar") ;
		torka_ut_V2_Cause_to_be_dry = mkV2 (partV (regV "torka") "ut") ;
		avfukta_V2_Cause_to_be_dry = mkV2 (mkV "avfuktar") ;
		soltorka_V2_Cause_to_be_dry = mkV2 (mkV "soltorkar") ;
		torka_bort_V2_Cause_to_be_dry = mkV2 (partV (regV "torka") "bort") ;

		adjungera_V2_Cause_to_be_included = mkV2 (mkV "adjungerar") ;
		infoga_V2_Cause_to_be_included = mkV2 (mkV "infogar") ;
		tillfoga_V2_Cause_to_be_included = mkV2 (mkV "tillfogar") ;
		uppta_V2_Cause_to_be_included = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		skärpa_V2_Cause_to_be_sharp = mkV2 (mkV "skärper") ;
		vässa_V2_Cause_to_be_sharp = mkV2 (mkV "vässa") ;

		dränka_V2_Cause_to_be_wet = mkV2 (mkV "dränker") ;
		läska_V2_Cause_to_be_wet = mkV2 (mkV "läskar") ;
		bevattna_V2_Cause_to_be_wet = mkV2 (mkV "bevattnar") ;

		fortsätta_VV_Cause_to_continue = mkVV (mkV "fortsätta" "fortsätter" "fortsätt" "fortsatte" "fortsatt" "fortsatt") ;

		bryta_V2_Cause_to_end = mkV2 (irregV "bryta" "bröt" "brutit") ;
		fuska_bort_V2_Cause_to_end = mkV2 (partV (mkV "fuskar") "bort") ;
		arbeta_bort_V2_Cause_to_end = mkV2 (partV (mkV "arbetar") "bort") ;
		lyfta_V2_Cause_to_end = mkV2 (mkV "lyfta" "lyfter" "lyft" "lyfte" "lyft" "lyft") ;
		slå_upp_V2_Cause_to_end = mkV2 (partV (irregV "slå" "slog" "slagit") "upp") ;

		förlusta_V2_Cause_to_experience = mkV2 (mkV "förlustar") ;
		terrorisera_V2_Cause_to_experience = mkV2 (mkV "terroriserar") ;

		bryta_av_V2_Cause_to_fragment = mkV2 (partV (irregV "bryta" "bröt" "brutit") "av") ;
		paja_V2_Cause_to_fragment = mkV2 (mkV "pajar") ;
		slå_in_V2_Cause_to_fragment = mkV2 (partV (irregV "slå" "slog" "slagit") "in") ;
		slå_sönder_V2_Cause_to_fragment = mkV2 (partV (irregV "slå" "slog" "slagit") "sönder") ;

		spela_V2_Cause_to_make_noise = mkV2 (regV "spela") ;

		förbättra_V2_Cause_to_make_progress = mkV2 (mkV "förbättrar") ;
		förnya_V2_Cause_to_make_progress = mkV2 (mkV "förnya") ;
		modernisera_V2_Cause_to_make_progress = mkV2 (mkV "moderniserar") ;
		utveckla_V2_Cause_to_make_progress = mkV2 (mkV "utvecklar") ;

		skaka_V2_Cause_to_move_in_place = mkV2 (mkV "skakar") ;
		rotera_V2_Cause_to_move_in_place = mkV2 (mkV "roterar") ;

		förevisa_V2_Cause_to_perceive = mkV2 (mkV "förevisar") ;

		starta_om_V2_Cause_to_resume = mkV2 (partV (mkV "startar") "om") ;
		återuppliva_V2_Cause_to_resume = mkV2 (mkV "återuppliva") ;

		driva_fram_V2_Cause_to_start = mkV2 (partV (irregV "driva" "drev" "drivit") "fram") ;
		tända_V2_Cause_to_start = mkV2 (mkV "tänder") ;
		provocera_fram_V2_Cause_to_start = mkV2 (partV (mkV "provocerar") "fram") ;

		uppväcka_V2_Cause_to_wake = mkV2 (mkV "uppväcker") ;
		väcka_V2_Cause_to_wake = mkV2 (mkV "väcker") ;

		bortgå_V_Ceasing_to_be = mkV "bortgå" "bortgick" "bortgått" ;
		dö_bort_V_Ceasing_to_be = partV (irregV "dö" "dog" "dött") "bort" ;
		försvinna_V_Ceasing_to_be = irregV "försvinna" "försvann" "försvunnit" ;

		tvivla_V_Certainty = mkV "tvivlar" ;
		tro_VS_Certainty = mkVS (mkV "tror") ;

		böja_av_V_Change_direction = partV (mkV "böja" "böjde" "böjt") "av" ;
		slå_V_Change_direction = irregV "slå" "slog" "slagit" ;
		svänga_V_Change_direction = mkV "svänger" ;
		ta_V_Change_direction = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		ta_av_V_Change_direction = partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "av" ;
		vända_V_Change_direction = irregV "vända" "vände" "vänt" ;

		förkorta_V2_Change_event_duration = mkV2 (mkV "förkorta") ;
		förlänga_V2_Change_event_duration = mkV2 (mkV "förlänger") ;
		fördröja_V2_Change_event_duration = mkV2 (mkV "fördröja" "fördröjde" "fördröjt") ;

		skjuta_upp_V2_Change_event_time = mkV2 (partV (irregV "skjuta" "skjöt" "skjutit") "upp") ;
		försena_V2_Change_event_time = mkV2 (mkV "försenar") ;

		gelea_sig_V_Change_of_consistency = reflV (mkV "gelear") ;
		skära_sig_V_Change_of_consistency = reflV (mkV "skära" "skär" "skär" "skar" "skurit" "skuren") ;
		stelna_V_Change_of_consistency = mkV "stelnar" ;
		tjockna_V_Change_of_consistency = mkV "tjocknar" ;

		bottenfrysa_V_Change_of_phase = mkV "bottenfryser" ;
		evaporera_V_Change_of_phase = mkV "evaporerar" ;
		frysa_V_Change_of_phase = irregV "frysa" "frös" "frusit" ;
		frysa_till_V_Change_of_phase = partV (irregV "frysa" "frös" "frusit") "till" ;
		fördunsta_V_Change_of_phase = mkV "fördunstar" ;
		förfrysa_V_Change_of_phase = irregV "förfrysa" "förfrös" "förfrusit" ;
		kondensera_V_Change_of_phase = mkV "kondenserar" ;
		smälta_V_Change_of_phase = mkV "smälta" "smälter" "smält" "smälte" "smält" "smält" ;
		tillfrysa_V_Change_of_phase = mkV "tillfryser" ;
		tina_V_Change_of_phase = mkV "tinar" ;
		tina_upp_V_Change_of_phase = partV (mkV "tinar") "upp" ;

		knäppa_på_V2_Change_operational_state = mkV2 (partV (mkV "knäpper") "på") ;
		slå_på_V2_Change_operational_state = mkV2 (partV (irregV "slå" "slog" "slagit") "på") ;
		aktivera_V2_Change_operational_state = mkV2 (mkV "aktiverar") ;

		växla_V_Change_position_on_a_scale = mkV "växlar" ;

		luta_sig_V_Change_posture = reflV (mkV "lutar") ;
		resa_sig_V_Change_posture = reflV (mk2V "resa" "reste") ;
		sträcka_V_Change_posture = mkV "sträcker" ;
		sträcka_sig_V_Change_posture = reflV (mkV "sträcker") ;
		stå_upp_V_Change_posture = partV (irregV "stå" "stod" "stått") "upp" ;

		byta_V_Change_tool = mkV "byter" ;
		gå_över_V_Change_tool = partV (irregV "gå" "gick" "gått") "över" ;

		småprata_V_Chatting = mkV "småpratar" ;
		prata_V_Chatting = regV "prata" ;
		samtala_V_Chatting = mkV "samtalar" ;
		snacka_V_Chatting = mkV "snacka" ;

		handplocka_V2_Choosing = mkV2 (mkV "handplockar") ;
		se_ut_V2_Choosing = mkV2 (partV (irregV "se" "såg" "sett") "ut") ;
		selektera_V2_Choosing = mkV2 (mkV "selekterar") ;
		toppa_V2_Choosing = mkV2 (mkV "toppar") ;
		välja_V2_Choosing = mkV2 (mkV "välja" "valde" "valt") ;
		plocka_ut_V2_Choosing = mkV2 (partV (mkV "plockar") "ut") ;

		muta_in_V2_Claim_ownership = mkV2 (partV (mkV "mutar") "in") ;

		skalka_V2_Closure = mkV2 (mkV "skalkar") ;
		tillsluta_V2_Closure = mkV2 (irregV "tillsluta" "tillslöt" "tillslutit") ;
		fästa_ihop_V2_Closure = mkV2 (partV (mkV "fästa" "fäster" "fäst" "fäste" "fäst" "fäst") "ihop") ;
		försegla_V2_Closure = mkV2 (mkV "förseglar") ;
		korka_upp_V2_Closure = mkV2 (partV (mkV "korkar") "upp") ;

		reflektera_V_Cogitation = mkV "reflektera" ;
		tänka_V_Cogitation = mk2V "tänka" "tänkte" ;
		fråga_sig_VQ_Cogitation = mkVQ (reflV (regV "frågar")) ;
		tänka_över_VQ_Cogitation = mkVQ (partV (mk2V "tänka" "tänkte") "över") ;
		undra_VQ_Cogitation = mkVQ (regV "undra") ;
		tänka_VS_Cogitation = mkVS (mk2V "tänka" "tänkte") ;

		jobba_ihop_V_Collaboration = partV (mkV "jobbar") "ihop" ;
		kooperera_V_Collaboration = mkV "koopererar" ;
		samarbeta_V_Collaboration = mkV "samarbetar" ;
		samverka_V_Collaboration = mkV "samverkar" ;
		arbeta_ihop_V_Collaboration = partV (mkV "arbetar") "ihop" ;

		stöta_samman_V_Come_together = partV (mkV "stöter") "samman" ;

		-- No target for Coming_to_be

		bestämma_V2_Coming_to_believe = mkV2 (mkV "bestämmer") ;
		finna_VS_Coming_to_believe = mkVS (irregV "finna" "fann" "funnit") ;
		tippa_VS_Coming_to_believe = mkVS (mkV "tippar") ;
		lära_sig_VV_Coming_to_believe = mkVV (reflV (mkV "lära" "lär" "lär" "lärde" "lärt" "lärd")) ;

		designa_V2_Coming_up_with = mkV2 (mkV "designa") ;
		dikta_ihop_V2_Coming_up_with = mkV2 (partV (mkV "diktar") "ihop") ;
		kläcka_V2_Coming_up_with = mkV2 (mkV "kläcka") ;
		upprätta_V2_Coming_up_with = mkV2 (mkV "upprättar") ;

		fynda_V2_Commerce_buy = mkV2 (mkV "fyndar") ;
		handla_V2_Commerce_buy = mkV2 (mkV "handlar") ;
		köpa_V2_Commerce_buy = mkV2 (mk2V "köpa" "köpte") ;

		kränga_av_V_Commerce_sell = partV (mkV "kränger") "av" ;
		saluföra_V2_Commerce_sell = mkV2 (mkV "saluföra" "saluförde" "salufört") ;
		sälja_V2_Commerce_sell = mkV2 (irregV "sälja" "sålde" "sålt") ;
		avyttra_V2_Commerce_sell = mkV2 (mkV "avyttrar") ;

		svära_sig_V_Commitment = reflV (mkV "svära" "svor" "svurit") ;
		svära_VS_Commitment = mkVS (mkV "svära" "svor" "svurit") ;
		utfästa_sig_VV_Commitment = mkVV (reflV (mkV "utfästa" "utfäster" "utfäst" "utfäste" "utfäst" "utfäst")) ;

		föröva_V2_Committing_crime = mkV2 (mkV "förövar") ;

		adressera_V2_Communication = mkV2 (mkV "adresserar") ;
		delge_V2_Communication = mkV2 (mkV "delge" "delger" "delge" "delgav" "delgett" "delgiven") ;
		meddela_V2_Communication = mkV2 (mkV "meddelar") ;
		meddela_VS_Communication = mkVS (mkV "meddelar") ;

		babbla_V_Communication_manner = mkV "babblar" ;
		bryta_V_Communication_manner = irregV "bryta" "bröt" "brutit" ;
		pladdra_V_Communication_manner = mkV "pladdrar" ;
		sjunga_V_Communication_manner = irregV "sjunga" "sjöng" "sjungit" ;
		stamma_V_Communication_manner = mkV "stammar" ;
		artikulera_V2_Communication_manner = mkV2 (mkV "artikulerar") ;
		sjunga_V2_Communication_manner = mkV2 (irregV "sjunga" "sjöng" "sjungit") ;

		faxa_V_Communication_means = mkV "faxar" ;
		messa_V_Communication_means = mkV "messar" ;
		ringa_V_Communication_means = mkV "ringa" ;
		faxa_V2_Communication_means = mkV2 (mkV "faxar") ;

		skrika_VS_Communication_noise = mkVS (irregV "skrika" "skrek" "skrikit") ;

		svara_V_Communication_response = regV "svarar" ;
		replikera_VS_Communication_response = mkVS (mkV "replikerar") ;
		svara_VS_Communication_response = mkVS (regV "svarar") ;

		förvandla_V2_Commutation = mkV2 (mkV "förvandlar") ;
		omvandla_V2_Commutation = mkV2 (mkV "omvandlar") ;

		passa_V_Compatibility = mkV "passar" ;
		passa_ihop_V_Compatibility = partV (mkV "passar") "ihop" ;
		matcha_V2_Compatibility = mkV2 (mkV "matchar") ;

		tävla_V_Competition = mkV "tävla" ;
		konkurrera_V_Competition = mkV "konkurrerar" ;

		klaga_V_Complaining = mkV "klagar" ;
		gnöla_V_Complaining = mkV "gnölar" ;

		hålla_sig_V_Compliance = reflV (irregV "hålla" "höll" "hållit") ;
		följa_V2_Compliance = mkV2 (mkV "följa" "följde" "följt") ;
		överträda_V2_Compliance = mkV2 (mkV "överträda" "överträdde" "överträtt") ;

		uppföra_sig_V_Conduct = reflV (mkV "uppföra" "uppförde" "uppfört") ;
		vara_V_Conduct = mkV "vara" ;

		bemöta_V2_Confronting_problem = mkV2 (mkV "bemöter") ;
		konfrontera_V2_Confronting_problem = mkV2 (mkV "konfronterar") ;
		stå_inför_V2_Confronting_problem = mkV2 (partV (irregV "stå" "stod" "stått") "inför") ;
		ta_upp_V2_Confronting_problem = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "upp") ;

		falla_V_Conquering = irregV "falla" "föll" "fallit" ;
		annektera_V2_Conquering = mkV2 (mkV "annekterar") ;
		besätta_V2_Conquering = mkV2 (mkV "besätta" "besätter" "besätt" "besatte" "besatt" "besatt") ;
		erövra_V2_Conquering = mkV2 (mkV "erövrar") ;

		kontakta_V2_Contacting = mkV2 (mkV "kontaktar") ;

		innehålla_V2_Containing = mkV2 (mkV "innehålla" "innehöll" "innehållit") ;
		rymma_V2_Containing = mkV2 (mkV "rymmer") ;

		komma_an_V_Contingency = partV (irregV "komma" "kom" "kommit") "an" ;

		-- No target for Contrition

		accentuera_V2_Convey_importance = mkV2 (mkV "accentuerar") ;
		poängtera_V2_Convey_importance = mkV2 (mkV "poängterar") ;
		framhålla_V2_Convey_importance = mkV2 (mkV "framhålla" "framhöll" "framhållit") ;
		framhålla_VS_Convey_importance = mkVS (mkV "framhålla" "framhöll" "framhållit") ;
		poängtera_VS_Convey_importance = mkVS (mkV "poängterar") ;
		understryka_VS_Convey_importance = mkVS (mkV "understryka" "underströk" "understrukit") ;
		understryka_V2_Convey_importance = mkV2 (mkV "understryka" "underströk" "understrukit") ;

		baka_V2_Cooking_creation = mkV2 (mkV "bakar") ;
		göra_V2_Cooking_creation = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		laga_V2_Cooking_creation = mkV2 (mkV "laga") ;
		laga_till_V2_Cooking_creation = mkV2 (partV (mkV "laga") "till") ;
		tillreda_V2_Cooking_creation = mkV2 (mkV "tillreda" "tillredde" "tillrett") ;

		korrodera_V_Corroding = mkV "korroderar" ;
		rosta_V_Corroding = mkV "rostar" ;

		förfölja_V2_Cotheme = mkV2 (mkV "förfölja" "förföljde" "förföljt") ;
		guida_V2_Cotheme = mkV2 (mkV "guidar") ;
		lotsa_V2_Cotheme = mkV2 (mkV "lotsar") ;
		leda_V2_Cotheme = mkV2 (mkV "leda" "ledde" "lett") ;
		eskortera_V2_Cotheme = mkV2 (mkV "eskorterar") ;

		korsförhöra_V2_Court_examination = mkV2 (mkV "korsförhöra" "korsförhörde" "korsförhört") ;

		dreja_V2_Create_physical_artwork = mkV2 (mkV "drejar") ;
		måla_V2_Create_physical_artwork = mkV2 (regV "måla") ;
		rita_V2_Create_physical_artwork = mkV2 (mkV "ritar") ;
		teckna_V2_Create_physical_artwork = mkV2 (mkV "tecknar") ;

		avbilda_V2_Create_representation = mkV2 (mkV "avbildar") ;
		måla_av_V2_Create_representation = mkV2 (partV (regV "måla") "av") ;
		porträttera_V2_Create_representation = mkV2 (mkV "porträtterar") ;

		frambringa_V2_Creating = mkV2 (mkV "frambringar") ;
		ge_V2_Creating = mkV2 (irregV "ge" "gav" "givit") ;
		skapa_V2_Creating = mkV2 (mkV "skapa") ;
		sätta_ihop_V2_Creating = mkV2 (partV (irregV "sätta" "satte" "satt") "ihop") ;

		undersöka_V2_Criminal_investigation = mkV2 (mkV "undersöker") ;
		utreda_V2_Criminal_investigation = mkV2 (mkV "utreda" "utredde" "utrett") ;

		hugga_V2_Cutting = mkV2 (irregV "hugga" "högg" "huggit") ;
		klippa_ner_V2_Cutting = mkV2 (partV (mkV "klipper") "ner") ;
		sönderdela_V2_Cutting = mkV2 (mkV "sönderdelar") ;
		toppa_V2_Cutting = mkV2 (mkV "toppar") ;

		vandalisera_V2_Damaging = mkV2 (mkV "vandaliserar") ;

		våga_sig_på_V2_Daring = mkV2 (partV (reflV (mkV "vågar")) "på") ;
		våga_sig_på_VV_Daring = mkVV (partV (reflV (mkV "vågar")) "på") ;

		avsomna_V_Death = mkV "avsomnar" ;
		dö_V_Death = irregV "dö" "dog" "dött" ;
		dö_ut_V_Death = partV (irregV "dö" "dog" "dött") "ut" ;
		gå_bort_V_Death = partV (irregV "gå" "gick" "gått") "bort" ;
		stryka_med_V_Death = partV (mkV "stryka" "strök" "strukit") "med" ;

		bestämma_VV_Deciding = mkVV (mkV "bestämmer") ;

		spänna_V_Delimitation_of_diversity = mkV "spänna" "spände" "spänt" ;

		leverera_V2_Delivery = mkV2 (mkV "levererar") ;
		distribuera_V2_Delivery = mkV2 (mkV "distribuerar") ;

		förbjuda_V2V_Deny_permission = mkV2V (irregV "förbjuda" "förbjöd" "förbjudit") ;

		lämna_V2_Departing = mkV2 (regV "lämnar") ;

		förtjäna_V2_Deserving = mkV2 (mkV "förtjänar") ;

		längta_V_Desiring = mkV "längtar" ;
		känna_för_V2_Desiring = mkV2 (partV (irregV "känna" "kände" "känt") "för") ;
		känna_för_VV_Desiring = mkVV (partV (irregV "känna" "kände" "känt") "för") ;
		vilja_VV_Desiring = mkVV (mkV "vilja" "vill" "vilj" "ville" "velat" "velad") ;

		förinta_V2_Destroying = mkV2 (mkV "förinta") ;
		tillintetgöra_V2_Destroying = mkV2 (mkV "tillintetgöra" "tillintetgjorde" "tillintetgjort") ;

		kapa_av_V2_Detaching = mkV2 (partV (mkV "kapar") "av") ;
		lösgöra_V2_Detaching = mkV2 (mkV "lösgöra" "lösgjorde" "lösgjort") ;
		kapa_V2_Detaching = mkV2 (mkV "kapar") ;

		häkta_V2_Detaining = mkV2 (mkV "häktar") ;

		urskilja_V2_Differentiation = mkV2 (mkV "urskilja" "urskilde" "urskilt") ;
		skilja_åt_V2_Differentiation = mkV2 (partV (mkV "skilja" "skilde" "skilt") "åt") ;

		beströ_V2_Dispersal = mkV2 (mkV "beströr") ;
		sprida_ut_V2_Dispersal = mkV2 (partV (irregV "sprida" "spred" "spridit") "ut") ;

		sidsteppa_V2_Dodging = mkV2 (mkV "sidsteppar") ;

		dominera_V2_Dominate_competitor = mkV2 (mkV "dominerar") ;

		dominera_V2_Dominate_situation = mkV2 (mkV "dominerar") ;

		klä_om_V_Dressing = partV (mkV "klä") "om" ;
		klä_på_sig_V_Dressing = reflV (partV (mkV "klä") "på") ;
		klä_sig_V_Dressing = reflV (mkV "klä") ;
		kostymera_sig_V_Dressing = reflV (mkV "kostymerar") ;
		skruda_sig_V_Dressing = reflV (mkV "skrudar") ;
		sätta_på_sig_V2_Dressing = mkV2 (reflV (partV (irregV "sätta" "satte" "satt") "på")) ;
		ta_på_sig_V2_Dressing = mkV2 (reflV (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "på")) ;

		smita_in_V_Drop_in_on = partV (irregV "smita" "smet" "smitit") "in" ;

		dippa_V2_Dunking = mkV2 (mkV "dippar") ;

		tjäna_V_Earnings_and_losses = mkV "tjänar" ;
		förlora_V2_Earnings_and_losses = mkV2 (regV "förlora") ;
		göra_V2_Earnings_and_losses = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		tjäna_V2_Earnings_and_losses = mkV2 (mkV "tjänar") ;

		avskärma_V_Eclipse = mkV "avskärmar" ;
		gömma_sig_V_Eclipse = reflV (mkV "gömma") ;
		blockera_V2_Eclipse = mkV2 (mkV "blockerar") ;
		skymma_V2_Eclipse = mkV2 (mkV "skymmer") ;
		förmörka_V2_Eclipse = mkV2 (mkV "förmörkar") ;

		studera_V_Education_teaching = mkV "studera" ;
		lära_upp_V2_Education_teaching = mkV2 (partV (mkV "lära" "lär" "lär" "lärde" "lärt" "lärd") "upp") ;

		gäcka_V2_Elusive_goal = mkV2 (mkV "gäcka") ;

		komma_V_Emanating = irregV "komma" "kom" "kommit" ;
		ryka_V_Emanating = mkV "ryker" ;
		stråla_V_Emanating = mkV "strålar" ;

		ge_ifrån_sig_V2_Emitting = mkV2 (reflV (partV (irregV "ge" "gav" "givit") "ifrån")) ;
		utstråla_V2_Emitting = mkV2 (mkV "utstrålar") ;
		utsöndra_V2_Emitting = mkV2 (mkV "utsöndrar") ;

		bekymra_sig_V_Emotion_active = reflV (mkV "bekymrar") ;
		oroa_sig_V_Emotion_active = reflV (mkV "oroa") ;

		koka_V_Emotion_heat = mkV "kokar" ;
		sjuda_V_Emotion_heat = irregV "sjuda" "sjöd" "sjudit" ;

		glädja_sig_V_Emotions_of_mental_activity = reflV (mkV "glädja" "gladde" "glatt") ;
		njuta_V_Emotions_of_mental_activity = irregV "njuta" "njöt" "njutit" ;

		anställa_V2_Employing = mkV2 (mkV "anställer") ;

		frosta_V_Emptying = mkV "frostar" ;
		avlusa_V2_Emptying = mkV2 (mkV "avlusar") ;
		duka_av_V2_Emptying = mkV2 (partV (mkV "dukar") "av") ;
		tömma_V2_Emptying = mkV2 (mkV "tömmer") ;
		ösa_V2_Emptying = mkV2 (mkV "öser") ;
		frosta_V2_Emptying = mkV2 (mkV "frostar") ;
		kalhugga_V2_Emptying = mkV2 (mkV "kalhugga" "kalhögg" "kalhuggit") ;

		formulera_sig_V_Encoding = reflV (mkV "formulerar") ;
		uttrycka_V_Encoding = mkV "uttrycker" ;
		formulera_V2_Encoding = mkV2 (mkV "formulerar") ;

		riskera_V2_Endangering = mkV2 (mkV "riskerar") ;
		vedervåga_V2_Endangering = mkV2 (mkV "vedervågar") ;

		genomdriva_V2_Enforcing = mkV2 (irregV "genomdriva" "genomdrev" "genomdrivit") ;
		genomföra_V2_Enforcing = mkV2 (mkV "genomföra" "genomförde" "genomfört") ;
		tvinga_fram_V2_Enforcing = mkV2 (partV (irregV "tvinga" "tvang" "tvungit") "fram") ;

		förklara_sig_V_Entering_of_plea = reflV (mkV "förklarar") ;

		rymma_V_Escaping = mkV "rymmer" ;

		hålla_för_sannolikt_VS_Estimating = mkVS (partV (partV (irregV "hålla" "höll" "hållit") "för") "sannolikt") ;

		komma_undan_V_Evading = partV (irregV "komma" "kom" "kommit") "undan" ;
		gäcka_V2_Evading = mkV2 (mkV "gäcka") ;
		hålla_sig_undan_V2_Evading = mkV2 (partV (reflV (irregV "hålla" "höll" "hållit")) "undan") ;
		komma_undan_V2_Evading = mkV2 (partV (irregV "komma" "kom" "kommit") "undan") ;
		undkomma_V2_Evading = mkV2 (mkV "undkomma" "undkom" "undkommit") ;

		gå_upp_V_Evaluative_comparison = partV (irregV "gå" "gick" "gått") "upp" ;
		mäta_sig_V_Evaluative_comparison = reflV (mkV "mäter") ;

		gå_V_Event = irregV "gå" "gick" "gått" ;
		gå_fram_V_Event = partV (irregV "gå" "gick" "gått") "fram" ;
		slå_in_V_Event = partV (irregV "slå" "slog" "slagit") "in" ;
		stå_V_Event = irregV "stå" "stod" "stått" ;
		inträffa_V2_Event = mkV2 (mkV "inträffa") ;

		bestyrka_V2_Evidence = mkV2 (mkV "bestyrker") ;
		påvisa_V2_Evidence = mkV2 (mkV "påvisar") ;
		styrka_V2_Evidence = mkV2 (mkV "styrker") ;
		bekräfta_VQ_Evidence = mkVQ (mkV "bekräfta") ;
		visa_VQ_Evidence = mkVQ (mkV "visar") ;
		visa_VS_Evidence = mkVS (mkV "visar") ;

		påminna_V2_Evoking = mkV2 (mkV "påminna" "påminde" "påmint") ;

		byta_V2_Exchange = mkV2 (mkV "byter") ;

		exkommunicera_V2_Exclude_member = mkV2 (mkV "exkommunicerar") ;

		spy_V2_Excreting = mkV2 (mk2V "spy" "spydde") ;

		genomföra_V2_Execute_plan = mkV2 (mkV "genomföra" "genomförde" "genomfört") ;
		implementera_V2_Execute_plan = mkV2 (mkV "implementera") ;

		avrätta_V2_Execution = mkV2 (mkV "avrättar") ;
		hänga_V2_Execution = mkV2 (mkV "hänger") ;

		existera_V_Existence = mkV "existera" ;

		ana_VQ_Expectation = mkVQ (mkV "ana") ;
		förutse_VS_Expectation = mkVS (mkV "förutse" "förutsåg" "förutsett") ;

		stå_V_Expensiveness = irregV "stå" "stod" "stått" ;

		bryta_V2_Experience_bodily_harm = mkV2 (irregV "bryta" "bröt" "brutit") ;
		skada_V2_Experience_bodily_harm = mkV2 (mkV "skadar") ;

		avguda_V2_Experiencer_focus = mkV2 (mkV "avgudar") ;
		älska_V2_Experiencer_focus = mkV2 (regV "älska") ;

		förblinda_V_Experiencer_obj = mkV "förblinda" ;
		lena_V_Experiencer_obj = mkV "lenar" ;
		slå_an_V_Experiencer_obj = partV (irregV "slå" "slog" "slagit") "an" ;
		tillintetgöra_V_Experiencer_obj = mkV "tillintetgöra" "tillintetgjorde" "tillintetgjort" ;
		drabba_V2_Experiencer_obj = mkV2 (mkV "drabbar") ;
		egga_upp_V2_Experiencer_obj = mkV2 (partV (mkV "eggar") "upp") ;
		fånga_V2_Experiencer_obj = mkV2 (irregV "fånga" "fäng" "fångit") ;
		förgöra_V2_Experiencer_obj = mkV2 (mkV "förgöra" "förgjorde" "förgjort") ;
		golva_V2_Experiencer_obj = mkV2 (mkV "golvar") ;
		hetsa_upp_V2_Experiencer_obj = mkV2 (partV (mkV "hetsar") "upp") ;
		irritera_V2_Experiencer_obj = mkV2 (mkV "irriterar") ;
		jaga_upp_V2_Experiencer_obj = mkV2 (partV (regV "jaga") "upp") ;
		kittla_V2_Experiencer_obj = mkV2 (mkV "kittlar") ;
		lamslå_V2_Experiencer_obj = mkV2 (mkV "lamslå" "lamslog" "lamslagit") ;
		lugna_V2_Experiencer_obj = mkV2 (mkV "lugnar") ;
		plåga_V2_Experiencer_obj = mkV2 (mkV "plågar") ;
		rubba_V2_Experiencer_obj = mkV2 (mkV "rubbar") ;
		röra_V2_Experiencer_obj = mkV2 (mkV "röra" "rörde" "rört") ;
		skaka_V2_Experiencer_obj = mkV2 (mkV "skakar") ;
		slå_ner_V2_Experiencer_obj = mkV2 (partV (irregV "slå" "slog" "slagit") "ner") ;
		stilla_V2_Experiencer_obj = mkV2 (mkV "stillar") ;
		reta_V2S_Experiencer_obj = mkV2S (mkV "reta") ;
		egga_V2_Experiencer_obj = mkV2 (mkV "eggar") ;
		frappera_VS_Experiencer_obj = mkVS (mkV "frapperar") ;

		förklara_VQ_Explaining_the_facts = mkVQ (mkV "förklarar") ;
		reda_ut_VQ_Explaining_the_facts = mkVQ (partV (mkV "reda" "redde" "rett") "ut") ;

		utskeppa_V2_Exporting = mkV2 (mkV "utskeppar") ;
		exportera_V2_Exporting = mkV2 (mkV "exporterar") ;

		lufta_V2_Expressing_publicly = mkV2 (mkV "luftar") ;
		ventilera_V2_Expressing_publicly = mkV2 (mkV "ventilerar") ;

		utlämna_V2_Extradition = mkV2 (mkV "utlämna") ;

		känna_V2_Familiarity = mkV2 (irregV "känna" "kände" "känt") ;
		känna_till_V2_Familiarity = mkV2 (partV (irregV "känna" "kände" "känt") "till") ;

		känna_sig_V_Feeling = reflV (irregV "känna" "kände" "känt") ;
		uppleva_V2_Feeling = mkV2 (mkV "upplever") ;

		simulera_V2_Feigning = mkV2 (mkV "simulerar") ;

		fylla_V2_Filling = mkV2 (mkV "fyller") ;
		slå_in_V2_Filling = mkV2 (partV (irregV "slå" "slog" "slagit") "in") ;
		proppa_V2_Filling = mkV2 (mkV "proppa") ;
		stryka_V2_Filling = mkV2 (mkV "stryka" "strök" "strukit") ;

		leda_V2_Finish_competition = mkV2 (mkV "leda" "ledde" "lett") ;
		vinna_V2_Finish_competition = mkV2 (irregV "vinna" "vann" "vunnit") ;

		förlora_V_Finish_game = regV "förlora" ;
		vinna_V_Finish_game = irregV "vinna" "vann" "vunnit" ;

		friställa_V2_Firing = mkV2 (mkV "friställer") ;
		säga_upp_V2_Firing = mkV2 (partV (irregV "säga" "sade" "sagt") "upp") ;

		skena_V_Fleeing = mkV "skenar" ;
		smita_iväg_V_Fleeing = partV (irregV "smita" "smet" "smitit") "iväg" ;
		fly_V_Fleeing = mkV "flyr" ;

		sippra_ur_V_Fluidic_motion = partV (mkV "sipprar") "ur" ;
		svämma_över_V_Fluidic_motion = partV (mkV "svämma") "över" ;
		cirkulera_V_Fluidic_motion = mkV "cirkulerar" ;
		flyta_fram_V_Fluidic_motion = partV (irregV "flyta" "flöt" "flutit") "fram" ;
		rinna_V_Fluidic_motion = irregV "rinna" "rann" "runnit" ;
		strömma_V_Fluidic_motion = mkV "strömmar" ;

		-- No target for Forging

		avstå_V_Forgoing = mkV "avstå" "avstod" "avstått" ;

		bryta_V_Forming_relationships = irregV "bryta" "bröt" "brutit" ;
		gifta_sig_V_Forming_relationships = reflV (mkV "gifter") ;
		göra_slut_V_Forming_relationships = partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "slut" ;
		äkta_V2_Forming_relationships = mkV2 (mkV "äktar") ;

		knirka_V_Friction = mkV "knirkar" ;
		skrapa_V_Friction = mkV "skrapar" ;

		dra_ihop_V2_Gathering_up = mkV2 (partV (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") "ihop") ;
		sammankalla_V2_Gathering_up = mkV2 (mkV "sammankallar") ;
		båda_upp_V2_Gathering_up = mkV2 (partV (mkV "bådar") "upp") ;
		föra_ihop_V2_Gathering_up = mkV2 (partV (mkV "föra" "förde" "fört") "ihop") ;
		föra_samman_V2_Gathering_up = mkV2 (partV (mkV "föra" "förde" "fört") "samman") ;
		kalla_ihop_V2_Gathering_up = mkV2 (partV (mkV "kalla") "ihop") ;
		samla_V2_Gathering_up = mkV2 (mkV "samlar") ;
		uppbåda_V2_Gathering_up = mkV2 (mkV "uppbådar") ;

		vinka_V_Gesture = mkV "vinkar" ;
		vinka_V2_Gesture = mkV2 (mkV "vinkar") ;
		teckna_VS_Gesture = mkVS (mkV "tecknar") ;
		vinka_VS_Gesture = mkVS (mkV "vinkar") ;
		vinka_VV_Gesture = mkVV (mkV "vinkar") ;

		skaffa_fram_V2_Getting = mkV2 (partV (mkV "skaffar") "fram") ;
		skaffa_sig_V2_Getting = mkV2 (reflV (mkV "skaffar")) ;
		säkra_V2_Getting = mkV2 (mkV "säkrar") ;

		köra_ut_V2_Getting_vehicle_underway = mkV2 (partV (mkV "köra" "körde" "kört") "ut") ;

		donera_V2_Giving = mkV2 (mkV "donerar") ;
		ge_V2_Giving = mkV2 (irregV "ge" "gav" "givit") ;
		ägna_V2_Giving = mkV2 (mkV "ägnar") ;

		fälla_ihop_sig_V_Go_into_shape = reflV (partV (mkV "fälla") "ihop") ;
		krusa_sig_V_Go_into_shape = reflV (mkV "krusar") ;
		kröka_sig_V_Go_into_shape = reflV (mkV "kröka") ;
		locka_sig_V_Go_into_shape = reflV (mkV "lockar") ;
		rulla_ihop_sig_V_Go_into_shape = reflV (partV (mkV "rullar") "ihop") ;
		räta_sig_V_Go_into_shape = reflV (mkV "rätar") ;
		vika_ihop_sig_V_Go_into_shape = reflV (partV (mkV "vika" "vek" "vikit") "ihop") ;

		backa_V_Going_back_on_a_commitment = mkV "backar" ;

		greppa_V2_Grasp = mkV2 (mkV "greppar") ;
		uppfatta_V2_Grasp = mkV2 (mkV "uppfattar") ;
		förstå_VQ_Grasp = mkVQ (mkV "förstå" "förstår" "förstå" "förstod" "förstått" "förstådd") ;

		tugga_V_Grinding = mkV "tuggar" ;
		pulvrisera_V2_Grinding = mkV2 (mkV "pulvriserar") ;
		smula_sönder_V2_Grinding = mkV2 (partV (mkV "smular") "sönder") ;

		borsta_V2_Grooming = mkV2 (mkV "borstar") ;
		tvätta_V2_Grooming = mkV2 (regV "tvätta") ;
		två_V2_Grooming = mkV2 (mkV "tvår") ;

		göra_halt_V_Halt = partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "halt" ;
		stanna_V_Halt = regV "stanna" ;
		stanna_till_V_Halt = partV (regV "stanna") "till" ;
		stanna_upp_V_Halt = partV (regV "stanna") "upp" ;

		höra_V_Hear = mkV "höra" "hör" "hör" "hörde" "hört" "hörd" ;
		höra_V2_Hear = mkV2 (mkV "höra" "hör" "hör" "hörde" "hört" "hörd") ;
		höra_VS_Hear = mkVS (mkV "höra" "hör" "hör" "hörde" "hört" "hörd") ;

		dölja_V2_Hiding_objects = mkV2 (mkV "dölja" "dolde" "dolt") ;
		gömma_V2_Hiding_objects = mkV2 (mkV "gömma") ;
		maskera_V2_Hiding_objects = mkV2 (mkV "maskerar") ;
		skymma_V2_Hiding_objects = mkV2 (mkV "skymmer") ;

		hindra_V2_Hindering = mkV2 (mkV "hindrar") ;
		hämma_V2_Hindering = mkV2 (mkV "hämmar") ;

		leja_V2_Hiring = mkV2 (mkV "leja" "lejde" "lejt") ;

		bråka_V_Hostile_encounter = mkV "bråkar" ;

		fiska_V_Hunting = mkV "fiska" ;
		jaga_V_Hunting = regV "jaga" ;

		apa_efter_V2_Imitating = mkV2 (partV (mkV "apar") "efter") ;
		efterlikna_V2_Imitating = mkV2 (mkV "efterliknar") ;

		bura_in_V2_Immobilization = mkV2 (partV (mkV "burar") "in") ;

		landa_V_Impact = mkV "landar" ;
		plöja_in_V_Impact = partV (mkV "plöja") "in" ;
		slå_V_Impact = irregV "slå" "slog" "slagit" ;
		slå_ner_V_Impact = partV (irregV "slå" "slog" "slagit") "ner" ;
		smattra_V_Impact = mkV "smattrar" ;
		snärta_V_Impact = mkV "snärtar" ;
		ta_V_Impact = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		ramma_V2_Impact = mkV2 (mkV "rammar") ;
		träffa_V2_Impact = mkV2 (mkV "träffar") ;

		ha_V2_Inclusion = mkV2 (mkV "ha" "har" "ha" "hade" "haft" "havd") ;
		omfatta_V2_Inclusion = mkV2 (mkV "omfattar") ;
		uppta_V2_Inclusion = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		peka_ut_V2_Indicating = mkV2 (partV (mkV "peka") "ut") ;

		röka_V2_Ingest_substance = mkV2 (mkV "röker") ;
		använda_V2_Ingest_substance = mkV2 (mkV "använder") ;
		bruka_V2_Ingest_substance = mkV2 (mkV "brukar") ;
		sniffa_V2_Ingest_substance = mkV2 (mkV "sniffar") ;
		inta_V2_Ingest_substance = mkV2 (mkV "inta" "intar" "inta" "intog" "intagit" "intagen") ;

		hugga_in_V_Ingestion = partV (irregV "hugga" "högg" "huggit") "in" ;
		äta_V_Ingestion = irregV "äta" "åt" "ätit" ;
		dricka_V_Ingestion = irregV "dricka" "drack" "druckit" ;
		dricka_V2_Ingestion = mkV2 (irregV "dricka" "drack" "druckit") ;
		ha_V2_Ingestion = mkV2 (mkV "ha" "har" "ha" "hade" "haft" "havd") ;
		äta_V2_Ingestion = mkV2 (irregV "äta" "åt" "ätit") ;
		inta_V2_Ingestion = mkV2 (mkV "inta" "intar" "inta" "intog" "intagit" "intagen") ;

		fjättra_V_Inhibit_movement = mkV "fjättra" ;
		hålla_fast_V2_Inhibit_movement = mkV2 (partV (irregV "hålla" "höll" "hållit") "fast") ;
		kvarhålla_V2_Inhibit_movement = mkV2 (mkV "kvarhålla" "kvarhöll" "kvarhållit") ;
		uppehålla_V2_Inhibit_movement = mkV2 (mkV "uppehålla" "uppehöll" "uppehållit") ;

		mönstra_V2_Inspecting = mkV2 (mkV "mönstrar") ;
		titta_till_V2_Inspecting = mkV2 (partV (regV "titta") "till") ;
		visitera_V2_Inspecting = mkV2 (mkV "visiterar") ;
		kroppsvisitera_V2_Inspecting = mkV2 (mkV "kroppsvisiterar") ;
		läkarundersöka_V2_Inspecting = mkV2 (mkV "läkarundersöker") ;

		installera_V2_Installing = mkV2 (mkV "installerar") ;

		hospitalisera_V2_Institutionalization = mkV2 (mkV "hospitaliserar") ;

		gena_V_Intentional_traversing = mkV "genar" ;
		vada_V_Intentional_traversing = mkV "vadar" ;
		bestiga_V2_Intentional_traversing = mkV2 (irregV "bestiga" "besteg" "bestigit") ;

		göra_V_Intentionally_affect = mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord" ;

		bilda_V2_Intentionally_create = mkV2 (mkV "bilda") ;
		göra_V2_Intentionally_create = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		kreera_V2_Intentionally_create = mkV2 (mkV "kreerar") ;

		fånga_upp_V2_Intercepting = mkV2 (partV (irregV "fånga" "fäng" "fångit") "upp") ;
		snappa_upp_V2_Intercepting = mkV2 (partV (mkV "snappar") "upp") ;

		avbryta_V2_Interrupt_process = mkV2 (irregV "avbryta" "avbröt" "avbrutit") ;

		invadera_V_Invading = mkV "invaderar" ;
		invadera_V2_Invading = mkV2 (mkV "invaderar") ;

		beundra_V2_Judgment = mkV2 (mkV "beundrar") ;

		svartmåla_V2_Judgment_communication = mkV2 (mkV "svartmålar") ;

		gräla_på_V2_Judgment_direct_address = mkV2 (partV (mkV "gräla") "på") ;
		komplimentera_V2_Judgment_direct_address = mkV2 (mkV "komplimenterar") ;
		tillrättavisa_V2_Judgment_direct_address = mkV2 (mkV "tillrättavisar") ;
		förebrå_V2_Judgment_direct_address = mkV2 (mkV "förebrår") ;

		försvara_V2_Justifying = mkV2 (mkV "försvarar") ;

		kidnappa_V2_Kidnapping = mkV2 (mkV "kidnappar") ;

		dränka_V2_Killing = mkV2 (mkV "dränker") ;
		gasa_V2_Killing = mkV2 (mkV "gasar") ;
		slå_ihjäl_V2_Killing = mkV2 (partV (irregV "slå" "slog" "slagit") "ihjäl") ;

		knyta_V2_Knot_creation = mkV2 (irregV "knyta" "knöt" "knutit") ;

		lansera_V2_Launch_process = mkV2 (mkV "lanserar") ;
		sjösätta_V2_Launch_process = mkV2 (mkV "sjösätta" "sjösatte" "sjösatt") ;

		leda_V2_Leadership = mkV2 (mkV "leda" "ledde" "lett") ;
		styra_V2_Leadership = mkV2 (mkV "styra" "styrde" "styrt") ;

		betyda_V2_Linguistic_meaning = mkV2 (mkV "betyda" "betydde" "betytt") ;

		krylla_V_Lively_place = mkV "kryllar" ;

		blinka_V_Location_of_light = mkV "blinkar" ;
		lysa_V_Location_of_light = mkV "lysa" ;
		skimra_V_Location_of_light = mkV "skimrar" ;

		bli_av_med_V2_Losing = mkV2 (partV (partV (irregV "bli" "blev" "blivit") "av") "med") ;
		tappa_V2_Losing = mkV2 (mkV "tappa") ;
		tappa_bort_V2_Losing = mkV2 (partV (mkV "tappa") "bort") ;

		mala_på_V_Make_noise = partV (mkV "maler") "på" ;
		säga_V2_Make_noise = mkV2 (irregV "säga" "sade" "sagt") ;

		möjliggöra_V2_Make_possible_to_do = mkV2 (mkV "möjliggöra" "möjliggjorde" "möjliggjort") ;
		tillåta_V2_Make_possible_to_do = mkV2 (irregV "tillåta" "tillät" "tillåtit") ;
		möjliggöra_VS_Make_possible_to_do = mkVS (mkV "möjliggöra" "möjliggjorde" "möjliggjort") ;
		tillåta_VS_Make_possible_to_do = mkVS (irregV "tillåta" "tillät" "tillåtit") ;

		flina_V_Making_faces = mkV "flinar" ;
		grimasera_V_Making_faces = mkV "grimaserar" ;
		hånle_V_Making_faces = mkV "hånle" "hånlog" "hånlett" ;

		manipulera_V2_Manipulate_into_doing = mkV2 (mkV "manipulerar") ;

		gno_V_Manipulation = mkV "gnor" ;
		nudda_V_Manipulation = mkV "nuddar" ;
		ta_V_Manipulation = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		gripa_V2_Manipulation = mkV2 (irregV "gripa" "grep" "gripit") ;
		hålla_V2_Manipulation = mkV2 (irregV "hålla" "höll" "hållit") ;
		topsa_V2_Manipulation = mkV2 (mkV "topsar") ;

		göra_V2_Manufacturing = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		ta_fram_V2_Manufacturing = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "fram") ;
		tillverka_V2_Manufacturing = mkV2 (mkV "tillverkar") ;

		sprida_ut_sig_V_Mass_motion = reflV (partV (irregV "sprida" "spred" "spridit") "ut") ;
		välla_fram_V_Mass_motion = partV (mkV "väller") "fram" ;
		tränga_sig_V_Mass_motion = reflV (mkV "tränger") ;
		hagla_V_Mass_motion = mkV "haglar" ;
		välla_in_V_Mass_motion = partV (mkV "väller") "in" ;

		fullgöra_V2_Meet_specifications = mkV2 (mkV "fullgöra" "fullgjorde" "fullgjort") ;
		utföra_V2_Meet_specifications = mkV2 (mkV "utföra" "utförde" "utfört") ;
		hålla_V2_Meet_specifications = mkV2 (irregV "hålla" "höll" "hållit") ;
		tillmötesgå_V2_Meet_specifications = mkV2 (mkV "tillmötesgå" "tillmötesgick" "tillmötesgått") ;
		uppfylla_V2_Meet_specifications = mkV2 (mkV "uppfyller") ;

		träffa_V2_Meet_with = mkV2 (mkV "träffar") ;

		ta_V2_Meet_with_response = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
		uppta_V2_Meet_with_response = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		memorera_V2_Memorization = mkV2 (mkV "memorerar") ;
		memorera_in_V2_Memorization = mkV2 (partV (mkV "memorerar") "in") ;

		komma_ihåg_V2_Memory = mkV2 (partV (irregV "komma" "kom" "kommit") "ihåg") ;
		glömma_VS_Memory = mkVS (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") ;

		nämna_V2_Mention = mkV2 (mkV "nämner") ;
		nämna_VS_Mention = mkVS (mkV "nämner") ;

		synda_V_Misdeed = mkV "syndar" ;

		gå_V_Motion = irregV "gå" "gick" "gått" ;
		orma_V_Motion = mkV "ormar" ;
		orma_sig_V_Motion = reflV (mkV "ormar") ;
		leda_V_Motion = mkV "leda" "ledde" "lett" ;
		åka_V_Motion = mkV "åker" ;
		spela_V_Motion = regV "spela" ;

		falla_V_Motion_directional = irregV "falla" "föll" "fallit" ;
		slå_över_V_Motion_directional = partV (irregV "slå" "slog" "slagit") "över" ;
		stiga_upp_V_Motion_directional = partV (irregV "stiga" "steg" "stigit") "upp" ;
		trilla_V_Motion_directional = mkV "trillar" ;
		störta_V_Motion_directional = mkV "störtar" ;

		svischa_V_Motion_noise = mkV "svischar" ;
		vina_V_Motion_noise = irregV "vina" "ven" "vinit" ;

		dallra_V_Moving_in_place = mkV "dallrar" ;
		kränga_V_Moving_in_place = mkV "kränger" ;
		slå_V_Moving_in_place = irregV "slå" "slog" "slagit" ;
		slå_runt_V_Moving_in_place = partV (irregV "slå" "slog" "slagit") "runt" ;
		sno_runt_V_Moving_in_place = partV (mkV "snor") "runt" ;
		svänga_V_Moving_in_place = mkV "svänger" ;
		vända_sig_V_Moving_in_place = reflV (irregV "vända" "vände" "vänt") ;

		döpa_V2_Name_conferral = mkV2 (mkV "döpa") ;
		döpa_om_V2_Name_conferral = mkV2 (partV (mkV "döpa") "om") ;
		dubba_V2_Name_conferral = mkV2 (mkV "dubbar") ;

		behöva_V2_Needing = mkV2 (mkV "behöver") ;

		anmäla_V2_Notification_of_charges = mkV2 (mkV "anmäla") ;
		åtala_V2_Notification_of_charges = mkV2 (mkV "åtalar") ;

		sönderfalla_V_Nuclear_process = mkV "sönderfalla" "sönderföll" "sönderfallit" ;

		visa_sig_V_Obviousness = reflV (mkV "visar") ;

		toppa_V_Occupy_rank = mkV "toppar" ;

		båda_V_Omen = mkV "bådar" ;
		bebåda_V2_Omen = mkV2 (mkV "bebådar") ;
		förutspå_V2_Omen = mkV2 (mkV "förutspå") ;

		cykla_V_Operate_vehicle = mkV "cyklar" ;
		köra_V_Operate_vehicle = mkV "köra" "körde" "kört" ;
		paddla_V_Operate_vehicle = mkV "paddlar" ;

		driva_V2_Operating_a_system = mkV2 (irregV "driva" "drev" "drivit") ;
		förvalta_V2_Operating_a_system = mkV2 (mkV "förvaltar") ;
		operera_V2_Operating_a_system = mkV2 (mkV "opererar") ;

		pröva_V2_Operational_testing = mkV2 (mkV "prövar") ;
		testa_V2_Operational_testing = mkV2 (mkV "testar") ;

		anse_VS_Opinion = mkVS (mkV "anse" "ansåg" "ansett") ;
		tycka_VS_Opinion = mkVS (mk2V "tycka" "tyckte") ;

		komma_V_Origin = irregV "komma" "kom" "kommit" ;

		sympatisera_V_Others_situation_as_stimulus = mkV "sympatiserar" ;
		tycka_synd_V_Others_situation_as_stimulus = partV (mk2V "tycka" "tyckte") "synd" ;
		känna_med_V2_Others_situation_as_stimulus = mkV2 (partV (irregV "känna" "kände" "känt") "med") ;

		benåda_V2_Pardon = mkV2 (mkV "benådar") ;

		gynna_V2_Partiality = mkV2 (mkV "gynnar") ;

		röra_sig_V_Participation = reflV (mkV "röra" "rörde" "rört") ;

		stiga_V_Path_shape = irregV "stiga" "steg" "stigit" ;
		svänga_V_Path_shape = mkV "svänger" ;
		gå_V_Path_shape = irregV "gå" "gick" "gått" ;
		löpa_V_Path_shape = mkV "löpa" ;
		korsa_V2_Path_shape = mkV2 (mkV "korsar") ;

		hugga_V_Perception_body = irregV "hugga" "högg" "huggit" ;
		kittla_V_Perception_body = mkV "kittlar" ;
		sticka_V_Perception_body = irregV "sticka" "stack" "stuckit" ;
		göra_ont_V_Perception_body = partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "ont" ;
		värka_V_Perception_body = mkV "värker" ;

		känna_V2_Perception_experience = mkV2 (irregV "känna" "kände" "känt") ;
		se_V2_Perception_experience = mkV2 (irregV "se" "såg" "sett") ;
		bevittna_VQ_Perception_experience = mkVQ (mkV "bevittnar") ;
		beskåda_V2_Perception_experience = mkV2 (mkV "beskådar") ;

		uppträda_ihop_V_Performers_and_roles = partV (mkV "uppträda" "uppträdde" "uppträtt") "ihop" ;
		spela_V2_Performers_and_roles = mkV2 (regV "spela") ;
		framträda_V2_Performers_and_roles = mkV2 (mkV "framträda" "framträdde" "framträtt") ;

		medge_V2_Permitting = mkV2 (mkV "medge" "medger" "medge" "medgav" "medgett" "medgiven") ;
		sanktionera_V2_Permitting = mkV2 (mkV "sanktionerar") ;
		tillåta_V2_Permitting = mkV2 (irregV "tillåta" "tillät" "tillåtit") ;

		flörta_V_Personal_relationship = mkV "flörtar" ;
		ha_ihop_sig_V_Personal_relationship = reflV (partV (mkV "ha" "har" "ha" "hade" "haft" "havd") "ihop") ;
		sammanbo_V_Personal_relationship = mkV "sammanbor" ;
		adoptera_V2_Personal_relationship = mkV2 (mkV "adopterar") ;
		dejta_V2_Personal_relationship = mkV2 (mkV "dejtar") ;
		kurtisera_V2_Personal_relationship = mkV2 (mkV "kurtiserar") ;

		kapa_V2_Piracy = mkV2 (mkV "kapar") ;
		uppbringa_V2_Piracy = mkV2 (mkV "uppbringar") ;

		-- No target for Place_weight_on

		dra_V2_Placing = mkV2 (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") ;
		placera_V2_Placing = mkV2 (mkV "placera") ;
		slå_V2_Placing = mkV2 (irregV "slå" "slog" "slagit") ;
		stoppa_V2_Placing = mkV2 (mkV "stoppar") ;
		tvinga_ned_V2_Placing = mkV2 (partV (irregV "tvinga" "tvang" "tvungit") "ned") ;
		adressera_V2_Placing = mkV2 (mkV "adresserar") ;
		toppa_V2_Placing = mkV2 (mkV "toppar") ;
		stationera_V2_Placing = mkV2 (mkV "stationerar") ;

		plantera_V2_Planting = mkV2 (mkV "planterar") ;
		sätta_V2_Planting = mkV2 (irregV "sätta" "satte" "satt") ;
		så_V2_Planting = mkV2 (mkV "sår") ;

		framställa_sig_V2_Posing_as = mkV2 (reflV (mkV "framställer")) ;

		ha_V2_Possession = mkV2 (mkV "ha" "har" "ha" "hade" "haft" "havd") ;
		sakna_V2_Possession = mkV2 (mkV "saknar") ;

		huka_sig_V_Posture = reflV (mkV "huka") ;
		ligga_V_Posture = irregV "ligga" "låg" "legat" ;
		luta_V_Posture = mkV "lutar" ;
		luta_sig_V_Posture = reflV (mkV "lutar") ;
		sitta_V_Posture = irregV "sitta" "satt" "suttit" ;
		sätta_sig_V_Posture = reflV (irregV "sätta" "satte" "satt") ;
		sätta_sig_upp_V_Posture = partV (reflV (irregV "sätta" "satte" "satt")) "upp" ;

		repa_in_V_Practice = partV (mkV "repar") "in" ;
		repetera_V_Practice = mkV "repeterar" ;
		öva_V_Practice = mkV "övar" ;
		repa_in_V2_Practice = mkV2 (partV (mkV "repar") "in") ;
		träna_V2_Practice = mkV2 (mkV "tränar") ;
		öva_in_V2_Practice = mkV2 (partV (mkV "övar") "in") ;

		snöa_V_Precipitation = mkV "snöar" ;

		balsamera_V2_Preserving = mkV2 (mkV "balsamerar") ;
		konservera_V2_Preserving = mkV2 (mkV "konserverar") ;
		luta_V2_Preserving = mkV2 (mkV "lutar") ;
		lägga_in_V2_Preserving = mkV2 (partV (irregV "lägga" "lade" "lagt") "in") ;
		sylta_V2_Preserving = mkV2 (mkV "syltar") ;
		sylta_in_V2_Preserving = mkV2 (partV (mkV "syltar") "in") ;

		ljuga_V_Prevarication = irregV "ljuga" "ljög" "ljugit" ;

		frånta_V3_Prevent_from_having = mkV3 (mkV "frånta") ;

		avvärja_V2_Preventing = mkV2 (mkV "avvärja") ;
		förhindra_V2_Preventing = mkV2 (mkV "förhindra") ;
		stoppa_V2_Preventing = mkV2 (mkV "stoppar") ;
		undanröja_V2_Preventing = mkV2 (mkV "undanröja" "undanröjde" "undanröjt") ;

		fortgå_V_Process_continue = mkV "fortgå" "fortgick" "fortgått" ;
		gå_V_Process_continue = irregV "gå" "gick" "gått" ;
		hålla_i_sig_V_Process_continue = reflV (partV (irregV "hålla" "höll" "hållit") "i") ;
		hålla_på_V_Process_continue = partV (irregV "hålla" "höll" "hållit") "på" ;
		pågå_V_Process_continue = mkV "pågå" "pågick" "pågått" ;

		sluta_V_Process_end = irregV "sluta" "slöt" "slutit" ;
		upphöra_V_Process_end = mkV "upphöra" "upphörde" "upphört" ;
		utmynna_V_Process_end = mkV "utmynnar" ;

		bryta_ut_V_Process_start = partV (irregV "bryta" "bröt" "brutit") "ut" ;
		börja_V_Process_start = mkV "börjar" ;
		starta_V_Process_start = mkV "startar" ;

		avstanna_V_Process_stop = mkV "avstannar" ;
		stanna_av_V_Process_stop = partV (regV "stanna") "av" ;

		arbeta_V2_Processing_materials = mkV2 (mkV "arbetar") ;
		bearbeta_V2_Processing_materials = mkV2 (mkV "bearbetar") ;

		gå_ner_V_Proliferating_in_number = partV (irregV "gå" "gick" "gått") "ner" ;
		gå_upp_V_Proliferating_in_number = partV (irregV "gå" "gick" "gått") "upp" ;
		krympa_V_Proliferating_in_number = mkV "krymper" ;
		minska_V_Proliferating_in_number = mkV "minskar" ;
		uppgå_V_Proliferating_in_number = mkV "uppgå" "uppgår" "uppgå" "uppgick" "uppgått" "uppgången" ;
		öka_V_Proliferating_in_number = mkV "ökar" ;
		fördubbla_V2_Proliferating_in_number = mkV2 (mkV "fördubblar") ;

		skydda_V2_Protecting = mkV2 (mkV "skyddar") ;
		säkerställa_V2_Protecting = mkV2 (mkV "säkerställer") ;

		käfta_V_Quarreling = mkV "käftar" ;
		bråka_V_Quarreling = mkV "bråkar" ;

		fråga_V_Questioning = regV "frågar" ;
		spörja_V_Questioning = mkV "spörja" "sporde" "sport" ;
		fråga_V2_Questioning = mkV2 (regV "frågar") ;
		höra_VQ_Questioning = mkVQ (mkV "höra" "hör" "hör" "hörde" "hört" "hörd") ;
		grilla_V2_Questioning = mkV2 (mkV "grillar") ;

		abdikera_V_Quitting = mkV "abdikerar" ;
		avgå_V_Quitting = mkV "avgå" "avgår" "avgå" "avgick" "avgått" "avgången" ;
		säga_upp_sig_V_Quitting = reflV (partV (irregV "säga" "sade" "sagt") "upp") ;

		dra_sig_tillbaka_V_Quitting_a_place = partV (reflV (mkV "dra" "drar" "dra" "drog" "dragit" "dragen")) "tillbaka" ;
		dunsta_V_Quitting_a_place = mkV "dunstar" ;
		utrymma_V2_Quitting_a_place = mkV2 (mkV "utrymmer") ;

		ratificera_V2_Ratification = mkV2 (mkV "ratificerar") ;

		förläsa_sig_V_Reading = reflV (mkV "förläser") ;
		sträckläsa_V_Reading = mkV "sträckläser" ;
		läsa_V2_Reading = mkV2 (mk2V "läsa" "läste") ;
		skumma_V2_Reading = mkV2 (mkV "skummar") ;
		skumma_igenom_V2_Reading = mkV2 (partV (mkV "skummar") "igenom") ;
		sluka_V2_Reading = mkV2 (mkV "slukar") ;
		ögna_igenom_V2_Reading = mkV2 (partV (mkV "ögna") "igenom") ;

		diktera_V2_Reading_aloud = mkV2 (mkV "dikterar") ;
		läsa_V2_Reading_aloud = mkV2 (mk2V "läsa" "läste") ;
		läsa_upp_V2_Reading_aloud = mkV2 (partV (mk2V "läsa" "läste") "upp") ;

		argumentera_V_Reasoning = mkV "argumenterar" ;
		demonstrera_V_Reasoning = mkV "demonstrerar" ;
		resonera_V_Reasoning = mkV "resonera" ;
		bevisa_VS_Reasoning = mkVS (mkV "bevisar") ;

		acceptera_V2_Receiving = mkV2 (mkV "accepterar") ;
		få_V2_Receiving = mkV2 (mkV "få" "måste" "få" "fick" "måst" "måst") ;
		ta_emot_V2_Receiving = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "emot") ;

		anteckna_V2_Recording = mkV2 (mkV "antecknar") ;
		dokumentera_V2_Recording = mkV2 (mkV "dokumenterar") ;
		skildra_V2_Recording = mkV2 (mkV "skildrar") ;

		komma_sig_V_Recovery = reflV (irregV "komma" "kom" "kommit") ;
		återhämta_sig_V_Recovery = reflV (mkV "återhämta") ;
		läka_V_Recovery = mkV "läker" ;

		avleda_V2_Redirecting = mkV2 (mkV "avleda" "avledde" "avlett") ;
		avvända_V2_Redirecting = mkV2 (mkV "avvänder") ;
		dirigera_om_V2_Redirecting = mkV2 (partV (mkV "dirigerar") "om") ;
		styra_om_V2_Redirecting = mkV2 (partV (mkV "styra" "styrde" "styrt") "om") ;

		se_V2_Reference_text = mkV2 (irregV "se" "såg" "sett") ;
		se_även_V2_Reference_text = mkV2 (partV (irregV "se" "såg" "sett") "även") ;

		omstrukturera_V2_Reforming_a_system = mkV2 (mkV "omstrukturerar") ;
		reformera_V2_Reforming_a_system = mkV2 (mkV "reformerar") ;

		föryngra_V2_Rejuvenation = mkV2 (mkV "föryngrar") ;
		återställa_V2_Rejuvenation = mkV2 (mkV "återställer") ;
		återuppliva_V2_Rejuvenation = mkV2 (mkV "återuppliva") ;
		vitalisera_V2_Rejuvenation = mkV2 (mkV "vitaliserar") ;

		binda_V2_Relating_concepts = mkV2 (irregV "binda" "band" "bundit") ;
		förbinda_V2_Relating_concepts = mkV2 (irregV "förbinda" "förband" "förbundit") ;
		förena_V2_Relating_concepts = mkV2 (mkV "förenar") ;
		relatera_V2_Relating_concepts = mkV2 (mkV "relatera") ;

		följa_V_Relative_time = mkV "följa" "följde" "följt" ;

		tro_V_Religious_belief = mkV "tror" ;
		tro_VS_Religious_belief = mkVS (mkV "tror") ;

		bli_över_V_Remainder = partV (irregV "bli" "blev" "blivit") "över" ;
		kvarstå_V_Remainder = mkV "kvarstå" "kvarstod" "kvarstått" ;
		lämna_V2_Remainder = mkV2 (regV "lämnar") ;

		erinra_sig_VQ_Remembering_experience = mkVQ (reflV (mkV "erinra")) ;

		påminna_sig_VS_Remembering_information = mkVS (reflV (mkV "påminna" "påminde" "påmint")) ;

		glömma_VV_Remembering_to_do = mkVV (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") ;
		komma_ihåg_VV_Remembering_to_do = mkVV (partV (irregV "komma" "kom" "kommit") "ihåg") ;

		göra_sig_av_V_Removing = partV (reflV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord")) "av" ;
		tömma_V2_Removing = mkV2 (mkV "tömmer") ;
		plocka_V2_Removing = mkV2 (mkV "plockar") ;
		slå_bort_V2_Removing = mkV2 (partV (irregV "slå" "slog" "slagit") "bort") ;
		vräka_V2_Removing = mkV2 (mkV "vräker") ;
		plocka_ur_V2_Removing = mkV2 (partV (mkV "plockar") "ur") ;
		plocka_ut_V2_Removing = mkV2 (partV (mkV "plockar") "ut") ;
		kränga_av_V3_Removing = mkV3 (partV (mkV "kränger") "av") ;
		abortera_V2_Removing = mkV2 (mkV "abortera") ;
		plocka_bort_V2_Removing = mkV2 (partV (mkV "plockar") "bort") ;
		utvisa_V2_Removing = mkV2 (mkV "utvisar") ;
		evakuera_V2_Removing = mkV2 (mkV "evakuerar") ;

		kvadda_V2_Render_nonfunctional = mkV2 (mkV "kvaddar") ;
		paja_V2_Render_nonfunctional = mkV2 (mkV "pajar") ;
		ta_sönder_V2_Render_nonfunctional = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "sönder") ;

		hyra_V2_Renting = mkV2 (mkV "hyra" "hyrde" "hyrt") ;
		hyra_in_V2_Renting = mkV2 (partV (mkV "hyra" "hyrde" "hyrt") "in") ;

		arrendera_ut_V2_Renting_out = mkV2 (partV (mkV "arrenderar") "ut") ;
		hyra_ut_V2_Renting_out = mkV2 (partV (mkV "hyra" "hyrde" "hyrt") "ut") ;

		avsäga_sig_V2_Renunciation = mkV2 (reflV (mkV "avsäga")) ;
		ge_upp_V2_Renunciation = mkV2 (partV (irregV "ge" "gav" "givit") "upp") ;

		stå_emot_V2_Repel = mkV2 (partV (irregV "stå" "stod" "stått") "emot") ;

		byta_ut_V2_Replacing = mkV2 (partV (mkV "byter") "ut") ;
		ersätta_V2_Replacing = mkV2 (mkV "ersätta" "ersätter" "ersätt" "ersatte" "ersatt" "ersatt") ;
		substituera_V2_Replacing = mkV2 (mkV "substituerar") ;

		gola_V_Reporting = mkV "golar" ;
		tjalla_V_Reporting = mkV "tjallar" ;

		stå_V_Representing = irregV "stå" "stod" "stått" ;

		hemställa_V_Request = mkV "hemställer" ;
		yrka_V_Request = mkV "yrkar" ;
		begära_V2_Request = mkV2 (mkV "begära" "begärde" "begärt") ;
		befalla_V2V_Request = mkV2V (mkV "befaller") ;
		blixtinkalla_V2_Request = mkV2 (mkV "blixtinkallar") ;
		hemkalla_V2_Request = mkV2 (mkV "hemkallar") ;
		kalla_ut_V2_Request = mkV2 (partV (mkV "kalla") "ut") ;

		forska_V_Research = mkV "forskar" ;
		vetenskapa_V_Research = mkV "vetenskapar" ;

		forma_V2_Reshaping = mkV2 (mkV "formar") ;
		krossa_V2_Reshaping = mkV2 (mkV "krossar") ;
		valsa_V2_Reshaping = mkV2 (mkV "valsar") ;

		bo_V_Residence = mkV "bor" ;

		fixa_V_Resolve_problem = mkV "fixar" ;
		behandla_V2_Resolve_problem = mkV2 (mkV "behandlar") ;
		klara_upp_V2_Resolve_problem = mkV2 (partV (mkV "klara") "upp") ;
		tillrättalägga_V2_Resolve_problem = mkV2 (mkV "tillrättalägga" "tillrättalade" "tillrättalagt") ;

		avböja_V2_Respond_to_proposal = mkV2 (mkV "avböjer") ;
		avslå_V2_Respond_to_proposal = mkV2 (mkV "avslå" "avslog" "avslagit") ;

		reagera_V_Response = mkV "reagerar" ;

		anförtro_V_Reveal_secret = mkV "anförtror" ;
		anförtro_sig_V_Reveal_secret = reflV (mkV "anförtror") ;
		yppa_V_Reveal_secret = mkV "yppar" ;
		avslöja_V2_Reveal_secret = mkV2 (mkV "avslöja") ;
		yppa_V2_Reveal_secret = mkV2 (mkV "yppar") ;
		avslöja_VQ_Reveal_secret = mkVQ (mkV "avslöja") ;
		yppa_VQ_Reveal_secret = mkVQ (mkV "yppar") ;
		avslöja_VS_Reveal_secret = mkVS (mkV "avslöja") ;

		vedergälla_V_Revenge = mkV "vedergäller" ;

		straffa_V2_Rewards_and_punishments = mkV2 (mkV "straffar") ;

		ta_V2_Ride_vehicle = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
		åka_V2_Ride_vehicle = mkV2 (mkV "åker") ;

		svara_V_Rising_to_a_challenge = regV "svarar" ;
		växa_V_Rising_to_a_challenge = mkV "växa" "växer" "växa" "växte" "vuxit" "vuxen" ;

		smörja_V2_Rite = mkV2 (irregV "smörja" "smorjde" "smort") ;
		döpa_V2_Rite = mkV2 (mkV "döpa") ;

		råna_V2_Robbery = mkV2 (mkV "råna") ;

		vara_sig_V_Rotting = reflV (mkV "vara") ;
		vittra_V_Rotting = mkV "vittrar" ;

		fastslå_VS_Ruling_legally = mkVS (mkV "fastslå" "fastslog" "fastslagit") ;

		riskera_V2_Run_risk = mkV2 (mkV "riskerar") ;
		riskera_VV_Run_risk = mkVV (mkV "riskerar") ;

		finkamma_V2_Scouring = mkV2 (mkV "finkammar") ;
		leta_igenom_V2_Scouring = mkV2 (partV (mkV "leta") "igenom") ;

		leta_V_Seeking = mkV "leta" ;

		eftersträva_V2_Seeking_to_achieve = mkV2 (mkV "eftersträvar") ;

		flänga_V_Self_motion = mkV "flänger" ;
		röra_sig_V_Self_motion = reflV (mkV "röra" "rörde" "rört") ;
		springa_V_Self_motion = irregV "springa" "sprang" "sprungit" ;
		strosa_V_Self_motion = mkV "strosar" ;
		stryka_V_Self_motion = mkV "stryka" "strök" "strukit" ;
		örla_V_Self_motion = mkV "örlar" ;
		jaga_V_Self_motion = regV "jaga" ;
		promenera_V_Self_motion = mkV "promenerar" ;
		stiga_fram_V_Self_motion = partV (irregV "stiga" "steg" "stigit") "fram" ;
		störta_V_Self_motion = mkV "störtar" ;

		dirigera_om_V2_Sending = mkV2 (partV (mkV "dirigerar") "om") ;
		skeppa_V2_Sending = mkV2 (mkV "skeppar") ;
		översända_V2_Sending = mkV2 (mkV "översänder") ;

		döma_V2_Sentencing = mkV2 (mkV "dömer") ;

		separera_V2_Separating = mkV2 (mkV "separerar") ;
		spalta_upp_V2_Separating = mkV2 (partV (mkV "spaltar") "upp") ;

		blossa_upp_V_Setting_fire = partV (mkV "blossar") "upp" ;
		anlägga_V2_Setting_fire = mkV2 (mkV "anlägga" "anlade" "anlagt") ;
		lunta_V2_Setting_fire = mkV2 (mkV "luntar") ;

		bege_sig_V_Setting_out = reflV (mkV "bege" "begav" "begett") ;
		bryta_upp_V_Setting_out = partV (irregV "bryta" "bröt" "brutit") "upp" ;
		sätta_av_V_Setting_out = partV (irregV "sätta" "satte" "satt") "av" ;

		avfyra_V2_Shoot_projectiles = mkV2 (mkV "avfyrar") ;
		bränna_av_V2_Shoot_projectiles = mkV2 (partV (mkV "bränner") "av") ;
		skjuta_V2_Shoot_projectiles = mkV2 (irregV "skjuta" "skjöt" "skjutit") ;
		skjuta_iväg_V2_Shoot_projectiles = mkV2 (partV (irregV "skjuta" "skjöt" "skjutit") "iväg") ;

		gå_ned_V_Sidereal_appearance = partV (irregV "gå" "gick" "gått") "ned" ;
		gå_upp_V_Sidereal_appearance = partV (irregV "gå" "gick" "gått") "upp" ;
		stiga_V_Sidereal_appearance = irregV "stiga" "steg" "stigit" ;
		stiga_upp_V_Sidereal_appearance = partV (irregV "stiga" "steg" "stigit") "upp" ;

		skriva_under_V2_Sign_agreement = mkV2 (partV (irregV "skriva" "skrev" "skrivit") "under") ;

		hyssja_ner_V2_Silencing = mkV2 (partV (mkV "hyssjar") "ner") ;
		tysta_V2_Silencing = mkV2 (mkV "tystar") ;

		stå_V_Similarity = irregV "stå" "stod" "stått" ;

		infalla_samtidigt_V_Simultaneity = partV (mkV "infalla" "inföll" "infallit") "samtidigt" ;
		inträffa_samtidigt_V_Simultaneity = partV (mkV "inträffa") "samtidigt" ;

		slagga_V_Sleep = mkV "slaggar" ;
		slumra_V_Sleep = mkV "slumrar" ;
		sova_V_Sleep = irregV "sova" "sov" "sovit" ;

		smuggla_V2_Smuggling = mkV2 (mkV "smugglar") ;
		smuggla_in_V2_Smuggling = mkV2 (partV (mkV "smugglar") "in") ;

		blötlägga_V2_Soaking = mkV2 (mkV "blötlägga" "blötlade" "blötlagt") ;
		marinera_V2_Soaking = mkV2 (mkV "marinerar") ;

		uppta_V2_Soaking_up = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		eka_V_Sound_movement = mkV "ekar" ;

		föreläsa_V_Speak_on_topic = mkV "föreläser" ;

		artikulera_V2_Spelling_and_pronouncing = mkV2 (mkV "artikulerar") ;
		säga_V2_Spelling_and_pronouncing = mkV2 (irregV "säga" "sade" "sagt") ;

		bli_V_State_continue = irregV "bli" "blev" "blivit" ;
		förbli_V_State_continue = mkV "förbli" "förblev" "förblivit" ;
		gå_V_State_continue = irregV "gå" "gick" "gått" ;
		hålla_V_State_continue = irregV "hålla" "höll" "hållit" ;
		stå_V_State_continue = irregV "stå" "stod" "stått" ;

		rapportera_V_Statement = mkV "rapportera" ;
		skriva_V_Statement = irregV "skriva" "skrev" "skrivit" ;
		tala_V_Statement = regV "tala" ;
		stadga_V2_Statement = mkV2 (mkV "stadgar") ;
		stadga_VS_Statement = mkVS (mkV "stadgar") ;
		fastslå_VS_Statement = mkVS (mkV "fastslå" "fastslog" "fastslagit") ;
		säga_VS_Statement = mkVS (irregV "säga" "sade" "sagt") ;
		ge_VV_Statement = mkVV (irregV "ge" "gav" "givit") ;
		kommentera_V2_Statement = mkV2 (mkV "kommenterar") ;

		lagra_V2_Storing = mkV2 (mkV "lagrar") ;

		ligga_V_Studying = irregV "ligga" "låg" "legat" ;
		studera_V2_Studying = mkV2 (mkV "studera") ;

		förmå_V2V_Suasion = mkV2V (mkV "förmår") ;
		övertala_V2V_Suasion = mkV2V (mkV "övertala") ;
		övertala_V2_Suasion = mkV2 (mkV "övertala") ;

		lämna_in_V2_Submitting_documents = mkV2 (partV (regV "lämnar") "in") ;
		skicka_in_V2_Submitting_documents = mkV2 (partV (regV "skicka") "in") ;
		sända_in_V2_Submitting_documents = mkV2 (partV (mkV "sänder") "in") ;

		göra_bort_sig_V_Success_or_failure = reflV (partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "bort") ;
		ta_V_Success_or_failure = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		klara_VV_Success_or_failure = mkVV (mkV "klara") ;
		klara_av_VV_Success_or_failure = mkVV (partV (mkV "klara") "av") ;

		slå_bakut_V_Successful_action = partV (irregV "slå" "slog" "slagit") "bakut" ;
		slå_fel_V_Successful_action = partV (irregV "slå" "slog" "slagit") "fel" ;

		förankra_V2_Successfully_communicate_message = mkV2 (mkV "förankrar") ;
		förmedla_V2_Successfully_communicate_message = mkV2 (mkV "förmedlar") ;

		förslå_V_Sufficiency = mkV "förslå" "förslog" "förslagit" ;
		räcka_V_Sufficiency = mkV "räcker" ;
		räcka_till_V_Sufficiency = partV (mkV "räcker") "till" ;

		ekipera_V2_Supply = mkV2 (mkV "ekiperar") ;
		pimpa_V2_Supply = mkV2 (mkV "pimpar") ;
		tanka_V2_Supply = mkV2 (mkV "tankar") ;
		förse_V2_Supply = mkV2 (mkV "förse" "försåg" "försett") ;

		stödja_V2_Supporting = mkV2 (mkV "stödjer") ;
		stötta_V2_Supporting = mkV2 (mkV "stötta") ;

		överlämna_sig_V_Surrendering = reflV (mkV "överlämnar") ;

		lämna_ifrån_sig_V2_Surrendering_possession = mkV2 (reflV (partV (regV "lämnar") "ifrån")) ;
		överlämna_V2_Surrendering_possession = mkV2 (mkV "överlämnar") ;

		avlösa_V2_Take_place_of = mkV2 (mkV "avlöser") ;
		efterträda_V2_Take_place_of = mkV2 (mkV "efterträda" "efterträdde" "efterträtt") ;
		ersätta_V2_Take_place_of = mkV2 (mkV "ersätta" "ersätter" "ersätt" "ersatte" "ersatt" "ersatt") ;

		beslagta_V2_Taking = mkV2 (mkV "beslagta" "beslagtar" "beslagta" "beslagtog" "beslagtagit" "beslagtagen") ;
		ta_V2_Taking = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;

		berätta_V_Telling = mkV "berätta" ;
		komma_V_Telling = irregV "komma" "kom" "kommit" ;
		dra_V2_Telling = mkV2 (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") ;
		berätta_VS_Telling = mkVS (mkV "berätta") ;

		sova_över_V_Temporary_stay = partV (irregV "sova" "sov" "sovit") "över" ;
		bo_V_Temporary_stay = mkV "bor" ;

		skriva_V2_Text_creation = mkV2 (irregV "skriva" "skrev" "skrivit") ;
		säga_V2_Text_creation = mkV2 (irregV "säga" "sade" "sagt") ;

		snatta_V_Theft = mkV "snattar" ;
		förskingra_V2_Theft = mkV2 (mkV "förskingra") ;
		nalla_V2_Theft = mkV2 (mkV "nallar") ;

		blomstra_V_Thriving = mkV "blomstrar" ;
		rasa_V_Thriving = mkV "rasar" ;

		blockera_V2_Thwarting = mkV2 (mkV "blockerar") ;
		lamslå_V2_Thwarting = mkV2 (mkV "lamslå" "lamslog" "lamslagit") ;

		behandla_V2_Topic = mkV2 (mkV "behandlar") ;
		röra_V2_Topic = mkV2 (mkV "röra" "rörde" "rört") ;

		pendla_V_Travel = mkV "pendlar" ;

		kretsa_V_Traversing = mkV "kretsar" ;
		sicksacka_V_Traversing = mkV "sicksackar" ;
		tvära_V_Traversing = mkV "tvärar" ;

		pröva_V2_Trying_out = mkV2 (mkV "prövar") ;
		pröva_på_V2_Trying_out = mkV2 (partV (mkV "prövar") "på") ;
		testköra_V2_Trying_out = mkV2 (mkV "testköra" "testkörde" "testkört") ;

		säga_VS_Unattributed_information = mkVS (irregV "säga" "sade" "sagt") ;

		slå_om_V_Undergo_change = partV (irregV "slå" "slog" "slagit") "om" ;
		svänga_V_Undergo_change = mkV "svänger" ;

		undergå_V2_Undergoing = mkV2 (mkV "undergå" "undergår" "undergå" "undergick" "undergått" "undergången") ;
		underkasta_sig_V2_Undergoing = mkV2 (reflV (mkV "underkastar")) ;

		dra_av_sig_V2_Undressing = mkV2 (reflV (partV (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") "av")) ;
		klä_V2_Undressing = mkV2 (mkV "klä") ;

		avfyra_V2_Use_firearm = mkV2 (mkV "avfyrar") ;

		begagna_V2_Using = mkV2 (mkV "begagnar") ;
		ta_till_V2_Using = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "till") ;
		ta_tillvara_V2_Using = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "tillvara") ;
		tillämpa_V2_Using = mkV2 (mkV "tillämpar") ;

		finna_V2_Verdict = mkV2 (irregV "finna" "fann" "funnit") ;

		slå_vad_VS_Wagering = mkVS (partV (irregV "slå" "slog" "slagit") "vad") ;

		vänta_V_Waiting = regV "vänta" ;

		vakna_V_Waking_up = mkV "vaknar" ;
		vakna_upp_V_Waking_up = partV (mkV "vaknar") "upp" ;

		tveka_V_Waver_between_options = mkV "tvekar" ;
		vackla_V_Waver_between_options = mkV "vacklar" ;
		hatta_V_Waver_between_options = mkV "hattar" ;
		vela_V_Waver_between_options = mkV "velar" ;

		bära_V2_Wearing = mkV2 (irregV "bära" "bar" "burit") ;

		erövra_V2_Win_prize = mkV2 (mkV "erövrar") ;
		ta_hem_V2_Win_prize = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "hem") ;

		dra_sig_tillbaka_V_Withdraw_from_participation = partV (reflV (mkV "dra" "drar" "dra" "drog" "dragit" "dragen")) "tillbaka" ;

}
