concrete TargetsSwe of Targets = CatSwe ** open (L = TargetsSweCnc) in {

	flags coding = utf8 ;

	lin

		abandon_V2_Abandonment = variants {L.lämna_V2_Abandonment | L.överge_V2_Abandonment | L.lämna_i_sticket_V2_Abandonment | L.lämna_kvar_V2_Abandonment} ;
		forget_V2_Abandonment = variants {L.glömma_V2_Abandonment | L.glömma_kvar_V2_Abandonment} ;

		swarm_V_Abounding_with = L.vimla_V_Abounding_with ;

		boil_V_Absorb_heat = L.koka_V_Absorb_heat ;
		simmer_V_Absorb_heat = L.sjuda_V_Absorb_heat ;

		abuse_V2_Abusing = L.misshandla_V2_Abusing ;

		accomplish_V2_Accomplishment = L.åstadkomma_V2_Accomplishment ;
		achieve_V2_Accomplishment = L.åstadkomma_V2_Accomplishment ;

		invent_V2_Achieving_first = L.uppfinna_V2_Achieving_first ;

		continue_VV_Activity_ongoing = L.fortsätta_VV_Activity_ongoing ;

		freeze_V2_Activity_pause = L.frysa_V2_Activity_pause ;

		prepare_V_Activity_prepare = variants {L.förbereda_V_Activity_prepare | L.bereda_sig_V_Activity_prepare | L.förbereda_sig_V_Activity_prepare} ;

		resume_V2_Activity_resume = L.återuppta_V2_Activity_resume ;

		begin_V2_Activity_start = L.börja_V2_Activity_start ;
		begin_VV_Activity_start = L.börja_VV_Activity_start ;
		commence_V2_Activity_start = L.börja_V2_Activity_start ;
		commence_VV_Activity_start = L.börja_VV_Activity_start ;
		start_V2_Activity_start = L.börja_V2_Activity_start ;
		start_VV_Activity_start = L.börja_VV_Activity_start ;

		stop_V2_Activity_stop = L.stoppa_V2_Activity_stop ;
		stop_VV_Activity_stop = L.sluta_VV_Activity_stop ;

		adopt_V2_Adopt_selection = L.adoptera_V2_Adopt_selection ;
		assume_V2_Adopt_selection = L.anta_V2_Adopt_selection ;

		adorn_V2_Adorning = variants {L.pryda_V2_Adorning | L.smycka_V2_Adorning} ;
		cover_V2_Adorning = L.täcka_V2_Adorning ;
		deck_V2_Adorning = L.pryda_V2_Adorning ;

		mature_V_Aging = L.mogna_V_Aging ;

		refuse_VV_Agree_or_refuse_to_act = variants {L.avböja_VV_Agree_or_refuse_to_act | L.vägra_VV_Agree_or_refuse_to_act} ;

		farm_V2_Agriculture = L.bruka_V2_Agriculture ;

		aim_V2_Aiming = variants {L.rikta_V2_Aiming | L.rikta_in_V2_Aiming} ;

		accumulate_V2_Amassing = L.ackumulera_V2_Amassing ;

		bake_V2_Apply_heat = L.baka_V2_Apply_heat ;
		boil_V2_Apply_heat = variants {L.koka_V2_Apply_heat | L.koka_upp_V2_Apply_heat} ;
		cook_V2_Apply_heat = variants {L.koka_V2_Apply_heat | L.koka_upp_V2_Apply_heat} ;
		grill_V2_Apply_heat = L.grilla_V2_Apply_heat ;
		roast_V2_Apply_heat = L.steka_V2_Apply_heat ;
		simmer_V2_Apply_heat = L.sjuda_V2_Apply_heat ;

		arrange_V2_Arranging = L.arrangera_V2_Arranging ;

		apprehend_V2_Arrest = L.gripa_V2_Arrest ;

		arrive_V_Arriving = L.ankomma_V_Arriving ;
		come_V_Arriving = L.komma_V_Arriving ;

		judge_V2_Assessing = L.bedöma_V2_Assessing ;
		rank_V2_Assessing = L.ranka_V2_Assessing ;

		assist_V2V_Assistance = L.hjälpa_V2V_Assistance ;
		assist_V2_Assistance = L.hjälpa_V2_Assistance ;
		help_V2V_Assistance = L.hjälpa_V2V_Assistance ;
		help_V2_Assistance = L.hjälpa_V2_Assistance ;

		attach_V2_Attaching = L.fästa_V2_Attaching ;
		connect_V2_Attaching = L.koppla_ihop_V2_Attaching ;
		fasten_V2_Attaching = L.fästa_V2_Attaching ;
		hook_V2_Attaching = L.haka_fast_V2_Attaching ;
		nail_V2_Attaching = L.spika_fast_V2_Attaching ;

		attack_V2_Attack = L.angripa_V2_Attack ;
		bomb_V2_Attack = variants {L.bomba_V2_Attack | L.bombardera_V2_Attack} ;

		attempt_VV_Attempt = L.försöka_VV_Attempt ;
		try_VV_Attempt = L.försöka_VV_Attempt ;

		try_V2_Attempt_means = variants {L.försöka_V2_Attempt_means | L.pröva_V2_Attempt_means} ;
		try_VV_Attempt_means = L.försöka_VV_Attempt_means ;

		avoid_V2_Avoiding = L.undvika_V2_Avoiding ;
		avoid_VV_Avoiding = L.undvika_VV_Avoiding ;

		believe_V2_Awareness = L.tro_V2_Awareness ;
		believe_VS_Awareness = L.tro_VS_Awareness ;
		imagine_VV_Awareness = L.föreställa_sig_VV_Awareness ;
		know_V2_Awareness = L.känna_V2_Awareness ;
		know_VS_Awareness = L.veta_VS_Awareness ;
		know_V_Awareness = L.veta_V_Awareness ;

		beat_V2_Beat_opponent = variants {L.slå_V2_Beat_opponent | L.slå_ner_V2_Beat_opponent | L.slå_ut_V2_Beat_opponent} ;
		defeat_V2_Beat_opponent = variants {L.slå_V2_Beat_opponent | L.slå_ner_V2_Beat_opponent | L.slå_ut_V2_Beat_opponent} ;

		become_V2_Becoming = L.bli_V2_Becoming ;
		become_V_Becoming = L.bli_V_Becoming ;
		grow_V_Becoming = L.bli_V_Becoming ;

		discover_VS_Becoming_aware = L.upptäcka_VS_Becoming_aware ;
		note_V2_Becoming_aware = L.märka_V2_Becoming_aware ;
		notice_V2_Becoming_aware = L.märka_V2_Becoming_aware ;
		spot_V2_Becoming_aware = L.märka_V2_Becoming_aware ;

		dehydrate_V_Becoming_dry = variants {L.torka_V_Becoming_dry | L.torka_bort_V_Becoming_dry | L.torka_in_V_Becoming_dry | L.torka_upp_V_Becoming_dry | L.torka_ut_V_Becoming_dry} ;
		dry_V_Becoming_dry = variants {L.torka_V_Becoming_dry | L.torka_bort_V_Becoming_dry | L.torka_in_V_Becoming_dry | L.torka_upp_V_Becoming_dry | L.torka_ut_V_Becoming_dry} ;

		produce_V2_Behind_the_scenes = L.producera_V2_Behind_the_scenes ;

		work_V_Being_employed = variants {L.arbeta_V_Being_employed | L.jobba_V_Being_employed} ;

		sit_V_Being_located = L.sitta_V_Being_located ;

		cross_V2_Body_movement = L.korsa_V2_Body_movement ;
		curtsy_V_Body_movement = L.knixa_V_Body_movement ;
		wiggle_V_Body_movement = L.vicka_V_Body_movement ;
		wriggle_V_Body_movement = L.vicka_V_Body_movement ;
		yawn_V_Body_movement = L.gäspa_V_Body_movement ;

		boast_V_Bragging = L.skryta_V_Bragging ;
		brag_V_Bragging = L.skryta_V_Bragging ;

		breathe_V2_Breathing = L.andas_in_V2_Breathing ;
		exhale_V2_Breathing = L.andas_in_V2_Breathing ;
		inhale_V2_Breathing = L.inhalera_V2_Breathing ;

		carry_V2_Bringing = L.bära_upp_V2_Bringing ;
		cart_V2_Bringing = variants {L.forsla_V2_Bringing | L.köra_V2_Bringing | L.forsla_fram_V2_Bringing | L.forsla_in_V2_Bringing | L.forsla_ned_V2_Bringing} ;
		convey_V2_Bringing = variants {L.forsla_V2_Bringing | L.forsla_fram_V2_Bringing | L.forsla_in_V2_Bringing | L.forsla_ned_V2_Bringing} ;
		drive_V2_Bringing = L.köra_V2_Bringing ;
		haul_V2_Bringing = variants {L.forsla_V2_Bringing | L.forsla_fram_V2_Bringing | L.forsla_in_V2_Bringing | L.forsla_ned_V2_Bringing} ;
		transport_V2_Bringing = variants {L.forsla_V2_Bringing | L.forsla_fram_V2_Bringing | L.forsla_in_V2_Bringing | L.forsla_ned_V2_Bringing} ;

		build_V2_Building = variants {L.bygga_V2_Building | L.bygga_om_V2_Building | L.bygga_ut_V2_Building} ;
		make_V2_Building = L.göra_V2_Building ;

		befall_V2_Catastrophe = L.drabba_V2_Catastrophe ;

		bring_V2V_Causation = L.få_V2V_Causation ;
		cause_V2_Causation = variants {L.förorsaka_V2_Causation | L.orsaka_V2_Causation} ;
		lead_V_Causation = L.leda_V_Causation ;
		make_V2_Causation = L.göra_V2_Causation ;

		alter_V2_Cause_change = L.ändra_V2_Cause_change ;

		freeze_V2_Cause_change_of_phase = L.frysa_V2_Cause_change_of_phase ;
		melt_V2_Cause_change_of_phase = L.smälta_V2_Cause_change_of_phase ;
		thaw_V2_Cause_change_of_phase = variants {L.smälta_V2_Cause_change_of_phase | L.tina_V2_Cause_change_of_phase | L.tina_upp_V2_Cause_change_of_phase} ;

		reinforce_V2_Cause_change_of_strength = L.förstärka_V2_Cause_change_of_strength ;
		weaken_V2_Cause_change_of_strength = L.försvaga_V2_Cause_change_of_strength ;

		splash_V2_Cause_fluidic_motion = L.skvalpa_ut_V2_Cause_fluidic_motion ;

		bash_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;
		batter_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;
		beat_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;
		belt_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;
		chop_V2_Cause_harm = L.hugga_V2_Cause_harm ;
		hit_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;
		kick_V2_Cause_harm = L.sparka_V2_Cause_harm ;
		punch_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;
		slap_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;
		whip_V2_Cause_harm = variants {L.slå_V2_Cause_harm | L.slå_ner_V2_Cause_harm} ;

		hit_V2_Cause_impact = variants {L.slå_V2_Cause_impact | L.slå_ihop_V2_Cause_impact} ;
		ram_V2_Cause_impact = variants {L.slå_V2_Cause_impact | L.slå_ihop_V2_Cause_impact} ;
		slap_V2_Cause_impact = variants {L.slå_V2_Cause_impact | L.slå_ihop_V2_Cause_impact} ;
		thump_V2_Cause_impact = variants {L.slå_V2_Cause_impact | L.slå_ihop_V2_Cause_impact} ;

		chuck_V2_Cause_motion = L.kasta_V2_Cause_motion ;
		drag_V2_Cause_motion = L.släpa_V2_Cause_motion ;
		pitch_V2_Cause_motion = L.kasta_V2_Cause_motion ;
		push_V2_Cause_motion = variants {L.skjuta_V2_Cause_motion | L.skjuta_iväg_V2_Cause_motion | L.skjuta_ut_V2_Cause_motion} ;
		throw_V2_Cause_motion = L.kasta_V2_Cause_motion ;
		toss_V2_Cause_motion = L.kasta_V2_Cause_motion ;

		chill_V2_Cause_temperature_change = variants {L.kyla_V2_Cause_temperature_change | L.kyla_ner_V2_Cause_temperature_change} ;
		heat_V2_Cause_temperature_change = variants {L.värma_V2_Cause_temperature_change | L.värma_upp_V2_Cause_temperature_change} ;
		warm_V2_Cause_temperature_change = variants {L.värma_V2_Cause_temperature_change | L.värma_upp_V2_Cause_temperature_change} ;

		amalgamate_V2_Cause_to_amalgamate = L.förena_V2_Cause_to_amalgamate ;
		combine_V2_Cause_to_amalgamate = L.kombinera_V2_Cause_to_amalgamate ;
		join_V2_Cause_to_amalgamate = L.förena_V2_Cause_to_amalgamate ;
		unify_V2_Cause_to_amalgamate = L.förena_V2_Cause_to_amalgamate ;
		unite_V2_Cause_to_amalgamate = L.förena_V2_Cause_to_amalgamate ;

		dehydrate_V2_Cause_to_be_dry = variants {L.torka_V2_Cause_to_be_dry | L.torka_bort_V2_Cause_to_be_dry | L.torka_ut_V2_Cause_to_be_dry} ;
		desiccate_V2_Cause_to_be_dry = variants {L.torka_V2_Cause_to_be_dry | L.torka_bort_V2_Cause_to_be_dry | L.torka_ut_V2_Cause_to_be_dry} ;
		dry_V2_Cause_to_be_dry = variants {L.torka_V2_Cause_to_be_dry | L.torka_bort_V2_Cause_to_be_dry | L.torka_ut_V2_Cause_to_be_dry} ;
		dry_off_V2_Cause_to_be_dry = variants {L.torka_V2_Cause_to_be_dry | L.torka_bort_V2_Cause_to_be_dry | L.torka_ut_V2_Cause_to_be_dry} ;
		dry_out_V2_Cause_to_be_dry = variants {L.torka_V2_Cause_to_be_dry | L.torka_bort_V2_Cause_to_be_dry | L.torka_ut_V2_Cause_to_be_dry} ;
		dry_up_V2_Cause_to_be_dry = variants {L.torka_V2_Cause_to_be_dry | L.torka_bort_V2_Cause_to_be_dry | L.torka_ut_V2_Cause_to_be_dry} ;

		sharpen_V2_Cause_to_be_sharp = variants {L.skärpa_V2_Cause_to_be_sharp | L.vässa_V2_Cause_to_be_sharp} ;

		lift_V2_Cause_to_end = L.lyfta_V2_Cause_to_end ;

		break_V2_Cause_to_fragment = variants {L.bryta_av_V2_Cause_to_fragment | L.slå_in_V2_Cause_to_fragment | L.slå_sönder_V2_Cause_to_fragment} ;

		tinkle_V2_Cause_to_make_noise = L.pingla_V2_Cause_to_make_noise ;

		develop_V2_Cause_to_make_progress = L.utveckla_V2_Cause_to_make_progress ;
		perfect_V2_Cause_to_make_progress = L.förbättra_V2_Cause_to_make_progress ;

		shake_V2_Cause_to_move_in_place = L.skaka_V2_Cause_to_move_in_place ;
		vibrate_V2_Cause_to_move_in_place = L.skaka_V2_Cause_to_move_in_place ;

		wake_V2_Cause_to_wake = L.väcka_V2_Cause_to_wake ;
		wake_up_V2_Cause_to_wake = L.väcka_V2_Cause_to_wake ;

		disappear_V_Ceasing_to_be = L.försvinna_V_Ceasing_to_be ;

		doubt_V_Certainty = L.tvivla_V_Certainty ;

		swing_V_Change_direction = L.svänga_V_Change_direction ;
		veer_V_Change_direction = L.svänga_V_Change_direction ;

		defer_V2_Change_event_time = L.skjuta_upp_V2_Change_event_time ;
		delay_V2_Change_event_time = L.skjuta_upp_V2_Change_event_time ;

		coagulate_V_Change_of_consistency = L.stelna_V_Change_of_consistency ;
		curdle_V_Change_of_consistency = L.stelna_V_Change_of_consistency ;
		thicken_V_Change_of_consistency = L.tjockna_V_Change_of_consistency ;

		condense_V_Change_of_phase = L.kondensera_V_Change_of_phase ;
		freeze_V_Change_of_phase = variants {L.frysa_V_Change_of_phase | L.frysa_till_V_Change_of_phase} ;
		melt_V_Change_of_phase = L.smälta_V_Change_of_phase ;
		thaw_V_Change_of_phase = variants {L.smälta_V_Change_of_phase | L.tina_V_Change_of_phase | L.tina_upp_V_Change_of_phase} ;

		lose_V2_Change_of_quantity_of_possession = L.tappa_bort_V2_Change_of_quantity_of_possession ;

		activate_V2_Change_operational_state = L.aktivera_V2_Change_operational_state ;

		lean_V_Change_posture = L.luta_sig_V_Change_posture ;
		stand_V_Change_posture = L.stå_upp_V_Change_posture ;
		stand_up_V_Change_posture = L.stå_upp_V_Change_posture ;

		chat_V_Chatting = L.prata_V_Chatting ;
		speak_V_Chatting = L.prata_V_Chatting ;
		talk_V_Chatting = L.prata_V_Chatting ;

		choose_V2_Choosing = L.välja_V2_Choosing ;
		opt_VV_Choosing = L.välja_VV_Choosing ;
		pick_V2_Choosing = variants {L.välja_V2_Choosing | L.plocka_ut_V2_Choosing} ;

		cap_V2_Closure = L.slå_upp_V2_Closure ;
		fasten_V2_Closure = L.fästa_ihop_V2_Closure ;
		seal_V2_Closure = L.försluta_V2_Closure ;

		contemplate_V_Cogitation = L.grubbla_V_Cogitation ;
		ponder_V_Cogitation = L.grubbla_V_Cogitation ;

		collaborate_V_Collaboration = L.samarbeta_V_Collaboration ;
		conspire_V_Collaboration = L.samverka_V_Collaboration ;

		meet_V2_Come_together = L.möta_V2_Come_together ;

		find_VS_Coming_to_believe = L.finna_VS_Coming_to_believe ;
		learn_VV_Coming_to_believe = L.lära_sig_VV_Coming_to_believe ;

		cook_up_V2_Coming_up_with = L.koka_ihop_V2_Coming_up_with ;
		design_V2_Coming_up_with = L.designa_V2_Coming_up_with ;
		hatch_V2_Coming_up_with = L.kläcka_V2_Coming_up_with ;

		buy_V2_Commerce_buy = L.köpa_V2_Commerce_buy ;
		purchase_V2_Commerce_buy = L.köpa_V2_Commerce_buy ;

		pay_V2_Commerce_pay = variants {L.betala_V2_Commerce_pay | L.betala_för_kalaset_V2_Commerce_pay} ;

		sell_V2_Commerce_sell = L.sälja_V2_Commerce_sell ;

		swear_VS_Commitment = L.svära_VS_Commitment ;

		babble_V_Communication_manner = L.babbla_V_Communication_manner ;
		jabber_V_Communication_manner = L.babbla_V_Communication_manner ;
		rant_V_Communication_manner = L.orera_V_Communication_manner ;
		sing_V2_Communication_manner = L.sjunga_V2_Communication_manner ;
		sing_V_Communication_manner = L.sjunga_V_Communication_manner ;
		stammer_V_Communication_manner = L.stamma_V_Communication_manner ;
		stutter_V_Communication_manner = L.stamma_V_Communication_manner ;
		whisper_V_Communication_manner = L.viska_V_Communication_manner ;

		phone_V2_Communication_means = variants {L.ringa_in_V2_Communication_means | L.ringa_upp_V2_Communication_means} ;

		cry_V2_Communication_noise = L.skrika_V2_Communication_noise ;
		cry_VS_Communication_noise = L.skrika_VS_Communication_noise ;
		scream_V2_Communication_noise = L.skrika_V2_Communication_noise ;
		scream_VS_Communication_noise = L.skrika_VS_Communication_noise ;
		squeal_V2_Communication_noise = L.skrika_V2_Communication_noise ;
		squeal_VS_Communication_noise = L.skrika_VS_Communication_noise ;
		yell_V2_Communication_noise = L.skrika_V2_Communication_noise ;
		yell_VS_Communication_noise = L.skrika_VS_Communication_noise ;

		answer_VS_Communication_response = L.svara_VS_Communication_response ;
		answer_V_Communication_response = L.svara_V_Communication_response ;
		reply_VS_Communication_response = L.svara_VS_Communication_response ;
		reply_V_Communication_response = L.svara_V_Communication_response ;
		respond_VS_Communication_response = L.svara_VS_Communication_response ;
		respond_V_Communication_response = L.svara_V_Communication_response ;

		complain_V_Complaining = L.klaga_V_Complaining ;
		lament_V_Complaining = L.klaga_V_Complaining ;

		adhere_V_Compliance = L.hålla_sig_V_Compliance ;
		follow_V2_Compliance = L.följa_V2_Compliance ;

		capture_V2_Conquering = L.ta_i_besittning_V2_Conquering ;
		fall_V_Conquering = L.falla_V_Conquering ;

		contact_V2_Contacting = L.kontakta_V2_Contacting ;

		depend_V_Contingency = variants {L.bero_V_Contingency | L.bero_på_V_Contingency} ;

		bake_V2_Cooking_creation = L.baka_V2_Cooking_creation ;
		cook_V2_Cooking_creation = variants {L.laga_V2_Cooking_creation | L.laga_till_V2_Cooking_creation} ;
		cook_up_V2_Cooking_creation = variants {L.laga_V2_Cooking_creation | L.laga_till_V2_Cooking_creation} ;
		make_V2_Cooking_creation = L.göra_V2_Cooking_creation ;

		corrode_V_Corroding = L.korrodera_V_Corroding ;
		rust_V_Corroding = L.rosta_V_Corroding ;

		conduct_V2_Cotheme = L.leda_V2_Cotheme ;
		follow_V2_Cotheme = L.följa_V2_Cotheme ;
		lead_V2_Cotheme = L.leda_V2_Cotheme ;

		draw_V2_Create_physical_artwork = variants {L.rita_V2_Create_physical_artwork | L.teckna_V2_Create_physical_artwork} ;
		paint_V2_Create_physical_artwork = L.måla_V2_Create_physical_artwork ;

		paint_V2_Create_representation = variants {L.måla_V2_Create_representation | L.måla_av_V2_Create_representation} ;

		create_V2_Creating = L.skapa_V2_Creating ;
		generate_V2_Creating = L.skapa_V2_Creating ;

		investigate_V2_Criminal_investigation = L.undersöka_V2_Criminal_investigation ;

		chop_V2_Cutting = variants {L.hacka_V2_Cutting | L.hugga_V2_Cutting | L.hugga_ned_V2_Cutting} ;
		dice_V2_Cutting = L.tärna_V2_Cutting ;
		mince_V2_Cutting = L.hacka_V2_Cutting ;
		slice_V2_Cutting = L.skära_upp_V2_Cutting ;

		risk_VV_Daring = L.ta_risken_VV_Daring ;
		venture_V2_Daring = L.våga_sig_på_V2_Daring ;
		venture_VV_Daring = L.våga_sig_på_VV_Daring ;

		croak_V_Death = variants {L.dö_V_Death | L.dö_bort_V_Death | L.dö_ut_V_Death} ;
		die_V_Death = variants {L.dö_V_Death | L.dö_bort_V_Death | L.dö_ut_V_Death} ;
		expire_V_Death = L.gå_bort_V_Death ;

		decide_VV_Deciding = L.bestämma_VV_Deciding ;

		forbid_V2V_Deny_permission = L.förbjuda_V2V_Deny_permission ;

		leave_V2_Departing = L.lämna_V2_Departing ;

		aspire_V_Desiring = L.längta_V_Desiring ;
		feel_like_V2_Desiring = L.känna_för_V2_Desiring ;
		feel_like_VV_Desiring = L.känna_för_VV_Desiring ;
		long_V_Desiring = L.längta_V_Desiring ;
		want_VV_Desiring = L.vilja_VV_Desiring ;

		annihilate_V2_Destroying = variants {L.förinta_V2_Destroying | L.tillintetgöra_V2_Destroying} ;

		differentiate_V2_Differentiation = L.skilja_åt_V2_Differentiation ;
		discriminate_V2_Differentiation = L.skilja_åt_V2_Differentiation ;
		separate_V2_Differentiation = L.skilja_åt_V2_Differentiation ;

		discuss_V_Discussion = L.diskutera_V_Discussion ;

		scatter_V2_Dispersal = L.sprida_ut_V2_Dispersal ;
		spread_V2_Dispersal = L.sprida_ut_V2_Dispersal ;

		characterize_V2_Distinctiveness = L.utmärka_V2_Distinctiveness ;

		dominate_V2_Dominate_competitor = L.dominera_V2_Dominate_competitor ;

		dominate_V2_Dominate_situation = L.dominera_V2_Dominate_situation ;

		put_on_V2_Dressing = L.sätta_på_sig_V2_Dressing ;

		copy_V2_Duplication = L.kopiera_V2_Duplication ;

		last_V_Duration_relation = L.hålla_i_sig_V_Duration_relation ;

		lose_V2_Earnings_and_losses = L.förlora_V2_Earnings_and_losses ;

		school_V2_Education_teaching = L.lära_upp_V2_Education_teaching ;
		study_V_Education_teaching = L.studera_V_Education_teaching ;

		radiate_V_Emanating = L.stråla_V_Emanating ;

		radiate_V2_Emitting = L.utstråla_V2_Emitting ;

		worry_V_Emotion_active = L.oroa_sig_V_Emotion_active ;

		boil_V_Emotion_heat = L.koka_V_Emotion_heat ;
		burn_V_Emotion_heat = L.brinna_av_iver_V_Emotion_heat ;
		seethe_V_Emotion_heat = L.koka_V_Emotion_heat ;
		simmer_V_Emotion_heat = L.sjuda_V_Emotion_heat ;

		delight_V_Emotions_of_mental_activity = L.glädja_sig_V_Emotions_of_mental_activity ;

		employ_V2_Employing = L.anställa_V2_Employing ;

		clear_V_Emptying = L.rensa_V_Emptying ;
		drain_V2_Emptying = L.tömma_V2_Emptying ;
		empty_V2_Emptying = L.tömma_V2_Emptying ;
		eviscerate_V_Emptying = L.rensa_V_Emptying ;
		strip_V2_Emptying = L.tömma_V2_Emptying ;

		encounter_V2_Encounter = L.stöta_på_V2_Encounter ;

		imperil_V2_Endangering = L.sätta_för_fara_V2_Endangering ;

		compare_V_Evaluative_comparison = L.jämföra_sig_V_Evaluative_comparison ;

		happen_V_Event = L.inträffa_V_Event ;

		attest_VS_Evidence = L.visa_VS_Evidence ;
		corroborate_V2_Evidence = variants {L.bestyrka_V2_Evidence | L.styrka_V2_Evidence} ;
		demonstrate_VS_Evidence = L.visa_VS_Evidence ;
		indicate_VQ_Evidence = L.visa_VQ_Evidence ;
		indicate_VS_Evidence = L.visa_VS_Evidence ;
		prove_VQ_Evidence = L.visa_VQ_Evidence ;
		prove_VS_Evidence = L.visa_VS_Evidence ;
		show_VQ_Evidence = L.visa_VQ_Evidence ;
		show_VS_Evidence = L.visa_VS_Evidence ;

		remind_V2_Evoking = L.påminna_V2_Evoking ;

		swap_V2_Exchange = L.byta_V2_Exchange ;
		trade_V2_Exchange = L.byta_V2_Exchange ;

		sweat_V_Excreting = L.svetta_V_Excreting ;

		implement_V2_Execute_plan = variants {L.genomföra_V2_Execute_plan | L.implementera_V2_Execute_plan} ;

		hang_V2_Execution = L.hänga_V2_Execution ;

		exist_V_Existence = L.existera_V_Existence ;

		anticipate_VS_Expectation = L.förutse_VS_Expectation ;

		break_V2_Experience_bodily_harm = L.bryta_V2_Experience_bodily_harm ;
		injure_V2_Experience_bodily_harm = L.skada_V2_Experience_bodily_harm ;

		love_V2_Experiencer_focus = L.älska_V2_Experiencer_focus ;

		bore_V2_Experiencer_obj = L.röra_V2_Experiencer_obj ;
		calm_V2_Experiencer_obj = L.lugna_V2_Experiencer_obj ;
		delight_V2_Experiencer_obj = L.fröjda_V2_Experiencer_obj ;
		enrage_V2S_Experiencer_obj = L.reta_V2S_Experiencer_obj ;
		floor_V2_Experiencer_obj = L.golva_V2_Experiencer_obj ;
		rattle_V2_Experiencer_obj = L.skaka_V2_Experiencer_obj ;
		shake_V2_Experiencer_obj = L.skaka_V2_Experiencer_obj ;
		stir_V2_Experiencer_obj = L.röra_V2_Experiencer_obj ;
		tickle_V2_Experiencer_obj = L.kittla_V2_Experiencer_obj ;
		torment_V2_Experiencer_obj = L.plåga_V2_Experiencer_obj ;

		explain_VQ_Explaining_the_facts = L.förklara_VQ_Explaining_the_facts ;

		export_V2_Exporting = L.exportera_V2_Exporting ;

		extradite_V2_Extradition = L.utlämna_V2_Extradition ;

		know_V2_Familiarity = variants {L.känna_V2_Familiarity | L.känna_till_V2_Familiarity} ;

		experience_V2_Feeling = L.uppleva_V2_Feeling ;
		feel_V_Feeling = L.känna_sig_V_Feeling ;

		simulate_V2_Feigning = L.simulera_V2_Feigning ;

		fill_V2_Filling = L.fylla_V2_Filling ;
		load_V2_Filling = L.lasta_V2_Filling ;
		paint_V2_Filling = L.måla_över_V2_Filling ;
		pile_V2_Filling = L.lasta_V2_Filling ;
		wrap_V2_Filling = variants {L.klä_V2_Filling | L.slå_in_V2_Filling} ;

		win_V2_Finish_competition = L.vinna_V2_Finish_competition ;

		lose_V_Finish_game = L.förlora_V_Finish_game ;
		win_V_Finish_game = L.vinna_V_Finish_game ;

		flee_V_Fleeing = L.fly_V_Fleeing ;

		dribble_V_Fluidic_motion = L.sippra_ur_V_Fluidic_motion ;
		flow_V_Fluidic_motion = L.rinna_V_Fluidic_motion ;
		stream_V_Fluidic_motion = L.strömma_V_Fluidic_motion ;

		refrain_V_Forgoing = L.avstå_V_Forgoing ;

		marry_V_Forming_relationships = L.gifta_sig_V_Forming_relationships ;

		squander_V2_Frugality = L.slösa_bort_V2_Frugality ;

		assemble_V2_Gathering_up = L.samla_V2_Gathering_up ;
		herd_V2_Gathering_up = L.samla_V2_Gathering_up ;

		motion_V2_Gesture = L.vinka_V2_Gesture ;
		motion_VS_Gesture = L.vinka_VS_Gesture ;
		motion_VV_Gesture = L.vinka_VV_Gesture ;

		acquire_V2_Getting = variants {L.skaffa_fram_V2_Getting | L.skaffa_sig_V2_Getting} ;

		rise_V_Getting_up = L.stiga_upp_V_Getting_up ;

		donate_V2_Giving = L.donera_V2_Giving ;
		gift_V2_Giving = L.donera_V2_Giving ;
		give_V2_Giving = L.ge_V2_Giving ;
		give_out_V2_Giving = L.ge_V2_Giving ;

		back_out_V_Going_back_on_a_commitment = L.backa_V_Going_back_on_a_commitment ;

		allow_V2_Grant_permission = L.tillåta_V2_Grant_permission ;
		permit_V2_Grant_permission = L.tillåta_V2_Grant_permission ;

		grasp_V2_Grasp = L.greppa_V2_Grasp ;
		understand_VQ_Grasp = L.förstå_VQ_Grasp ;

		crush_V_Grinding = L.krossa_V_Grinding ;
		pulverize_V2_Grinding = L.pulvrisera_V2_Grinding ;

		brush_V2_Grooming = L.borsta_V2_Grooming ;
		comb_V2_Grooming = L.kamma_ned_V2_Grooming ;
		shave_V2_Grooming = L.raka_V2_Grooming ;
		wash_V2_Grooming = variants {L.tvätta_V2_Grooming | L.tvätta_av_V2_Grooming} ;

		stop_V_Halt = variants {L.stanna_V_Halt | L.stanna_till_V_Halt | L.stanna_upp_V_Halt} ;

		demand_V2_Have_as_requirement = L.kräva_V2_Have_as_requirement ;

		hear_V2_Hear = L.höra_V2_Hear ;
		hear_VS_Hear = L.höra_VS_Hear ;
		hear_V_Hear = L.höra_V_Hear ;

		conceal_V2_Hiding_objects = L.dölja_V2_Hiding_objects ;
		hide_V2_Hiding_objects = variants {L.dölja_V2_Hiding_objects | L.gömma_V2_Hiding_objects} ;

		hinder_V2_Hindering = L.hindra_V2_Hindering ;
		inhibit_V2_Hindering = L.hämma_V2_Hindering ;

		shoot_V2_Hit_target = L.skjuta_V2_Hit_target ;

		brawl_V_Hostile_encounter = L.bråka_V_Hostile_encounter ;

		hunt_V_Hunting = L.jaga_V_Hunting ;

		imitate_V2_Imitating = L.härma_V2_Imitating ;

		hit_V2_Impact = L.träffa_V2_Impact ;
		hit_V_Impact = variants {L.slå_V_Impact | L.slå_ner_V_Impact} ;
		plough_V_Impact = L.plöja_in_V_Impact ;
		slap_V_Impact = variants {L.slå_V_Impact | L.slå_ner_V_Impact} ;
		strike_V2_Impact = L.träffa_V2_Impact ;
		thump_V_Impact = variants {L.slå_V_Impact | L.slå_ner_V_Impact} ;

		include_V2_Inclusion = L.inkludera_V2_Inclusion ;
		incorporate_V2_Inclusion = L.uppta_V2_Inclusion ;

		smoke_V2_Ingest_substance = L.röka_V2_Ingest_substance ;
		smoke_V_Ingest_substance = L.röka_ner_sig_V_Ingest_substance ;
		sniff_V2_Ingest_substance = L.sniffa_V2_Ingest_substance ;
		snort_V2_Ingest_substance = L.sniffa_V2_Ingest_substance ;
		take_V2_Ingest_substance = L.ta_V2_Ingest_substance ;
		use_V2_Ingest_substance = variants {L.använda_V2_Ingest_substance | L.bruka_V2_Ingest_substance} ;

		breakfast_V_Ingestion = L.äta_V_Ingestion ;
		dine_V_Ingestion = L.dinera_V_Ingestion ;
		drink_V2_Ingestion = L.dricka_V2_Ingestion ;
		drink_V_Ingestion = L.dricka_V_Ingestion ;
		eat_V2_Ingestion = L.äta_V2_Ingestion ;
		eat_V_Ingestion = L.äta_V_Ingestion ;
		have_V2_Ingestion = variants {L.ha_V2_Ingestion | L.äta_V2_Ingestion} ;
		ingest_V2_Ingestion = L.inta_V2_Ingestion ;
		lunch_V_Ingestion = L.äta_V_Ingestion ;
		nibble_V_Ingestion = L.knapra_V_Ingestion ;

		install_V2_Installing = L.installera_V2_Installing ;

		do_something_V_Intentionally_affect = L.göra_V_Intentionally_affect ;

		interrupt_V2_Interrupt_process = L.avbryta_V2_Interrupt_process ;

		invade_V2_Invading = L.invadera_V2_Invading ;
		invade_V_Invading = L.invadera_V_Invading ;

		accuse_V2_Judgment_communication = L.anklaga_V2_Judgment_communication ;

		compliment_V2_Judgment_direct_address = L.komplimentera_V2_Judgment_direct_address ;
		scold_V2_Judgment_direct_address = L.gräla_på_V2_Judgment_direct_address ;

		kidnap_V2_Kidnapping = L.kidnappa_V2_Kidnapping ;

		drown_V2_Killing = L.dränka_V2_Killing ;
		kill_V2_Killing = L.döda_V2_Killing ;
		slay_V2_Killing = L.slå_ihjäl_V2_Killing ;

		tie_V2_Knot_creation = L.knyta_V2_Knot_creation ;

		launch_V2_Launch_process = L.sjösätta_V2_Launch_process ;

		govern_V2_Leadership = variants {L.regera_V2_Leadership | L.styra_V2_Leadership} ;
		lead_V2_Leadership = L.leda_V2_Leadership ;
		rule_V2_Leadership = variants {L.regera_V2_Leadership | L.styra_V2_Leadership} ;

		denote_V2_Linguistic_meaning = L.betyda_V2_Linguistic_meaning ;

		find_V2_Locating = variants {L.finna_V2_Locating | L.hitta_V2_Locating} ;

		flare_V_Location_of_light = L.skimra_V_Location_of_light ;
		shimmer_V_Location_of_light = L.skimra_V_Location_of_light ;
		shine_V_Location_of_light = L.skimra_V_Location_of_light ;
		twinkle_V_Location_of_light = L.blinka_V_Location_of_light ;

		lose_V2_Losing = variants {L.tappa_V2_Losing | L.tappa_bort_V2_Losing} ;

		lose_V2_Losing_someone = L.förlora_V2_Losing_someone ;

		agree_V_Make_agreement_on_action = variants {L.komma_V_Make_agreement_on_action | L.komma_överens_V_Make_agreement_on_action} ;

		permit_V2_Make_possible_to_do = L.tillåta_V2_Make_possible_to_do ;

		grimace_V_Making_faces = L.grimasera_V_Making_faces ;

		caress_V2_Manipulation = L.smeka_V2_Manipulation ;
		clutch_V2_Manipulation = L.gripa_V2_Manipulation ;
		grab_V2_Manipulation = L.gripa_V2_Manipulation ;
		grab_V_Manipulation = L.ta_V_Manipulation ;
		grab_hold_V_Manipulation = L.ta_V_Manipulation ;
		grasp_V2_Manipulation = L.gripa_V2_Manipulation ;
		grip_V2_Manipulation = L.gripa_V2_Manipulation ;
		seize_V2_Manipulation = L.gripa_V2_Manipulation ;

		hail_V_Mass_motion = L.hagla_V_Mass_motion ;
		pour_V_Mass_motion = L.strömma_V_Mass_motion ;
		stream_V_Mass_motion = L.strömma_V_Mass_motion ;
		swarm_V_Mass_motion = L.vimla_V_Mass_motion ;
		throng_V_Mass_motion = L.tränga_sig_V_Mass_motion ;
		troop_V_Mass_motion = L.strömma_V_Mass_motion ;

		meet_with_V2_Meet_with = L.träffa_V2_Meet_with ;

		meet_V2_Meet_with_response = L.möta_V2_Meet_with_response ;

		recollect_V2_Memory = L.komma_ihåg_V2_Memory ;
		remember_V2_Memory = L.komma_ihåg_V2_Memory ;

		mention_V2_Mention = L.nämna_V2_Mention ;
		mention_VS_Mention = L.nämna_VS_Mention ;

		sin_V_Misdeed = L.synda_V_Misdeed ;

		drift_V_Motion = L.driva_bort_V_Motion ;
		go_V_Motion = L.gå_V_Motion ;

		rise_V_Motion_directional = L.stiga_upp_V_Motion_directional ;

		chug_V_Motion_noise = L.tuffa_V_Motion_noise ;
		clatter_V2_Motion_noise = L.slamra_V2_Motion_noise ;
		whine_V_Motion_noise = L.vina_V_Motion_noise ;

		swing_V_Moving_in_place = L.svänga_V_Moving_in_place ;

		christen_V2_Name_conferral = variants {L.döpa_V2_Name_conferral | L.döpa_om_V2_Name_conferral} ;

		need_V2_Needing = L.behöva_V2_Needing ;

		indict_V2_Notification_of_charges = L.åtala_V2_Notification_of_charges ;

		show_V_Obviousness = L.visa_sig_V_Obviousness ;

		offer_V2_Offering = L.erbjuda_V2_Offering ;

		augur_V_Omen = L.båda_V_Omen ;
		bode_V_Omen = L.båda_V_Omen ;
		foretell_V2_Omen = L.förutspå_V2_Omen ;

		bicycle_V_Operate_vehicle = L.cykla_V_Operate_vehicle ;
		bike_V_Operate_vehicle = L.cykla_V_Operate_vehicle ;
		drive_V_Operate_vehicle = L.köra_V_Operate_vehicle ;
		paddle_V_Operate_vehicle = L.paddla_V_Operate_vehicle ;

		operate_V2_Operating_a_system = L.operera_V2_Operating_a_system ;

		test_V2_Operational_testing = L.testa_V2_Operational_testing ;

		feel_VS_Opinion = L.anse_VS_Opinion ;

		sympathize_V_Others_situation_as_stimulus = L.sympatisera_V_Others_situation_as_stimulus ;

		ascend_V_Path_shape = variants {L.gå_V_Path_shape | L.stiga_V_Path_shape} ;
		crisscross_V2_Path_shape = L.korsa_V2_Path_shape ;
		meander_V_Path_shape = L.slingra_sig_V_Path_shape ;
		reach_V_Path_shape = L.gå_V_Path_shape ;
		rise_V_Path_shape = L.stiga_V_Path_shape ;
		snake_V_Path_shape = L.slingra_sig_V_Path_shape ;
		swing_V_Path_shape = L.svänga_V_Path_shape ;
		veer_V_Path_shape = L.svänga_V_Path_shape ;

		feel_V2_Perception_active = L.känna_V2_Perception_active ;
		glance_V_Perception_active = variants {L.titta_V_Perception_active | L.titta_på_V_Perception_active} ;
		look_V_Perception_active = variants {L.se_V_Perception_active | L.titta_V_Perception_active | L.se_på_V_Perception_active | L.titta_på_V_Perception_active} ;
		peer_V_Perception_active = L.kisa_V_Perception_active ;
		smell_V_Perception_active = L.lukta_V_Perception_active ;
		spy_V_Perception_active = variants {L.se_V_Perception_active | L.se_på_V_Perception_active} ;
		watch_V_Perception_active = variants {L.se_V_Perception_active | L.titta_V_Perception_active | L.se_på_V_Perception_active | L.titta_på_V_Perception_active} ;

		ache_V_Perception_body = L.värka_V_Perception_body ;
		hurt_V_Perception_body = L.göra_ont_V_Perception_body ;
		prickle_V_Perception_body = L.sticka_V_Perception_body ;
		sting_V_Perception_body = L.sticka_V_Perception_body ;
		tickle_V_Perception_body = L.kittla_V_Perception_body ;

		feel_V2_Perception_experience = L.känna_V2_Perception_experience ;
		perceive_V2_Perception_experience = L.se_V2_Perception_experience ;
		see_V2_Perception_experience = variants {L.se_V2_Perception_experience | L.syna_V2_Perception_experience} ;

		play_V2_Performers_and_roles = L.spela_V2_Performers_and_roles ;

		permit_V2_Permitting = L.tillåta_V2_Permitting ;

		cohabit_V_Personal_relationship = L.sammanbo_V_Personal_relationship ;

		hijack_V2_Piracy = L.kapa_V2_Piracy ;

		bag_V2_Placing = variants {L.packa_V2_Placing | L.packa_in_V2_Placing | L.packa_ner_V2_Placing | L.packa_om_V2_Placing} ;
		jam_V2_Placing = L.stoppa_V2_Placing ;
		load_V2_Placing = L.lasta_V2_Placing ;
		pack_V2_Placing = variants {L.packa_V2_Placing | L.packa_in_V2_Placing | L.packa_ner_V2_Placing | L.packa_om_V2_Placing} ;
		package_V2_Placing = variants {L.packa_V2_Placing | L.packa_in_V2_Placing | L.packa_ner_V2_Placing | L.packa_om_V2_Placing} ;
		park_V2_Placing = L.placera_V2_Placing ;
		pile_V2_Placing = L.lasta_V2_Placing ;
		place_V2_Placing = L.placera_V2_Placing ;
		position_V2_Placing = L.placera_V2_Placing ;
		stick_V2_Placing = L.stoppa_V2_Placing ;
		stow_V2_Placing = variants {L.packa_V2_Placing | L.packa_in_V2_Placing | L.packa_ner_V2_Placing | L.packa_om_V2_Placing} ;
		stuff_V2_Placing = L.stoppa_V2_Placing ;
		wrap_V2_Placing = L.slå_V2_Placing ;

		plant_V2_Planting = L.plantera_V2_Planting ;
		sow_V2_Planting = L.så_V2_Planting ;

		have_V2_Possession = L.ha_V2_Possession ;

		hunch_V_Posture = L.huka_sig_V_Posture ;
		lean_V_Posture = variants {L.luta_V_Posture | L.luta_sig_V_Posture} ;
		lie_V_Posture = L.ligga_V_Posture ;
		sit_V_Posture = variants {L.sitta_V_Posture | L.sitta_ner_V_Posture} ;
		squat_V_Posture = variants {L.sitta_V_Posture | L.sitta_ner_V_Posture} ;
		stand_V_Posture = variants {L.stå_V_Posture | L.stå_upp_V_Posture} ;
		stoop_V_Posture = L.kuta_V_Posture ;

		practice_V2_Practice = variants {L.träna_V2_Practice | L.träna_upp_V2_Practice | L.öva_in_V2_Practice | L.öva_upp_V2_Practice} ;
		practice_V_Practice = L.öva_V_Practice ;
		rehearse_V_Practice = L.repetera_V_Practice ;

		rain_V_Precipitation = L.regna_floder_V_Precipitation ;
		snow_V_Precipitation = L.snöa_V_Precipitation ;

		foretell_V2_Predicting = L.förutspå_V2_Predicting ;
		foretell_VQ_Predicting = L.förutspå_VQ_Predicting ;
		prophesy_V2_Predicting = L.förutspå_V2_Predicting ;
		prophesy_VQ_Predicting = L.förutspå_VQ_Predicting ;

		can_V2_Preserving = L.konservera_V2_Preserving ;
		pickle_V2_Preserving = variants {L.sylta_V2_Preserving | L.sylta_in_V2_Preserving} ;

		lie_V_Prevarication = L.ljuga_V_Prevarication ;

		prevent_V2_Preventing = L.förhindra_V2_Preventing ;
		stop_V2_Preventing = L.stoppa_V2_Preventing ;

		end_V_Process_end = L.sluta_V_Process_end ;

		begin_V_Process_start = L.börja_V_Process_start ;
		commence_V_Process_start = L.börja_V_Process_start ;

		prohibit_V2_Prohibiting = L.förbjuda_V2_Prohibiting ;

		protect_V2_Protecting = L.skydda_V2_Protecting ;
		shield_V2_Protecting = L.skydda_V2_Protecting ;

		row_V_Quarreling = L.bråka_V_Quarreling ;

		ask_V2_Questioning = variants {L.fråga_V2_Questioning | L.rådfråga_V2_Questioning} ;
		ask_VQ_Questioning = L.fråga_VQ_Questioning ;
		grill_V2_Questioning = L.grilla_V2_Questioning ;
		inquire_VQ_Questioning = L.fråga_VQ_Questioning ;
		interrogate_V2_Questioning = L.förhöra_V2_Questioning ;
		question_V2_Questioning = L.fråga_V2_Questioning ;

		quit_V_Quitting = L.avgå_V_Quitting ;
		resign_V_Quitting = L.avgå_V_Quitting ;

		skedaddle_V_Quitting_a_place = L.dra_sig_tillbaka_V_Quitting_a_place ;

		ratify_V2_Ratification = L.ratificera_V2_Ratification ;

		devour_V2_Reading = L.sluka_V2_Reading ;
		peruse_V2_Reading = L.läsa_V2_Reading ;
		read_V2_Reading = L.läsa_V2_Reading ;
		scan_V2_Reading = variants {L.skumma_V2_Reading | L.skumma_igenom_V2_Reading} ;
		skim_V2_Reading = variants {L.skumma_V2_Reading | L.skumma_igenom_V2_Reading} ;

		read_V2_Reading_aloud = variants {L.läsa_V2_Reading_aloud | L.läsa_upp_V2_Reading_aloud} ;
		read_out_V2_Reading_aloud = variants {L.läsa_V2_Reading_aloud | L.läsa_upp_V2_Reading_aloud} ;

		argue_V_Reasoning = L.argumentera_V_Reasoning ;
		prove_VS_Reasoning = L.bevisa_VS_Reasoning ;
		show_VS_Reasoning = L.bevisa_VS_Reasoning ;

		heal_V2_Recovery = L.läka_V2_Recovery ;
		heal_V_Recovery = L.läka_V_Recovery ;
		recover_V_Recovery = L.återhämta_sig_V_Recovery ;

		see_V2_Reference_text = variants {L.se_V2_Reference_text | L.se_även_V2_Reference_text} ;

		restructure_V2_Reforming_a_system = L.omstrukturera_V2_Reforming_a_system ;

		rejuvenate_V2_Rejuvenation = L.föryngra_V2_Rejuvenation ;
		resuscitate_V2_Rejuvenation = L.återuppliva_V2_Rejuvenation ;

		link_V2_Relating_concepts = variants {L.förbinda_V2_Relating_concepts | L.förena_V2_Relating_concepts} ;

		follow_V_Relative_time = L.följa_V_Relative_time ;

		release_V2_Releasing = L.släppa_loss_V2_Releasing ;

		believe_VS_Religious_belief = L.tro_VS_Religious_belief ;
		believe_V_Religious_belief = L.tro_V_Religious_belief ;

		remain_V_Remainder = L.kvarstå_V_Remainder ;

		forget_VV_Remembering_to_do = L.glömma_VV_Remembering_to_do ;

		drain_V2_Removing = variants {L.tömma_V2_Removing | L.tömma_ur_V2_Removing | L.tömma_ut_V2_Removing} ;
		eject_V2_Removing = L.vräka_V2_Removing ;
		empty_V2_Removing = variants {L.tömma_V2_Removing | L.tömma_ur_V2_Removing | L.tömma_ut_V2_Removing} ;
		evacuate_V2_Removing = L.evakuera_V2_Removing ;
		pluck_V2_Removing = variants {L.plocka_bort_V2_Removing | L.plocka_ur_V2_Removing | L.plocka_ut_V2_Removing} ;
		strip_V2_Removing = variants {L.tömma_V2_Removing | L.tömma_ur_V2_Removing | L.tömma_ut_V2_Removing} ;
		unload_V2_Removing = L.lossa_V2_Removing ;
		wash_V2_Removing = variants {L.tvätta_V2_Removing | L.tvätta_av_V2_Removing | L.tvätta_bort_V2_Removing} ;

		rent_V2_Renting = variants {L.hyra_V2_Renting | L.hyra_in_V2_Renting} ;

		rent_V2_Renting_out = L.hyra_ut_V2_Renting_out ;

		replace_V2_Replacing = L.ersätta_V2_Replacing ;
		substitute_V2_Replacing = variants {L.ersätta_V2_Replacing | L.substituera_V2_Replacing} ;

		rat_V_Reporting = L.tjalla_V_Reporting ;
		snitch_V_Reporting = variants {L.gola_V_Reporting | L.tjalla_V_Reporting} ;

		order_V2V_Request = L.befalla_V2V_Request ;
		summon_V2_Request = L.kalla_ut_V2_Request ;

		research_V_Research = L.forska_V_Research ;

		crumple_V2_Reshaping = L.krossa_V2_Reshaping ;
		crush_V2_Reshaping = L.krossa_V2_Reshaping ;
		fold_V2_Reshaping = L.vika_ihop_V2_Reshaping ;

		dwell_V_Residence = L.bo_V_Residence ;
		live_V_Residence = L.bo_V_Residence ;
		reside_V_Residence = L.bo_V_Residence ;
		stay_V_Residence = L.bo_V_Residence ;

		reject_V2_Respond_to_proposal = L.avslå_V2_Respond_to_proposal ;

		confide_VS_Reveal_secret = L.anförtro_VS_Reveal_secret ;
		confide_V_Reveal_secret = variants {L.anförtro_V_Reveal_secret | L.anförtro_sig_V_Reveal_secret} ;
		divulge_V2_Reveal_secret = L.avslöja_V2_Reveal_secret ;
		divulge_VQ_Reveal_secret = L.avslöja_VQ_Reveal_secret ;
		divulge_VS_Reveal_secret = L.avslöja_VS_Reveal_secret ;
		reveal_VQ_Reveal_secret = L.avslöja_VQ_Reveal_secret ;
		reveal_VS_Reveal_secret = L.avslöja_VS_Reveal_secret ;

		retaliate_V2_Revenge = L.hämna_V2_Revenge ;

		punish_V2_Rewards_and_punishments = L.straffa_V2_Rewards_and_punishments ;

		hitchhike_V_Ride_vehicle = L.lifta_V_Ride_vehicle ;
		take_V2_Ride_vehicle = L.ta_V2_Ride_vehicle ;

		christen_V2_Rite = L.döpa_V2_Rite ;

		mug_V2_Robbery = L.råna_V2_Robbery ;
		rob_V2_Robbery = L.råna_V2_Robbery ;

		risk_V2_Run_risk = L.riskera_V2_Run_risk ;
		risk_VV_Run_risk = L.riskera_VV_Run_risk ;

		satisfy_V2_Satisfying = L.tillfredsställa_V2_Satisfying ;

		investigate_V2_Scrutiny = L.undersöka_V2_Scrutiny ;

		bound_V_Self_motion = variants {L.hoppa_bock_V_Self_motion | L.hoppa_fallskärm_V_Self_motion} ;
		climb_V_Self_motion = L.stiga_fram_V_Self_motion ;
		head_V_Self_motion = L.åka_skridskor_V_Self_motion ;
		hop_V_Self_motion = variants {L.hoppa_bock_V_Self_motion | L.hoppa_fallskärm_V_Self_motion} ;
		jump_V_Self_motion = variants {L.hoppa_bock_V_Self_motion | L.hoppa_fallskärm_V_Self_motion} ;
		leap_V_Self_motion = variants {L.hoppa_bock_V_Self_motion | L.hoppa_fallskärm_V_Self_motion} ;
		pace_V_Self_motion = L.stiga_fram_V_Self_motion ;
		rush_V_Self_motion = L.störta_V_Self_motion ;
		skip_V_Self_motion = variants {L.hoppa_bock_V_Self_motion | L.hoppa_fallskärm_V_Self_motion} ;
		spring_V_Self_motion = variants {L.hoppa_bock_V_Self_motion | L.hoppa_fallskärm_V_Self_motion} ;

		forward_V2_Sending = variants {L.skicka_bort_V2_Sending | L.skicka_in_V2_Sending | L.skicka_med_V2_Sending | L.skicka_ner_V2_Sending | L.skicka_ut_V2_Sending | L.skicka_över_V2_Sending} ;
		post_V2_Sending = variants {L.skicka_bort_V2_Sending | L.skicka_in_V2_Sending | L.skicka_med_V2_Sending | L.skicka_ner_V2_Sending | L.skicka_ut_V2_Sending | L.skicka_över_V2_Sending} ;
		send_V2_Sending = variants {L.skicka_bort_V2_Sending | L.skicka_in_V2_Sending | L.skicka_med_V2_Sending | L.skicka_ner_V2_Sending | L.skicka_ut_V2_Sending | L.skicka_över_V2_Sending} ;
		ship_V2_Sending = L.skeppa_V2_Sending ;

		sentence_V2_Sentencing = L.döma_V2_Sentencing ;

		set_off_V_Setting_out = L.sätta_av_V_Setting_out ;

		shoot_V2_Shoot_projectiles = variants {L.skjuta_V2_Shoot_projectiles | L.skjuta_iväg_V2_Shoot_projectiles} ;

		rise_V_Sidereal_appearance = variants {L.stiga_V_Sidereal_appearance | L.stiga_upp_V_Sidereal_appearance} ;

		sign_V2_Sign_agreement = L.skriva_under_V2_Sign_agreement ;

		shush_V2_Silencing = L.hyssja_ner_V2_Silencing ;

		kip_V_Sleep = L.sova_V_Sleep ;
		sleep_V_Sleep = L.sova_V_Sleep ;
		slumber_V_Sleep = L.slumra_V_Sleep ;

		smuggle_V2_Smuggling = variants {L.smuggla_V2_Smuggling | L.smuggla_in_V2_Smuggling} ;

		absorb_V2_Soaking_up = L.absorbera_V2_Soaking_up ;

		echo_V_Sound_movement = L.eka_V_Sound_movement ;

		remain_V_State_continue = L.förbli_V_State_continue ;

		announce_VS_Statement = L.annonsera_VS_Statement ;
		report_V_Statement = L.rapportera_V_Statement ;
		say_VS_Statement = L.säga_VS_Statement ;
		speak_V_Statement = L.tala_V_Statement ;
		talk_V_Statement = L.tala_V_Statement ;
		write_V_Statement = L.skriva_V_Statement ;

		store_V2_Storing = L.lagra_V2_Storing ;

		study_V2_Studying = L.studera_V2_Studying ;

		persuade_V2S_Suasion = L.övertala_V2S_Suasion ;
		persuade_V2V_Suasion = L.övertala_V2V_Suasion ;

		fail_V2_Success_or_failure = L.misslyckas_V2_Success_or_failure ;

		do_the_trick_V_Successful_action = L.göra_susen_V_Successful_action ;

		suffice_V_Sufficiency = variants {L.förslå_V_Sufficiency | L.räcka_V_Sufficiency | L.räcka_till_V_Sufficiency} ;

		provide_V2_Supply = L.förse_V2_Supply ;
		supply_V2_Supply = L.förse_V2_Supply ;

		buttress_V2_Supporting = L.stötta_V2_Supporting ;
		support_V2_Supporting = variants {L.stödja_V2_Supporting | L.stötta_V2_Supporting} ;

		surrender_V_Surrendering = L.överlämna_sig_V_Surrendering ;

		relinquish_V2_Surrendering_possession = L.lämna_ifrån_sig_V2_Surrendering_possession ;
		surrender_V2_Surrendering_possession = L.överlämna_V2_Surrendering_possession ;
		yield_V2_Surrendering_possession = L.överlämna_V2_Surrendering_possession ;

		replace_V2_Take_place_of = L.ersätta_V2_Take_place_of ;
		substitute_V2_Take_place_of = variants {L.ersätta_V2_Take_place_of | L.substituera_V2_Take_place_of} ;

		try_V2_Tasting = L.prova_V2_Tasting ;

		tell_V2_Telling = L.berätta_V2_Telling ;
		tell_V_Telling = L.berätta_V_Telling ;

		sleep_over_V_Temporary_stay = L.sova_över_V_Temporary_stay ;
		stay_V_Temporary_stay = L.bo_V_Temporary_stay ;
		stay_over_V_Temporary_stay = L.bo_V_Temporary_stay ;

		say_V2_Text_creation = L.säga_V2_Text_creation ;
		write_V2_Text_creation = L.skriva_V2_Text_creation ;
		write_down_V2_Text_creation = L.skriva_V2_Text_creation ;
		write_out_V2_Text_creation = L.skriva_V2_Text_creation ;
		write_up_V2_Text_creation = L.skriva_V2_Text_creation ;

		embezzle_V2_Theft = L.förskingra_V2_Theft ;
		pilfer_V_Theft = L.snatta_V_Theft ;
		shoplift_V_Theft = L.snatta_V_Theft ;

		thrive_V_Thriving = L.blomstra_V_Thriving ;

		commute_V_Travel = L.pendla_V_Travel ;

		cross_V2_Traversing = L.passera_V2_Traversing ;

		try_V2_Trying_out = variants {L.pröva_V2_Trying_out | L.pröva_på_V2_Trying_out} ;
		try_out_V2_Trying_out = variants {L.pröva_V2_Trying_out | L.pröva_på_V2_Trying_out} ;

		swing_V_Undergo_change = L.svänga_V_Undergo_change ;
		veer_V_Undergo_change = L.svänga_V_Undergo_change ;

		apply_V2_Using = L.tillämpa_V2_Using ;

		find_V2_Verdict = L.finna_V2_Verdict ;

		visit_V2_Visiting = L.besöka_V2_Visiting ;

		wait_V_Waiting = L.vänta_V_Waiting ;

		wake_V_Waking_up = variants {L.vakna_V_Waking_up | L.vakna_upp_V_Waking_up} ;
		wake_up_V_Waking_up = variants {L.vakna_V_Waking_up | L.vakna_upp_V_Waking_up} ;

		win_V2_Win_prize = L.vinna_V2_Win_prize ;

}
