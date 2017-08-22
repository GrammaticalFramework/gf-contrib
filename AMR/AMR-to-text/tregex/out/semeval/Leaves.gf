--# -path=../../../lexicons/translator

abstract Leaves = Cat, Dictionary ** {

	fun

		-- Manually added:

		administrate_V : V ;	-- missing in Dictionary
		analyze_V : V ;			-- only analyze_V2 in Dictionary
		attack_V : V ;			-- only attack_V2 in Dictionary
		byline_V : V ;			-- FIXME
		cause_V : V ;			-- only cause_V2 in Dictionary
		commit_V : V ;			-- only commit_V2 in Dictionary
		counsel_V : V ;			-- only counsel_V2 in Dictionary
		defend_V : V ;			-- subcat in Dictionary
		do_V : V ;				-- subcat in Dictionary
		enrich_V : V ;			-- only enrich_V2 in Dictionary
		entertain_V : V ;		-- only entertain_V2 in Dictionary
		exempt_V : V ;			-- only exempt_V2 in Dictionary
		inspect_V : V ;			-- only inspect_V2 in Dictionary
		kidnap_V : V ;			-- only kidnap_V2 in Dictionary
		limit_V : V ;			-- only limit_V2 in Dictionary
		mean_V : V ;			-- from IrregEng
		opine_V : V ;			-- only opine_V2 in Dictionary
		pledge_V : V ;			-- only pledge_V2 in Dictionary
		prosecute_V : V ;		-- only prosecute_V2 in Dictionary
		ranch_V : V ;			-- missing in Dictionary
		sanction_V : V ;		-- only sanction_V2 in Dictionary
		state_V : V ;			-- only state_V2 in Dictionary
		support_V : V ;			-- only support_V2 in Dictionary
		tolerate_V : V ;		-- only tolerate_V2 in Dictionary

		belong_V2 : V2 ;		-- the mapping between belong_V2 and belong_to_V2 is not straightforward
		byline_V2 : V2 ;		-- FIXME (?)
		conflict_V2 : V2 ;		-- only conflict_V in Dictionary
		counter_V2 : V2 ;		-- subcat in Dictionary
		explode_V2 : V2 ;		-- subcat in Dictionary
		fall_V2 : V2 ;			-- subcat in Dictionary
		go_V2 : V2 ;			-- subcat in Dictionary
		google_V2 : V2 ;		-- missing in Dictionary
		hyperlink_V2 : V2 ;		-- missing in Dictionary
		lane_V2 : V2 ;			-- missing in Dictionary
		misidentify_V2 : V2 ;	-- missing in Dictionary
		pass_V2 : V2 ;			-- subcat in Dictionary
		recover_V2 : V2 ; 		-- only recover_V in Dictionary
		result_V2 : V2 ;		-- only result_V in Dictionary
		traffic_V2 : V2 ;		-- only traffic_V in Dictionary
		transfer_V2 : V2 ;		-- subcat in Dictionary

		begin_VV : VV ;			-- only begin_V2 in Dictionary
		contrast_VV : VV ;		-- only contrast_V2 in Dictionary
		convince_VV : VV ;		-- only convince_V2 in Dictionary
		obligate_VV : VV ;		-- only obligate_V2 in Dictionary
		order_VV : VV ;			-- subcat in Dictionary
		start_VV : VV ;			-- only start_V2 in Dictionary
		urge_VV : VV ;			-- missing in Dictionary

		allow_VS : VS ;			-- subcat in Dictionary
		answer_VS : VS ;		-- only answer_V2 in Dictionary
		call_VS : VS ;			-- only call_V2 in Dictionary
		cause_VS : VS ;			-- subcat in Dictionary
		criticize_VS : VS ;		-- only criticize_V2 in Dictionary
		decline_VS : VS ;		-- subcat in Dictionary
		express_VS : VS ;		-- only express_V2 in Dictionary
		forbid_VS : VS ;		-- only forbid_VS in Dictionary
		intend_VS : VS ;		-- only intend_V2 in Dictionary
		let_VS : VS ;			-- subcat in Dictionary
		love_VS : VS ;			-- only love_V2 in Dictionary
		make_VS : VS ;			-- subcat in Dictionary
		need_VS : VS ;			-- subcat in Dictionary
		offer_VS : VS ;			-- subcat in Dictionary
		outline_VS : VS ;		-- only outline_V2 in Dictionary
		present_VS : VS ;		-- only present_V2 in Dictionary
		pursue_VS : VS ;		-- only pursue_V2 in Dictionary
		quote_VS : VS ;			-- missing in Dictionary
		recommend_VS : VS ;		-- only recommend_V2 in Dictionary
		refuse_VS : VS ;		-- missing in Dictionary
		suffer_VS : VS ;		-- missing in Dictionary
		support_VS : VS ;		-- missing in Dictionary
		want_VS : VS ;			-- subcat in Dictionary
		will_VS : VS ;			-- only will_V2 in Dictionary

		any_N : N ;				-- FIXME
		center_N : N ;			-- missing in Dictionary
		citizen_N : N ;			-- citizenFem_N in Dictionary
		here_N : N ;			-- FIXME
		president_N : N ;		-- presidentMasc_N in Dictionary
		official_N : N ;		-- missing in Dictionary
		one_N : N ;				-- missing in Dictionary / FIXME
		some_N : N ;			-- FIXME
		there_N : N ;			-- FIXME

		interest_A : A ;		-- the mapping between "interest" and "interesting" is not straightforward

		just_AdA : AdA ;		-- missing in Dictionary
		more_AdA : AdA ;		-- missing in Dictionary
		most_AdA : AdA ;		-- missing in Dictionary

		what_IAdv : IAdv ;		-- FIXME (?)

		all_Det : Det ;			-- vs. all_Quant
		more_Det : Det ;		-- vs. more_Quant

		part_Prep : Prep ;		-- see Structural

		CAU_Prep : Prep ;		-- temporary
		COM_Prep : Prep ;		-- temporary
		DIR_Prep : Prep ;		-- temporary
		EXT_Prep : Prep ;		-- temporary
		GOL_Prep : Prep ;		-- temporary
		LOC_Prep : Prep ;		-- temporary
		MNR_Prep : Prep ;		-- temporary
		PAG_Prep : Prep ;		-- temporary
		PPT_Prep : Prep ;		-- temporary
		PRD_Prep : Prep ;		-- temporary
		PRP_Prep : Prep ;		-- temporary
		VSP_Prep : Prep ;		-- temporary

		-- Mapping of PropBank noun frames

		agree_N : N ;
		assemble_N : N ;
		depart_N : N ;
		discuss_N : N ;
		explode_N : N ;
		investigate_N : N ;
		negotiate_N : N ;
		participate_N : N ;
		proliferate_N : N ;
		secede_N : N ;
		swear_in_N : N ;
		verify_N : N ;

		-- Extracted from DictionaryEng:

		actor_N : N ;
		application_N : N ;
		area_N : N ;
		arm_N : N ;
		attempt_N : N ;
		authority_N : N ;
		away_Adv : Adv ;
		back_up_V2 : V2 ;
		bank_N : N ;
		bar_N : N ;
		battery_N : N ;
		beef_N : N ;
		board_N : N ;
		bold_A : A ;
		can_VV : VV ;
		cannon_N : N ;
		cap_N : N ;
		capital_N : N ;
		card_N : N ;
		certain_A : A ;
		character_N : N ;
		charge_N : N ;
		club_N : N ;
		coach_N : N ;
		command_N : N ;
		commode_N : N ;
		common_A : A ;
		company_N : N ;
		condition_N : N ;
		conservative_N : N ;
		constipate_V2 : V2 ;
		correction_N : N ;
		cortege_N : N ;
		count_N : N ;
		court_N : N ;
		crepe_N : N ;
		critical_A : A ;
		current_N : N ;
		date_N : N ;
		debut_N : N ;
		degree_N : N ;
		disco_N : N ;
		division_N : N ;
		draw_V2 : V2 ;
		economy_N : N ;
		elder_N : N ;
		enclosure_N : N ;
		end_N : N ;
		entry_N : N ;
		even_A : A ;
		evidence_N : N ;
		exponent_N : N ;
		fall_N : N ;
		fan_N : N ;
		field_N : N ;
		figure_N : N ;
		film_N : N ;
		fire_N : N ;
		foreign_A : A ;
		fork_N : N ;
		free_A : A ;
		future_N : N ;
		game_N : N ;
		gender_N : N ;
		get_on_V2 : V2 ;
		glass_N : N ;
		goal_N : N ;
		ground_N : N ;
		gull_N : N ;
		hard_A : A ;
		ill_A : A ;
		in_Adv : Adv ;
		in_the_end_Adv : Adv ;
		in_the_main_Adv : Adv ;
		independent_A : A ;
		indianFem_N : N ;
		indianMasc_N : N ;
		intelligence_N : N ;
		interest_N : N ;
		issue_N : N ;
		juice_N : N ;
		key_N : N ;
		kip_N : N ;
		lager_N : N ;
		last_A : A ;
		law_N : N ;
		league_N : N ;
		lepton_N : N ;
		letter_N : N ;
		level_N : N ;
		lie_V : V ;
		light_A : A ;
		lime_N : N ;
		loop_N : N ;
		lot_N : N ;
		market_N : N ;
		marrow_N : N ;
		mass_N : N ;
		master_N : N ;
		match_N : N ;
		mateFem_N : N ;
		mateMasc_N : N ;
		matter_N : N ;
		maturity_N : N ;
		may_VV : VV ;
		minister_N : N ;
		mould_N : N ;
		move_V : V ;
		note_N : N ;
		number_N : N ;
		odd_A : A ;
		officer_N : N ;
		orange_N : N ;
		palm_N : N ;
		party_N : N ;
		pate_N : N ;
		pen_N : N ;
		performance_N : N ;
		period_N : N ;
		personally_Adv : Adv ;
		pharmacy_N : N ;
		pipe_N : N ;
		plant_N : N ;
		play_V : V ;
		play_V2 : V2 ;
		point_N : N ;
		poor_A : A ;
		pound_N : N ;
		property_N : N ;
		race_N : N ;
		real_N : N ;
		recognize_V2 : V2 ;
		record_N : N ;
		regime_N : N ;
		right_A : A ;
		right_Adv : Adv ;
		rock_N : N ;
		rocket_N : N ;
		room_N : N ;
		sake_N : N ;
		school_N : N ;
		script_N : N ;
		scuff_N : N ;
		set_N : N ;
		sex_N : N ;
		single_A : A ;
		sling_N : N ;
		solution_N : N ;
		space_N : N ;
		spring_N : N ;
		staff_N : N ;
		stainless_A : A ;
		stamp_N : N ;
		starter_N : N ;
		state_N : N ;
		station_N : N ;
		stone_N : N ;
		strike_N : N ;
		string_N : N ;
		subject_N : N ;
		table_N : N ;
		tambour_N : N ;
		tangent_N : N ;
		tectonic_A : A ;
		time_N : N ;
		torch_N : N ;
		typical_A : A ;
		uneven_A : A ;
		unit_N : N ;
		variety_N : N ;
		view_N : N ;
		voucher_N : N ;
		watch_V2 : V2 ;
		way_N : N ;
		web_N : N ;
		work_V : V ;
		yet_Adv : Adv ;

}
