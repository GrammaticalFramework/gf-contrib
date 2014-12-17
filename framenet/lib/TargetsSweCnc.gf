concrete TargetsSweCnc of TargetsSweAbs = CatSwe ** open ParadigmsSwe, IrregSwe, StructuralSwe in {

	flags coding = utf8 ;

	lin

		glömma_V2_Abandonment = mkV2 (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") ;
		glömma_kvar_V2_Abandonment = mkV2 (partV (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") "kvar") ;
		lämna_V2_Abandonment = mkV2 (regV "lämnar") ;
		överge_V2_Abandonment = mkV2 (mkV "överge" "överger" "överge" "övergav" "övergett" "övergiven") ;
		lämna_i_sticket_V2_Abandonment = variants {} ;
		lämna_kvar_V2_Abandonment = mkV2 (partV (regV "lämnar") "kvar") ;

		drälla_V_Abounding_with = mkV "dräller" ;
		myllra_V_Abounding_with = mkV "myllrar" ;
		svämma_över_V_Abounding_with = partV (mkV "svämma") "över" ;
		vimla_V_Abounding_with = mkV "vimlar" ;

		grädda_V_Absorb_heat = mkV "gräddar" ;
		koka_V_Absorb_heat = mkV "kokar" ;
		puttra_V_Absorb_heat = mkV "puttrar" ;
		sjuda_V_Absorb_heat = irregV "sjuda" "sjöd" "sjudit" ;
		småkoka_V_Absorb_heat = variants {} ;
		steka_V_Absorb_heat = mkV "steker" ;

		krylla_V_Abundance = mkV "kryllar" ;

		misshandla_V2_Abusing = mkV2 (mkV "misshandlar") ;
		utnyttja_V2_Abusing = mkV2 (mkV "utnyttjar") ;

		åstadkomma_V2_Accomplishment = mkV2 (mkV "åstadkomma" "åstadkom" "åstadkommit") ;
		genomföra_V2_Accomplishment = mkV2 (mkV "genomföra" "genomförde" "genomfört") ;

		mynta_V2_Achieving_first = mkV2 (mkV "myntar") ;
		uppfinna_V2_Achieving_first = mkV2 (irregV "uppfinna" "uppfann" "uppfunnit") ;
		upptäcka_VS_Achieving_first = mkVS (mkV "upptäcker") ;

		absolvera_V2_Activity_finish = mkV2 (mkV "absolverar") ;
		avlägga_V2_Activity_finish = mkV2 (mkV "avlägga" "avlade" "avlagt") ;
		fullgöra_V2_Activity_finish = mkV2 (mkV "fullgöra" "fullgjorde" "fullgjort") ;
		fasa_ut_V2_Activity_finish = mkV2 (partV (mkV "fasar") "ut") ;

		fortfara_VV_Activity_ongoing = mkVV (mkV "fortfara" "fortfor" "fortfarit") ;
		fortsätta_VV_Activity_ongoing = mkVV (mkV "fortsätta" "fortsätter" "fortsätt" "fortsatte" "fortsatt" "fortsatt") ;

		frysa_V2_Activity_pause = mkV2 (irregV "frysa" "frös" "frusit") ;

		bereda_sig_V_Activity_prepare = reflV (mkV "bereder") ;
		förbereda_V_Activity_prepare = mkV "förbereder" ;
		förbereda_sig_V_Activity_prepare = reflV (mkV "förbereder") ;

		återuppta_V2_Activity_resume = mkV2 (mkV "återuppta" "återupptar" "återuppta" "återupptog" "återupptagit" "återupptagen") ;

		börja_V_Activity_start = mkV "börjar" ;
		börja_V2_Activity_start = mkV2 (mkV "börjar") ;
		ingå_V2_Activity_start = mkV2 (mkV "ingå" "ingår" "ingå" "ingick" "ingått" "ingången") ;
		inleda_V2_Activity_start = mkV2 (mkV "inleda" "inledde" "inlett") ;
		sluta_V2_Activity_start = mkV2 (irregV "sluta" "slöt" "slutit") ;
		slå_sig_på_V2_Activity_start = mkV2 (partV (reflV (irregV "slå" "slog" "slagit")) "på") ;
		träffa_V2_Activity_start = mkV2 (mkV "träffar") ;
		begynna_VV_Activity_start = mkVV (mkV "begynna" "begynte" "begynt") ;
		börja_VV_Activity_start = mkVV (mkV "börjar") ;
		ge_sig_på_VV_Activity_start = mkVV (partV (reflV (irregV "ge" "gav" "givit")) "på") ;
		komma_VV_Activity_start = mkVV (irregV "komma" "kom" "kommit") ;
		uppta_V2_Activity_start = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		ava_V2_Activity_stop = mkV2 (mkV "avar") ;
		avsluta_V2_Activity_stop = mkV2 (mkV "avsluta") ;
		lägga_ner_V2_Activity_stop = mkV2 (partV (irregV "lägga" "lade" "lagt") "ner") ;
		stoppa_V2_Activity_stop = mkV2 (mkV "stoppar") ;
		ställa_in_V2_Activity_stop = mkV2 (partV (mkV "ställer") "in") ;
		sluta_VV_Activity_stop = mkVV (irregV "sluta" "slöt" "slutit") ;
		avlysa_V2_Activity_stop = mkV2 (mkV "avlyser") ;
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
		anpassa_V2_Adjusting = mkV2 (mkV "anpassa") ;
		justera_V2_Adjusting = mkV2 (mkV "justerar") ;
		kalibrera_V2_Adjusting = mkV2 (mkV "kalibrerar") ;
		stämma_V2_Adjusting = mkV2 (mkV "stämmer") ;

		anta_V2_Adopt_selection = mkV2 (mkV "anta" "antar" "anta" "antog" "antagit" "antagen") ;
		inta_V2_Adopt_selection = mkV2 (mkV "inta" "intar" "inta" "intog" "intagit" "intagen") ;
		omfamna_V2_Adopt_selection = mkV2 (mkV "omfamnar") ;
		adoptera_V2_Adopt_selection = mkV2 (mkV "adoptera") ;

		pryda_V2_Adorning = mkV2 (mkV "pryda" "prydde" "prytt") ;
		översvämma_V2_Adorning = mkV2 (mkV "översvämma") ;
		smycka_V2_Adorning = mkV2 (mkV "smyckar") ;
		täcka_V2_Adorning = mkV2 (mkV "täcker") ;

		eftermogna_V_Aging = mkV "eftermognar" ;
		mogna_V_Aging = mkV "mognar" ;
		åldras_V2_Aging = mkV2 (mkV "åldras") ;

		avböja_VV_Agree_or_refuse_to_act = mkVV (mkV "avböjer") ;
		vägra_VV_Agree_or_refuse_to_act = mkVV (mkV "vägra") ;

		bruka_V2_Agriculture = mkV2 (mkV "brukar") ;
		kultivera_V2_Agriculture = mkV2 (mkV "kultiverar") ;

		rikta_V2_Aiming = mkV2 (mkV "riktar") ;
		rikta_in_V2_Aiming = mkV2 (partV (mkV "riktar") "in") ;

		ackumulera_V2_Amassing = mkV2 (mkV "ackumulerar") ;
		hamstra_V2_Amassing = mkV2 (mkV "hamstrar") ;
		lagra_V2_Amassing = mkV2 (mkV "lagrar") ;
		ansamla_V2_Amassing = mkV2 (mkV "ansamlar") ;

		belöpa_sig_V_Amounting_to = reflV (mkV "belöpa" "belöpte" "belupit") ;

		besvära_sig_V_Appeal = reflV (mkV "besvära") ;
		besvärja_sig_V_Appeal = reflV (mkV "besvärja" "besvor" "besvurit") ;

		baka_V2_Apply_heat = mkV2 (mkV "bakar") ;
		grilla_V2_Apply_heat = mkV2 (mkV "grillar") ;
		koka_V2_Apply_heat = mkV2 (mkV "kokar") ;
		koka_upp_V2_Apply_heat = mkV2 (partV (mkV "kokar") "upp") ;
		mikra_V2_Apply_heat = mkV2 (mkV "mikrar") ;
		sjuda_V2_Apply_heat = mkV2 (irregV "sjuda" "sjöd" "sjudit") ;
		steka_V2_Apply_heat = mkV2 (mkV "steker") ;
		woka_V2_Apply_heat = variants {} ;
		röka_V2_Apply_heat = mkV2 (mkV "röker") ;

		ackreditera_V2_Appointing = mkV2 (mkV "ackrediterar") ;

		alfabetisera_V2_Arranging = mkV2 (mkV "alfabetiserar") ;
		arrangera_V2_Arranging = mkV2 (mkV "arrangera") ;
		gruppera_V2_Arranging = mkV2 (mkV "grupperar") ;
		lägga_upp_V2_Arranging = mkV2 (partV (irregV "lägga" "lade" "lagt") "upp") ;

		gripa_V2_Arrest = mkV2 (irregV "gripa" "grep" "gripit") ;

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
		spika_fast_V2_Attaching = variants {} ;
		säkra_V2_Attaching = mkV2 (mkV "säkrar") ;
		koppla_ihop_V2_Attaching = mkV2 (partV (mkV "kopplar") "ihop") ;
		slå_fast_V2_Attaching = mkV2 (partV (irregV "slå" "slog" "slagit") "fast") ;
		dra_fast_V2_Attaching = mkV2 (partV (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") "fast") ;
		slå_på_V2_Attaching = mkV2 (partV (irregV "slå" "slog" "slagit") "på") ;

		angripa_V2_Attack = mkV2 (irregV "angripa" "angrep" "angripit") ;
		atombomba_V2_Attack = mkV2 (mkV "atombombar") ;
		bomba_V2_Attack = mkV2 (mkV "bombar") ;
		bombardera_V2_Attack = mkV2 (mkV "bombardera") ;
		ge_sig_på_V2_Attack = mkV2 (partV (reflV (irregV "ge" "gav" "givit")) "på") ;

		anstränga_sig_V_Attempt = reflV (mkV "anstränger") ;
		bjuda_till_V_Attempt = partV (irregV "bjuda" "bjöd" "bjudit") "till" ;
		anstränga_sig_VV_Attempt = mkVV (reflV (mkV "anstränger")) ;
		försöka_VV_Attempt = mkVV (mkV "försöker") ;
		söka_VV_Attempt = mkVV (mk2V "söka" "sökte") ;

		försöka_V2_Attempt_means = mkV2 (mkV "försöker") ;
		pröva_V2_Attempt_means = mkV2 (mkV "prövar") ;
		försöka_VV_Attempt_means = mkVV (mkV "försöker") ;

		advocera_V_Attempt_suasion = mkV "advocerar" ;
		agitera_V_Attempt_suasion = mkV "agiterar" ;
		lirka_V_Attempt_suasion = mkV "lirkar" ;
		lobba_V_Attempt_suasion = mkV "lobbar" ;
		pressa_V2_Attempt_suasion = mkV2 (mkV "pressa") ;
		anbefalla_V2_Attempt_suasion = mkV2 (mkV "anbefaller") ;
		föreslå_V2_Attempt_suasion = mkV2 (mkV "föreslå" "föreslog" "föreslagit") ;

		bevista_V2_Attending = mkV2 (mkV "bevistar") ;
		övervara_V2_Attending = mkV2 (mkV "övervarar") ;

		undvika_V2_Avoiding = mkV2 (mkV "undvika" "undvek" "undvikit") ;
		undgå_VV_Avoiding = mkVV (mkV "undgå" "undgick" "undgått") ;
		undvika_VV_Avoiding = mkVV (mkV "undvika" "undvek" "undvikit") ;

		veta_V_Awareness = mk6V "veta" "vet" "vet" "visste" "vetat" "visst" ;
		ana_V2_Awareness = mkV2 (mkV "ana") ;
		känna_V2_Awareness = mkV2 (irregV "känna" "kände" "känt") ;
		tro_V2_Awareness = mkV2 (mkV "tror") ;
		tro_VS_Awareness = mkVS (mkV "tror") ;
		veta_VS_Awareness = mkVS (mk6V "veta" "vet" "vet" "visste" "vetat" "visst") ;
		föreställa_sig_VV_Awareness = mkVV (reflV (mkV "föreställa")) ;

		få_medhåll_V_Be_in_agreement_on_assessment = variants {} ;

		klå_V2_Beat_opponent = mkV2 (mkV "klå") ;
		slå_V2_Beat_opponent = mkV2 (irregV "slå" "slog" "slagit") ;
		slå_ner_V2_Beat_opponent = mkV2 (partV (irregV "slå" "slog" "slagit") "ner") ;
		slå_ut_V2_Beat_opponent = mkV2 (partV (irregV "slå" "slog" "slagit") "ut") ;
		spöa_V2_Beat_opponent = mkV2 (mkV "spöa") ;
		ta_V2_Beat_opponent = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
		utklassa_V2_Beat_opponent = mkV2 (mkV "utklassar") ;

		hålla_babblan_V_Become_silent = variants {} ;
		hålla_flabben_V_Become_silent = variants {} ;
		hålla_gafflan_V_Become_silent = variants {} ;
		hålla_klaffen_V_Become_silent = variants {} ;
		tiga_V_Become_silent = irregV "tiga" "teg" "tigit" ;

		bli_V_Becoming = irregV "bli" "blev" "blivit" ;
		göra_sig_V_Becoming = reflV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		utfalla_V_Becoming = mkV "utfalla" "utföll" "utfallit" ;
		bli_V2_Becoming = mkV2 (irregV "bli" "blev" "blivit") ;

		ansluta_sig_V_Becoming_a_member = reflV (mkV "ansluta" "anslöt" "anslutit") ;
		inträda_V_Becoming_a_member = mkV "inträda" "inträdde" "inträtt" ;
		gå_in_i_V2_Becoming_a_member = mkV2 (partV (partV (irregV "gå" "gick" "gått") "in") "i") ;
		gå_med_i_V2_Becoming_a_member = mkV2 (partV (partV (irregV "gå" "gick" "gått") "med") "i") ;

		bli_varse_V_Becoming_aware = variants {} ;
		märka_V2_Becoming_aware = mkV2 (mkV "märker") ;
		varsna_V2_Becoming_aware = mkV2 (mkV "varsnar") ;
		lägga_märke_till_VQ_Becoming_aware = variants {} ;
		upptäcka_VS_Becoming_aware = mkVS (mkV "upptäcker") ;

		lösgöra_sig_V_Becoming_detached = reflV (mkV "lösgöra" "lösgjorde" "lösgjort") ;
		slita_sig_V_Becoming_detached = reflV (irregV "slita" "slet" "slitit") ;
		släppa_V_Becoming_detached = mkV "släppa" ;

		lufttorka_V_Becoming_dry = mkV "lufttorkar" ;
		soltorka_V_Becoming_dry = mkV "soltorkar" ;
		torka_V_Becoming_dry = regV "torka" ;
		torka_bort_V_Becoming_dry = partV (regV "torka") "bort" ;
		torka_in_V_Becoming_dry = partV (regV "torka") "in" ;
		torka_upp_V_Becoming_dry = partV (regV "torka") "upp" ;
		torka_ut_V_Becoming_dry = partV (regV "torka") "ut" ;

		dela_sig_V_Becoming_separated = reflV (mkV "delar") ;
		smula_V_Becoming_separated = mkV "smular" ;
		smula_sig_V_Becoming_separated = reflV (mkV "smular") ;

		dirigera_V2_Behind_the_scenes = mkV2 (mkV "dirigerar") ;
		filmatisera_V2_Behind_the_scenes = mkV2 (mkV "filmatiserar") ;
		producera_V2_Behind_the_scenes = mkV2 (mkV "producera") ;
		regissera_V2_Behind_the_scenes = mkV2 (mkV "regisserar") ;
		rollbesätta_V2_Behind_the_scenes = mkV2 (mkV "rollbesätta" "rollbesätter" "rollbesätt" "rollbesatte" "rollbesatt" "rollbesatt") ;
		smalfilma_V2_Behind_the_scenes = mkV2 (mkV "smalfilmar") ;

		hålla_ihop_V_Being_attached = partV (irregV "hålla" "höll" "hållit") "ihop" ;

		föda_V2_Being_born = mkV2 (mkV "föda" "födde" "fött") ;

		arbeta_V_Being_employed = mkV "arbetar" ;
		jobba_V_Being_employed = mkV "jobbar" ;
		yrkesarbeta_V_Being_employed = mkV "yrkesarbetar" ;

		ligga_V_Being_located = irregV "ligga" "låg" "legat" ;
		sitta_V_Being_located = irregV "sitta" "satt" "suttit" ;
		stå_V_Being_located = irregV "stå" "stod" "stått" ;
		vara_V_Being_located = mkV "vara" ;

		belägra_V2_Besieging = mkV2 (mkV "belägrar") ;
		omringa_V2_Besieging = mkV2 (mkV "omringar") ;
		ringa_V2_Besieging = mkV2 (mkV "ringa") ;

		embarkera_V2_Board_vehicle = mkV2 (mkV "embarkerar") ;
		stiga_på_V2_Board_vehicle = mkV2 (partV (irregV "stiga" "steg" "stigit") "på") ;

		bocka_sig_V_Body_movement = reflV (mkV "bockar") ;
		buga_V_Body_movement = mkV "bugar" ;
		fingra_V_Body_movement = mkV "fingrar" ;
		gäspa_V_Body_movement = mkV "gäspar" ;
		halvblunda_V_Body_movement = variants {} ;
		hovniga_V_Body_movement = mkV "hovniga" "hovneg" "hovnigit" ;
		jucka_V_Body_movement = mkV "juckar" ;
		klippa_med_ögonen_V_Body_movement = variants {} ;
		klippa_med_öronen_V_Body_movement = variants {} ;
		knixa_V_Body_movement = mkV "knixar" ;
		korsa_sig_V_Body_movement = reflV (mkV "korsar") ;
		leda_V_Body_movement = mkV "leda" "ledde" "lett" ;
		masturbera_V_Body_movement = mkV "masturberar" ;
		onanera_V_Body_movement = mkV "onanerar" ;
		runka_V_Body_movement = mkV "runkar" ;
		röra_V_Body_movement = mkV "röra" "rörde" "rört" ;
		vicka_V_Body_movement = mkV "vickar" ;
		korsa_V2_Body_movement = mkV2 (mkV "korsar") ;

		förfalla_V_Bond_maturation = mkV "förfalla" "förföll" "förfallit" ;
		löpa_ut_V_Bond_maturation = partV (mkV "löpa") "ut" ;

		bravera_V_Bragging = mkV "braverar" ;
		göra_sig_fin_V_Bragging = variants {} ;
		skryta_V_Bragging = irregV "skryta" "skröt" "skrutit" ;

		inhalera_V2_Breathing = mkV2 (mkV "inhalerar") ;
		andas_in_V2_Breathing = mkV2 (partV (mkV "andas") "in") ;

		bära_upp_V2_Bringing = mkV2 (partV (irregV "bära" "bar" "burit") "upp") ;
		flotta_V2_Bringing = mkV2 (mkV "flottar") ;
		forsla_V2_Bringing = mkV2 (mkV "forslar") ;
		forsla_fram_V2_Bringing = mkV2 (partV (mkV "forslar") "fram") ;
		forsla_in_V2_Bringing = mkV2 (partV (mkV "forslar") "in") ;
		köra_V2_Bringing = mkV2 (mkV "köra" "körde" "kört") ;
		forsla_ned_V2_Bringing = mkV2 (partV (mkV "forslar") "ned") ;

		anlägga_V2_Building = mkV2 (mkV "anlägga" "anlade" "anlagt") ;
		bygga_V2_Building = mkV2 (mkV "bygger") ;
		bygga_om_V2_Building = mkV2 (partV (mkV "bygger") "om") ;
		bygga_ut_V2_Building = mkV2 (partV (mkV "bygger") "ut") ;
		göra_V2_Building = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		lyxrenovera_V2_Building = mkV2 (mkV "lyxrenoverar") ;
		montera_V2_Building = mkV2 (mkV "monterar") ;
		renovera_V2_Building = mkV2 (mkV "renoverar") ;
		slå_upp_V2_Building = mkV2 (partV (irregV "slå" "slog" "slagit") "upp") ;
		sätta_ihop_V2_Building = mkV2 (partV (irregV "sätta" "satte" "satt") "ihop") ;
		timra_V2_Building = mkV2 (mkV "timrar") ;
		uppföra_V2_Building = mkV2 (mkV "uppföra" "uppförde" "uppfört") ;
		sätta_samman_V2_Building = mkV2 (partV (irregV "sätta" "satte" "satt") "samman") ;

		blanda_ihop_V2_Bungling = mkV2 (partV (mkV "blandar") "ihop") ;
		schabbla_bort_V2_Bungling = mkV2 (partV (mkV "schabblar") "bort") ;

		föra_V2_Carry_goods = mkV2 (mkV "föra" "förde" "fört") ;
		saluföra_V2_Carry_goods = mkV2 (mkV "saluföra" "saluförde" "salufört") ;

		råka_illa_ut_V_Catastrophe = partV (partV (mkV "råka") "illa") "ut" ;
		råka_ut_V_Catastrophe = partV (mkV "råka") "ut" ;
		drabba_V2_Catastrophe = mkV2 (mkV "drabbar") ;

		artbestämma_V2_Categorization = mkV2 (mkV "artbestämmer") ;
		kategorisera_V2_Categorization = mkV2 (mkV "kategoriserar") ;

		leda_V_Causation = mkV "leda" "ledde" "lett" ;
		framkalla_V2_Causation = mkV2 (mkV "framkallar") ;
		väcka_V2_Causation = mkV2 (mkV "väcker") ;
		åsamka_V2_Causation = mkV2 (mkV "åsamkar") ;
		göra_V2_Causation = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		förorsaka_V2_Causation = mkV2 (mkV "förorsaka") ;
		orsaka_V2_Causation = mkV2 (mkV "orsakar") ;
		utlösa_V2_Causation = mkV2 (mkV "utlöser") ;
		vålla_V2_Causation = mkV2 (mkV "vållar") ;
		få_V2V_Causation = mkV2V (mkV "få" "måste" "få" "fick" "måst" "måst") ;
		komma_V2V_Causation = mkV2V (irregV "komma" "kom" "kommit") ;
		tvinga_V2V_Causation = mkV2V (irregV "tvinga" "tvang" "tvungit") ;

		arrangera_V2_Cause_change = mkV2 (mkV "arrangera") ;
		förändra_V2_Cause_change = mkV2 (mkV "förändrar") ;
		göra_V2_Cause_change = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		omdana_V2_Cause_change = mkV2 (mkV "omdanar") ;
		ändra_V2_Cause_change = mkV2 (mkV "ändrar") ;
		omvandla_V2_Cause_change = mkV2 (mkV "omvandlar") ;
		omändra_V2_Cause_change = mkV2 (mkV "omändrar") ;

		lösa_V2_Cause_change_of_consistency = mkV2 (mkV "löser") ;
		reda_ut_V2_Cause_change_of_consistency = mkV2 (partV (mkV "reda" "redde" "rett") "ut") ;
		lösa_upp_V2_Cause_change_of_consistency = mkV2 (partV (mkV "löser") "upp") ;

		frysa_V2_Cause_change_of_phase = mkV2 (irregV "frysa" "frös" "frusit") ;
		smälta_V2_Cause_change_of_phase = mkV2 (mkV "smälta" "smälter" "smält" "smälte" "smält" "smält") ;
		tina_V2_Cause_change_of_phase = mkV2 (mkV "tinar") ;
		tina_upp_V2_Cause_change_of_phase = mkV2 (partV (mkV "tinar") "upp") ;
		förgasa_V2_Cause_change_of_phase = mkV2 (mkV "förgasar") ;
		förånga_V2_Cause_change_of_phase = mkV2 (mkV "förångar") ;

		befästa_V2_Cause_change_of_strength = mkV2 (mkV "befästa" "befäster" "befäst" "befäste" "befäst" "befäst") ;
		förstärka_V2_Cause_change_of_strength = mkV2 (mkV "förstärker") ;
		aggravera_V2_Cause_change_of_strength = mkV2 (mkV "aggraverar") ;
		försvaga_V2_Cause_change_of_strength = mkV2 (mkV "försvaga") ;

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
		daska_V2_Cause_harm = mkV2 (mkV "daskar") ;
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
		dänga_V2_Cause_impact = mkV2 (mkV "dänger") ;
		slå_V2_Cause_impact = mkV2 (irregV "slå" "slog" "slagit") ;
		daska_till_V2_Cause_impact = mkV2 (partV (mkV "daskar") "till") ;
		drämma_till_V2_Cause_impact = mkV2 (partV (mkV "drämmer") "till") ;
		slå_ihop_V2_Cause_impact = mkV2 (partV (irregV "slå" "slog" "slagit") "ihop") ;
		köra_V2_Cause_impact = mkV2 (mkV "köra" "körde" "kört") ;

		röra_V_Cause_motion = mkV "röra" "rörde" "rört" ;
		toppa_V_Cause_motion = mkV "toppar" ;
		flytta_V2_Cause_motion = mkV2 (mkV "flyttar") ;
		skjuta_V2_Cause_motion = mkV2 (irregV "skjuta" "skjöt" "skjutit") ;
		skjuta_ut_V2_Cause_motion = mkV2 (partV (irregV "skjuta" "skjöt" "skjutit") "ut") ;
		släpa_V2_Cause_motion = mkV2 (mkV "släpar") ;
		vältra_av_V2_Cause_motion = mkV2 (partV (mkV "vältra") "av") ;
		vältra_undan_V2_Cause_motion = mkV2 (partV (mkV "vältra") "undan") ;
		bogsera_V2_Cause_motion = mkV2 (mkV "bogserar") ;
		fira_ner_V2_Cause_motion = mkV2 (partV (mkV "fira") "ner") ;
		kasta_V2_Cause_motion = mkV2 (regV "kasta") ;
		skjuta_iväg_V2_Cause_motion = mkV2 (partV (irregV "skjuta" "skjöt" "skjutit") "iväg") ;
		toppa_V2_Cause_motion = mkV2 (mkV "toppar") ;
		vältra_V2_Cause_motion = mkV2 (mkV "vältra") ;
		nicka_V2_Cause_motion = mkV2 (mkV "nickar") ;
		rulla_V2_Cause_motion = mkV2 (mkV "rullar") ;
		vältra_upp_V2_Cause_motion = mkV2 (partV (mkV "vältra") "upp") ;
		toppa_V3_Cause_motion = mkV3 (mkV "toppar") ;
		hala_V2_Cause_motion = mkV2 (mkV "halar") ;
		hissa_V2_Cause_motion = mkV2 (mkV "hissar") ;

		hetta_upp_V2_Cause_temperature_change = mkV2 (partV (mkV "hettar") "upp") ;
		kyla_V2_Cause_temperature_change = mkV2 (mkV "kyler") ;
		kyla_ner_V2_Cause_temperature_change = mkV2 (partV (mkV "kyler") "ner") ;
		svalka_av_V2_Cause_temperature_change = mkV2 (partV (mkV "svalkar") "av") ;
		svalka_ner_V2_Cause_temperature_change = mkV2 (partV (mkV "svalkar") "ner") ;
		värma_upp_V2_Cause_temperature_change = mkV2 (partV (mkV "värmer") "upp") ;
		överhetta_V2_Cause_temperature_change = mkV2 (mkV "överhettar") ;
		värma_V2_Cause_temperature_change = mkV2 (mkV "värmer") ;

		förena_V2_Cause_to_amalgamate = mkV2 (mkV "förenar") ;
		kombinera_V2_Cause_to_amalgamate = mkV2 (mkV "kombinerar") ;
		bunta_ihop_V2_Cause_to_amalgamate = mkV2 (partV (mkV "buntar") "ihop") ;
		korsa_V2_Cause_to_amalgamate = mkV2 (mkV "korsar") ;

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
		införliva_V2_Cause_to_be_included = mkV2 (mkV "införliva") ;
		infoga_V2_Cause_to_be_included = mkV2 (mkV "infogar") ;
		inlemma_V2_Cause_to_be_included = mkV2 (mkV "inlemmar") ;
		integrera_V2_Cause_to_be_included = mkV2 (mkV "integrerar") ;
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

		pingla_V2_Cause_to_make_noise = mkV2 (mkV "pinglar") ;
		spela_V2_Cause_to_make_noise = mkV2 (regV "spela") ;

		förbättra_V2_Cause_to_make_progress = mkV2 (mkV "förbättrar") ;
		förnya_V2_Cause_to_make_progress = mkV2 (mkV "förnya") ;
		modernisera_V2_Cause_to_make_progress = mkV2 (mkV "moderniserar") ;
		utveckla_V2_Cause_to_make_progress = mkV2 (mkV "utvecklar") ;
		öka_värdet_på_V2_Cause_to_make_progress = variants {} ;

		skaka_V2_Cause_to_move_in_place = mkV2 (mkV "skakar") ;
		vicka_V2_Cause_to_move_in_place = mkV2 (mkV "vickar") ;
		rotera_V2_Cause_to_move_in_place = mkV2 (mkV "roterar") ;

		förevisa_V2_Cause_to_perceive = mkV2 (mkV "förevisar") ;

		starta_om_V2_Cause_to_resume = mkV2 (partV (mkV "startar") "om") ;
		återuppliva_V2_Cause_to_resume = mkV2 (mkV "återuppliva") ;

		driva_fram_V2_Cause_to_start = mkV2 (partV (irregV "driva" "drev" "drivit") "fram") ;
		få_till_stånd_V2_Cause_to_start = variants {} ;
		tända_V2_Cause_to_start = mkV2 (mkV "tänder") ;
		provocera_fram_V2_Cause_to_start = mkV2 (partV (mkV "provocerar") "fram") ;

		uppväcka_V2_Cause_to_wake = mkV2 (mkV "uppväcker") ;
		väcka_V2_Cause_to_wake = mkV2 (mkV "väcker") ;
		återuppväcka_V2_Cause_to_wake = mkV2 (mkV "återuppväcker") ;

		bortgå_V_Ceasing_to_be = mkV "bortgå" "bortgick" "bortgått" ;
		dö_bort_V_Ceasing_to_be = partV (irregV "dö" "dog" "dött") "bort" ;
		dö_ut_V_Ceasing_to_be = partV (irregV "dö" "dog" "dött") "ut" ;
		försvinna_V_Ceasing_to_be = irregV "försvinna" "försvann" "försvunnit" ;
		gå_upp_i_rök_V_Ceasing_to_be = variants {} ;
		förgå_V2_Ceasing_to_be = mkV2 (mkV "förgå" "förgår" "förgå" "förgick" "förgått" "förgången") ;
		upplösa_V2_Ceasing_to_be = mkV2 (mkV "upplöser") ;

		tvivla_V_Certainty = mkV "tvivlar" ;
		tro_VS_Certainty = mkVS (mkV "tror") ;

		böja_av_V_Change_direction = partV (mkV "böja" "böjde" "böjt") "av" ;
		slå_V_Change_direction = irregV "slå" "slog" "slagit" ;
		svänga_V_Change_direction = mkV "svänger" ;
		ta_V_Change_direction = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		ta_av_V_Change_direction = partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "av" ;
		vända_V_Change_direction = irregV "vända" "vände" "vänt" ;
		ändra_kurs_V_Change_direction = variants {} ;

		förkorta_V2_Change_event_duration = mkV2 (mkV "förkorta") ;
		förlänga_V2_Change_event_duration = mkV2 (mkV "förlänger") ;
		fördröja_V2_Change_event_duration = mkV2 (mkV "fördröja" "fördröjde" "fördröjt") ;

		skjuta_upp_V2_Change_event_time = mkV2 (partV (irregV "skjuta" "skjöt" "skjutit") "upp") ;
		försena_V2_Change_event_time = mkV2 (mkV "försenar") ;

		gelea_sig_V_Change_of_consistency = reflV (mkV "gelear") ;
		skära_sig_V_Change_of_consistency = reflV (mkV "skära" "skär" "skär" "skar" "skurit" "skuren") ;
		stelna_V_Change_of_consistency = mkV "stelnar" ;
		tjockna_V_Change_of_consistency = mkV "tjocknar" ;

		upphöja_V2_Change_of_leadership = mkV2 (mkV "upphöja") ;
		fälla_V2_Change_of_leadership = mkV2 (mkV "fälla") ;

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

		anskaffa_V2_Change_of_quantity_of_possession = mkV2 (mkV "anskaffar") ;
		tappa_bort_V2_Change_of_quantity_of_possession = mkV2 (partV (mkV "tappa") "bort") ;

		knäppa_på_V2_Change_operational_state = mkV2 (partV (mkV "knäpper") "på") ;
		slå_av_V2_Change_operational_state = mkV2 (partV (irregV "slå" "slog" "slagit") "av") ;
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

		slå_sig_i_slang_V_Chatting = variants {} ;
		småprata_V_Chatting = mkV "småpratar" ;
		prata_V_Chatting = regV "prata" ;
		samtala_V_Chatting = mkV "samtalar" ;
		sladdra_V_Chatting = mkV "sladdrar" ;
		snacka_V_Chatting = mkV "snacka" ;

		dra_V2_Choosing = mkV2 (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") ;
		handplocka_V2_Choosing = mkV2 (mkV "handplockar") ;
		se_ut_V2_Choosing = mkV2 (partV (irregV "se" "såg" "sett") "ut") ;
		selektera_V2_Choosing = mkV2 (mkV "selekterar") ;
		toppa_V2_Choosing = mkV2 (mkV "toppar") ;
		välja_V2_Choosing = mkV2 (mkV "välja" "valde" "valt") ;
		välja_VV_Choosing = mkVV (mkV "välja" "valde" "valt") ;
		plocka_ut_V2_Choosing = mkV2 (partV (mkV "plockar") "ut") ;

		göra_anspråk_på_V2_Claim_ownership = variants {} ;
		muta_in_V2_Claim_ownership = mkV2 (partV (mkV "mutar") "in") ;

		borra_upp_V2_Closure = mkV2 (partV (mkV "borrar") "upp") ;
		bryta_upp_V2_Closure = mkV2 (partV (irregV "bryta" "bröt" "brutit") "upp") ;
		dyrka_upp_V2_Closure = mkV2 (partV (mkV "dyrkar") "upp") ;
		fälla_ut_V2_Closure = mkV2 (partV (mkV "fälla") "ut") ;
		nödöppna_V2_Closure = mkV2 (mkV "nödöppnar") ;
		skalka_V2_Closure = mkV2 (mkV "skalkar") ;
		slå_upp_V2_Closure = mkV2 (partV (irregV "slå" "slog" "slagit") "upp") ;
		ta_upp_V2_Closure = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "upp") ;
		tillsluta_V2_Closure = mkV2 (irregV "tillsluta" "tillslöt" "tillslutit") ;
		fästa_ihop_V2_Closure = mkV2 (partV (mkV "fästa" "fäster" "fäst" "fäste" "fäst" "fäst") "ihop") ;
		försegla_V2_Closure = mkV2 (mkV "förseglar") ;
		sabrera_V2_Closure = mkV2 (mkV "sabrerar") ;
		spärra_upp_V2_Closure = mkV2 (partV (mkV "spärrar") "upp") ;
		försluta_V2_Closure = mkV2 (mkV "försluta" "förslöt" "förslutit") ;
		korka_upp_V2_Closure = mkV2 (partV (mkV "korkar") "upp") ;

		grubbla_V_Cogitation = mkV "grubblar" ;
		tänka_V_Cogitation = mk2V "tänka" "tänkte" ;
		fråga_sig_VQ_Cogitation = mkVQ (reflV (regV "frågar")) ;
		tänka_över_VQ_Cogitation = mkVQ (partV (mk2V "tänka" "tänkte") "över") ;
		undra_VQ_Cogitation = mkVQ (regV "undra") ;
		tänka_VS_Cogitation = mkVS (mk2V "tänka" "tänkte") ;

		jobba_ihop_V_Collaboration = partV (mkV "jobbar") "ihop" ;
		kooperera_V_Collaboration = mkV "koopererar" ;
		medarbeta_V_Collaboration = mkV "medarbetar" ;
		samarbeta_V_Collaboration = mkV "samarbetar" ;
		samverka_V_Collaboration = mkV "samverkar" ;
		stå_i_maskopi_V_Collaboration = variants {} ;
		arbeta_ihop_V_Collaboration = partV (mkV "arbetar") "ihop" ;

		gadda_ihop_sig_V_Come_together = reflV (partV (mkV "gadda") "ihop") ;
		stöta_samman_V_Come_together = partV (mkV "stöter") "samman" ;
		församla_V2_Come_together = mkV2 (mkV "församlar") ;
		möta_V2_Come_together = mkV2 (mkV "möta") ;
		tränga_V2_Come_together = mkV2 (mkV "tränger") ;

		uppkomma_V_Coming_to_be = variants {} ;

		bestämma_V2_Coming_to_believe = mkV2 (mkV "bestämmer") ;
		finna_VS_Coming_to_believe = mkVS (irregV "finna" "fann" "funnit") ;
		tippa_VS_Coming_to_believe = mkVS (mkV "tippar") ;
		lära_sig_VV_Coming_to_believe = mkVV (reflV (mkV "lära" "lär" "lär" "lärde" "lärt" "lärd")) ;

		designa_V2_Coming_up_with = mkV2 (mkV "designa") ;
		dikta_ihop_V2_Coming_up_with = mkV2 (partV (mkV "diktar") "ihop") ;
		formulera_V2_Coming_up_with = mkV2 (mkV "formulerar") ;
		kläcka_V2_Coming_up_with = mkV2 (mkV "kläcka") ;
		koka_ihop_V2_Coming_up_with = mkV2 (partV (mkV "kokar") "ihop") ;
		sätta_ihop_V2_Coming_up_with = mkV2 (partV (irregV "sätta" "satte" "satt") "ihop") ;
		upprätta_V2_Coming_up_with = mkV2 (mkV "upprättar") ;

		fynda_V2_Commerce_buy = mkV2 (mkV "fyndar") ;
		handla_V2_Commerce_buy = mkV2 (mkV "handlar") ;
		köpa_V2_Commerce_buy = mkV2 (mk2V "köpa" "köpte") ;
		ropa_in_V2_Commerce_buy = mkV2 (partV (mkV "ropar") "in") ;

		överdebitera_V2_Commerce_collect = mkV2 (mkV "överdebiterar") ;

		betala_V2_Commerce_pay = mkV2 (mkV "betala") ;
		betala_för_kalaset_V2_Commerce_pay = variants {} ;
		delbetala_V2_Commerce_pay = variants {} ;
		ge_V2_Commerce_pay = mkV2 (irregV "ge" "gav" "givit") ;
		arvodera_V2_Commerce_pay = mkV2 (mkV "arvoderar") ;

		kränga_av_V_Commerce_sell = partV (mkV "kränger") "av" ;
		auktionera_bort_V2_Commerce_sell = mkV2 (partV (mkV "auktionerar") "bort") ;
		saluföra_V2_Commerce_sell = mkV2 (mkV "saluföra" "saluförde" "salufört") ;
		sälja_V2_Commerce_sell = mkV2 (irregV "sälja" "sålde" "sålt") ;
		avyttra_V2_Commerce_sell = mkV2 (mkV "avyttrar") ;

		anmäla_sig_V_Commitment = reflV (mkV "anmäla") ;
		avlägga_ämbetseden_V_Commitment = variants {} ;
		svära_sig_V_Commitment = reflV (mkV "svära" "svor" "svurit") ;
		svära_VS_Commitment = mkVS (mkV "svära" "svor" "svurit") ;
		utfästa_sig_VV_Commitment = mkVV (reflV (mkV "utfästa" "utfäster" "utfäst" "utfäste" "utfäst" "utfäst")) ;

		föröva_V2_Committing_crime = mkV2 (mkV "förövar") ;

		adressera_V2_Communication = mkV2 (mkV "adresserar") ;
		delge_V2_Communication = mkV2 (mkV "delge" "delger" "delge" "delgav" "delgett" "delgiven") ;
		meddela_V2_Communication = mkV2 (mkV "meddelar") ;
		ringa_in_V2_Communication = mkV2 (partV (mkV "ringa") "in") ;
		meddela_VS_Communication = mkVS (mkV "meddelar") ;

		babbla_V_Communication_manner = mkV "babblar" ;
		bryta_V_Communication_manner = irregV "bryta" "bröt" "brutit" ;
		orera_V_Communication_manner = mkV "orerar" ;
		pladdra_V_Communication_manner = mkV "pladdrar" ;
		sjunga_V_Communication_manner = irregV "sjunga" "sjöng" "sjungit" ;
		stamma_V_Communication_manner = mkV "stammar" ;
		tassla_V_Communication_manner = mkV "tasslar" ;
		tissla_V_Communication_manner = mkV "tisslar" ;
		viska_V_Communication_manner = mkV "viskar" ;
		artikulera_V2_Communication_manner = mkV2 (mkV "artikulerar") ;
		sjunga_V2_Communication_manner = mkV2 (irregV "sjunga" "sjöng" "sjungit") ;
		skråla_V2_Communication_manner = mkV2 (mkV "skrålar") ;

		faxa_V_Communication_means = mkV "faxar" ;
		messa_V_Communication_means = mkV "messar" ;
		ringa_V_Communication_means = mkV "ringa" ;
		emaila_V2_Communication_means = mkV2 (mkV "e-mailar") ;
		faxa_V2_Communication_means = mkV2 (mkV "faxar") ;
		ringa_upp_V2_Communication_means = mkV2 (partV (mkV "ringa") "upp") ;
		ringa_in_V2_Communication_means = mkV2 (partV (mkV "ringa") "in") ;

		hoa_V2_Communication_noise = mkV2 (mkV "hoar") ;
		skrika_V2_Communication_noise = mkV2 (irregV "skrika" "skrek" "skrikit") ;
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
		curla_V_Competition = mkV "curlar" ;
		konkurrera_V_Competition = mkV "konkurrerar" ;

		gnälla_V_Complaining = mkV "gnäller" ;
		gnöla_V_Complaining = mkV "gnölar" ;
		klaga_V_Complaining = mkV "klagar" ;
		lamentera_V_Complaining = mkV "lamenterar" ;
		älta_V2_Complaining = mkV2 (mkV "ältar") ;

		hålla_sig_V_Compliance = reflV (irregV "hålla" "höll" "hållit") ;
		följa_V2_Compliance = mkV2 (mkV "följa" "följde" "följt") ;
		överträda_V2_Compliance = mkV2 (mkV "överträda" "överträdde" "överträtt") ;

		bete_sig_V_Conduct = reflV (mkV "bete" "betedde" "betett") ;
		bära_sig_åt_V_Conduct = partV (reflV (irregV "bära" "bar" "burit")) "åt" ;
		uppföra_sig_V_Conduct = reflV (mkV "uppföra" "uppförde" "uppfört") ;
		vara_V_Conduct = mkV "vara" ;

		bemöta_V2_Confronting_problem = mkV2 (mkV "bemöter") ;
		konfrontera_V2_Confronting_problem = mkV2 (mkV "konfronterar") ;
		stå_inför_V2_Confronting_problem = mkV2 (partV (irregV "stå" "stod" "stått") "inför") ;

		falla_V_Conquering = irregV "falla" "föll" "fallit" ;
		annektera_V2_Conquering = mkV2 (mkV "annekterar") ;
		besätta_V2_Conquering = mkV2 (mkV "besätta" "besätter" "besätt" "besatte" "besatt" "besatt") ;
		erövra_V2_Conquering = mkV2 (mkV "erövrar") ;
		ta_i_besittning_V2_Conquering = variants {} ;

		kontakta_V2_Contacting = mkV2 (mkV "kontaktar") ;

		innehålla_V2_Containing = mkV2 (mkV "innehålla" "innehöll" "innehållit") ;
		rymma_V2_Containing = mkV2 (mkV "rymmer") ;

		bero_V_Contingency = mkV "bero" ;
		bero_på_V_Contingency = partV (mkV "bero") "på" ;
		komma_an_V_Contingency = partV (irregV "komma" "kom" "kommit") "an" ;

		känna_sig_skyldig_V_Contrition = variants {} ;

		accentuera_V2_Convey_importance = mkV2 (mkV "accentuerar") ;
		poängtera_V2_Convey_importance = mkV2 (mkV "poängterar") ;
		poängtera_VS_Convey_importance = mkVS (mkV "poängterar") ;

		koka_V_Cooking_creation = mkV "kokar" ;
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
		följa_V2_Cotheme = mkV2 (mkV "följa" "följde" "följt") ;
		leda_V2_Cotheme = mkV2 (mkV "leda" "ledde" "lett") ;
		eskortera_V2_Cotheme = mkV2 (mkV "eskorterar") ;

		korsförhöra_V2_Court_examination = mkV2 (mkV "korsförhöra" "korsförhörde" "korsförhört") ;

		dreja_V2_Create_physical_artwork = mkV2 (mkV "drejar") ;
		måla_V2_Create_physical_artwork = mkV2 (regV "måla") ;
		rita_V2_Create_physical_artwork = mkV2 (mkV "rita") ;
		teckna_V2_Create_physical_artwork = mkV2 (mkV "teckna") ;

		avbilda_V2_Create_representation = mkV2 (mkV "avbildar") ;
		avporträttera_V2_Create_representation = mkV2 (mkV "avporträtterar") ;
		måla_V2_Create_representation = mkV2 (regV "måla") ;
		måla_av_V2_Create_representation = mkV2 (partV (regV "måla") "av") ;
		porträttera_V2_Create_representation = mkV2 (mkV "porträtterar") ;
		smygfilma_V2_Create_representation = mkV2 (mkV "smygfilmar") ;
		mikrofilma_V2_Create_representation = mkV2 (mkV "mikrofilmar") ;

		frambringa_V2_Creating = mkV2 (mkV "frambringar") ;
		ge_V2_Creating = mkV2 (irregV "ge" "gav" "givit") ;
		skapa_V2_Creating = mkV2 (mkV "skapa") ;
		sätta_ihop_V2_Creating = mkV2 (partV (irregV "sätta" "satte" "satt") "ihop") ;

		undersöka_V2_Criminal_investigation = mkV2 (mkV "undersöker") ;
		utreda_V2_Criminal_investigation = mkV2 (mkV "utreda" "utredde" "utrett") ;

		beskära_V2_Cutting = mkV2 (mkV "beskära" "beskar" "beskurit") ;
		flänsa_V2_Cutting = mkV2 (mkV "flänsar") ;
		hacka_V2_Cutting = mkV2 (mkV "hackar") ;
		hugga_V2_Cutting = mkV2 (irregV "hugga" "högg" "huggit") ;
		hugga_ned_V2_Cutting = mkV2 (partV (irregV "hugga" "högg" "huggit") "ned") ;
		klippa_ner_V2_Cutting = mkV2 (partV (mkV "klipper") "ner") ;
		klyfta_V2_Cutting = mkV2 (mkV "klyftar") ;
		pincera_V2_Cutting = mkV2 (mkV "pincerar") ;
		skära_upp_V2_Cutting = mkV2 (partV (mkV "skära" "skär" "skär" "skar" "skurit" "skuren") "upp") ;
		snedskära_V2_Cutting = variants {} ;
		snida_V2_Cutting = mkV2 (mkV "snidar") ;
		snitta_V2_Cutting = mkV2 (mkV "snittar") ;
		sprätta_V2_Cutting = mkV2 (mkV "sprätta" "sprätter" "sprätt" "sprätte" "sprätt" "sprätt") ;
		sprätta_upp_V2_Cutting = mkV2 (partV (mkV "sprätta" "sprätter" "sprätt" "sprätte" "sprätt" "sprätt") "upp") ;
		sönderdela_V2_Cutting = mkV2 (mkV "sönderdelar") ;
		tillskära_V2_Cutting = mkV2 (mkV "tillskära" "tillskar" "tillskurit") ;
		toppa_V2_Cutting = mkV2 (mkV "toppar") ;
		tärna_V2_Cutting = mkV2 (mkV "tärnar") ;
		skiva_V2_Cutting = mkV2 (mkV "skivar") ;

		rista_V2_Damaging = mkV2 (mkV "ristar") ;
		vandalisera_V2_Damaging = mkV2 (mkV "vandaliserar") ;
		äta_V2_Damaging = mkV2 (irregV "äta" "åt" "ätit") ;

		våga_sig_på_V2_Daring = mkV2 (partV (reflV (mkV "vågar")) "på") ;
		ta_risken_VV_Daring = variants {} ;
		våga_sig_på_VV_Daring = mkVV (partV (reflV (mkV "vågar")) "på") ;

		avsomna_V_Death = mkV "avsomnar" ;
		dö_V_Death = irregV "dö" "dog" "dött" ;
		dö_bort_V_Death = partV (irregV "dö" "dog" "dött") "bort" ;
		dö_ut_V_Death = partV (irregV "dö" "dog" "dött") "ut" ;
		gå_bort_V_Death = partV (irregV "gå" "gick" "gått") "bort" ;
		insomna_V_Death = mkV "insomnar" ;
		omkomma_V_Death = variants {} ;
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
		annihilera_V2_Destroying = mkV2 (mkV "annihilerar") ;
		spränga_i_luften_V2_Destroying = variants {} ;
		tillintetgöra_V2_Destroying = mkV2 (mkV "tillintetgöra" "tillintetgjorde" "tillintetgjort") ;
		jämna_med_marken_V2_Destroying = variants {} ;

		kapa_av_V2_Detaching = mkV2 (partV (mkV "kapar") "av") ;
		lösgöra_V2_Detaching = mkV2 (mkV "lösgöra" "lösgjorde" "lösgjort") ;
		kapa_V2_Detaching = mkV2 (mkV "kapar") ;

		häkta_V2_Detaining = mkV2 (mkV "häktar") ;
		omhäkta_V2_Detaining = mkV2 (mkV "omhäktar") ;

		urskilja_V2_Differentiation = mkV2 (mkV "urskilja" "urskilde" "urskilt") ;
		skilja_åt_V2_Differentiation = mkV2 (partV (mkV "skilja" "skilde" "skilt") "åt") ;

		diskutera_V_Discussion = mkV "diskuterar" ;

		beströ_V2_Dispersal = mkV2 (mkV "beströr") ;
		sprida_ut_V2_Dispersal = mkV2 (partV (irregV "sprida" "spred" "spridit") "ut") ;

		utmärka_V2_Distinctiveness = mkV2 (mkV "utmärker") ;

		sidsteppa_V2_Dodging = mkV2 (mkV "sidsteppar") ;

		dominera_V2_Dominate_competitor = mkV2 (mkV "dominerar") ;

		dominera_V2_Dominate_situation = mkV2 (mkV "dominerar") ;

		förklä_sig_V_Dressing = variants {} ;
		klä_om_V_Dressing = partV (mkV "klä") "om" ;
		klä_på_sig_V_Dressing = reflV (partV (mkV "klä") "på") ;
		klä_sig_V_Dressing = reflV (mkV "klä") ;
		kostymera_sig_V_Dressing = reflV (mkV "kostymerar") ;
		skruda_sig_V_Dressing = reflV (mkV "skrudar") ;
		sätta_på_sig_V2_Dressing = mkV2 (reflV (partV (irregV "sätta" "satte" "satt") "på")) ;
		ta_på_sig_V2_Dressing = mkV2 (reflV (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "på")) ;

		smita_in_V_Drop_in_on = partV (irregV "smita" "smet" "smitit") "in" ;

		dippa_V2_Dunking = mkV2 (mkV "dippar") ;
		doppa_V2_Dunking = mkV2 (mkV "doppar") ;
		doppa_ner_V2_Dunking = mkV2 (partV (mkV "doppar") "ner") ;

		blåkopiera_V2_Duplication = mkV2 (mkV "blåkopierar") ;
		kopiera_V2_Duplication = mkV2 (mkV "kopierar") ;
		piratkopiera_V2_Duplication = variants {} ;

		hålla_i_sig_V_Duration_relation = reflV (partV (irregV "hålla" "höll" "hållit") "i") ;
		härda_ut_V_Duration_relation = partV (mkV "härdar") "ut" ;
		klara_sig_V_Duration_relation = reflV (mkV "klara") ;

		tjäna_V_Earnings_and_losses = mkV "tjänar" ;
		förlora_V2_Earnings_and_losses = mkV2 (regV "förlora") ;
		göra_V2_Earnings_and_losses = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		räkna_hem_V2_Earnings_and_losses = mkV2 (partV (regV "räkna") "hem") ;
		tjäna_V2_Earnings_and_losses = mkV2 (mkV "tjänar") ;

		avskärma_V_Eclipse = mkV "avskärmar" ;
		gömma_sig_V_Eclipse = reflV (mkV "gömma") ;
		blockera_V2_Eclipse = mkV2 (mkV "blockerar") ;
		skymma_V2_Eclipse = mkV2 (mkV "skymmer") ;
		förmörka_V2_Eclipse = mkV2 (mkV "förmörkar") ;

		studera_V_Education_teaching = mkV "studera" ;
		alfabetisera_V2_Education_teaching = mkV2 (mkV "alfabetiserar") ;
		bilda_V2_Education_teaching = mkV2 (mkV "bilda") ;
		lära_upp_V2_Education_teaching = mkV2 (partV (mkV "lära" "lär" "lär" "lärde" "lärt" "lärd") "upp") ;
		allmänbilda_V2_Education_teaching = mkV2 (mkV "allmänbildar") ;
		instruera_V2V_Education_teaching = mkV2V (mkV "instruerar") ;

		gäcka_V2_Elusive_goal = mkV2 (mkV "gäcka") ;

		komma_V_Emanating = irregV "komma" "kom" "kommit" ;
		ryka_V_Emanating = mkV "ryker" ;
		stråla_V_Emanating = mkV "strålar" ;

		ge_ifrån_sig_V2_Emitting = mkV2 (reflV (partV (irregV "ge" "gav" "givit") "ifrån")) ;
		utstråla_V2_Emitting = mkV2 (mkV "utstrålar") ;
		utsöndra_V2_Emitting = mkV2 (mkV "utsöndrar") ;

		bekymra_sig_V_Emotion_active = reflV (mkV "bekymrar") ;
		oroa_sig_V_Emotion_active = reflV (mkV "oroa") ;

		brinna_av_iver_V_Emotion_heat = variants {} ;
		koka_V_Emotion_heat = mkV "kokar" ;
		sjuda_V_Emotion_heat = irregV "sjuda" "sjöd" "sjudit" ;

		finna_nöje_V_Emotions_of_mental_activity = variants {} ;
		glädja_sig_V_Emotions_of_mental_activity = reflV (mkV "glädja" "gladde" "glatt") ;
		njuta_V_Emotions_of_mental_activity = irregV "njuta" "njöt" "njutit" ;

		anställa_V2_Employing = mkV2 (mkV "anställer") ;
		förordna_V2_Employing = mkV2 (mkV "förordna") ;

		frosta_V_Emptying = mkV "frostar" ;
		rensa_V_Emptying = mkV "rensa" ;
		avhumanisera_V2_Emptying = mkV2 (mkV "avhumaniserar") ;
		avindividualisera_V2_Emptying = variants {} ;
		avköna_V2_Emptying = mkV2 (mkV "avkönar") ;
		avlusa_V2_Emptying = mkV2 (mkV "avlusar") ;
		barka_V2_Emptying = mkV2 (mkV "barkar") ;
		dricka_ur_V2_Emptying = mkV2 (partV (irregV "dricka" "drack" "druckit") "ur") ;
		duka_av_V2_Emptying = mkV2 (partV (mkV "dukar") "av") ;
		kratsa_V2_Emptying = mkV2 (mkV "kratsar") ;
		kratsa_ut_V2_Emptying = mkV2 (partV (mkV "kratsar") "ut") ;
		kvista_V2_Emptying = mkV2 (mkV "kvistar") ;
		kvista_av_V2_Emptying = mkV2 (partV (mkV "kvistar") "av") ;
		lasta_ur_V2_Emptying = mkV2 (partV (mkV "lastar") "ur") ;
		mocka_V2_Emptying = mkV2 (mkV "mockar") ;
		plocka_V2_Emptying = mkV2 (mkV "plockar") ;
		skumtvätta_V2_Emptying = mkV2 (mkV "skumtvättar") ;
		skura_V2_Emptying = mkV2 (mkV "skurar") ;
		snöploga_V2_Emptying = mkV2 (mkV "snöplogar") ;
		tvätta_V2_Emptying = mkV2 (regV "tvätta") ;
		tömma_V2_Emptying = mkV2 (mkV "tömmer") ;
		ösa_V2_Emptying = mkV2 (mkV "öser") ;
		avbarka_V2_Emptying = mkV2 (mkV "avbarkar") ;
		avhorna_V2_Emptying = variants {} ;
		avintellektualisera_V2_Emptying = variants {} ;
		avnazifiera_V2_Emptying = mkV2 (mkV "avnazifierar") ;
		frosta_V2_Emptying = mkV2 (mkV "frostar") ;
		gälla_V2_Emptying = mkV2 (mkV "gäller") ;
		göra_ren_V2_Emptying = variants {} ;
		magpumpa_V2_Emptying = mkV2 (mkV "magpumpar") ;
		skura_av_V2_Emptying = mkV2 (partV (mkV "skurar") "av") ;
		skölja_V2_Emptying = mkV2 (mkV "skölja" "sköljde" "sköljt") ;

		formulera_sig_V_Encoding = reflV (mkV "formulerar") ;
		uttrycka_V_Encoding = mkV "uttrycker" ;
		formulera_V2_Encoding = mkV2 (mkV "formulerar") ;

		råka_V2_Encounter = mkV2 (mkV "råka") ;
		stöta_på_V2_Encounter = mkV2 (partV (mkV "stöter") "på") ;
		träffa_på_V2_Encounter = mkV2 (partV (mkV "träffar") "på") ;

		riskera_V2_Endangering = mkV2 (mkV "riskerar") ;
		vedervåga_V2_Endangering = mkV2 (mkV "vedervågar") ;
		sätta_för_fara_V2_Endangering = variants {} ;

		genomdriva_V2_Enforcing = mkV2 (irregV "genomdriva" "genomdrev" "genomdrivit") ;
		genomföra_V2_Enforcing = mkV2 (mkV "genomföra" "genomförde" "genomfört") ;
		tvinga_fram_V2_Enforcing = mkV2 (partV (irregV "tvinga" "tvang" "tvungit") "fram") ;

		förklara_sig_V_Entering_of_plea = reflV (mkV "förklarar") ;

		rymma_V_Escaping = mkV "rymmer" ;

		hålla_för_sannolikt_VS_Estimating = mkVS (partV (partV (irregV "hålla" "höll" "hållit") "för") "sannolikt") ;
		hållas_för_sannolikt_VS_Estimating = variants {} ;

		komma_undan_V_Evading = partV (irregV "komma" "kom" "kommit") "undan" ;
		slingra_sig_V_Evading = reflV (mkV "slingrar") ;
		gäcka_V2_Evading = mkV2 (mkV "gäcka") ;
		hålla_sig_undan_V2_Evading = mkV2 (partV (reflV (irregV "hålla" "höll" "hållit")) "undan") ;
		komma_undan_V2_Evading = mkV2 (partV (irregV "komma" "kom" "kommit") "undan") ;
		undkomma_V2_Evading = mkV2 (mkV "undkomma" "undkom" "undkommit") ;

		gå_upp_V_Evaluative_comparison = partV (irregV "gå" "gick" "gått") "upp" ;
		jämföra_sig_V_Evaluative_comparison = reflV (mkV "jämföra" "jämförde" "jämfört") ;
		mäta_sig_V_Evaluative_comparison = reflV (mkV "mäter") ;

		gå_V_Event = irregV "gå" "gick" "gått" ;
		gå_av_stapeln_V_Event = variants {} ;
		gå_fram_V_Event = partV (irregV "gå" "gick" "gått") "fram" ;
		inträffa_V_Event = mkV "inträffa" ;
		slå_in_V_Event = partV (irregV "slå" "slog" "slagit") "in" ;
		stå_V_Event = irregV "stå" "stod" "stått" ;
		vara_V_Event = mkV "vara" ;
		äga_rum_V_Event = variants {} ;

		bestyrka_V2_Evidence = mkV2 (mkV "bestyrker") ;
		påvisa_V2_Evidence = mkV2 (mkV "påvisar") ;
		styrka_V2_Evidence = mkV2 (mkV "styrker") ;
		bekräfta_VQ_Evidence = mkVQ (mkV "bekräfta") ;
		visa_VQ_Evidence = mkVQ (mkV "visar") ;
		visa_VS_Evidence = mkVS (mkV "visar") ;

		påminna_V2_Evoking = mkV2 (mkV "påminna" "påminde" "påmint") ;

		byta_V2_Exchange = mkV2 (mkV "byter") ;
		utväxla_V2_Exchange = mkV2 (mkV "utväxlar") ;

		exkommunicera_V2_Exclude_member = mkV2 (mkV "exkommunicerar") ;

		fisa_V_Excreting = variants {} ;
		snora_V_Excreting = mkV "snorar" ;
		svetta_V_Excreting = mkV "svettar" ;
		spy_V2_Excreting = mkV2 (mk2V "spy" "spydde") ;

		genomföra_V2_Execute_plan = mkV2 (mkV "genomföra" "genomförde" "genomfört") ;
		implementera_V2_Execute_plan = mkV2 (mkV "implementera") ;

		defenestrera_V2_Execution = variants {} ;
		dekapitera_V2_Execution = mkV2 (mkV "dekapiterar") ;
		avrätta_V2_Execution = mkV2 (mkV "avrättar") ;
		hänga_V2_Execution = mkV2 (mkV "hänger") ;

		existera_V_Existence = mkV "existera" ;
		finna_V2_Existence = mkV2 (irregV "finna" "fann" "funnit") ;

		ana_VQ_Expectation = mkVQ (mkV "ana") ;
		förutse_VS_Expectation = mkVS (mkV "förutse" "förutsåg" "förutsett") ;

		stå_V_Expensiveness = irregV "stå" "stod" "stått" ;

		bryta_V2_Experience_bodily_harm = mkV2 (irregV "bryta" "bröt" "brutit") ;
		skada_V2_Experience_bodily_harm = mkV2 (mkV "skadar") ;

		akta_sig_V_Experiencer_focus = reflV (mkV "akta") ;
		dampa_V_Experiencer_focus = mkV "dampar" ;
		hänga_läpp_V_Experiencer_focus = variants {} ;
		hänga_med_huvudet_V_Experiencer_focus = variants {} ;
		avguda_V2_Experiencer_focus = mkV2 (mkV "avgudar") ;
		älska_V2_Experiencer_focus = mkV2 (regV "älska") ;

		förblinda_V_Experiencer_obj = mkV "förblinda" ;
		lena_V_Experiencer_obj = mkV "lenar" ;
		slå_an_V_Experiencer_obj = partV (irregV "slå" "slog" "slagit") "an" ;
		smärta_V_Experiencer_obj = mkV "smärta" ;
		tillintetgöra_V_Experiencer_obj = mkV "tillintetgöra" "tillintetgjorde" "tillintetgjort" ;
		drabba_V2_Experiencer_obj = mkV2 (mkV "drabbar") ;
		egga_upp_V2_Experiencer_obj = mkV2 (partV (mkV "eggar") "upp") ;
		elda_V2_Experiencer_obj = mkV2 (mkV "eldar") ;
		engagera_V2_Experiencer_obj = mkV2 (mkV "engagera") ;
		fröjda_V2_Experiencer_obj = mkV2 (mkV "fröjdar") ;
		fånga_V2_Experiencer_obj = mkV2 (irregV "fånga" "fäng" "fångit") ;
		förgöra_V2_Experiencer_obj = mkV2 (mkV "förgöra" "förgjorde" "förgjort") ;
		golva_V2_Experiencer_obj = mkV2 (mkV "golvar") ;
		hetsa_upp_V2_Experiencer_obj = mkV2 (partV (mkV "hetsar") "upp") ;
		irritera_V2_Experiencer_obj = mkV2 (mkV "irriterar") ;
		jaga_upp_V2_Experiencer_obj = mkV2 (partV (regV "jaga") "upp") ;
		kittla_V2_Experiencer_obj = mkV2 (mkV "kittlar") ;
		lamslå_V2_Experiencer_obj = mkV2 (mkV "lamslå" "lamslog" "lamslagit") ;
		lugna_V2_Experiencer_obj = mkV2 (mkV "lugnar") ;
		passivisera_V2_Experiencer_obj = mkV2 (mkV "passiviserar") ;
		plåga_V2_Experiencer_obj = mkV2 (mkV "plågar") ;
		rubba_V2_Experiencer_obj = mkV2 (mkV "rubbar") ;
		röra_V2_Experiencer_obj = mkV2 (mkV "röra" "rörde" "rört") ;
		skaka_V2_Experiencer_obj = mkV2 (mkV "skakar") ;
		slå_ner_V2_Experiencer_obj = mkV2 (partV (irregV "slå" "slog" "slagit") "ner") ;
		stilla_V2_Experiencer_obj = mkV2 (mkV "stillar") ;
		reta_V2S_Experiencer_obj = mkV2S (mkV "reta") ;
		absorbera_V2_Experiencer_obj = mkV2 (mkV "absorberar") ;
		egga_V2_Experiencer_obj = mkV2 (mkV "eggar") ;
		frappera_VS_Experiencer_obj = mkVS (mkV "frapperar") ;

		förklara_VQ_Explaining_the_facts = mkVQ (mkV "förklarar") ;
		reda_ut_VQ_Explaining_the_facts = mkVQ (partV (mkV "reda" "redde" "rett") "ut") ;

		exportera_V2_Exporting = mkV2 (mkV "exporterar") ;

		klä_i_ord_V2_Expressing_publicly = variants {} ;
		lufta_V2_Expressing_publicly = mkV2 (mkV "luftar") ;
		ventilera_V2_Expressing_publicly = mkV2 (mkV "ventilerar") ;

		utlämna_V2_Extradition = mkV2 (mkV "utlämna") ;

		falla_i_sömn_V_Fall_asleep = variants {} ;
		slumra_till_V_Fall_asleep = partV (mkV "slumrar") "till" ;
		somna_V_Fall_asleep = mkV "somna" ;

		känna_V2_Familiarity = mkV2 (irregV "känna" "kände" "känt") ;
		känna_till_V2_Familiarity = mkV2 (partV (irregV "känna" "kände" "känt") "till") ;

		känna_sig_V_Feeling = reflV (irregV "känna" "kände" "känt") ;
		uppleva_V2_Feeling = mkV2 (mkV "upplever") ;

		simulera_V2_Feigning = mkV2 (mkV "simulerar") ;

		agna_V2_Filling = mkV2 (mkV "agnar") ;
		dubbelpanera_V2_Filling = variants {} ;
		fylla_V2_Filling = mkV2 (mkV "fyller") ;
		klä_V2_Filling = mkV2 (mkV "klä") ;
		lasta_V2_Filling = mkV2 (mkV "lastar") ;
		slå_in_V2_Filling = mkV2 (partV (irregV "slå" "slog" "slagit") "in") ;
		proppa_V2_Filling = mkV2 (mkV "proppa") ;
		stryka_V2_Filling = mkV2 (mkV "stryka" "strök" "strukit") ;
		anstryka_V2_Filling = mkV2 (mkV "anstryka" "anströk" "anstrukit") ;
		måla_över_V2_Filling = mkV2 (partV (regV "måla") "över") ;
		panera_V2_Filling = mkV2 (mkV "panerar") ;

		leda_V2_Finish_competition = mkV2 (mkV "leda" "ledde" "lett") ;
		vinna_V2_Finish_competition = mkV2 (irregV "vinna" "vann" "vunnit") ;

		förlora_V_Finish_game = regV "förlora" ;
		vinna_V_Finish_game = irregV "vinna" "vann" "vunnit" ;

		focka_V2_Firing = mkV2 (mkV "fockar") ;
		friställa_V2_Firing = mkV2 (mkV "friställer") ;
		kicka_V2_Firing = mkV2 (mkV "kickar") ;
		sparka_ut_V2_Firing = mkV2 (partV (mkV "sparkar") "ut") ;
		säga_upp_V2_Firing = mkV2 (partV (irregV "säga" "sade" "sagt") "upp") ;
		lasa_ut_V2_Firing = mkV2 (partV (mkV "lasar") "ut") ;
		massavskeda_V2_Firing = mkV2 (mkV "massavskedar") ;
		pensionera_V2_Firing = mkV2 (mkV "pensionerar") ;
		sjukpensionera_V2_Firing = variants {} ;

		skena_V_Fleeing = mkV "skenar" ;
		smita_iväg_V_Fleeing = partV (irregV "smita" "smet" "smitit") "iväg" ;
		fly_V_Fleeing = mkV "flyr" ;

		sippra_ur_V_Fluidic_motion = partV (mkV "sipprar") "ur" ;
		svämma_över_V_Fluidic_motion = partV (mkV "svämma") "över" ;
		cirkulera_V_Fluidic_motion = mkV "cirkulerar" ;
		flyta_fram_V_Fluidic_motion = partV (irregV "flyta" "flöt" "flutit") "fram" ;
		rinna_V_Fluidic_motion = irregV "rinna" "rann" "runnit" ;
		strömma_V_Fluidic_motion = mkV "strömmar" ;

		ha_förfalska_V2_Forging = variants {} ;

		avstå_V_Forgoing = mkV "avstå" "avstod" "avstått" ;
		låta_bli_VV_Forgoing = variants {} ;

		bryta_V_Forming_relationships = irregV "bryta" "bröt" "brutit" ;
		gifta_sig_V_Forming_relationships = reflV (mkV "gifter") ;
		göra_slut_V_Forming_relationships = partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "slut" ;
		äkta_V2_Forming_relationships = mkV2 (mkV "äktar") ;

		knirka_V_Friction = mkV "knirkar" ;
		skrapa_V_Friction = mkV "skrapar" ;

		hålla_masken_V_Front_for = variants {} ;

		slösa_bort_V2_Frugality = mkV2 (partV (mkV "slöser") "bort") ;

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
		teckna_VS_Gesture = mkVS (mkV "teckna") ;
		vinka_VS_Gesture = mkVS (mkV "vinkar") ;
		vinka_VV_Gesture = mkVV (mkV "vinkar") ;

		få_jobb_V_Get_a_job = variants {} ;
		mönstra_på_V_Get_a_job = partV (mkV "mönstrar") "på" ;
		ta_jobb_V_Get_a_job = variants {} ;
		ta_värvning_V_Get_a_job = variants {} ;

		anskaffa_V2_Getting = mkV2 (mkV "anskaffar") ;
		greja_V2_Getting = mkV2 (mkV "grejar") ;
		skaffa_fram_V2_Getting = mkV2 (partV (mkV "skaffa") "fram") ;
		skaffa_sig_V2_Getting = mkV2 (reflV (mkV "skaffa")) ;
		säkra_V2_Getting = mkV2 (mkV "säkrar") ;

		ge_sig_iväg_V_Getting_underway = partV (reflV (irregV "ge" "gav" "givit")) "iväg" ;
		ge_sig_ut_V_Getting_underway = partV (reflV (irregV "ge" "gav" "givit")) "ut" ;
		pallra_sig_V_Getting_underway = reflV (mkV "pallrar") ;

		stiga_upp_V_Getting_up = partV (irregV "stiga" "steg" "stigit") "upp" ;

		köra_ut_V2_Getting_vehicle_underway = mkV2 (partV (mkV "köra" "körde" "kört") "ut") ;

		allokera_V2_Giving = mkV2 (mkV "allokerar") ;
		anslå_V2_Giving = mkV2 (mkV "anslå" "anslog" "anslagit") ;
		donera_V2_Giving = mkV2 (mkV "donerar") ;
		ge_V2_Giving = mkV2 (irregV "ge" "gav" "givit") ;
		ägna_V2_Giving = mkV2 (mkV "ägna") ;

		falla_till_föga_V_Giving_in = partV (partV (irregV "falla" "föll" "fallit") "till") "föga" ;

		fälla_ihop_sig_V_Go_into_shape = reflV (partV (mkV "fälla") "ihop") ;
		krusa_sig_V_Go_into_shape = reflV (mkV "krusar") ;
		kröka_sig_V_Go_into_shape = reflV (mkV "kröka") ;
		locka_sig_V_Go_into_shape = reflV (mkV "lockar") ;
		rulla_ihop_sig_V_Go_into_shape = reflV (partV (mkV "rullar") "ihop") ;
		räta_sig_V_Go_into_shape = reflV (mkV "rätar") ;
		vecka_sig_V_Go_into_shape = reflV (mkV "veckar") ;
		vika_ihop_sig_V_Go_into_shape = reflV (partV (mkV "vika" "vek" "vikit") "ihop") ;

		backa_V_Going_back_on_a_commitment = mkV "backar" ;

		okeja_V2_Grant_permission = variants {} ;
		tillåta_V2_Grant_permission = mkV2 (irregV "tillåta" "tillät" "tillåtit") ;

		greppa_V2_Grasp = mkV2 (mkV "greppar") ;
		uppfatta_V2_Grasp = mkV2 (mkV "uppfattar") ;
		förstå_VQ_Grasp = mkVQ (mkV "förstå" "förstår" "förstå" "förstod" "förstått" "förstådd") ;

		krossa_V_Grinding = mkV "krossar" ;
		tugga_V_Grinding = mkV "tuggar" ;
		pulvrisera_V2_Grinding = mkV2 (mkV "pulvriserar") ;
		smula_sönder_V2_Grinding = mkV2 (partV (mkV "smular") "sönder") ;

		borsta_V_Grooming = mkV "borstar" ;
		tandtråda_V_Grooming = mkV "tandtrådar" ;
		bena_V2_Grooming = mkV2 (mkV "bena") ;
		borsta_V2_Grooming = mkV2 (mkV "borstar") ;
		kamma_ned_V2_Grooming = mkV2 (partV (mkV "kammar") "ned") ;
		locka_V2_Grooming = mkV2 (mkV "lockar") ;
		ondulera_V2_Grooming = mkV2 (mkV "ondulerar") ;
		permanenta_V2_Grooming = mkV2 (mkV "permanentar") ;
		permanentondulera_V2_Grooming = mkV2 (mkV "permanentondulerar") ;
		slätraka_V2_Grooming = mkV2 (mkV "slätrakar") ;
		tvätta_V2_Grooming = mkV2 (regV "tvätta") ;
		tvätta_av_V2_Grooming = mkV2 (partV (regV "tvätta") "av") ;
		två_V2_Grooming = mkV2 (mkV "tvår") ;
		vattenkamma_V2_Grooming = mkV2 (mkV "vattenkammar") ;
		vaxa_V2_Grooming = mkV2 (mkV "vaxar") ;
		raka_V2_Grooming = mkV2 (mkV "rakar") ;
		rykta_V2_Grooming = mkV2 (mkV "ryktar") ;
		tvaga_V2_Grooming = mkV2 (mkV "tvagar") ;

		avla_V2_Growing_food = mkV2 (mkV "avlar") ;
		föda_upp_V2_Growing_food = mkV2 (partV (mkV "föda" "födde" "fött") "upp") ;
		odla_V2_Growing_food = mkV2 (mkV "odlar") ;

		knollra_sig_V_Hair_configuration = reflV (mkV "knollrar") ;

		göra_halt_V_Halt = partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "halt" ;
		stanna_V_Halt = regV "stanna" ;
		stanna_till_V_Halt = partV (regV "stanna") "till" ;
		stanna_upp_V_Halt = partV (regV "stanna") "upp" ;

		kräva_V2_Have_as_requirement = mkV2 (mkV "kräver") ;

		kunna_översätta_V_Have_as_translation_equivalent = variants {} ;

		höra_V_Hear = mkV "höra" "hör" "hör" "hörde" "hört" "hörd" ;
		höra_V2_Hear = mkV2 (mkV "höra" "hör" "hör" "hörde" "hört" "hörd") ;
		höra_VS_Hear = mkVS (mkV "höra" "hör" "hör" "hörde" "hört" "hörd") ;

		proklamera_V2_Heralding = mkV2 (mkV "proklamerar") ;
		utbasunera_V2_Heralding = mkV2 (mkV "utbasunerar") ;

		dölja_V2_Hiding_objects = mkV2 (mkV "dölja" "dolde" "dolt") ;
		gömma_V2_Hiding_objects = mkV2 (mkV "gömma") ;
		maskera_V2_Hiding_objects = mkV2 (mkV "maskerar") ;
		skymma_V2_Hiding_objects = mkV2 (mkV "skymmer") ;

		hindra_V2_Hindering = mkV2 (mkV "hindrar") ;
		hämma_V2_Hindering = mkV2 (mkV "hämmar") ;

		leja_V2_Hiring = mkV2 (mkV "leja" "lejde" "lejt") ;

		skjuta_V2_Hit_target = mkV2 (irregV "skjuta" "skjöt" "skjutit") ;
		träffa_V2_Hit_target = mkV2 (mkV "träffar") ;

		dröja_med_VV_Holding_off_on = mkVV (partV (mkV "dröja") "med") ;
		vänta_med_VV_Holding_off_on = mkVV (partV (regV "vänta") "med") ;

		bråka_V_Hostile_encounter = mkV "bråkar" ;
		ryka_ihop_V_Hostile_encounter = partV (mkV "ryker") "ihop" ;
		ryka_samman_V_Hostile_encounter = partV (mkV "ryker") "samman" ;

		fiska_V_Hunting = mkV "fiska" ;
		jaga_V_Hunting = regV "jaga" ;
		pilka_V_Hunting = mkV "pilkar" ;

		fälla_V2_Hunting_success_or_failure = mkV2 (mkV "fälla") ;

		härma_V2_Imitating = mkV2 (mkV "härma") ;
		apa_efter_V2_Imitating = mkV2 (partV (mkV "apar") "efter") ;
		efterlikna_V2_Imitating = mkV2 (mkV "efterliknar") ;
		spela_V2_Imitating = mkV2 (regV "spela") ;

		bura_in_V2_Immobilization = mkV2 (partV (mkV "burar") "in") ;

		krocka_V_Impact = mkV "krockar" ;
		landa_V_Impact = mkV "landar" ;
		plöja_in_V_Impact = partV (mkV "plöja") "in" ;
		slå_V_Impact = irregV "slå" "slog" "slagit" ;
		slå_ner_V_Impact = partV (irregV "slå" "slog" "slagit") "ner" ;
		smattra_V_Impact = mkV "smattrar" ;
		snärta_V_Impact = mkV "snärtar" ;
		ta_V_Impact = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		däcka_V2_Impact = mkV2 (mkV "däckar") ;
		ramma_V2_Impact = mkV2 (mkV "rammar") ;
		träffa_V2_Impact = mkV2 (mkV "träffar") ;

		ha_V2_Inclusion = mkV2 (mkV "ha" "har" "ha" "hade" "haft" "havd") ;
		inkludera_V2_Inclusion = mkV2 (mkV "inkluderar") ;
		omfatta_V2_Inclusion = mkV2 (mkV "omfatta") ;
		uppta_V2_Inclusion = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		ge_V2_Indicating = mkV2 (irregV "ge" "gav" "givit") ;
		namnge_V2_Indicating = mkV2 (mkV "namnge" "namnger" "namnge" "namngav" "namngett" "namngiven") ;
		peka_ut_V2_Indicating = mkV2 (partV (mkV "peka") "ut") ;
		lista_V2_Indicating = mkV2 (mkV "listar") ;

		använda_sig_V_Ingest_substance = reflV (mkV "använder") ;
		röka_ner_sig_V_Ingest_substance = reflV (partV (mkV "röker") "ner") ;
		smygröka_V_Ingest_substance = mkV "smygröker" ;
		tjuvröka_V_Ingest_substance = mkV "tjuvröker" ;
		röka_V2_Ingest_substance = mkV2 (mkV "röker") ;
		använda_V2_Ingest_substance = mkV2 (mkV "använder") ;
		bruka_V2_Ingest_substance = mkV2 (mkV "brukar") ;
		kedjeröka_V2_Ingest_substance = mkV2 (mkV "kedjeröker") ;
		sniffa_V2_Ingest_substance = mkV2 (mkV "sniffar") ;
		snorta_V2_Ingest_substance = mkV2 (mkV "snortar") ;
		ta_V2_Ingest_substance = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
		inta_V2_Ingest_substance = mkV2 (mkV "inta" "intar" "inta" "intog" "intagit" "intagen") ;

		dinera_V_Ingestion = mkV "dinerar" ;
		frukostera_V_Ingestion = mkV "frukosterar" ;
		fukta_strupen_V_Ingestion = variants {} ;
		gnaga_V_Ingestion = mkV "gnager" ;
		hugga_in_V_Ingestion = partV (irregV "hugga" "högg" "huggit") "in" ;
		idissla_V_Ingestion = mkV "idisslar" ;
		knapra_V_Ingestion = mkV "knaprar" ;
		proppa_i_sig_V_Ingestion = reflV (partV (mkV "proppa") "i") ;
		smälla_i_sig_V_Ingestion = reflV (partV (mkV "smälla" "small" "smäll") "i") ;
		supera_V_Ingestion = mkV "superar" ;
		sällskapsäta_V_Ingestion = mkV "sällskapsäta" "sällskapsåt" "sällskapsätit" ;
		äta_V_Ingestion = irregV "äta" "åt" "ätit" ;
		dricka_V_Ingestion = irregV "dricka" "drack" "druckit" ;
		dia_V2_Ingestion = mkV2 (mkV "diar") ;
		dricka_V2_Ingestion = mkV2 (irregV "dricka" "drack" "druckit") ;
		ha_V2_Ingestion = mkV2 (mkV "ha" "har" "ha" "hade" "haft" "havd") ;
		kasta_i_sig_V2_Ingestion = mkV2 (reflV (partV (regV "kasta") "i")) ;
		skåpäta_V2_Ingestion = variants {} ;
		snaska_V2_Ingestion = mkV2 (mkV "snaskar") ;
		äta_V2_Ingestion = mkV2 (irregV "äta" "åt" "ätit") ;
		inta_V2_Ingestion = mkV2 (mkV "inta" "intar" "inta" "intog" "intagit" "intagen") ;

		fjättra_V_Inhibit_movement = mkV "fjättra" ;
		hålla_fast_V2_Inhibit_movement = mkV2 (partV (irregV "hålla" "höll" "hållit") "fast") ;
		kvarhålla_V2_Inhibit_movement = mkV2 (mkV "kvarhålla" "kvarhöll" "kvarhållit") ;
		uppehålla_V2_Inhibit_movement = mkV2 (mkV "uppehålla" "uppehöll" "uppehållit") ;

		mönstra_V2_Inspecting = mkV2 (mkV "mönstrar") ;
		titta_till_V2_Inspecting = mkV2 (partV (regV "titta") "till") ;
		visitera_V2_Inspecting = mkV2 (mkV "visiterar") ;

		installera_V2_Installing = mkV2 (mkV "installerar") ;

		hospitalisera_V2_Institutionalization = mkV2 (mkV "hospitaliserar") ;

		gena_V_Intentional_traversing = mkV "genar" ;
		vada_V_Intentional_traversing = mkV "vadar" ;
		bestiga_V2_Intentional_traversing = mkV2 (irregV "bestiga" "besteg" "bestigit") ;

		göra_V_Intentionally_affect = mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord" ;

		bilda_V2_Intentionally_create = mkV2 (mkV "bilda") ;
		ge_V2_Intentionally_create = mkV2 (irregV "ge" "gav" "givit") ;
		göra_V2_Intentionally_create = mkV2 (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") ;
		kreera_V2_Intentionally_create = mkV2 (mkV "kreerar") ;

		fånga_upp_V2_Intercepting = mkV2 (partV (irregV "fånga" "fäng" "fångit") "upp") ;
		snappa_upp_V2_Intercepting = mkV2 (partV (mkV "snappar") "upp") ;

		ajournera_V2_Interrupt_process = mkV2 (mkV "ajournerar") ;
		avbryta_V2_Interrupt_process = mkV2 (irregV "avbryta" "avbröt" "avbrutit") ;

		invadera_V_Invading = mkV "invaderar" ;
		invadera_V2_Invading = mkV2 (mkV "invaderar") ;

		beundra_V2_Judgment = mkV2 (mkV "beundrar") ;

		ta_avstånd_V_Judgment_communication = variants {} ;
		anklaga_V2_Judgment_communication = mkV2 (mkV "anklagar") ;
		svartmåla_V2_Judgment_communication = mkV2 (mkV "svartmålar") ;

		gräla_på_V2_Judgment_direct_address = mkV2 (partV (mkV "gräla") "på") ;
		komplimentera_V2_Judgment_direct_address = mkV2 (mkV "komplimenterar") ;
		tillrättavisa_V2_Judgment_direct_address = mkV2 (mkV "tillrättavisar") ;
		tala_till_rätta_V2_Judgment_direct_address = variants {} ;
		förebrå_V2_Judgment_direct_address = mkV2 (mkV "förebrår") ;

		försvara_V2_Justifying = mkV2 (mkV "försvara") ;
		rättfärdiga_V2_Justifying = mkV2 (mkV "rättfärdigar") ;

		kidnappa_V2_Kidnapping = mkV2 (mkV "kidnappar") ;

		dränka_V2_Killing = mkV2 (mkV "dränker") ;
		gasa_V2_Killing = mkV2 (mkV "gasar") ;
		döda_V2_Killing = mkV2 (regV "döda") ;
		slå_ihjäl_V2_Killing = mkV2 (partV (irregV "slå" "slog" "slagit") "ihjäl") ;

		knyta_V2_Knot_creation = mkV2 (irregV "knyta" "knöt" "knutit") ;

		kalla_V2_Labeling = mkV2 (mkV "kalla") ;

		lansera_V2_Launch_process = mkV2 (mkV "lanserar") ;
		sjösätta_V2_Launch_process = mkV2 (mkV "sjösätta" "sjösatte" "sjösatt") ;

		leda_V2_Leadership = mkV2 (mkV "leda" "ledde" "lett") ;
		regera_V2_Leadership = mkV2 (mkV "regerar") ;
		styra_V2_Leadership = mkV2 (mkV "styra" "styrde" "styrt") ;

		betyda_V2_Linguistic_meaning = mkV2 (mkV "betyda" "betydde" "betytt") ;

		krylla_V_Lively_place = mkV "kryllar" ;

		finna_V2_Locating = mkV2 (irregV "finna" "fann" "funnit") ;
		hitta_V2_Locating = mkV2 (mkV "hitta") ;

		blinka_V_Location_of_light = mkV "blinkar" ;
		lysa_V_Location_of_light = mkV "lysa" ;
		skimra_V_Location_of_light = mkV "skimrar" ;

		omge_V2_Locative_relation = mkV2 (mkV "omge" "omger" "omge" "omgav" "omgett" "omgiven") ;

		bli_av_med_V2_Losing = mkV2 (partV (partV (irregV "bli" "blev" "blivit") "av") "med") ;
		tappa_V2_Losing = mkV2 (mkV "tappa") ;
		tappa_bort_V2_Losing = mkV2 (partV (mkV "tappa") "bort") ;

		förlora_V2_Losing_someone = mkV2 (regV "förlora") ;
		mista_V2_Losing_someone = mkV2 (mkV "mista" "mister" "mist" "mistade" "mist" "mistad") ;

		ingå_fred_V_Make_agreement_on_action = variants {} ;
		komma_V_Make_agreement_on_action = irregV "komma" "kom" "kommit" ;
		komma_överens_V_Make_agreement_on_action = partV (irregV "komma" "kom" "kommit") "överens" ;
		sluta_avtal_V_Make_agreement_on_action = variants {} ;
		sluta_fred_V_Make_agreement_on_action = variants {} ;

		associera_V2_Make_cognitive_connection = mkV2 (mkV "associera") ;
		hänga_ihop_V2_Make_cognitive_connection = mkV2 (partV (mkV "hänger") "ihop") ;
		sammankoppla_V2_Make_cognitive_connection = mkV2 (mkV "sammankopplar") ;

		mala_på_V_Make_noise = partV (mkV "maler") "på" ;
		ge_V2_Make_noise = mkV2 (irregV "ge" "gav" "givit") ;
		säga_V2_Make_noise = mkV2 (irregV "säga" "sade" "sagt") ;

		möjliggöra_V2_Make_possible_to_do = mkV2 (mkV "möjliggöra" "möjliggjorde" "möjliggjort") ;
		tillåta_V2_Make_possible_to_do = mkV2 (irregV "tillåta" "tillät" "tillåtit") ;
		möjliggöra_VS_Make_possible_to_do = mkVS (mkV "möjliggöra" "möjliggjorde" "möjliggjort") ;
		tillåta_VS_Make_possible_to_do = mkVS (irregV "tillåta" "tillät" "tillåtit") ;

		dra_på_smilbanden_V_Making_faces = variants {} ;
		flina_V_Making_faces = mkV "flinar" ;
		grimasera_V_Making_faces = mkV "grimaserar" ;
		hånle_V_Making_faces = mkV "hånle" "hånlog" "hånlett" ;

		manipulera_V2_Manipulate_into_doing = mkV2 (mkV "manipulerar") ;

		forma_V2_Manipulate_into_shape = mkV2 (mkV "formar") ;
		modellera_V2_Manipulate_into_shape = mkV2 (mkV "modellerar") ;

		gno_V_Manipulation = mkV "gnor" ;
		nudda_V_Manipulation = mkV "nuddar" ;
		ta_V_Manipulation = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		gnussa_V2_Manipulation = mkV2 (mkV "gnussar") ;
		gripa_V2_Manipulation = mkV2 (irregV "gripa" "grep" "gripit") ;
		hålla_V2_Manipulation = mkV2 (irregV "hålla" "höll" "hållit") ;
		smeka_V2_Manipulation = mkV2 (mkV "smeker") ;
		topsa_V2_Manipulation = mkV2 (mkV "topsar") ;

		framställa_V2_Manufacturing = mkV2 (mkV "framställer") ;

		bre_ut_sig_V_Mass_motion = variants {} ;
		sprida_ut_sig_V_Mass_motion = reflV (partV (irregV "sprida" "spred" "spridit") "ut") ;
		vimla_V_Mass_motion = mkV "vimlar" ;
		välla_fram_V_Mass_motion = partV (mkV "väller") "fram" ;
		vältra_fram_V_Mass_motion = partV (mkV "vältra") "fram" ;
		tränga_sig_V_Mass_motion = reflV (mkV "tränger") ;
		hagla_V_Mass_motion = mkV "haglar" ;
		strömma_V_Mass_motion = mkV "strömmar" ;
		välla_in_V_Mass_motion = partV (mkV "väller") "in" ;
		välla_upp_V_Mass_motion = partV (mkV "väller") "upp" ;

		fullgöra_V2_Meet_specifications = mkV2 (mkV "fullgöra" "fullgjorde" "fullgjort") ;
		utföra_V2_Meet_specifications = mkV2 (mkV "utföra" "utförde" "utfört") ;
		hålla_V2_Meet_specifications = mkV2 (irregV "hålla" "höll" "hållit") ;
		tillmötesgå_V2_Meet_specifications = mkV2 (mkV "tillmötesgå" "tillmötesgick" "tillmötesgått") ;
		uppfylla_V2_Meet_specifications = mkV2 (mkV "uppfyller") ;

		träffa_V2_Meet_with = mkV2 (mkV "träffar") ;

		möta_V2_Meet_with_response = mkV2 (mkV "möta") ;
		ta_V2_Meet_with_response = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
		uppta_V2_Meet_with_response = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		lägga_på_minnet_V2_Memorization = variants {} ;
		lära_sig_V2_Memorization = mkV2 (reflV (mkV "lära" "lär" "lär" "lärde" "lärt" "lärd")) ;
		memorera_V2_Memorization = mkV2 (mkV "memorerar") ;
		memorera_in_V2_Memorization = mkV2 (partV (mkV "memorerar") "in") ;

		komma_ihåg_V2_Memory = mkV2 (partV (irregV "komma" "kom" "kommit") "ihåg") ;
		glömma_VS_Memory = mkVS (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") ;
		hålla_i_minnet_VS_Memory = variants {} ;

		nämna_V2_Mention = mkV2 (mkV "nämner") ;
		nämna_VS_Mention = mkVS (mkV "nämner") ;

		synda_V_Misdeed = mkV "syndar" ;

		asa_V_Motion = mkV "asar" ;
		curla_V_Motion = mkV "curlar" ;
		driva_bort_V_Motion = partV (irregV "driva" "drev" "drivit") "bort" ;
		gå_V_Motion = irregV "gå" "gick" "gått" ;
		halka_V_Motion = mkV "halkar" ;
		orma_V_Motion = mkV "ormar" ;
		sladda_V_Motion = mkV "sladdar" ;
		leda_V_Motion = mkV "leda" "ledde" "lett" ;
		spela_V_Motion = regV "spela" ;

		slå_över_V_Motion_directional = partV (irregV "slå" "slog" "slagit") "över" ;
		stiga_upp_V_Motion_directional = partV (irregV "stiga" "steg" "stigit") "upp" ;
		trilla_V_Motion_directional = mkV "trillar" ;
		störta_V_Motion_directional = mkV "störtar" ;

		svirra_V_Motion_noise = mkV "svirrar" ;
		svischa_V_Motion_noise = mkV "svischar" ;
		tuffa_V_Motion_noise = mkV "tuffar" ;
		vina_V_Motion_noise = irregV "vina" "ven" "vinit" ;
		slamra_V2_Motion_noise = mkV2 (mkV "slamrar") ;

		dallra_V_Moving_in_place = mkV "dallrar" ;
		kränga_V_Moving_in_place = mkV "kränger" ;
		orma_sig_V_Moving_in_place = reflV (mkV "ormar") ;
		slå_V_Moving_in_place = irregV "slå" "slog" "slagit" ;
		slå_runt_V_Moving_in_place = partV (irregV "slå" "slog" "slagit") "runt" ;
		sno_runt_V_Moving_in_place = partV (mkV "snor") "runt" ;
		svänga_V_Moving_in_place = mkV "svänger" ;
		vicka_V_Moving_in_place = mkV "vickar" ;
		vända_sig_V_Moving_in_place = reflV (irregV "vända" "vände" "vänt") ;

		döpa_V2_Name_conferral = mkV2 (mkV "döpa") ;
		döpa_om_V2_Name_conferral = mkV2 (partV (mkV "döpa") "om") ;
		dubba_V2_Name_conferral = mkV2 (mkV "dubbar") ;

		behöva_V2_Needing = mkV2 (mkV "behöver") ;

		anmäla_V2_Notification_of_charges = mkV2 (mkV "anmäla") ;
		åtala_V2_Notification_of_charges = mkV2 (mkV "åtalar") ;

		sönderfalla_V_Nuclear_process = mkV "sönderfalla" "sönderföll" "sönderfallit" ;
		ansamla_V2_Nuclear_process = mkV2 (mkV "ansamlar") ;
		smälta_samman_V2_Nuclear_process = mkV2 (partV (mkV "smälta" "smälter" "smält" "smälte" "smält" "smält") "samman") ;

		visa_sig_V_Obviousness = reflV (mkV "visar") ;

		toppa_V_Occupy_rank = mkV "toppar" ;

		erbjuda_V2_Offering = mkV2 (irregV "erbjuda" "erbjöd" "erbjudit") ;

		båda_V_Omen = mkV "bådar" ;
		bebåda_V2_Omen = mkV2 (mkV "bebådar") ;
		förutspå_V2_Omen = mkV2 (mkV "förutspå") ;

		cykla_V_Operate_vehicle = mkV "cyklar" ;
		köra_V_Operate_vehicle = mkV "köra" "körde" "kört" ;
		rida_V_Operate_vehicle = irregV "rida" "red" "ridit" ;
		skejta_V_Operate_vehicle = mkV "skejtar" ;
		hoja_V_Operate_vehicle = mkV "hojar" ;
		paddla_V_Operate_vehicle = mkV "paddlar" ;

		driva_V2_Operating_a_system = mkV2 (irregV "driva" "drev" "drivit") ;
		förvalta_V2_Operating_a_system = mkV2 (mkV "förvaltar") ;
		handha_V2_Operating_a_system = variants {} ;
		operera_V2_Operating_a_system = mkV2 (mkV "operera") ;

		pröva_V2_Operational_testing = mkV2 (mkV "prövar") ;
		testa_V2_Operational_testing = mkV2 (mkV "testar") ;

		anse_VS_Opinion = mkVS (mkV "anse" "ansåg" "ansett") ;
		tycka_VS_Opinion = mkVS (mk2V "tycka" "tyckte") ;

		emanera_V_Origin = mkV "emanerar" ;
		komma_V_Origin = irregV "komma" "kom" "kommit" ;

		sympatisera_V_Others_situation_as_stimulus = mkV "sympatiserar" ;
		tycka_synd_V_Others_situation_as_stimulus = partV (mk2V "tycka" "tyckte") "synd" ;
		känna_med_V2_Others_situation_as_stimulus = mkV2 (partV (irregV "känna" "kände" "känt") "med") ;

		benåda_V2_Pardon = mkV2 (mkV "benådar") ;

		gynna_V2_Partiality = mkV2 (mkV "gynna") ;

		röra_sig_V_Participation = reflV (mkV "röra" "rörde" "rört") ;

		gå_V_Path_shape = irregV "gå" "gick" "gått" ;
		slingra_sig_V_Path_shape = reflV (mkV "slingrar") ;
		stiga_V_Path_shape = irregV "stiga" "steg" "stigit" ;
		svänga_V_Path_shape = mkV "svänger" ;
		löpa_V_Path_shape = mkV "löpa" ;
		korsa_V2_Path_shape = mkV2 (mkV "korsar") ;

		kisa_V_Perception_active = mkV "kisar" ;
		se_på_V_Perception_active = partV (irregV "se" "såg" "sett") "på" ;
		titta_V_Perception_active = regV "titta" ;
		titta_på_V_Perception_active = partV (regV "titta") "på" ;
		fästa_blicken_V_Perception_active = variants {} ;
		lukta_V_Perception_active = regV "lukta" ;
		se_V_Perception_active = irregV "se" "såg" "sett" ;
		avlyssna_V2_Perception_active = mkV2 (mkV "avlyssnar") ;
		betrakta_V2_Perception_active = mkV2 (mkV "betraktar") ;
		beundra_V2_Perception_active = mkV2 (mkV "beundrar") ;
		känna_V2_Perception_active = mkV2 (irregV "känna" "kände" "känt") ;
		observera_V2_Perception_active = mkV2 (mkV "observera") ;
		åse_V2_Perception_active = mkV2 (mkV "åse" "åsåg" "åsett") ;

		hugga_V_Perception_body = irregV "hugga" "högg" "huggit" ;
		kittla_V_Perception_body = mkV "kittlar" ;
		sticka_V_Perception_body = irregV "sticka" "stack" "stuckit" ;
		göra_ont_V_Perception_body = partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "ont" ;
		värka_V_Perception_body = mkV "värker" ;

		känna_V2_Perception_experience = mkV2 (irregV "känna" "kände" "känt") ;
		se_V2_Perception_experience = mkV2 (irregV "se" "såg" "sett") ;
		skönja_V2_Perception_experience = mkV2 (mkV "skönja" "skönjde" "skönjt") ;
		urskönja_V2_Perception_experience = mkV2 (mkV "urskönja" "urskönjde" "urskönjt") ;
		återse_V2_Perception_experience = mkV2 (mkV "återse" "återsåg" "återsett") ;
		bevittna_VQ_Perception_experience = mkVQ (mkV "bevittnar") ;
		beskåda_V2_Perception_experience = mkV2 (mkV "beskådar") ;
		syna_V2_Perception_experience = mkV2 (mkV "syna") ;

		uppträda_ihop_V_Performers_and_roles = partV (mkV "uppträda" "uppträdde" "uppträtt") "ihop" ;
		spela_V2_Performers_and_roles = mkV2 (regV "spela") ;
		framträda_V2_Performers_and_roles = mkV2 (mkV "framträda" "framträdde" "framträtt") ;

		medge_V2_Permitting = mkV2 (mkV "medge" "medger" "medge" "medgav" "medgett" "medgiven") ;
		sanktionera_V2_Permitting = mkV2 (mkV "sanktionerar") ;
		tillåta_V2_Permitting = mkV2 (irregV "tillåta" "tillät" "tillåtit") ;

		flörta_V_Personal_relationship = mkV "flörtar" ;
		ha_ihop_det_V_Personal_relationship = variants {} ;
		sammanbo_V_Personal_relationship = mkV "sammanbor" ;
		adoptera_V2_Personal_relationship = mkV2 (mkV "adoptera") ;
		dejta_V2_Personal_relationship = mkV2 (mkV "dejtar") ;
		kurtisera_V2_Personal_relationship = mkV2 (mkV "kurtiserar") ;

		kapa_V2_Piracy = mkV2 (mkV "kapar") ;
		uppbringa_V2_Piracy = mkV2 (mkV "uppbringar") ;

		ge_tyngd_V_Place_weight_on = variants {} ;
		lägga_tyngden_V_Place_weight_on = variants {} ;

		adressera_V2_Placing = mkV2 (mkV "adresserar") ;
		burka_V2_Placing = mkV2 (mkV "burkar") ;
		dra_V2_Placing = mkV2 (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") ;
		lasta_V2_Placing = mkV2 (mkV "lastar") ;
		packa_V2_Placing = mkV2 (mkV "packar") ;
		packa_in_V2_Placing = mkV2 (partV (mkV "packar") "in") ;
		packa_ner_V2_Placing = mkV2 (partV (mkV "packar") "ner") ;
		parkera_V2_Placing = mkV2 (mkV "parkerar") ;
		placera_V2_Placing = mkV2 (mkV "placera") ;
		slå_V2_Placing = mkV2 (irregV "slå" "slog" "slagit") ;
		stoppa_V2_Placing = mkV2 (mkV "stoppar") ;
		tvinga_ned_V2_Placing = mkV2 (partV (irregV "tvinga" "tvang" "tvungit") "ned") ;
		toppa_V2_Placing = mkV2 (mkV "toppar") ;
		förlägga_V2_Placing = mkV2 (mkV "förlägga" "förlade" "förlagt") ;
		lokalisera_V2_Placing = mkV2 (mkV "lokaliserar") ;
		packa_om_V2_Placing = mkV2 (partV (mkV "packar") "om") ;
		stationera_V2_Placing = mkV2 (mkV "stationerar") ;
		utlokalisera_V2_Placing = mkV2 (mkV "utlokaliserar") ;

		plantera_V2_Planting = mkV2 (mkV "planterar") ;
		sätta_V2_Planting = mkV2 (irregV "sätta" "satte" "satt") ;
		så_V2_Planting = mkV2 (mkV "sår") ;
		återplantera_V2_Planting = mkV2 (mkV "återplanterar") ;
		odla_V2_Planting = mkV2 (mkV "odlar") ;

		framställa_sig_V2_Posing_as = mkV2 (reflV (mkV "framställer")) ;

		ha_V2_Possession = mkV2 (mkV "ha" "har" "ha" "hade" "haft" "havd") ;
		sakna_V2_Possession = mkV2 (mkV "saknar") ;

		huka_sig_V_Posture = reflV (mkV "huka") ;
		kuta_V_Posture = mkV "kutar" ;
		ligga_V_Posture = irregV "ligga" "låg" "legat" ;
		luta_V_Posture = mkV "lutar" ;
		luta_sig_V_Posture = reflV (mkV "lutar") ;
		sitta_V_Posture = irregV "sitta" "satt" "suttit" ;
		sitta_ner_V_Posture = partV (irregV "sitta" "satt" "suttit") "ner" ;
		stå_V_Posture = irregV "stå" "stod" "stått" ;
		stå_upp_V_Posture = partV (irregV "stå" "stod" "stått") "upp" ;
		sätta_sig_V_Posture = reflV (irregV "sätta" "satte" "satt") ;
		sätta_sig_upp_V_Posture = partV (reflV (irregV "sätta" "satte" "satt")) "upp" ;

		repa_V_Practice = mkV "repar" ;
		repa_in_V_Practice = partV (mkV "repar") "in" ;
		repetera_V_Practice = mkV "repeterar" ;
		yoga_V_Practice = mkV "yogar" ;
		öva_V_Practice = mkV "övar" ;
		repa_in_V2_Practice = mkV2 (partV (mkV "repar") "in") ;
		träna_V2_Practice = mkV2 (mkV "tränar") ;
		träna_upp_V2_Practice = mkV2 (partV (mkV "tränar") "upp") ;
		öva_in_V2_Practice = mkV2 (partV (mkV "övar") "in") ;
		öva_upp_V2_Practice = mkV2 (partV (mkV "övar") "upp") ;

		regna_floder_V_Precipitation = variants {} ;
		snöa_V_Precipitation = mkV "snöar" ;

		förutspå_V2_Predicting = mkV2 (mkV "förutspå") ;
		prognostisera_V2_Predicting = mkV2 (mkV "prognostiserar") ;
		spå_V2_Predicting = mkV2 (mkV "spår") ;
		förutspå_VQ_Predicting = mkVQ (mkV "förutspå") ;
		spå_VS_Predicting = mkVS (mkV "spår") ;

		balsamera_V2_Preserving = mkV2 (mkV "balsamerar") ;
		konservera_V2_Preserving = mkV2 (mkV "konserverar") ;
		luta_V2_Preserving = mkV2 (mkV "lutar") ;
		lägga_in_V2_Preserving = mkV2 (partV (irregV "lägga" "lade" "lagt") "in") ;
		sylta_V2_Preserving = mkV2 (mkV "syltar") ;
		sylta_in_V2_Preserving = mkV2 (partV (mkV "syltar") "in") ;

		ljuga_V_Prevarication = irregV "ljuga" "ljög" "ljugit" ;
		tala_osanning_V_Prevarication = variants {} ;

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

		avlöpa_V_Process_end = mkV "avlöper" ;
		sluta_V_Process_end = irregV "sluta" "slöt" "slutit" ;
		ta_slut_V_Process_end = variants {} ;
		upphöra_V_Process_end = mkV "upphöra" "upphörde" "upphört" ;
		utmynna_V_Process_end = mkV "utmynnar" ;

		återgå_V_Process_resume = mkV "återgå" "återgår" "återgå" "återgick" "återgått" "återgången" ;

		bryta_ut_V_Process_start = partV (irregV "bryta" "bröt" "brutit") "ut" ;
		börja_V_Process_start = mkV "börjar" ;
		starta_V_Process_start = mkV "startar" ;
		sätta_fart_V_Process_start = variants {} ;

		avstanna_V_Process_stop = mkV "avstannar" ;
		stanna_av_V_Process_stop = partV (regV "stanna") "av" ;

		arbeta_V2_Processing_materials = mkV2 (mkV "arbetar") ;
		bearbeta_V2_Processing_materials = mkV2 (mkV "bearbetar") ;
		blåsa_V2_Processing_materials = mkV2 (mk2V "blåsa" "blåste") ;
		kallpressa_V2_Processing_materials = mkV2 (mkV "kallpressar") ;
		pastörisera_V2_Processing_materials = mkV2 (mkV "pastöriserar") ;

		gå_V_Progress = irregV "gå" "gick" "gått" ;
		utveckla_sig_V_Progress = reflV (mkV "utvecklar") ;

		förbjuda_V2_Prohibiting = mkV2 (irregV "förbjuda" "förbjöd" "förbjudit") ;

		gå_ner_V_Proliferating_in_number = partV (irregV "gå" "gick" "gått") "ner" ;
		gå_upp_V_Proliferating_in_number = partV (irregV "gå" "gick" "gått") "upp" ;
		krympa_V_Proliferating_in_number = mkV "krymper" ;
		minska_V_Proliferating_in_number = mkV "minskar" ;
		uppgå_V_Proliferating_in_number = mkV "uppgå" "uppgår" "uppgå" "uppgick" "uppgått" "uppgången" ;
		öka_V_Proliferating_in_number = mkV "ökar" ;
		fördubbla_V2_Proliferating_in_number = mkV2 (mkV "fördubblar") ;

		passa_V2_Protecting = mkV2 (mkV "passar") ;
		skydda_V2_Protecting = mkV2 (mkV "skyddar") ;
		säkerställa_V2_Protecting = mkV2 (mkV "säkerställer") ;
		akta_V2_Protecting = mkV2 (mkV "akta") ;
		isolera_V2_Protecting = mkV2 (mkV "isolerar") ;

		käfta_V_Quarreling = mkV "käftar" ;
		bråka_V_Quarreling = mkV "bråkar" ;

		fråga_V2_Questioning = mkV2 (regV "frågar") ;
		förhöra_V2_Questioning = mkV2 (mkV "förhöra" "förhörde" "förhört") ;
		konsultera_V2_Questioning = mkV2 (mkV "konsulterar") ;
		pumpa_V2_Questioning = mkV2 (mkV "pumpar") ;
		rådfråga_V2_Questioning = mkV2 (mkV "rådfrågar") ;
		fråga_VQ_Questioning = mkVQ (regV "frågar") ;
		höra_VQ_Questioning = mkVQ (mkV "höra" "hör" "hör" "hörde" "hört" "hörd") ;
		grilla_V2_Questioning = mkV2 (mkV "grillar") ;

		abdikera_V_Quitting = mkV "abdikerar" ;
		avgå_V_Quitting = mkV "avgå" "avgår" "avgå" "avgick" "avgått" "avgången" ;
		säga_upp_sig_V_Quitting = reflV (partV (irregV "säga" "sade" "sagt") "upp") ;
		frånträda_V2_Quitting = mkV2 (mkV "frånträda" "frånträdde" "frånträtt") ;

		dra_sig_tillbaka_V_Quitting_a_place = partV (reflV (mkV "dra" "drar" "dra" "drog" "dragit" "dragen")) "tillbaka" ;
		dunsta_V_Quitting_a_place = mkV "dunstar" ;
		fly_fältet_V_Quitting_a_place = variants {} ;
		utrymma_V2_Quitting_a_place = mkV2 (mkV "utrymmer") ;

		ratificera_V2_Ratification = mkV2 (mkV "ratificerar") ;

		förläsa_sig_V_Reading = reflV (mkV "förläser") ;
		sträckläsa_V_Reading = mkV "sträckläser" ;
		lusläsa_V2_Reading = mkV2 (mkV "lusläser") ;
		läsa_V2_Reading = mkV2 (mk2V "läsa" "läste") ;
		provläsa_V2_Reading = variants {} ;
		skumma_V2_Reading = mkV2 (mkV "skummar") ;
		skumma_igenom_V2_Reading = mkV2 (partV (mkV "skummar") "igenom") ;
		sluka_V2_Reading = mkV2 (mkV "slukar") ;
		ögna_igenom_V2_Reading = mkV2 (partV (mkV "ögna") "igenom") ;

		deklamera_V2_Reading_aloud = mkV2 (mkV "deklamerar") ;
		diktera_V2_Reading_aloud = mkV2 (mkV "dikterar") ;
		förestava_V2_Reading_aloud = mkV2 (mkV "förestavar") ;
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
		läka_V_Recovery = mkV "läker" ;
		återhämta_sig_V_Recovery = reflV (mkV "återhämta") ;
		läka_V2_Recovery = mkV2 (mkV "läker") ;

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
		pånyttföda_V2_Rejuvenation = mkV2 (mkV "pånyttföda" "pånyttfödde" "pånyttfött") ;
		vitalisera_V2_Rejuvenation = mkV2 (mkV "vitaliserar") ;

		binda_V2_Relating_concepts = mkV2 (irregV "binda" "band" "bundit") ;
		förbinda_V2_Relating_concepts = mkV2 (irregV "förbinda" "förband" "förbundit") ;
		förena_V2_Relating_concepts = mkV2 (mkV "förenar") ;
		relatera_V2_Relating_concepts = mkV2 (mkV "relatera") ;
		sätta_i_relation_V2_Relating_concepts = variants {} ;

		dra_ut_på_tiden_V_Relative_time = variants {} ;
		följa_V_Relative_time = mkV "följa" "följde" "följt" ;

		frige_V2_Releasing = mkV2 (mkV "frige" "friger" "frige" "frigav" "frigett" "frigiven") ;
		släppa_loss_V2_Releasing = mkV2 (partV (mkV "släppa") "loss") ;

		förlita_sig_V_Reliance = reflV (mkV "förlitar") ;

		tro_V_Religious_belief = mkV "tror" ;
		tro_VS_Religious_belief = mkVS (mkV "tror") ;

		bli_över_V_Remainder = partV (irregV "bli" "blev" "blivit") "över" ;
		kvarstå_V_Remainder = mkV "kvarstå" "kvarstod" "kvarstått" ;
		lämna_V2_Remainder = mkV2 (regV "lämnar") ;

		erinra_sig_VQ_Remembering_experience = mkVQ (reflV (mkV "erinra")) ;

		dra_sig_till_minnes_VS_Remembering_information = variants {} ;
		påminna_sig_VS_Remembering_information = mkVS (reflV (mkV "påminna" "påminde" "påmint")) ;

		glömma_VV_Remembering_to_do = mkVV (mkV "glömma" "glömmer" "glöm" "glömde" "glömt" "glömd") ;
		komma_ihåg_VV_Remembering_to_do = mkVV (partV (irregV "komma" "kom" "kommit") "ihåg") ;

		göra_sig_av_V_Removing = partV (reflV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord")) "av" ;
		avtvå_V2_Removing = mkV2 (mkV "avtvår") ;
		evakuera_V2_Removing = mkV2 (mkV "evakuerar") ;
		hälla_av_V2_Removing = mkV2 (partV (mkV "häller") "av") ;
		kratsa_ut_V2_Removing = mkV2 (partV (mkV "kratsar") "ut") ;
		kvista_av_V2_Removing = mkV2 (partV (mkV "kvistar") "av") ;
		lasta_ur_V2_Removing = mkV2 (partV (mkV "lastar") "ur") ;
		mocka_V2_Removing = mkV2 (mkV "mockar") ;
		packa_upp_V2_Removing = mkV2 (partV (mkV "packar") "upp") ;
		plocka_ur_V2_Removing = mkV2 (partV (mkV "plockar") "ur") ;
		plocka_ut_V2_Removing = mkV2 (partV (mkV "plockar") "ut") ;
		skrapa_av_V2_Removing = mkV2 (partV (mkV "skrapar") "av") ;
		skrapa_ut_V2_Removing = mkV2 (partV (mkV "skrapar") "ut") ;
		skrubba_av_V2_Removing = mkV2 (partV (mkV "skrubbar") "av") ;
		slå_bort_V2_Removing = mkV2 (partV (irregV "slå" "slog" "slagit") "bort") ;
		tvätta_V2_Removing = mkV2 (regV "tvätta") ;
		tvätta_bort_V2_Removing = mkV2 (partV (regV "tvätta") "bort") ;
		tömma_V2_Removing = mkV2 (mkV "tömmer") ;
		tömma_ur_V2_Removing = mkV2 (partV (mkV "tömmer") "ur") ;
		tömma_ut_V2_Removing = mkV2 (partV (mkV "tömmer") "ut") ;
		vräka_V2_Removing = mkV2 (mkV "vräker") ;
		abortera_V2_Removing = mkV2 (mkV "abortera") ;
		lossa_V2_Removing = mkV2 (mkV "lossar") ;
		plocka_bort_V2_Removing = mkV2 (partV (mkV "plockar") "bort") ;
		tvätta_av_V2_Removing = mkV2 (partV (regV "tvätta") "av") ;
		utvisa_V2_Removing = mkV2 (mkV "utvisar") ;

		kvadda_V2_Render_nonfunctional = mkV2 (mkV "kvaddar") ;
		paja_V2_Render_nonfunctional = mkV2 (mkV "pajar") ;
		ta_sönder_V2_Render_nonfunctional = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "sönder") ;

		arrendera_V2_Renting = mkV2 (mkV "arrenderar") ;
		hyra_V2_Renting = mkV2 (mkV "hyra" "hyrde" "hyrt") ;
		hyra_in_V2_Renting = mkV2 (partV (mkV "hyra" "hyrde" "hyrt") "in") ;

		arrendera_ut_V2_Renting_out = mkV2 (partV (mkV "arrenderar") "ut") ;
		hyra_ut_V2_Renting_out = mkV2 (partV (mkV "hyra" "hyrde" "hyrt") "ut") ;

		avsäga_sig_V2_Renunciation = mkV2 (reflV (mkV "avsäga")) ;
		frånsäga_sig_V2_Renunciation = mkV2 (reflV (mkV "frånsäga" "frånsade" "frånsagt")) ;
		ge_upp_V2_Renunciation = mkV2 (partV (irregV "ge" "gav" "givit") "upp") ;

		stå_emot_V2_Repel = mkV2 (partV (irregV "stå" "stod" "stått") "emot") ;

		byta_ut_V2_Replacing = mkV2 (partV (mkV "byter") "ut") ;
		ersätta_V2_Replacing = mkV2 (mkV "ersätta" "ersätter" "ersätt" "ersatte" "ersatt" "ersatt") ;
		substituera_V2_Replacing = mkV2 (mkV "substituerar") ;

		gola_V_Reporting = mkV "golar" ;
		tjalla_V_Reporting = mkV "tjallar" ;

		stå_V_Representing = irregV "stå" "stod" "stått" ;

		anropa_V2_Request = mkV2 (mkV "anropa") ;
		avkräva_V2_Request = mkV2 (mkV "avkräver") ;
		instämma_V2_Request = mkV2 (mkV "instämmer") ;
		kommendera_V2_Request = mkV2 (mkV "kommenderar") ;
		begära_V2_Request = mkV2 (mkV "begära" "begärde" "begärt") ;
		äska_V2_Request = mkV2 (mkV "äskar") ;
		befalla_V2V_Request = mkV2V (mkV "befaller") ;
		hemställa_VS_Request = mkVS (mkV "hemställer") ;
		blixtinkalla_V2_Request = mkV2 (mkV "blixtinkallar") ;
		hemkalla_V2_Request = mkV2 (mkV "hemkallar") ;
		kalla_ut_V2_Request = mkV2 (partV (mkV "kalla") "ut") ;

		forska_V_Research = mkV "forskar" ;
		vetenskapa_V_Research = mkV "vetenskapar" ;

		hopvika_V_Reshaping = mkV "hopvika" "hopvek" "hopvikit" ;
		forma_V2_Reshaping = mkV2 (mkV "formar") ;
		kavla_V2_Reshaping = mkV2 (mkV "kavlar") ;
		kavla_ut_V2_Reshaping = mkV2 (partV (mkV "kavlar") "ut") ;
		krossa_V2_Reshaping = mkV2 (mkV "krossar") ;
		platta_till_V2_Reshaping = mkV2 (partV (mkV "plattar") "till") ;
		rynka_ihop_V2_Reshaping = mkV2 (partV (mkV "rynka") "ihop") ;
		valsa_V2_Reshaping = mkV2 (mkV "valsar") ;
		vika_ihop_V2_Reshaping = mkV2 (partV (mkV "vika" "vek" "vikit") "ihop") ;

		bo_V_Residence = mkV "bor" ;

		komma_till_rätta_V_Resolve_problem = variants {} ;
		fixa_V_Resolve_problem = mkV "fixa" ;
		behandla_V2_Resolve_problem = mkV2 (mkV "behandlar") ;
		klara_upp_V2_Resolve_problem = mkV2 (partV (mkV "klara") "upp") ;
		tillrättalägga_V2_Resolve_problem = mkV2 (mkV "tillrättalägga" "tillrättalade" "tillrättalagt") ;
		avhjälpa_V2_Resolve_problem = mkV2 (mkV "avhjälper") ;

		avböja_V2_Respond_to_proposal = mkV2 (mkV "avböjer") ;
		avslå_V2_Respond_to_proposal = mkV2 (mkV "avslå" "avslog" "avslagit") ;
		slå_bort_V2_Respond_to_proposal = mkV2 (partV (irregV "slå" "slog" "slagit") "bort") ;

		reagera_V_Response = mkV "reagerar" ;

		anförtro_V_Reveal_secret = mkV "anförtror" ;
		anförtro_sig_V_Reveal_secret = reflV (mkV "anförtror") ;
		yppa_V_Reveal_secret = mkV "yppar" ;
		öppna_sig_V_Reveal_secret = reflV (regV "öppna") ;
		avslöja_V2_Reveal_secret = mkV2 (mkV "avslöja") ;
		yppa_V2_Reveal_secret = mkV2 (mkV "yppar") ;
		avslöja_VQ_Reveal_secret = mkVQ (mkV "avslöja") ;
		yppa_VQ_Reveal_secret = mkVQ (mkV "yppar") ;
		avslöja_VS_Reveal_secret = mkVS (mkV "avslöja") ;
		anförtro_VS_Reveal_secret = mkVS (mkV "anförtror") ;

		vedergälla_V_Revenge = mkV "vedergäller" ;
		hämna_V2_Revenge = mkV2 (mkV "hämnar") ;

		straffa_V2_Rewards_and_punishments = mkV2 (mkV "straffar") ;

		lifta_V_Ride_vehicle = mkV "liftar" ;
		damma_V_Ride_vehicle = mkV "dammar" ;
		ta_V2_Ride_vehicle = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
		åka_V2_Ride_vehicle = mkV2 (mkV "åker") ;

		komma_i_kapp_V_Rising_to_a_challenge = variants {} ;
		svara_V_Rising_to_a_challenge = regV "svarar" ;
		växa_V_Rising_to_a_challenge = mkV "växa" "växer" "växa" "växte" "vuxit" "vuxen" ;

		be_en_bön_V_Rite = variants {} ;
		smörja_V2_Rite = mkV2 (irregV "smörja" "smorjde" "smort") ;
		döpa_V2_Rite = mkV2 (mkV "döpa") ;

		råna_V2_Robbery = mkV2 (mkV "råna") ;

		vara_sig_V_Rotting = reflV (mkV "vara") ;
		vittra_V_Rotting = mkV "vittrar" ;

		riskera_V2_Run_risk = mkV2 (mkV "riskerar") ;
		riskera_VV_Run_risk = mkVV (mkV "riskerar") ;

		infria_V2_Satisfying = mkV2 (mkV "infriar") ;
		komma_på_skam_V2_Satisfying = variants {} ;
		satisfiera_V2_Satisfying = mkV2 (mkV "satisfierar") ;
		tillfredsställa_V2_Satisfying = mkV2 (mkV "tillfredsställer") ;
		tillgodose_V2_Satisfying = mkV2 (mkV "tillgodose" "tillgodosåg" "tillgodosett") ;
		uppfylla_V2_Satisfying = mkV2 (mkV "uppfyller") ;

		finkamma_V2_Scouring = mkV2 (mkV "finkammar") ;
		leta_igenom_V2_Scouring = mkV2 (partV (mkV "leta") "igenom") ;
		snoka_igenom_V2_Scouring = mkV2 (partV (mkV "snokar") "igenom") ;

		gå_till_botten_V_Scrutiny = variants {} ;
		skanna_V_Scrutiny = mkV "skannar" ;
		dra_V2_Scrutiny = mkV2 (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") ;
		gå_igenom_V2_Scrutiny = mkV2 (partV (irregV "gå" "gick" "gått") "igenom") ;
		hårdgranska_V2_Scrutiny = mkV2 (mkV "hårdgranskar") ;
		kartlägga_V2_Scrutiny = mkV2 (mkV "kartlägga" "kartlade" "kartlagt") ;
		korrekturläsa_V2_Scrutiny = mkV2 (mkV "korrekturläser") ;
		nagelfara_V2_Scrutiny = mkV2 (mkV "nagelfara" "nagelfor" "nagelfarit") ;
		sätta_under_lupp_V2_Scrutiny = variants {} ;
		undersöka_V2_Scrutiny = mkV2 (mkV "undersöker") ;

		leta_V_Seeking = mkV "leta" ;

		eftersträva_V2_Seeking_to_achieve = mkV2 (mkV "eftersträvar") ;

		ambulera_V_Self_motion = mkV "ambulerar" ;
		flänga_V_Self_motion = mkV "flänger" ;
		gnussa_V_Self_motion = mkV "gnussar" ;
		gumpa_V_Self_motion = mkV "gumpar" ;
		hjula_V_Self_motion = mkV "hjular" ;
		hoppa_bock_V_Self_motion = variants {} ;
		pulsa_V_Self_motion = mkV "pulsar" ;
		röra_sig_V_Self_motion = reflV (mkV "röra" "rörde" "rört") ;
		skumpa_V_Self_motion = mkV "skumpar" ;
		springa_V_Self_motion = irregV "springa" "sprang" "sprungit" ;
		strosa_V_Self_motion = mkV "strosar" ;
		stryka_V_Self_motion = mkV "stryka" "strök" "strukit" ;
		åka_skridskor_V_Self_motion = variants {} ;
		ånga_fram_V_Self_motion = partV (mkV "ångar") "fram" ;
		örla_V_Self_motion = mkV "örlar" ;
		dyka_V_Self_motion = irregV "dyka" "dök" "dukit" ;
		orma_V_Self_motion = mkV "ormar" ;
		orma_sig_V_Self_motion = reflV (mkV "ormar") ;
		promenera_V_Self_motion = mkV "promenerar" ;
		styra_kosan_V_Self_motion = variants {} ;
		stiga_fram_V_Self_motion = partV (irregV "stiga" "steg" "stigit") "fram" ;
		stäva_V_Self_motion = mkV "stävar" ;
		störta_V_Self_motion = mkV "störtar" ;
		hoppa_fallskärm_V_Self_motion = variants {} ;
		jaga_V_Self_motion = regV "jaga" ;

		eftersända_V2_Sending = mkV2 (mkV "eftersänder") ;
		skeppa_V2_Sending = mkV2 (mkV "skeppar") ;
		skicka_bort_V2_Sending = mkV2 (partV (regV "skicka") "bort") ;
		skicka_in_V2_Sending = mkV2 (partV (regV "skicka") "in") ;
		skicka_ner_V2_Sending = mkV2 (partV (regV "skicka") "ner") ;
		skicka_ut_V2_Sending = mkV2 (partV (regV "skicka") "ut") ;
		översända_V2_Sending = mkV2 (mkV "översänder") ;
		skicka_med_V2_Sending = mkV2 (partV (regV "skicka") "med") ;
		skicka_över_V2_Sending = mkV2 (partV (regV "skicka") "över") ;

		döma_V2_Sentencing = mkV2 (mkV "dömer") ;

		avstycka_V2_Separating = mkV2 (mkV "avstyckar") ;
		separera_V2_Separating = mkV2 (mkV "separerar") ;
		avstava_V2_Separating = mkV2 (mkV "avstavar") ;
		spalta_upp_V2_Separating = mkV2 (partV (mkV "spaltar") "upp") ;

		blossa_upp_V_Setting_fire = partV (mkV "blossar") "upp" ;
		anlägga_V2_Setting_fire = mkV2 (mkV "anlägga" "anlade" "anlagt") ;
		lunta_V2_Setting_fire = mkV2 (mkV "luntar") ;

		bege_sig_V_Setting_out = reflV (mkV "bege" "begav" "begett") ;
		bryta_upp_V_Setting_out = partV (irregV "bryta" "bröt" "brutit") "upp" ;
		sätta_av_V_Setting_out = partV (irregV "sätta" "satte" "satt") "av" ;

		avfyra_V2_Shoot_projectiles = mkV2 (mkV "avfyrar") ;
		avlossa_V2_Shoot_projectiles = mkV2 (mkV "avlossar") ;
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

		skilja_sig_V_Similarity = reflV (mkV "skilja" "skilde" "skilt") ;
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

		absorbera_V2_Soaking_up = mkV2 (mkV "absorberar") ;
		adsorbera_V2_Soaking_up = mkV2 (mkV "adsorberar") ;
		suga_upp_V2_Soaking_up = mkV2 (partV (irregV "suga" "sög" "sugit") "upp") ;
		uppta_V2_Soaking_up = mkV2 (mkV "uppta" "upptar" "uppta" "upptog" "upptagit" "upptagen") ;

		eka_V_Sound_movement = mkV "ekar" ;

		föreläsa_V_Speak_on_topic = mkV "föreläser" ;

		artikulera_V2_Spelling_and_pronouncing = mkV2 (mkV "artikulerar") ;
		bokstavera_V2_Spelling_and_pronouncing = mkV2 (mkV "bokstaverar") ;
		säga_V2_Spelling_and_pronouncing = mkV2 (irregV "säga" "sade" "sagt") ;

		bli_V_State_continue = irregV "bli" "blev" "blivit" ;
		förbli_V_State_continue = mkV "förbli" "förblev" "förblivit" ;
		gå_V_State_continue = irregV "gå" "gick" "gått" ;
		hålla_V_State_continue = irregV "hålla" "höll" "hållit" ;
		stå_V_State_continue = irregV "stå" "stod" "stått" ;

		rapportera_V_Statement = mkV "rapportera" ;
		skriva_V_Statement = irregV "skriva" "skrev" "skrivit" ;
		glunka_V_Statement = mkV "glunkar" ;
		tala_V_Statement = regV "tala" ;
		stadga_V2_Statement = mkV2 (mkV "stadgar") ;
		stadga_VS_Statement = mkVS (mkV "stadgar") ;
		annonsera_VS_Statement = mkVS (mkV "annonserar") ;
		fastslå_VS_Statement = mkVS (mkV "fastslå" "fastslog" "fastslagit") ;
		säga_VS_Statement = mkVS (irregV "säga" "sade" "sagt") ;
		ge_VV_Statement = mkVV (irregV "ge" "gav" "givit") ;
		kommentera_V2_Statement = mkV2 (mkV "kommenterar") ;
		dödförklara_V2_Statement = mkV2 (mkV "dödförklarar") ;

		lagra_V2_Storing = mkV2 (mkV "lagrar") ;

		ligga_V_Studying = irregV "ligga" "låg" "legat" ;
		studera_V2_Studying = mkV2 (mkV "studera") ;

		övertala_V2S_Suasion = mkV2S (mkV "övertala") ;
		förmå_V2V_Suasion = mkV2V (mkV "förmår") ;
		övertala_V2V_Suasion = mkV2V (mkV "övertala") ;
		övertala_V2_Suasion = mkV2 (mkV "övertala") ;

		lämna_in_V2_Submitting_documents = mkV2 (partV (regV "lämnar") "in") ;
		skicka_in_V2_Submitting_documents = mkV2 (partV (regV "skicka") "in") ;
		sända_in_V2_Submitting_documents = mkV2 (partV (mkV "sänder") "in") ;

		bita_i_gräset_V_Success_or_failure = variants {} ;
		göra_bort_sig_V_Success_or_failure = reflV (partV (mkV "göra" "gör" "gör" "gjorde" "gjort" "gjord") "bort") ;
		ta_V_Success_or_failure = mkV "ta" "tar" "ta" "tog" "tagit" "tagen" ;
		torska_V_Success_or_failure = mkV "torskar" ;
		klara_VV_Success_or_failure = mkVV (mkV "klara") ;
		klara_av_VV_Success_or_failure = mkVV (partV (mkV "klara") "av") ;
		misslyckas_V2_Success_or_failure = mkV2 (mkV "misslyckas") ;

		göra_susen_V_Successful_action = variants {} ;
		bära_frukt_V_Successful_action = variants {} ;
		gå_bra_V_Successful_action = variants {} ;
		slå_bakut_V_Successful_action = partV (irregV "slå" "slog" "slagit") "bakut" ;
		slå_fel_V_Successful_action = partV (irregV "slå" "slog" "slagit") "fel" ;

		förankra_V2_Successfully_communicate_message = mkV2 (mkV "förankrar") ;
		förmedla_V2_Successfully_communicate_message = mkV2 (mkV "förmedlar") ;

		förslå_V_Sufficiency = mkV "förslå" "förslog" "förslagit" ;
		räcka_V_Sufficiency = mkV "räcker" ;
		räcka_till_V_Sufficiency = partV (mkV "räcker") "till" ;

		ekipera_V2_Supply = mkV2 (mkV "ekiperar") ;
		mata_V2_Supply = mkV2 (mkV "matar") ;
		pimpa_V2_Supply = mkV2 (mkV "pimpar") ;
		tanka_V2_Supply = mkV2 (mkV "tankar") ;
		tillföra_V2_Supply = mkV2 (mkV "tillföra" "tillförde" "tillfört") ;
		förse_V2_Supply = mkV2 (mkV "förse" "försåg" "försett") ;

		stödja_V2_Supporting = mkV2 (mkV "stödjer") ;
		stötta_V2_Supporting = mkV2 (mkV "stötta") ;

		överlämna_sig_V_Surrendering = reflV (mkV "överlämnar") ;

		avträda_V2_Surrendering_possession = mkV2 (mkV "avträda" "avträdde" "avträtt") ;
		lämna_ifrån_sig_V2_Surrendering_possession = mkV2 (reflV (partV (regV "lämnar") "ifrån")) ;
		överlämna_V2_Surrendering_possession = mkV2 (mkV "överlämnar") ;

		misstänkliggöra_V2_Suspicion = mkV2 (mkV "misstänkliggöra" "misstänkliggjorde" "misstänkliggjort") ;

		avlösa_V2_Take_place_of = mkV2 (mkV "avlöser") ;
		efterträda_V2_Take_place_of = mkV2 (mkV "efterträda" "efterträdde" "efterträtt") ;
		ersätta_V2_Take_place_of = mkV2 (mkV "ersätta" "ersätter" "ersätt" "ersatte" "ersatt" "ersatt") ;
		substituera_V2_Take_place_of = mkV2 (mkV "substituerar") ;

		beslagta_V2_Taking = mkV2 (mkV "beslagta" "beslagtar" "beslagta" "beslagtog" "beslagtagit" "beslagtagen") ;
		hugga_V2_Taking = mkV2 (irregV "hugga" "högg" "huggit") ;
		lägga_rabarber_på_V2_Taking = variants {} ;
		nappa_V2_Taking = mkV2 (mkV "nappar") ;
		nappa_åt_sig_V2_Taking = mkV2 (reflV (partV (mkV "nappar") "åt")) ;
		snappa_V2_Taking = mkV2 (mkV "snappar") ;
		snappa_upp_V2_Taking = mkV2 (partV (mkV "snappar") "upp") ;
		snappa_åt_sig_V2_Taking = mkV2 (reflV (partV (mkV "snappar") "åt")) ;
		ta_V2_Taking = mkV2 (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") ;
		avhämta_V2_Taking = mkV2 (mkV "avhämtar") ;

		motsätta_sig_V2_Taking_sides = mkV2 (reflV (mkV "motsätta" "motsatte" "motsatt")) ;
		gå_emot_V2_Taking_sides = mkV2 (partV (irregV "gå" "gick" "gått") "emot") ;

		prova_V2_Tasting = mkV2 (mkV "prova") ;
		provsmaka_V2_Tasting = variants {} ;
		smaka_av_V2_Tasting = mkV2 (partV (mkV "smakar") "av") ;

		annonsera_V_Telling = mkV "annonserar" ;
		berätta_V_Telling = mkV "berätta" ;
		mala_på_V_Telling = partV (mkV "maler") "på" ;
		berätta_V2_Telling = mkV2 (mkV "berätta") ;
		dra_V2_Telling = mkV2 (mkV "dra" "drar" "dra" "drog" "dragit" "dragen") ;
		avisera_VS_Telling = mkVS (mkV "aviserar") ;
		berätta_VS_Telling = mkVS (mkV "berätta") ;
		ge_till_känna_VS_Telling = variants {} ;

		befinna_sig_V_Temporary_stay = reflV (irregV "befinna" "befann" "befunnit") ;
		bo_V_Temporary_stay = mkV "bor" ;
		hänga_V_Temporary_stay = mkV "hänger" ;
		hålla_till_V_Temporary_stay = partV (irregV "hålla" "höll" "hållit") "till" ;
		uppehålla_sig_V_Temporary_stay = reflV (mkV "uppehålla" "uppehöll" "uppehållit") ;
		sova_över_V_Temporary_stay = partV (irregV "sova" "sov" "sovit") "över" ;
		vistas_V2_Temporary_stay = variants {} ;

		sammanskriva_V2_Text_creation = mkV2 (mkV "sammanskriva" "sammanskrev" "sammanskrivit") ;
		skriva_V2_Text_creation = mkV2 (irregV "skriva" "skrev" "skrivit") ;
		säga_V2_Text_creation = mkV2 (irregV "säga" "sade" "sagt") ;
		blogga_VS_Text_creation = mkVS (mkV "bloggar") ;
		anmäla_V2_Text_creation = mkV2 (mkV "anmäla") ;

		snatta_V_Theft = mkV "snattar" ;
		förskingra_V2_Theft = mkV2 (mkV "förskingra") ;
		nalla_V2_Theft = mkV2 (mkV "nallar") ;

		blomstra_V_Thriving = mkV "blomstrar" ;
		rasa_V_Thriving = mkV "rasar" ;
		frodas_V2_Thriving = variants {} ;

		blockera_V2_Thwarting = mkV2 (mkV "blockerar") ;
		lamslå_V2_Thwarting = mkV2 (mkV "lamslå" "lamslog" "lamslagit") ;
		stänga_av_V2_Thwarting = mkV2 (partV (irregV "stänga" "stängde" "stängt") "av") ;

		stå_pall_V_Tolerating = variants {} ;

		gälla_V_Topic = mkV "gäller" ;
		ta_upp_V2_Topic = mkV2 (partV (mkV "ta" "tar" "ta" "tog" "tagit" "tagen") "upp") ;
		behandla_V2_Topic = mkV2 (mkV "behandlar") ;
		röra_V2_Topic = mkV2 (mkV "röra" "rörde" "rört") ;

		ryggsäcksluffa_V_Travel = mkV "ryggsäcksluffar" ;
		båtpendla_V_Travel = variants {} ;
		pendla_V_Travel = mkV "pendlar" ;
		tågpendla_V_Travel = mkV "tågpendlar" ;
		arbetspendla_V_Travel = mkV "arbetspendlar" ;
		veckopendla_V_Travel = mkV "veckopendlar" ;

		kretsa_V_Traversing = mkV "kretsar" ;
		sicksacka_V_Traversing = mkV "sicksackar" ;
		tvära_V_Traversing = mkV "tvärar" ;
		passera_V2_Traversing = mkV2 (mkV "passerar") ;

		provrida_V2_Trying_out = variants {} ;
		provspela_V2_Trying_out = variants {} ;
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
		tillämpa_V2_Using = mkV2 (mkV "tillämpa") ;
		ta_i_anspråk_V2_Using = variants {} ;

		finna_V2_Verdict = mkV2 (irregV "finna" "fann" "funnit") ;

		styrka_V2_Verification = mkV2 (mkV "styrker") ;
		fastställa_VS_Verification = mkVS (mkV "fastställer") ;

		besöka_V2_Visiting = mkV2 (mkV "besöker") ;

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
		vinna_V2_Win_prize = mkV2 (irregV "vinna" "vann" "vunnit") ;

		dra_sig_tillbaka_V_Withdraw_from_participation = partV (reflV (mkV "dra" "drar" "dra" "drog" "dragit" "dragen")) "tillbaka" ;

}
