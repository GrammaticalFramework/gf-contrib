concrete PatternsEng of Patterns = ElementsEng ** open SyntaxEng, Maybe in {

	flags coding = utf8 ;

	lin
		--
		-- Abandonment
		--

		Abandonment_V2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[she] [FORGOT] <Theme>[her hairbrush]

		Abandonment_V2_Pass theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Theme>[Another vehicle] was [ABANDONED]

		--
		-- Abounding_with
		--

		Abounding_with_V location_np theme_adv v = lin Clause {
			np = fromMaybe NP emptyNP location_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Location>[The streets] are quite narrow , and [THRONGED] <Theme>[with people]

		--
		-- Absorb_heat
		--

		Absorb_heat_V entity_np heat_source_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv heat_source_adv)
		} ;
		-- <Entity>[a saucepan] [SIZZLED] , now and then , <Heat_source>[upon the diminutive stove]

		--
		-- Abundance
		--

		Abundance_V collection_np place_adv v = lin Clause {
			np = fromMaybe NP emptyNP collection_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv place_adv)
		} ;
		-- <Collection>[Memories] [ABOUND] <Place>[on the tee] , <Collection>[of Lyle hitting his seven-iron from the fairway bunker to 10 ft , of Woosnam creaming his drive way to the left and almost redefining the way to play the hole]

		--
		-- Abusing
		--

		Abusing_V2 abuser_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP abuser_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Abuser>[its servants] <Abuser>[who] [MALTREATED] <Victim>[the natives]

		--
		-- Accomplishment
		--

		Accomplishment_V2 agent_np goal_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goal_np)
		} ;
		-- <Agent>[Jeremy] [ACCOMPLISHED] <Goal>[this task]

		Accomplishment_V2_Pass goal_np v2 = lin Clause {
			np = fromMaybe NP emptyNP goal_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Goal>[this] be [ACHIEVED]

		--
		-- Achieving_first
		--

		Achieving_first_V2 cognizer_np new_idea_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP new_idea_np)
		} ;
		-- <Cognizer>[he] [INVENTED] <New_idea>[the pi-meson]

		Achieving_first_VS cognizer_np new_idea_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS new_idea_s)
		} ;
		-- <Cognizer>[An American scientist] has [INVENTED] <New_idea>[a fuel cell which he claims can store hydrogen safely]

		--
		-- Activity_finish
		--

		Activity_finish_V2 activity_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Agent>[the OPCS] had [CONCLUDED] <Activity>[its disability surveys]

		Activity_finish_V2_Pass activity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP activity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Activity>[The wine] was [FINISHED]

		--
		-- Activity_ongoing
		--

		Activity_ongoing_VV activity_vp agent_np vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP activity_vp)
		} ;
		-- <Agent>[we] [KEPT] <Activity>[working]

		--
		-- Activity_pause
		--

		Activity_pause_V2 activity_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Agent>[you] want to [SUSPEND] <Activity>[this policy]

		--
		-- Activity_prepare
		--

		Activity_prepare_V activity_adv agent_np v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv activity_adv)
		} ;
		-- <Agent>[we] [READIED] <Activity>[for the weekend 's big attraction : a copy of a New Generation episode , not due to be shown here for months]

		--
		-- Activity_resume
		--

		Activity_resume_V2 activity_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Agent>[The umpires] tried to [RESTART] <Activity>[the game]

		Activity_resume_V2_Pass activity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP activity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Activity>[The trial] was [RESUMED]

		--
		-- Activity_start
		--

		Activity_start_V activity_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv activity_adv)
		} ;
		-- [ENTERING] <Activity>[into detailed debate on these contentious issues]

		Activity_start_V2 activity_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Agent>[Major] has [ENTERED] <Activity>[phase two of his premiership]

		Activity_start_VV activity_vp agent_np vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP activity_vp)
		} ;
		-- <Agent>[it] [COMMENCED] <Activity>[to play a tinkling version of ` The Bluebells of Scotland]

		Activity_start_V2_Pass activity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP activity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Activity>[Follow-up testing] has been [STARTED]

		--
		-- Activity_stop
		--

		Activity_stop_V2 activity_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Agent>[The fliers] [STOPPED] <Activity>[their displays]

		Activity_stop_VV activity_vp agent_np vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP activity_vp)
		} ;
		-- <Agent>[we] would have to [DISCONTINUE] <Activity>[visiting those schools]

		Activity_stop_V2_Pass activity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP activity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Activity>[A ROBBERY trial] was [HALTED]

		--
		-- Adding_up
		--

		Adding_up_V2_1 numbers_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP numbers_np)
		} ;
		-- [TOTALLING] <Numbers>[a column of numbers]

		Adding_up_V2_2 result_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP result_np)
		} ;
		-- [TOTALLING] <Result>[the number of such problems ( listed in the box )]

		--
		-- Adducing
		--

		Adducing_V2 speaker_np specified_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP specified_entity_np)
		} ;
		-- <Speaker>[Neumann] also [CITES] <Specified_entity>[Jean-Pierre Marty 's deductions about Mozart tempos]

		Adducing_V2_Pass specified_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP specified_entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Specified_entity>[Two other reasons] can be [ADDUCED]

		--
		-- Adjusting
		--

		Adjusting_V part_np v = lin Clause {
			np = fromMaybe NP emptyNP part_np ;
			vp = mkVP v
		} ;
		-- <Part>[graphics adaptors] will need [TWEAKING]

		Adjusting_V2_1 agent_np feature_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP feature_np)
		} ;
		-- <Agent>[engineers] to [TWEAK] <Feature>[the car 's operating systems]

		Adjusting_V2_2 agent_np part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP part_np)
		} ;
		-- <Agent>[He] [ADJUSTED] <Part>[his earphones]

		Adjusting_V2_Pass part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP part_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Part>[the front suspension] could be [TWEAKED]

		--
		-- Adopt_selection
		--

		Adopt_selection_V2 agent_np value_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP value_np)
		} ;
		-- <Agent>[It] [EMBRACES] <Value>[social factors and the environment]

		Adopt_selection_V2_Pass value_np v2 = lin Clause {
			np = fromMaybe NP emptyNP value_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Value>[Radical change] was [EMBRACED]

		--
		-- Adorning
		--

		Adorning_V2 location_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP location_np)
		} ;
		-- <Theme>[slabs of stone] [PAVING] <Location>[the campo]

		Adorning_V2_Pass location_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP location_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP theme_np))
		} ;
		-- <Location>[Carbon] will be completely [COATED] <Theme>[by what it has removed after six weeks]

		--
		-- Aging
		--

		Aging_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[you] [MATURE]

		Aging_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[they] [MATURED]

		--
		-- Agree_or_refuse_to_act
		--

		Agree_or_refuse_to_act_VV proposed_action_vp speaker_np vv = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vv (fromMaybe VP emptyVP proposed_action_vp)
		} ;
		-- <Speaker>[Mr Spicer] [DECLINED] <Proposed_action>[to disclose details]

		--
		-- Agriculture
		--

		Agriculture_V2 agriculturist_np ground_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agriculturist_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ground_np)
		} ;
		-- <Agriculturist>[he] must have the wherewithal to [CULTIVATE] <Ground>[it]

		--
		-- Aiming
		--

		Aiming_V2 agent_np instrument_np targeted_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP instrument_np)) (fromMaybe Adv emptyAdv targeted_adv)
		} ;
		-- <Agent>[these four stations on the African continent] [AIMED] <Instrument>[their programmes] <Targeted>[exclusively at white settler communities]

		--
		-- Amassing
		--

		Amassing_V2 mass_theme_np recipient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP recipient_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP mass_theme_np)
		} ;
		-- <Recipient>[he] has [STOCKPILED] <Mass_theme>[weapons]

		Amassing_V2_Pass mass_theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Mass_theme>[the Shah 's own private fortune] , [AMASSED]

		--
		-- Amounting_to
		--

		Amounting_to_V attribute_np value_adv v = lin Clause {
			np = fromMaybe NP emptyNP attribute_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv value_adv)
		} ;
		-- <Attribute>[the Kaszubes] [NUMBERED] <Value>[around 110,000]

		--
		-- Appeal
		--

		Appeal_V convict_np decision_adv v = lin Clause {
			np = fromMaybe NP emptyNP convict_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv decision_adv)
		} ;
		-- <Convict>[A racehorse trainer] <Convict>[who] [APPEALED] <Decision>[against a cruelty conviction]

		--
		-- Apply_heat
		--

		Apply_heat_V2_1 container_adv food_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP food_np)) (fromMaybe Adv emptyAdv container_adv)
		} ;
		-- [SIMMER] <Food>[the aubergines] <Container>[in a large pan of water]

		Apply_heat_V2_2 cook_np food_np heating_instrument_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP cook_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP food_np)) (fromMaybe Adv emptyAdv heating_instrument_adv)
		} ;
		-- <Cook>[I] prefer to [COOK] <Food>[it] <Heating_instrument>[in the microwave]

		Apply_heat_V2_3 food_np temperature_setting_adv v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP food_np)) (fromMaybe Adv emptyAdv temperature_setting_adv)
		} ;
		-- [COOK] <Food>[the dumplings] <Temperature_setting>[over a medium heat]

		Apply_heat_V2_Pass food_np v2 = lin Clause {
			np = fromMaybe NP emptyNP food_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Food>[it] is [STEEPED]

		--
		-- Appointing
		--

		Appointing_V2_Pass official_np role_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP official_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv role_adv)
		} ;
		-- <Official>[Jane] was not [APPOINTED] <Role>[to any official position]

		--
		-- Arranging
		--

		Arranging_V2 agent_np configuration_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv configuration_adv)
		} ;
		-- <Agent>[you] might decide to colour co-ordinate your curtains and cushions , why not try [ARRANGING] <Theme>[your houseplants] <Configuration>[into effective colour schemes]

		--
		-- Arrest
		--

		Arrest_V2 authorities_np suspect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP authorities_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP suspect_np)
		} ;
		-- <Authorities>[The police] had [SUMMONSED] <Suspect>[the wrong man]

		--
		-- Arriving
		--

		Arriving_V goal_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[He] took time out of a busy schedule to [COME] <Goal>[up to the zoo]

		--
		-- Assemble
		--

		Assemble_V group_np v = lin Clause {
			np = fromMaybe NP emptyNP group_np ;
			vp = mkVP v
		} ;
		-- <Group>[the Assembly] [MEETS]

		--
		-- Assessing
		--

		Assessing_V2 assessor_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP assessor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- <Assessor>[An estate agent] has [VALUED] <Phenomenon>[their home]

		Assessing_V2_Pass assessor_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP assessor_np))
		} ;
		-- <Phenomenon>[The investment property] was [VALUED] <Assessor>[by the directors]

		--
		-- Assistance
		--

		Assistance_V2 benefited_party_np focal_entity_adv helper_np v2 = lin Clause {
			np = fromMaybe NP emptyNP helper_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP benefited_party_np)) (fromMaybe Adv emptyAdv focal_entity_adv)
		} ;
		-- <Helper>[I] could n't aid and [ABET] <Benefited_party>[you] <Focal_entity>[against Susan]

		Assistance_V2V benefited_party_np goal_vp helper_np v2v = lin Clause {
			np = fromMaybe NP emptyNP helper_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP benefited_party_np) (fromMaybe VP emptyVP goal_vp)
		} ;
		-- <Helper>[they] had to [AID] <Benefited_party>[each other] <Goal>[to achieve coupling]

		--
		-- Atonement
		--

		Atonement_V2 agent_np wrong_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP wrong_np)
		} ;
		-- <Agent>[she] had to [EXPIATE] <Wrong>[her failure]

		Atonement_V2_Pass amends_adv wrong_np v2 = lin Clause {
			np = fromMaybe NP emptyNP wrong_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv amends_adv)
		} ;
		-- <Wrong>[their sins] [EXPIATED] <Amends>[by sacrifice]

		--
		-- Attaching
		--

		Attaching_V2_1 agent_np goal_adv item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP item_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[Hrun] heaved , and managed to [HOOK] <Item>[his fingers] <Goal>[under the stone]

		Attaching_V2_2 agent_np items_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP items_np)
		} ;
		-- <Agent>[THREE masked thugs] [TRUSSED] <Items>[businessman Tom Hartley and his wife Helen]

		Attaching_V2_3 connector_adv goal_adv item_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP (mkVP v2 (fromMaybe NP emptyNP item_np)) (fromMaybe Adv emptyAdv goal_adv)) (fromMaybe Adv emptyAdv connector_adv)
		} ;
		-- [SECURE] <Item>[the box] <Goal>[to the masonry behind] <Connector>[with wallplugs and screws]

		Attaching_V2_Pass connector_adv goal_adv item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv goal_adv)) (fromMaybe Adv emptyAdv connector_adv)
		} ;
		-- <Item>[Caspar] was [TIED] <Goal>[to a tree] <Connector>[with wire fixed to Philip 's belt]

		--
		-- Attack
		--

		Attack_V2 assailant_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP assailant_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Assailant>[Famine] [STRUCK] <Victim>[the Volga]

		--
		-- Attempt
		--

		Attempt_V agent_np goal_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[I] would n't [TRY] <Goal>[for a rebooking]

		Attempt_VV agent_np goal_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP goal_vp)
		} ;
		-- <Agent>[he] had [UNDERTAKEN] <Goal>[to find her and persuade her to come home]

		--
		-- Attempt_means
		--

		Attempt_means_V2 agent_np means_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP means_np)
		} ;
		-- <Agent>[you] might [TRY] <Means>[uh alt privacy]

		Attempt_means_VV means_vp vv = lin Clause {
			np = emptyNP ;
			vp = mkVP vv (fromMaybe VP emptyVP means_vp)
		} ;
		-- [TRY] <Means>[saying that in Latin]

		--
		-- Attempt_suasion
		--

		Attempt_suasion_V content_adv speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Speaker>[an older constable] [URGED] <Content>[against it]

		Attempt_suasion_V2_1 addressee_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP addressee_np)
		} ;
		-- <Speaker>[Mr Gorbachev] may refrain from saying it publicly on Saturday but he can be expected to [PRESS] <Addressee>[Mr Honecker]

		Attempt_suasion_V2_2 content_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Speaker>[I] [BEG] <Content>[your pardon]

		--
		-- Attending
		--

		Attending_V2 agent_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Agent>[the Soviet Union] wanted to [ATTEND] <Event>[the G7 summit in London]

		--
		-- Avoiding
		--

		Avoiding_V2 agent_np undesirable_situation_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undesirable_situation_np)
		} ;
		-- <Agent>[Ministers] once again [DUCKED] <Undesirable_situation>[the question of recognising Macedonia]

		Avoiding_VV agent_np undesirable_situation_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP undesirable_situation_vp)
		} ;
		-- <Agent>[She] [SIDESTEPPED] <Undesirable_situation>[answering]

		--
		-- Awareness
		--

		Awareness_V cognizer_np content_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Cognizer>[I] do n't [THINK] <Content>[so]

		Awareness_V2 cognizer_np content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Cognizer>[I] can not [CONCEIVE] <Content>[I could possibly have shown any interest in the Party 's literature service]

		Awareness_VS cognizer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Cognizer>[The British] hardly [CONCEIVED] <Content>[the French could be defeated]

		Awareness_VV cognizer_np content_vp vv = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP content_vp)
		} ;
		-- <Cognizer>[He] [RECKONED] <Content>[to be airborne for 15 minutes in every 50 of the average run]

		--
		-- Be_in_agreement_on_assessment
		--

		Be_in_agreement_on_assessment_V cognizer_1_np cognizer_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv cognizer_2_adv)
		} ;
		-- <Cognizer_1>[I] [AGREE] <Cognizer_2>[with my hon. Friend]

		--
		-- Beat_opponent
		--

		Beat_opponent_V2 loser_np winner_np v2 = lin Clause {
			np = fromMaybe NP emptyNP winner_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP loser_np)
		} ;
		-- <Winner>[the government] claimed on Nov. 1 to have [ROUTED] <Loser>[the rebels]

		--
		-- Become_silent
		--

		Become_silent_V speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v
		} ;
		-- <Speaker>[him] to [SHUSH]

		--
		-- Becoming
		--

		Becoming_V entity_np final_state_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv final_state_adv)
		} ;
		-- <Entity>[Hartlepool] will [END UP] <Final_state>[in the Second Division]

		Becoming_V2 entity_np final_category_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP final_category_np)
		} ;
		-- <Entity>[The walls] have [TURNED] <Final_category>[a gruesome red-brown]

		--
		-- Becoming_a_member
		--

		Becoming_a_member_V group_adv new_member_np v = lin Clause {
			np = fromMaybe NP emptyNP new_member_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv group_adv)
		} ;
		-- <New_member>[most of us] [ENLISTED] <Group>[into the services]

		Becoming_a_member_V2 group_np new_member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP new_member_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP group_np)
		} ;
		-- <New_member>[her] to [JOIN] <Group>[us]

		--
		-- Becoming_aware
		--

		Becoming_aware_V cognizer_np phenomenon_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv phenomenon_adv)
		} ;
		-- <Cognizer>[He] 's [SPOTTING] <Phenomenon>[for their batteries]

		Becoming_aware_V2 cognizer_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- <Cognizer>[she] [DESCRIED] <Phenomenon>[two figures]

		Becoming_aware_VQ cognizer_np phenomenon_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS phenomenon_qs)
		} ;
		-- <Cognizer>[he] [RECOGNIZED] <Phenomenon>[where he was]

		Becoming_aware_VS phenomenon_s vs = lin Clause {
			np = emptyNP ;
			vp = mkVP vs (fromMaybe S emptyS phenomenon_s)
		} ;
		-- [TELL] <Phenomenon>[that they are not]

		--
		-- Becoming_detached
		--

		Becoming_detached_V item_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Item>[the bound protein] can [DETACH] <Source>[from the protected DNA fragment]

		--
		-- Becoming_dry
		--

		Becoming_dry_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[they] will [DEHYDRATE]

		--
		-- Becoming_separated
		--

		Becoming_separated_V parts_adv whole_np v = lin Clause {
			np = fromMaybe NP emptyNP whole_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv parts_adv)
		} ;
		-- <Whole>[they] [SEPARATE] <Parts>[into two groups]

		--
		-- Behind_the_scenes
		--

		Behind_the_scenes_V2_1 artist_np production_np v2 = lin Clause {
			np = fromMaybe NP emptyNP artist_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP production_np)
		} ;
		-- <Artist>[I] 'm planning to direct and [PRODUCE] <Production>[my own films]

		Behind_the_scenes_V2_2 artist_np scene_np v2 = lin Clause {
			np = fromMaybe NP emptyNP artist_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP scene_np)
		} ;
		-- <Artist>[Miss Perrie] was about to [FILM] <Scene>[key scenes]

		--
		-- Being_attached
		--

		Being_attached_V goal_adv item_np v = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Item>[a small strip of tape] designed to [STICK] firmly <Goal>[onto skin]

		--
		-- Being_born
		--

		Being_born_V2_Pass child_np v2 = lin Clause {
			np = fromMaybe NP emptyNP child_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Child>[their children] are [BORN]

		--
		-- Being_employed
		--

		Being_employed_V employee_np place_of_employment_adv v = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv place_of_employment_adv)
		} ;
		-- <Employee>[My father] [WORKED] <Place_of_employment>[in a market]

		--
		-- Being_located
		--

		Being_located_V location_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Theme>[The plain-faced buildings] [SIT] <Location>[in the desert]

		--
		-- Besieging
		--

		Besieging_V2 assailant_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP assailant_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Assailant>[the army] [BESIEGING] <Victim>[them]

		--
		-- Board_vehicle
		--

		Board_vehicle_V2 traveller_np vehicle_np v2 = lin Clause {
			np = fromMaybe NP emptyNP traveller_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP vehicle_np)
		} ;
		-- <Traveller>[some] [BOARDING] <Vehicle>[vessels]

		--
		-- Body_movement
		--

		Body_movement_V agent_np body_part_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv body_part_adv)
		} ;
		-- <Agent>[She] held her glass aloft in her left hand , [WAVED] <Body_part>[with her right]

		Body_movement_V2 agent_np body_part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP body_part_np)
		} ;
		-- <Agent>[She] [WRITHED] <Body_part>[her hands]

		--
		-- Bond_maturation
		--

		Bond_maturation_V financial_instrument_np v = lin Clause {
			np = fromMaybe NP emptyNP financial_instrument_np ;
			vp = mkVP v
		} ;
		-- <Financial_instrument>[it] [MATURES]

		--
		-- Bragging
		--

		Bragging_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[He] could n't wait to get back to the station and [BRAG] <Topic>[about how he 'd seen him]

		--
		-- Breathing
		--

		Breathing_V2 agent_np air_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP air_np)
		} ;
		-- <Agent>[He] had always [RESPIRED] <Air>[his work]

		Breathing_V2_Pass air_np v2 = lin Clause {
			np = fromMaybe NP emptyNP air_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Air>[Smokeless tobacco] can be [INHALED]

		--
		-- Bringing
		--

		Bringing_V2_1 agent_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[She] yanked the reins and [BROUGHT] <Theme>[the whip] <Goal>[down] <Goal>[upon its bony rump]

		Bringing_V2_2 carrier_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP carrier_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Carrier>[UN relief flights] to [FLY] <Theme>[food] <Goal>[into rebel-held areas]

		Bringing_V2_Pass path_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[The eggs] were collected in the Falkland Islands under licence from the British Antarctic Survey and [TRANSPORTED] <Path>[by air]

		--
		-- Building
		--

		Building_V2_1 agent_np components_adv created_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP created_entity_np)) (fromMaybe Adv emptyAdv components_adv)
		} ;
		-- <Agent>[Tab the tinker , who had come in to be shriven] , had agreed to [FASHION] <Created_entity>[a coffin of sorts] <Components>[out of thin planks of wood]

		Building_V2_2 agent_np components_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP components_np)
		} ;
		-- <Agent>[one] can often [GLUE] <Components>[a broken vase]

		--
		-- Bungling
		--

		Bungling_V2 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[the one] <Agent>[who] 's [FUCKED UP] <Patient>[your entire operation]

		Bungling_V2_Pass patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP patient_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Patient>[a piece of paper] gets [SCREWED UP]

		--
		-- Carry_goods
		--

		Carry_goods_V2 distributor_np goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP distributor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Distributor>[the NASM store] does [CARRY] <Goods>[some very rare Japanese types]

		Carry_goods_V2_Pass goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Goods>[Blanks] were also [STOCKED]

		--
		-- Catastrophe
		--

		Catastrophe_V undergoer_np undesirable_event_adv v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv undesirable_event_adv)
		} ;
		-- <Undergoer>[This] is the very last thing that should ever [SUFFER] <Undesirable_Event>[in a time of recession or emergency]

		Catastrophe_V2 undergoer_np undesirable_event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undesirable_event_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Undesirable_Event>[woe] [BETIDE] <Undergoer>[anyone not paying attention]

		--
		-- Categorization
		--

		Categorization_V2 cognizer_np item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP item_np)
		} ;
		-- <Cognizer>[no-one] ever really tries to [PIGEONHOLE] <Item>[him]

		Categorization_V2_Pass criteria_adv item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv criteria_adv)
		} ;
		-- <Item>[Tephra] can be [CATEGORIZED] <Criteria>[on the basis of the size of the pyroclasts of which it is composed]

		--
		-- Causation
		--

		Causation_V cause_np effect_adv v = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv effect_adv)
		} ;
		-- <Cause>[a chain of events] <Cause>[that] [LED] <Effect>[to the Trojan War9]

		Causation_V2_1 actor_np affected_adv effect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP actor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP effect_np)) (fromMaybe Adv emptyAdv affected_adv)
		} ;
		-- <Actor>[The monster] [WREAKED] <Effect>[destruction] <Affected>[on him and his house]

		Causation_V2_2 actor_np affected_np effect_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP actor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP affected_np)) (fromMaybe Adv emptyAdv effect_adv)
		} ;
		-- <Actor>[Our culture] may have [RENDERED] <Affected>[natural selection] <Effect>[relatively irrelevant]

		Causation_V2_3 cause_np effect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP effect_np)
		} ;
		-- <Cause>[They] have [WREAKED] <Effect>[havoc that will take months to restore]

		Causation_V2V affected_np cause_np effect_vp v2v = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP affected_np) (fromMaybe VP emptyVP effect_vp)
		} ;
		-- <Cause>[Both of these features] [RENDER] <Affected>[the designs] <Effect>[more scenic , circular visions than expansive roundels]

		--
		-- Cause_change
		--

		Cause_change_V2_1 agent_np attribute_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP attribute_np)
		} ;
		-- <Agent>[individual species] can not [VARY] <Attribute>[their body size]

		Cause_change_V2_2 agent_np entity_np final_category_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP entity_np)) (fromMaybe Adv emptyAdv final_category_adv)
		} ;
		-- <Agent>[you] [CONVERTED] <Entity>[a barn] <Final_category>[into a comfortable home]

		Cause_change_V2_3 cause_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Cause>[her campaign] to [CHANGE] <Entity>[public attitudes to the illness]

		Cause_change_V2_Pass entity_np final_category_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv final_category_adv)
		} ;
		-- <Entity>[the dome] was [ALTERED] <Final_category>[to Russian designs and climatic needs]

		--
		-- Cause_change_of_consistency
		--

		Cause_change_of_consistency_V2 agent_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Agent>[Adams ' polyester] used a peroxide catalyst to [HARDEN] <Undergoer>[it]

		Cause_change_of_consistency_V2_Pass undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Undergoer>[it] can be [HARDENED]

		--
		-- Cause_change_of_phase
		--

		Cause_change_of_phase_V2 agent_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Agent>[we] [THAW] out <Undergoer>[the boat]

		Cause_change_of_phase_V2_Pass undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Undergoer>[The natural gas] will be [LIQUEFIED]

		--
		-- Cause_change_of_strength
		--

		Cause_change_of_strength_V2_1 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[Diana] has [WEAKENED] <Patient>[it]

		Cause_change_of_strength_V2_2 cause_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Cause>[the cold , hard power] <Cause>[that] had [FORTIFIED] <Patient>[the Norsemen]

		Cause_change_of_strength_V2_Pass patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP patient_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Patient>[Bridges] were also [FORTIFIED]

		--
		-- Cause_emotion
		--

		Cause_emotion_V2 agent_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP experiencer_np)
		} ;
		-- <Agent>[you] [AFFRONT] <Experiencer>[him]

		Cause_emotion_V2_Pass experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Experiencer>[He] was n't just [OFFENDED]

		--
		-- Cause_fluidic_motion
		--

		Cause_fluidic_motion_V2 agent_np fluid_np goal_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP fluid_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[solar power] to be used to [PUMP] <Fluid>[downstream water] back <Goal>[up to the main reservoir]

		--
		-- Cause_harm
		--

		Cause_harm_V agent_np victim_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv victim_adv)
		} ;
		-- <Agent>[the four defendants] go for Mr Johnson , holding knives and [STABBING] <Victim>[at him]

		Cause_harm_V2 agent_np body_part_adv victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP victim_np)) (fromMaybe Adv emptyAdv body_part_adv)
		} ;
		-- <Agent>[he] gave a roar of rage and [PUNCHED] <Victim>[me] <Body_part>[right in the stomach]

		Cause_harm_V2_Pass agent_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP victim_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP agent_np))
		} ;
		-- <Victim>[He] would be told to take down his trousers and underpants and would be [WHIPPED] <Agent>[by his foster father]

		--
		-- Cause_impact
		--

		Cause_impact_V agent_np impactee_adv impactor_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv impactor_adv)) (fromMaybe Adv emptyAdv impactee_adv)
		} ;
		-- <Agent>[Cornelius] stepped sharply up and [RAPPED] <Impactor>[upon it] <Impactee>[with his knuckle]

		Cause_impact_V2_1 agent_np impactee_adv impactor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP impactor_np)) (fromMaybe Adv emptyAdv impactee_adv)
		} ;
		-- <Agent>[Vologsky] [SLAMMED] <Impactor>[his fist] <Impactee>[upon the table]

		Cause_impact_V2_2 agent_np impactee_np impactor_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP impactee_np)) (fromMaybe Adv emptyAdv impactor_adv)
		} ;
		-- <Agent>[his men] [JABBING] <Impactee>[the bodies] <Impactor>[with bayonets]

		Cause_impact_V2_3 agent_np impactors_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP impactors_np)
		} ;
		-- <Agent>[He] turned on his heel , picked up the painting , and left the villa , [SLAMMING] <Impactors>[the door]

		Cause_impact_V2_Pass impactor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP impactor_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Impactor>[The shutters] were [BANGED]

		--
		-- Cause_motion
		--

		Cause_motion_V theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v
		} ;
		-- <Theme>[she] 'd just escaped a raging tornado , [FLUNG]

		Cause_motion_V2_1 agent_np area_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Agent>[not one but several such figures] [PUSHING] <Theme>[trolleys] <Area>[about the corridors of Darlington Hall]

		Cause_motion_V2_2 agent_np goal_adv source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[he] gave one last , vicious backward kick and [LAUNCHED] <Theme>[himself] <Source>[out] <Goal>[into the dark]

		Cause_motion_V2_3 agent_np path_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Agent>[She] began to struggle , [TOSSING] <Theme>[her head] <Path>[from side to side]

		Cause_motion_V2_4 cause_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Cause>[an electric field] <Cause>[which] [PROPELS] <Theme>[it] <Goal>[towards the paper]

		Cause_motion_V3 agent_np theme_np v3 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v3 (fromMaybe NP emptyNP theme_np) emptyNP
		} ;
		-- <Agent>[he] began [TUGGING] <Theme>[her]

		Cause_motion_V2_Pass theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Theme>[this new life] <Theme>[which] had been [THRUST]

		--
		-- Cause_temperature_change
		--

		Cause_temperature_change_V2_1 agent_np hot_cold_source_adv item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP item_np)) (fromMaybe Adv emptyAdv hot_cold_source_adv)
		} ;
		-- <Agent>[They] had to [HEAT] <Item>[the water] <Hot_Cold_source>[over the fire in the hearth]

		Cause_temperature_change_V2_2 cause_np item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP item_np)
		} ;
		-- <Cause>[The extra energy of the unbroken symmetry state] would then be released and would [REHEAT] <Item>[the universe]

		--
		-- Cause_to_amalgamate
		--

		Cause_to_amalgamate_V2_1 agent_np part_1_np part_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP part_1_np)) (fromMaybe Adv emptyAdv part_2_adv)
		} ;
		-- <Agent>[it] can commence the new business or [AMALGAMATE] <Part_1>[it] <Part_2>[into its existing business]

		Cause_to_amalgamate_V2_2 agent_np parts_np whole_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP parts_np)) (fromMaybe Adv emptyAdv whole_adv)
		} ;
		-- <Agent>[Northern Telecom Ltd] has [UNIFIED] <Parts>[its data network products] <Whole>[under the name Magellan]

		Cause_to_amalgamate_V2_Pass part_1_np part_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP part_1_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv part_2_adv)
		} ;
		-- <Part_1>[The National Union] was [MERGED] <Part_2>[with Central Office]

		--
		-- Cause_to_be_dry
		--

		Cause_to_be_dry_V2_1 agent_np dryee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP dryee_np)
		} ;
		-- <Agent>[Peter Maylam] , has no winter barley , but was planning to [DESICCATE] <Dryee>[oilseed rape]

		Cause_to_be_dry_V2_2 cause_np dryee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP dryee_np)
		} ;
		-- <Cause>[they] can [DESICCATE] <Dryee>[the pups]

		Cause_to_be_dry_V2_Pass dryee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP dryee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Dryee>[Each part] must be [DRIED OFF]

		--
		-- Cause_to_be_included
		--

		Cause_to_be_included_V2 agent_np group_adv new_member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP new_member_np)) (fromMaybe Adv emptyAdv group_adv)
		} ;
		-- <Agent>[They] will continue with this , and [ADD] <New_member>[a second foreign language] <Group>[in S1]

		Cause_to_be_included_V2_Pass group_adv new_member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP new_member_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv group_adv)
		} ;
		-- <New_member>[the -tu suffix] is [ADDED] <Group>[to the man]

		--
		-- Cause_to_be_sharp
		--

		Cause_to_be_sharp_V2 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[I] 've [SHARPENED] <Patient>[my axe]

		--
		-- Cause_to_be_wet
		--

		Cause_to_be_wet_V2 agent_np liquid_adv undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP undergoer_np)) (fromMaybe Adv emptyAdv liquid_adv)
		} ;
		-- <Agent>[I] [SOAKED] <Undergoer>[a piece of cotton wool] <Liquid>[in ether]

		Cause_to_be_wet_V2_Pass liquid_adv undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv liquid_adv)
		} ;
		-- <Undergoer>[crunchy buschetta] [SOUSED] <Liquid>[in green olive oil]

		--
		-- Cause_to_continue
		--

		Cause_to_continue_VV agent_np process_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP process_vp)
		} ;
		-- <Agent>[I] 'll [KEEP] <Process>[trying]

		--
		-- Cause_to_end
		--

		Cause_to_end_V2_1 agent_np process_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP process_np)
		} ;
		-- <Agent>[The government] is also said to be under pressure to [END] <Process>[the experiment]

		Cause_to_end_V2_2 agent_np state_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP state_np)
		} ;
		-- <Agent>[America] does [LIFT] <State>[its trade embargo]

		--
		-- Cause_to_experience
		--

		Cause_to_experience_V2 agent_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP experiencer_np)
		} ;
		-- <Agent>[salesmen] [TERRORISING] <Experiencer>[potential customers]

		--
		-- Cause_to_fragment
		--

		Cause_to_fragment_V2 agent_np whole_patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP whole_patient_np)
		} ;
		-- <Agent>[he] [SHATTERED] <Whole_patient>[the mirror]

		--
		-- Cause_to_make_noise
		--

		Cause_to_make_noise_V2 agent_np sound_maker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sound_maker_np)
		} ;
		-- <Agent>[He] whistled now and [TINKLED] <Sound_maker>[an imaginary drum]

		--
		-- Cause_to_make_progress
		--

		Cause_to_make_progress_V2 agent_np project_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP project_np)
		} ;
		-- <Agent>[A growth plan] is developed to [MATURE] <Project>[the product 's reliability]

		Cause_to_make_progress_V2_Pass project_np v2 = lin Clause {
			np = fromMaybe NP emptyNP project_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Project>[the Dexter] was [DEVELOPED]

		--
		-- Cause_to_move_in_place
		--

		Cause_to_move_in_place_V2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[Winston] [TURNED] <Theme>[a switch]

		Cause_to_move_in_place_V2_Pass theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Theme>[the carpet] is [SHAKEN]

		--
		-- Cause_to_perceive
		--

		Cause_to_perceive_V2 phenomenon_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- [SHOWING] <Phenomenon>[so much flesh]

		--
		-- Cause_to_resume
		--

		Cause_to_resume_V2 agent_np process_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP process_np)
		} ;
		-- <Agent>[The Department of Employment] [REINSTATED] <Process>[my benefits]

		--
		-- Cause_to_start
		--

		Cause_to_start_V2 cause_np effect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP effect_np)
		} ;
		-- <Cause>[this] will [ENGENDER] <Effect>[great rage in the creature]

		Cause_to_start_V2_Pass cause_np effect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP effect_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP cause_np))
		} ;
		-- <Effect>[Sensations] [ELICITED] <Cause>[by rectal distensions]

		--
		-- Cause_to_wake
		--

		Cause_to_wake_V2_1 agent_np sleeper_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sleeper_np)
		} ;
		-- <Agent>[Nichols] [AWAKENED] <Sleeper>[Turman]

		Cause_to_wake_V2_2 cause_np sleeper_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sleeper_np)
		} ;
		-- <Cause>[which] [WOKE UP] <Sleeper>[the Loch Ness Monster]

		--
		-- Ceasing_to_be
		--

		Ceasing_to_be_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[The symptoms] [DISAPPEARED]

		Ceasing_to_be_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[The blue patch of sky] had long since [DISAPPEARED]

		--
		-- Certainty
		--

		Certainty_V cognizer_np content_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Cognizer>[she] [DOUBTED] <Content>[whether the man heard her]

		Certainty_VS cognizer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Cognizer>[I] [KNOW] <Content>[they 'll touch yours]

		--
		-- Change_direction
		--

		Change_direction_V direction_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Theme>[the wind] slowly [VEERED] <Direction>[into the west]

		--
		-- Change_event_duration
		--

		Change_event_duration_V2_1 agent_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Agent>[some patients] [PROLONG] <Event>[treatment]

		Change_event_duration_V2_2 cause_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Cause>[Superoxide dismutase] [PROLONGS] <Event>[the half life of NO]

		--
		-- Change_event_time
		--

		Change_event_time_V2 cause_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Cause>[Permitting new supplies] , as is suggested in paragraph 55 of draft MPG6 , only [POSTPONES] <Event>[the day when such a prospect has to be faced]

		Change_event_time_V2_Pass event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP event_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Event>[Changes] will be [DEFERRED]

		--
		-- Change_of_consistency
		--

		Change_of_consistency_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[blue fire] [GELLED]

		--
		-- Change_of_leadership
		--

		Change_of_leadership_V2_1 new_leader_np role_adv selector_np v2 = lin Clause {
			np = fromMaybe NP emptyNP selector_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP new_leader_np)) (fromMaybe Adv emptyAdv role_adv)
		} ;
		-- <Selector>[the Assembly] [ELECTED] <New_leader>[Senior Gen. Le Duc Anh] <Role>[to the new post of President]

		Change_of_leadership_V2_2 old_order_np selector_np v2 = lin Clause {
			np = fromMaybe NP emptyNP selector_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP old_order_np)
		} ;
		-- <Selector>[Rabuka] , <Selector>[who] in May 1987 had [OUSTED] <Old_order>[the civilian government elected one month earlier]

		--
		-- Change_of_phase
		--

		Change_of_phase_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[The ice] [SUBLIMED]

		--
		-- Change_of_quantity_of_possession
		--

		Change_of_quantity_of_possession_V2 owner_np possession_np v2 = lin Clause {
			np = fromMaybe NP emptyNP owner_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP possession_np)
		} ;
		-- <Owner>[they] 've -- we 've -- also [LOST] <Possession>[all patience for kids]

		--
		-- Change_operational_state
		--

		Change_operational_state_V2_1 agent_np device_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP device_np)
		} ;
		-- <Agent>[this] would [DEACTIVATE] <Device>[them]

		Change_operational_state_V2_2 cause_np device_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP device_np)
		} ;
		-- <Cause>[it] [DEACTIVATES] <Device>[the mechanism]

		--
		-- Change_position_on_a_scale
		--

		Change_position_on_a_scale_V_1 attribute_np v = lin Clause {
			np = fromMaybe NP emptyNP attribute_np ;
			vp = mkVP v
		} ;
		-- <Attribute>[its share price] [JUMPED]

		Change_position_on_a_scale_V_2 item_np v = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP v
		} ;
		-- <Item>[Korean investment in South-East Asia] [SOARED]

		--
		-- Change_posture
		--

		Change_posture_V protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP v
		} ;
		-- <Protagonist>[she] went and [STOOD]

		--
		-- Change_tool
		--

		Change_tool_V agent_np new_tool_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv new_tool_adv)
		} ;
		-- <Agent>[people] to [TRANSFER] <New_tool>[to public transport]

		--
		-- Chatting
		--

		Chatting_V_1 interlocutor_1_np interlocutor_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP interlocutor_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv interlocutor_2_adv)
		} ;
		-- <Interlocutor_1>[The monks] , unused to such curious behaviour , [GOSSIPED] <Interlocutor_2>[about the strange eccentricities of this English clerk]

		Chatting_V_2 interlocutors_np v = lin Clause {
			np = fromMaybe NP emptyNP interlocutors_np ;
			vp = mkVP v
		} ;
		-- <Interlocutors>[them] [GABBING]

		--
		-- Choosing
		--

		Choosing_V2 chosen_np cognizer_np possibilities_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP chosen_np)) (fromMaybe Adv emptyAdv possibilities_adv)
		} ;
		-- <Cognizer>[you] to [PICK] <Chosen>[the ideal model] <Possibilities>[from the dozens competing for your custom]

		Choosing_VV chosen_vp cognizer_np vv = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP chosen_vp)
		} ;
		-- <Cognizer>[Mr Clarke] may [OPT] <Chosen>[to extend the scope of VAT to newspapers , food , children 's clothing]

		Choosing_V2_Pass chosen_np v2 = lin Clause {
			np = fromMaybe NP emptyNP chosen_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Chosen>[jesters] were [PICKED]

		--
		-- Claim_ownership
		--

		Claim_ownership_V2 claimant_np property_np v2 = lin Clause {
			np = fromMaybe NP emptyNP claimant_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP property_np)
		} ;
		-- <Claimant>[all nations] [CLAIMING] <Property>[territory]

		--
		-- Closure
		--

		Closure_V2_1 agent_np container_portal_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP container_portal_np)
		} ;
		-- <Agent>[I] [ZIPPED] up <Container_portal>[the flaps]

		Closure_V2_2 agent_np containing_object_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP containing_object_np)
		} ;
		-- <Agent>[Tallis] [UNFASTENED] <Containing_object>[his cloak]

		Closure_V2_3 containing_object_np fastener_adv v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP containing_object_np)) (fromMaybe Adv emptyAdv fastener_adv)
		} ;
		-- [TIE] <Containing_object>[a package] <Fastener>[with very little twine and very little paper]

		Closure_V2_Pass containing_object_np v2 = lin Clause {
			np = fromMaybe NP emptyNP containing_object_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Containing_object>[His white tie] was [TIED]

		--
		-- Cogitation
		--

		Cogitation_V cognizer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Cognizer>[I] [MUSE] <Topic>[of youth , and dreams of fame]

		Cogitation_VQ cognizer_np topic_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS topic_qs)
		} ;
		-- <Cognizer>[you] [REFLECT] <Topic>[how common it is that poetic plans do n't get fulfilled]

		Cogitation_VS cognizer_np topic_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS topic_s)
		} ;
		-- <Cognizer>[Taylor] [DELIBERATES] <Topic>[just who should be his partner]

		--
		-- Collaboration
		--

		Collaboration_V_1 partner_1_np partner_2_adv undertaking_adv v = lin Clause {
			np = fromMaybe NP emptyNP partner_1_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv partner_2_adv)) (fromMaybe Adv emptyAdv undertaking_adv)
		} ;
		-- <Partner_1>[they] have now been invited to [COLLABORATE] <Partner_2>[with the Egyptian Antiquities Organisation] <Undertaking>[on the restoration of the tomb of Tuthankhamun]

		Collaboration_V_2 partners_np undertaking_adv v = lin Clause {
			np = fromMaybe NP emptyNP partners_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv undertaking_adv)
		} ;
		-- <Partners>[they] [COLLABORATE] <Undertaking>[upon it]

		--
		-- Come_together
		--

		Come_together_V_1 configuration_np v = lin Clause {
			np = fromMaybe NP emptyNP configuration_np ;
			vp = mkVP v
		} ;
		-- <Configuration>[the mass] that was [THRONGING]

		Come_together_V_2 party_1_np party_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP party_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv party_2_adv)
		} ;
		-- <Party_1>[Small groups of patients and their family members] [COME TOGETHER] <Party_2>[with the staff members]

		Come_together_V2_Pass individuals_np v2 = lin Clause {
			np = fromMaybe NP emptyNP individuals_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Individuals>[Officials of Czech coalition parties] [MET]

		--
		-- Coming_to_be
		--

		Coming_to_be_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[these elements] [COALESCED]

		--
		-- Coming_to_believe
		--

		Coming_to_believe_V2 content_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- [FIND] <Content>[a way to steal the phetam and sell it somewhere else]

		Coming_to_believe_VS cognizer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Cognizer>[You] may [FIND] <Content>[that you have to suspend unemployment benefit]

		Coming_to_believe_VV cognizer_np content_vp vv = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP content_vp)
		} ;
		-- <Cognizer>[Children] [LEARN] <Content>[to speak and understand speech]

		--
		-- Coming_up_with
		--

		Coming_up_with_V2 cognizer_np idea_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP idea_np)
		} ;
		-- <Cognizer>[they] [COINED] <Idea>[the phrase ` piezonuclear fusion "]

		Coming_up_with_V2_Pass idea_np v2 = lin Clause {
			np = fromMaybe NP emptyNP idea_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Idea>[a great plan] was [CONCEIVED]

		--
		-- Commerce_buy
		--

		Commerce_buy_V2 buyer_np goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP buyer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Buyer>[he] [BOUGHT] <Goods>[a ticket]

		--
		-- Commerce_collect
		--

		Commerce_collect_V2 buyer_np seller_np v2 = lin Clause {
			np = fromMaybe NP emptyNP seller_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP buyer_np)
		} ;
		-- <Seller>[The water company] then [CHARGES] <Buyer>[you]

		--
		-- Commerce_pay
		--

		Commerce_pay_V2_1 buyer_np goods_adv money_np v2 = lin Clause {
			np = fromMaybe NP emptyNP buyer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP money_np)) (fromMaybe Adv emptyAdv goods_adv)
		} ;
		-- <Buyer>[We] [PAY] <Money>[£5] <Goods>[for every letter we publish]

		Commerce_pay_V2_2 buyer_np goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP buyer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Buyer>[He] was also ordered to [PAY] <Goods>[£25,000 costs]

		--
		-- Commerce_sell
		--

		Commerce_sell_V goods_np v = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP v
		} ;
		-- <Goods>[books] were not [SELLING]

		Commerce_sell_V2 buyer_adv goods_np seller_np v2 = lin Clause {
			np = fromMaybe NP emptyNP seller_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP goods_np)) (fromMaybe Adv emptyAdv buyer_adv)
		} ;
		-- <Seller>[few lenders] want to [SELL] <Goods>[assets] <Buyer>[into a falling market]

		Commerce_sell_V2_Pass goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Goods>[they] are being [RETAILED]

		--
		-- Commitment
		--

		Commitment_V message_adv speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv message_adv)
		} ;
		-- <Speaker>[Lovebite] [CONSENTED] <Message>[in our Dionysian excesses]

		Commitment_VS addressee_adv message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP vs (fromMaybe S emptyS message_s)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Speaker>[I] [SWEAR] <Addressee>[to you] <Message>[this is ending]

		Commitment_VV message_vp speaker_np vv = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vv (fromMaybe VP emptyVP message_vp)
		} ;
		-- <Speaker>[someone] <Speaker>[who] [THREATENS] <Message>[to kill you]

		--
		-- Committing_crime
		--

		Committing_crime_V2_Pass crime_np v2 = lin Clause {
			np = fromMaybe NP emptyNP crime_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Crime>[the horrors] being [PERPETRATED]

		--
		-- Communication
		--

		Communication_V2_1 communicator_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Communicator>[art] to [COMMUNICATE] <Message>[what the artist has felt]

		Communication_V2_2 medium_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Medium>[it] does not [COMMUNICATE] <Message>[its meaning]

		Communication_VS communicator_np message_s vs = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Communicator>[the country] could [SAY] <Message>[that equal access to theaters and public accommodations was the law of the land]

		--
		-- Communication_manner
		--

		Communication_manner_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[she] could [BABBLE] away <Topic>[on the topic of cooking game]

		Communication_manner_V2 addressee_adv message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP message_np)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Speaker>[He] [SHOUTED] <Message>[one word] <Addressee>[across to Rocky]

		--
		-- Communication_means
		--

		Communication_means_V addressee_adv communicator_np v = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Communicator>[Alfreda] was [SEMAPHORING] <Addressee>[to him]

		Communication_means_V2_1 addressee_adv message_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP message_np)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- [WIRE] <Message>[the information] <Addressee>[to Paris]

		Communication_means_V2_2 addressee_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP addressee_np)
		} ;
		-- [TELEXED] <Addressee>[my hotel]

		Communication_means_V2_3 communicator_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Communicator>[I] [TELEGRAPHED] <Message>[the command to proceed]

		--
		-- Communication_noise
		--

		Communication_noise_V2 message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Speaker>[Forest Goblin tribes] riding giant spiders and [WHOOPING] <Message>[their savage war cries]

		Communication_noise_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[Umberto] [WHIMPERED] <Message>[that Maldita had developed colic that morning]

		--
		-- Communication_response
		--

		Communication_response_V speaker_np trigger_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv trigger_adv)
		} ;
		-- <Speaker>[my friend] [REPLY] <Trigger>[to this]

		Communication_response_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[The weary Norwegians] [REJOINED] <Message>[that , even if the rate of deposition was falling , any extra sulphate entering soils already depleted in calcium would make acidification worse]

		--
		-- Commutation
		--

		Commutation_V2 executive_authority_np original_punishment_np v2 = lin Clause {
			np = fromMaybe NP emptyNP executive_authority_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP original_punishment_np)
		} ;
		-- <Executive_authority>[De Graaff] [COMMUTED] <Original_punishment>[the sentence]

		Commutation_V2_Pass original_punishment_np v2 = lin Clause {
			np = fromMaybe NP emptyNP original_punishment_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Original_punishment>[His sentence] was [COMMUTED]

		--
		-- Compatibility
		--

		Compatibility_V item_1_np item_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP item_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv item_2_adv)
		} ;
		-- <Item_1>[long thin legs , blue from the cold] [CLASHING] <Item_2>[with the bright pink mini-dress which began at my neck and finished at my knicker legs]

		Compatibility_V2_Pass item_1_np item_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP item_1_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv item_2_adv)
		} ;
		-- <Item_1>[Red shirts] [CLASHED] <Item_2>[with blue]

		--
		-- Competition
		--

		Competition_V_1 competition_adv participants_np v = lin Clause {
			np = fromMaybe NP emptyNP participants_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv competition_adv)
		} ;
		-- <Participants>[Bangladesh and Sri Lanka] also [PLAY] <Competition>[in this tournament]

		Competition_V_2 participant_1_np participant_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP participant_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv participant_2_adv)
		} ;
		-- <Participant_1>[Olympiakos] [PLAYS] <Participant_2>[against Aris Salonica]

		--
		-- Complaining
		--

		Complaining_V_1 complainer_np complaint_adv v = lin Clause {
			np = fromMaybe NP emptyNP complainer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv complaint_adv)
		} ;
		-- <Complainer>[THE airpass holder] <Complainer>[who] [WHINGED] <Complaint>[that she had spent all day standing by for a flight out of one of America 's less attractive airports]

		Complaining_V_2 complainer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP complainer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Complainer>[John Stewart] ( Points of View , today ) [LAMENTS] <Topic>[over the quality of programmes being made for the £30 million being spent over the next three years on Gaelic television]

		Complaining_V2 complainer_np complaint_np v2 = lin Clause {
			np = fromMaybe NP emptyNP complainer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP complaint_np)
		} ;
		-- <Complainer>[he] [LAMENTED] <Complaint>[the endless squeeze on cash]

		--
		-- Compliance
		--

		Compliance_V norm_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv norm_adv)
		} ;
		-- [COMPLY] <Norm>[with these provisions]

		Compliance_V2 norm_np protagonist_np v2 = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP norm_np)
		} ;
		-- <Protagonist>[the UK] had [BREACHED] <Norm>[international agreements]

		--
		-- Conduct
		--

		Conduct_V agent_np manner_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv manner_adv)
		} ;
		-- <Agent>[we all] [BEHAVED] <Manner>[as adults]

		--
		-- Confronting_problem
		--

		Confronting_problem_V2 agent_np issue_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP issue_np)
		} ;
		-- <Agent>[everyone] [CONFRONTS] <Issue>[the same challenge]

		--
		-- Conquering
		--

		Conquering_V conqueror_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv conqueror_adv)
		} ;
		-- <Theme>[the town] [FELL] <Conqueror>[to the king]

		Conquering_V2 conqueror_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP conqueror_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Conqueror>[Forster] [CAPTURED] <Theme>[the town]

		--
		-- Contacting
		--

		Contacting_V2 address_adv addressee_np communicator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP addressee_np)) (fromMaybe Adv emptyAdv address_adv)
		} ;
		-- <Communicator>[they] [PHONED] <Addressee>[me] <Address>[back]

		--
		-- Containing
		--

		Containing_V2 container_np contents_np v2 = lin Clause {
			np = fromMaybe NP emptyNP container_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP contents_np)
		} ;
		-- <Container>[a taller container] [HELD] <Contents>[more water]

		--
		-- Contingency
		--

		Contingency_V determinant_adv outcome_np v = lin Clause {
			np = fromMaybe NP emptyNP outcome_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv determinant_adv)
		} ;
		-- <Outcome>[It] [DEPENDS] <Determinant>[whether they want to own up to it]

		--
		-- Contrition
		--

		Contrition_V action_adv experiencer_np v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv action_adv)
		} ;
		-- <Experiencer>[she] 'll [REPENT] <Action>[of it]

		--
		-- Convey_importance
		--

		Convey_importance_V2 medium_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Medium>[It] [STRESSED] <Message>[the need for their broadest possible implementation]

		Convey_importance_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[He] [EMPHASISED] <Message>[that people distinguished between the ex-government and the King]

		Convey_importance_V2_Pass message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP message_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Message>[Its comparative absence of autonomy] is [UNDERSCORED]

		--
		-- Cooking_creation
		--

		Cooking_creation_V produced_food_np v = lin Clause {
			np = fromMaybe NP emptyNP produced_food_np ;
			vp = mkVP v
		} ;
		-- <Produced_food>[Weetabix] [MADE]

		Cooking_creation_V2 cook_np produced_food_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cook_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP produced_food_np)
		} ;
		-- <Cook>[The chefs of Brighton & Hove 's excellent restaurants] can [WHIP UP] <Produced_food>[a piquant sauce]

		Cooking_creation_V2_Pass produced_food_np v2 = lin Clause {
			np = fromMaybe NP emptyNP produced_food_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Produced_food>[The meals] are [COOKED]

		--
		-- Corroding
		--

		Corroding_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[The unit] will not [CORRODE]

		--
		-- Cotheme
		--

		Cotheme_V2_1 cotheme_np direction_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP cotheme_np)) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Theme>[predatory fish] [CHASING] <Cotheme>[the smaller fish] <Direction>[upwards]

		Cotheme_V2_2 cotheme_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP cotheme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[He] [LED] <Cotheme>[her] <Goal>[under the shadow of the tarpaulin , which formed a sort of big , dusty cave]

		Cotheme_V2_3 cotheme_np path_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP cotheme_np)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[The girl] swung round as a silent invitation to follow , and [LED] <Cotheme>[them] <Path>[past a tangled bunch of bicycles and a wall of political posters to hopeless causes]

		Cotheme_V2_4 cotheme_np source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP cotheme_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Theme>[he] [CHASES] <Cotheme>[them] <Source>[away]

		Cotheme_V2_Pass cotheme_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cotheme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP theme_np))
		} ;
		-- <Cotheme>[She] then arrived at Zaidie 's house [FOLLOWED] <Theme>[by the defendant]

		--
		-- Court_examination
		--

		Court_examination_V2 witness_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP witness_np)
		} ;
		-- [EXAMINING] and cross-examining <Witness>[witnesses]

		--
		-- Create_physical_artwork
		--

		Create_physical_artwork_V2 creator_np representation_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP representation_np)
		} ;
		-- <Creator>[Mortimer] was [DRAWING] <Representation>[diagrams]

		--
		-- Create_representation
		--

		Create_representation_V2 creator_np represented_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP represented_np)
		} ;
		-- <Creator>[he] [PAINTED] <Represented>[her]

		Create_representation_V2_Pass creator_np represented_np v2 = lin Clause {
			np = fromMaybe NP emptyNP represented_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP creator_np))
		} ;
		-- <Represented>[this placid mask of Eastern innocence] being [PHOTOGRAPHED] <Creator>[by David Bailey]

		--
		-- Creating
		--

		Creating_V2_1 cause_np created_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP created_entity_np)
		} ;
		-- <Cause>[A square metre of grass] [GENERATES] <Created_entity>[about 10 litres of oxygen each day]

		Creating_V2_2 created_entity_np creator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP created_entity_np)
		} ;
		-- <Creator>[The latter] is [YIELDING] <Created_entity>[fresh produce]

		--
		-- Criminal_investigation
		--

		Criminal_investigation_V2 incident_np investigator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP investigator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP incident_np)
		} ;
		-- <Investigator>[police] [PROBING] <Incident>[a rape and kidnap]

		--
		-- Cutting
		--

		Cutting_V2 agent_np item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP item_np)
		} ;
		-- <Agent>[Omi] [SLICED] <Item>[her cake]

		Cutting_V2_Pass item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Item>[It] is [MINCED]

		--
		-- Damaging
		--

		Damaging_V2_1 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[Dougal 's fingers] tightened involuntarily , [DENTING] <Patient>[the cigarette]

		Damaging_V2_2 cause_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Cause>[it] just [RIPPED] <Patient>[it]

		--
		-- Daring
		--

		Daring_V2 action_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP action_np)
		} ;
		-- <Agent>[I] [DARE] <Action>[say that for surgeons , operations are like buses at a bus depot]

		Daring_VV action_vp agent_np vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP action_vp)
		} ;
		-- <Agent>[Stokes] [VENTURED] <Action>[to arrest his deputy]

		--
		-- Death
		--

		Death_V protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP v
		} ;
		-- <Protagonist>[he] [CROAKED]

		--
		-- Deciding
		--

		Deciding_VV cognizer_np decision_vp vv = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP decision_vp)
		} ;
		-- <Cognizer>[he] [DECIDED] <Decision>[to climb Everest]

		--
		-- Delimitation_of_diversity
		--

		Delimitation_of_diversity_V limit1_adv limit2_adv variable_np v = lin Clause {
			np = fromMaybe NP emptyNP variable_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv limit1_adv)) (fromMaybe Adv emptyAdv limit2_adv)
		} ;
		-- <Variable>[Ticket prices] [RANGE] <Limit1>[from .00] <Limit2>[to .50]

		--
		-- Delivery
		--

		Delivery_V2 deliverer_np recipient_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP deliverer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv recipient_adv)
		} ;
		-- <Deliverer>[Sebastian 's driver] would [DELIVER] <Theme>[me] <Recipient>[to him]

		Delivery_V2_Pass_1 goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[Seawitch] to be [DELIVERED] <Goal>[to the marina]

		Delivery_V2_Pass_2 recipient_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv recipient_adv)
		} ;
		-- <Theme>[The copy] [DELIVERED] <Recipient>[to the Registrar]

		--
		-- Deny_permission
		--

		Deny_permission_V2V action_vp authority_np protagonist_np v2v = lin Clause {
			np = fromMaybe NP emptyNP authority_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP protagonist_np) (fromMaybe VP emptyVP action_vp)
		} ;
		-- <Authority>[he] has [FORBIDDEN] <Protagonist>[us] <Action>[to go back there]

		--
		-- Departing
		--

		Departing_V2 source_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP source_np)
		} ;
		-- <Theme>[The Doctor] [EXITED] <Source>[the laboratory]

		--
		-- Deserving
		--

		Deserving_V2 action_np state_of_affairs_np v2 = lin Clause {
			np = fromMaybe NP emptyNP state_of_affairs_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP action_np)
		} ;
		-- <State_of_affairs>[several areas] which may [WARRANT] <Action>[exploration]

		--
		-- Desiring
		--

		Desiring_V experiencer_np focal_participant_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv focal_participant_adv)
		} ;
		-- <Experiencer>[They] [ASPIRED] <Focal_participant>[towards the Chelsea shore , where , in the early 1960s many thousands lived with sensible occupations and adequate amounts of money]

		Desiring_V2 experiencer_np focal_participant_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP focal_participant_np)
		} ;
		-- <Experiencer>[I] [FEEL LIKE] <Focal_participant>[a glass]

		Desiring_VV event_vp experiencer_np vv = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP event_vp)
		} ;
		-- <Experiencer>[He] ground his teeth together , [LUSTING] <Event>[to tear the alien apart and eat of its lurid vitals , so as to comprehend something of its strange nature]

		--
		-- Destroying
		--

		Destroying_V2_1 cause_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Cause>[a mine] [BLEW UP] <Undergoer>[the Land-Rover he was travelling in]

		Destroying_V2_2 destroyer_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP destroyer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Destroyer>[I] 'd like to [RAZE] <Undergoer>[it]

		Destroying_V2_Pass_1 destroyer_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP destroyer_np))
		} ;
		-- [DESTROYED] <Destroyer>[by the hero Bellepheron]

		Destroying_V2_Pass_2 undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Undergoer>[Belfast city centre] was [DEVASTATED]

		--
		-- Detaching
		--

		Detaching_V2 agent_np item_np source_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP item_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Agent>[he] paused to [UNTIE] <Item>[his Fair Isle sweater] <Source>[from his waist]

		Detaching_V2_Pass item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Item>[Simon Cormack] was [DETACHED]

		--
		-- Detaining
		--

		Detaining_V2 authorities_np suspect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP authorities_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP suspect_np)
		} ;
		-- <Authorities>[police] could [HOLD] <Suspect>[the man]

		Detaining_V2_Pass suspect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP suspect_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Suspect>[" a dozen " Nahda leaders] were [DETAINED]

		--
		-- Differentiation
		--

		Differentiation_V2_1 cognizer_np phenomena_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomena_np)
		} ;
		-- <Cognizer>[the user] to [DIFFERENTIATE] <Phenomena>[such functions]

		Differentiation_V2_2 phenomenon_1_np phenomenon_2_adv v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP phenomenon_1_np)) (fromMaybe Adv emptyAdv phenomenon_2_adv)
		} ;
		-- [SEPARATING] <Phenomenon_1>[main ideas] <Phenomenon_2>[from subsidiary points]

		Differentiation_V2_Pass phenomena_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomena_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Phenomena>[more and more elements] come to be [DISCRIMINATED]

		--
		-- Discussion
		--

		Discussion_V interlocutors_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP interlocutors_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Interlocutors>[they] also [DEBATE] <Topic>[over ` What is a problem ? "]

		--
		-- Dispersal
		--

		Dispersal_V2 agent_np individuals_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP individuals_np)
		} ;
		-- <Agent>[she] [STREWED] <Individuals>[more objects]

		--
		-- Distinctiveness
		--

		Distinctiveness_V2 entity_np feature_np v2 = lin Clause {
			np = fromMaybe NP emptyNP feature_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Feature>[the mixture of concerns] <Feature>[which] [CHARACTERIZE] <Entity>[black sportsmen]

		--
		-- Dodging
		--

		Dodging_V2 bad_entity_np dodger_np v2 = lin Clause {
			np = fromMaybe NP emptyNP dodger_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP bad_entity_np)
		} ;
		-- <Dodger>[She] tried to [SIDESTEP] <Bad_entity>[him]

		--
		-- Dominate_competitor
		--

		Dominate_competitor_V2 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[me] to [DOMINATE] <Patient>[you]

		--
		-- Dominate_situation
		--

		Dominate_situation_V2 agent_np situation_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP situation_np)
		} ;
		-- <Agent>[the overdraft] would [DOMINATE] <Situation>[the lending market]

		--
		-- Dressing
		--

		Dressing_V clothing_adv wearer_np v = lin Clause {
			np = fromMaybe NP emptyNP wearer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv clothing_adv)
		} ;
		-- [DRESSING] <Wearer>[them] [UP] <Clothing>[in the toffee-brown and pale uniform Elizabeth Jarvis had selected]

		Dressing_V2 clothing_np wearer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP wearer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP clothing_np)
		} ;
		-- <Wearer>[I] 'd just [THROW ON] <Clothing>[a cotton frock and a pair of sandals]

		--
		-- Drop_in_on
		--

		Drop_in_on_V visitor_np v = lin Clause {
			np = fromMaybe NP emptyNP visitor_np ;
			vp = mkVP v
		} ;
		-- <Visitor>[you] [DROPPED IN]

		--
		-- Dunking
		--

		Dunking_V2 agent_np substance_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv substance_adv)
		} ;
		-- <Agent>[I] [DIPPED] <Theme>[this finger] <Substance>[into the samples]

		--
		-- Duplication
		--

		Duplication_V2 creator_np original_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP original_np)
		} ;
		-- <Creator>[the jeweller] was free to use more efficient methods , [REPLICATING] <Original>[designs]

		Duplication_V2_Pass original_np v2 = lin Clause {
			np = fromMaybe NP emptyNP original_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Original>[many sources] can not be [PHOTOCOPIED]

		--
		-- Duration_relation
		--

		Duration_relation_V_1 duration_adv eventuality_np v = lin Clause {
			np = fromMaybe NP emptyNP eventuality_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv duration_adv)
		} ;
		-- <Eventuality>[The fight] [LASTED] <Duration>[20 gripping minutes]

		Duration_relation_V_2 entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[well-made clubs] ought to [LAST]

		--
		-- Earnings_and_losses
		--

		Earnings_and_losses_V earner_np earnings_adv v = lin Clause {
			np = fromMaybe NP emptyNP earner_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv earnings_adv)
		} ;
		-- <Earner>[the Arab states as a whole] had [LOST] <Earnings>[about US$25,000 million]

		Earnings_and_losses_V2 earner_np earnings_np v2 = lin Clause {
			np = fromMaybe NP emptyNP earner_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP earnings_np)
		} ;
		-- <Earner>[he] [LOSES] <Earnings>[money]

		--
		-- Eclipse
		--

		Eclipse_V eclipsed_np obstruction_adv v = lin Clause {
			np = fromMaybe NP emptyNP eclipsed_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv obstruction_adv)
		} ;
		-- <Eclipsed>[a sky] [SHROUDED] <Obstruction>[by deep snow clouds]

		Eclipse_V2 eclipsed_np obstruction_np v2 = lin Clause {
			np = fromMaybe NP emptyNP obstruction_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP eclipsed_np)
		} ;
		-- <Obstruction>[An outstretched fist] could [ECLIPSE] <Eclipsed>[the sun that burned them by day]

		Eclipse_V2_Pass eclipsed_np v2 = lin Clause {
			np = fromMaybe NP emptyNP eclipsed_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Eclipsed>[It] is never [SHROUDED]

		--
		-- Education_teaching
		--

		Education_teaching_V qualification_adv student_np v = lin Clause {
			np = fromMaybe NP emptyNP student_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv qualification_adv)
		} ;
		-- <Student>[he] was [STUDYING] <Qualification>[for his degree in environmental biology]

		Education_teaching_V2_1 role_adv student_np teacher_np v2 = lin Clause {
			np = fromMaybe NP emptyNP teacher_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP student_np)) (fromMaybe Adv emptyAdv role_adv)
		} ;
		-- <Teacher>[his father , the man] <Teacher>[who] had [TUTORED] <Student>[him] <Role>[as a Dreamwalker]

		Education_teaching_V2_2 student_np subject_adv v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP student_np)) (fromMaybe Adv emptyAdv subject_adv)
		} ;
		-- [TRAIN] <Student>[all company personnel] <Subject>[in the company 's crime prevention policy and practice]

		Education_teaching_V2V skill_vp student_np v2v = lin Clause {
			np = emptyNP ;
			vp = mkVP v2v (fromMaybe NP emptyNP student_np) (fromMaybe VP emptyVP skill_vp)
		} ;
		-- [TRAINING] <Student>[the receptionist] <Skill>[to smile]

		--
		-- Elusive_goal
		--

		Elusive_goal_V2 desired_goal_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP desired_goal_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP experiencer_np)
		} ;
		-- <Desired_goal>[the answer] [EVADED] <Experiencer>[her]

		--
		-- Emanating
		--

		Emanating_V emission_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP emission_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Emission>[the soul] rising up from the chest into the neck and [ISSUING] <Source>[forth]

		--
		-- Emitting
		--

		Emitting_V2 emission_np source_emitter_np v2 = lin Clause {
			np = fromMaybe NP emptyNP source_emitter_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP emission_np)
		} ;
		-- <Source_emitter>[poor Dr Dunstaple] had [VOIDED] <Emission>[a great deal of " rice-water]

		Emitting_V2_Pass emission_np v2 = lin Clause {
			np = fromMaybe NP emptyNP emission_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Emission>[the faint but unmistakeable musty-sweet aroma] <Emission>[that] was [EXUDED]

		--
		-- Emotion_active
		--

		Emotion_active_V experiencer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Experiencer>[the APU] [AGONISED] <Topic>[on just what to assess under the umbrella word “ science ” — and how to assess it]

		--
		-- Emotion_heat
		--

		Emotion_heat_V emotion_adv experiencer_np v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv emotion_adv)
		} ;
		-- <Experiencer>[the Trinovantes] <Experiencer>[who] had been [SIMMERING] <Emotion>[in discontent]

		--
		-- Emotions_of_mental_activity
		--

		Emotions_of_mental_activity_V experiencer_np stimulus_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv stimulus_adv)
		} ;
		-- <Experiencer>[God] [DELIGHTS] <Stimulus>[in himself]

		--
		-- Employing
		--

		Employing_V2 employee_np employer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP employee_np)
		} ;
		-- <Employer>[I] [EMPLOY] <Employee>[someone]

		Employing_V2_Pass employee_np employer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP employer_np))
		} ;
		-- <Employee>[Mr Westwood] was [EMPLOYED] <Employer>[by British Airways]

		--
		-- Emptying
		--

		Emptying_V source_np theme_adv v = lin Clause {
			np = fromMaybe NP emptyNP source_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Source>[he] was condemned as a heretic , publicly [STRIPPED] <Theme>[of the vestments of priesthood]

		Emptying_V2_1 agent_np source_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP source_np)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Agent>[they] had [EMPTIED] <Source>[their tiny cups] <Theme>[of black coffee]

		Emptying_V2_2 cause_np source_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP source_np)
		} ;
		-- <Cause>[bubble baths] <Cause>[which] [DEGREASE] <Source>[any bit of skin they are in contact with]

		Emptying_V2_Pass source_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP source_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Source>[Ireland] can be [PURGED] <Theme>[of the Dark Lords]

		--
		-- Encoding
		--

		Encoding_V manner_adv message_np v = lin Clause {
			np = fromMaybe NP emptyNP message_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv manner_adv)
		} ;
		-- <Message>[lots of quiet opinions] , he remembered , <Message>[which] she had offered him , shyly slyly , [COUCHED] <Manner>[as a kind of invitation or bait]

		Encoding_V2_Pass manner_adv message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP message_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv manner_adv)
		} ;
		-- <Message>[this element] is [COUCHED] <Manner>[within a highly formalised and conventional genre]

		--
		-- Encounter
		--

		Encounter_V2 party_1_np party_2_np v2 = lin Clause {
			np = fromMaybe NP emptyNP party_1_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP party_2_np)
		} ;
		-- <Party_1>[they] [ENCOUNTERED] <Party_2>[a beautiful blonde starlet called Lila Leeds , something of a Lana Turner lookalike]

		--
		-- Endangering
		--

		Endangering_V2 agent_np valued_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP valued_entity_np)
		} ;
		-- <Agent>[he] might [IMPERIL] <Valued_entity>[her life]

		Endangering_V2_Pass valued_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP valued_entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Valued_entity>[the life of the mother] is [ENDANGERED]

		--
		-- Enforcing
		--

		Enforcing_V2 agent_np rule_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP rule_np)
		} ;
		-- <Agent>[its tenant farmers] [ENFORCE] <Rule>[the ban]

		--
		-- Entering_of_plea
		--

		Entering_of_plea_V accused_np charges_adv plea_adv v = lin Clause {
			np = fromMaybe NP emptyNP accused_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv plea_adv)) (fromMaybe Adv emptyAdv charges_adv)
		} ;
		-- <Accused>[I] [PLEAD] <Plea>[guilty] <Charges>[to that]

		--
		-- Escaping
		--

		Escaping_V escapee_np undesirable_location_adv v = lin Clause {
			np = fromMaybe NP emptyNP escapee_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv undesirable_location_adv)
		} ;
		-- <Escapee>[he] had [ESCAPED] <Undesirable_location>[from prison]

		--
		-- Estimating
		--

		Estimating_VS cognizer_np estimation_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS estimation_s)
		} ;
		-- <Cognizer>[George Constantinou] [ESTIMATES] <Estimation>[that 2000 thousand tonnes of copper had been mined by Roman times]

		Estimating_VS_Pass estimation_s vs = lin Clause {
			np = emptyNP ;
			vp = mkVP vs (fromMaybe S emptyS estimation_s)
		} ;
		-- [ESTIMATED] <Estimation>[that the potential levy off live lamb exports is £750,000]

		--
		-- Evading
		--

		Evading_V evader_np pursuer_adv v = lin Clause {
			np = fromMaybe NP emptyNP evader_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv pursuer_adv)
		} ;
		-- <Evader>[he] [FLED] <Pursuer>[from five masked youths]

		Evading_V2 evader_np pursuer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP evader_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP pursuer_np)
		} ;
		-- <Evader>[Kerry] [GAVE] <Pursuer>[them] [THE SLIP]

		--
		-- Evaluative_comparison
		--

		Evaluative_comparison_V attribute_adv profiled_item_np standard_item_adv v = lin Clause {
			np = fromMaybe NP emptyNP profiled_item_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv attribute_adv)) (fromMaybe Adv emptyAdv standard_item_adv)
		} ;
		-- <Profiled_item>[she] [COMPARED] <Attribute>[in that respect] <Standard_item>[with this Sybil]

		--
		-- Event
		--

		Event_V event_np place_adv time_adv v = lin Clause {
			np = fromMaybe NP emptyNP event_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv place_adv)) (fromMaybe Adv emptyAdv time_adv)
		} ;
		-- <Event>[The rally , organised by the Northern Ireland Pensioners ' Convention to mark the European Year of Older People] , will [TAKE PLACE] <Place>[in Cornmarket] <Time>[next Friday]

		--
		-- Evidence
		--

		Evidence_V2 proposition_np support_np v2 = lin Clause {
			np = fromMaybe NP emptyNP support_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP proposition_np)
		} ;
		-- <Support>[human nature , which has presumably evolved in response to an enormous array of random forces] , [TELLS] <Proposition>[anything about what is good or desirable in terms of the traits humans should possess]

		Evidence_VQ proposition_qs support_np vq = lin Clause {
			np = fromMaybe NP emptyNP support_np ;
			vp = mkVP vq (fromMaybe QS emptyQS proposition_qs)
		} ;
		-- <Support>[The Queen 's Speech in November] will broadly [REVEAL] <Proposition>[what the Bill is likely to contain]

		Evidence_VS proposition_s support_np vs = lin Clause {
			np = fromMaybe NP emptyNP support_np ;
			vp = mkVP vs (fromMaybe S emptyS proposition_s)
		} ;
		-- <Support>[a growing body of scientific evidence] [ATTESTS] <Proposition>[that yoga can influence nearly all the Physiological systems of the human organism , and has therapeutic effects on a wide range of disorders]

		--
		-- Evoking
		--

		Evoking_V2 cognizer_np phenomenon_adv stimulus_np v2 = lin Clause {
			np = fromMaybe NP emptyNP stimulus_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP cognizer_np)) (fromMaybe Adv emptyAdv phenomenon_adv)
		} ;
		-- <Stimulus>[it] [REMINDED] <Cognizer>[him] <Phenomenon>[of Stamford]

		--
		-- Exchange
		--

		Exchange_V2 exchanger_1_np exchanger_2_adv themes_np v2 = lin Clause {
			np = fromMaybe NP emptyNP exchanger_1_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP themes_np)) (fromMaybe Adv emptyAdv exchanger_2_adv)
		} ;
		-- <Exchanger_1>[He] was more than prepared to [TRADE] <Themes>[blows] <Exchanger_2>[with the former circus act Benichou]

		Exchange_V2_Pass theme_1_np theme_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_1_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv theme_2_adv)
		} ;
		-- <Theme_1>[the cattle] were [TRADED] <Theme_2>[for grain]

		--
		-- Exclude_member
		--

		Exclude_member_V2 authority_np member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP authority_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP member_np)
		} ;
		-- <Authority>[Nkrumah] dealt with the rebels by [EXPELLING] <Member>[81 CPP members]

		--
		-- Excreting
		--

		Excreting_V source_np v = lin Clause {
			np = fromMaybe NP emptyNP source_np ;
			vp = mkVP v
		} ;
		-- <Source>[his hands] [SWEATING]

		Excreting_V2 excreta_np excreter_np v2 = lin Clause {
			np = fromMaybe NP emptyNP excreter_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP excreta_np)
		} ;
		-- <Excreter>[I] 've been [PISSING] <Excreta>[blood]

		--
		-- Execute_plan
		--

		Execute_plan_V2 agent_np plan_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP plan_np)
		} ;
		-- <Agent>[Æthelred 's government] [IMPLEMENTED] <Plan>[its decisions]

		--
		-- Execution
		--

		Execution_V2 executed_np executioner_np v2 = lin Clause {
			np = fromMaybe NP emptyNP executioner_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP executed_np)
		} ;
		-- <Executioner>[Captain Lorenzo] [HANGED] <Executed>[himself]

		Execution_V2_Pass executed_np executioner_np v2 = lin Clause {
			np = fromMaybe NP emptyNP executed_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP executioner_np))
		} ;
		-- <Executed>[Serbs] being [GUILLOTINED] <Executioner>[by the French]

		--
		-- Existence
		--

		Existence_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[sexual reproduction] [EXISTS]

		Existence_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[the world] [EXISTED]

		--
		-- Expectation
		--

		Expectation_VQ cognizer_np phenomenon_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS phenomenon_qs)
		} ;
		-- <Cognizer>[Sukarno] should have [ANTICIPATED] <Phenomenon>[what happened]

		Expectation_VS_Pass phenomenon_s vs = lin Clause {
			np = emptyNP ;
			vp = mkVP vs (fromMaybe S emptyS phenomenon_s)
		} ;
		-- [EXPECTED] <Phenomenon>[that the engineer shall be fair and reasonable in the way he or she administers the contract]

		--
		-- Expensiveness
		--

		Expensiveness_V asset_adv goods_np v = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv asset_adv)
		} ;
		-- <Goods>[most mail order purchases] [COST] <Asset>[under £30]

		--
		-- Experience_bodily_harm
		--

		Experience_bodily_harm_V2 body_part_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP body_part_np)
		} ;
		-- <Experiencer>[The Danish midfielder] has [TORN] <Body_part>[a calf muscle]

		--
		-- Experiencer_focus
		--

		Experiencer_focus_V content_adv experiencer_np v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Experiencer>[he] [RESENTED] it <Content>[when she was out of town and not picking up his calls]

		Experiencer_focus_V2 content_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Experiencer>[Everyone] [ABOMINATES] <Content>[air travel]

		--
		-- Experiencer_obj
		--

		Experiencer_obj_V experiencer_adv stimulus_np v = lin Clause {
			np = fromMaybe NP emptyNP stimulus_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv experiencer_adv)
		} ;
		-- <Stimulus>[a profound , ` adult " question] <Stimulus>[that] is [MYSTIFYING] <Experiencer>[to children]

		Experiencer_obj_V2 experiencer_np stimulus_np v2 = lin Clause {
			np = fromMaybe NP emptyNP stimulus_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP experiencer_np)
		} ;
		-- <Stimulus>[it] [RANKLES] <Experiencer>[the band]

		Experiencer_obj_V2S experiencer_np stimulus_s v2s = lin Clause {
			np = emptyNP ;
			vp = mkVP v2s (fromMaybe NP emptyNP experiencer_np) (fromMaybe S emptyS stimulus_s)
		} ;
		-- [THRILLED] <Experiencer>[her] <Stimulus>[that he 'd called them that]

		Experiencer_obj_V2_Pass experiencer_np stimulus_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP stimulus_np))
		} ;
		-- <Experiencer>[We] were [TRAUMATISED] <Stimulus>[by what we saw]

		Experiencer_obj_VS_Pass experiencer_np stimulus_s vs = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP vs (fromMaybe S emptyS stimulus_s)
		} ;
		-- <Experiencer>[he] was good-natured , and was [TICKLED] <Stimulus>[that she 'd asked him to go shopping with her]

		--
		-- Explaining_the_facts
		--

		Explaining_the_facts_VQ_1 fact_np question_qs vq = lin Clause {
			np = fromMaybe NP emptyNP fact_np ;
			vp = mkVP vq (fromMaybe QS emptyQS question_qs)
		} ;
		-- <Fact>[This] may [EXPLAIN] <Question>[why Držić was known as “ the Croatian Molière ”]

		Explaining_the_facts_VQ_2 state_of_affairs_qs vq = lin Clause {
			np = emptyNP ;
			vp = mkVP vq (fromMaybe QS emptyQS state_of_affairs_qs)
		} ;
		-- [EXPLAINS] <State_of_affairs>[why the Tsar was able to secure the acquiescence of the nobility]

		--
		-- Exporting
		--

		Exporting_V2_Pass goods_np importing_area_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv importing_area_adv)
		} ;
		-- <Goods>[It] was [EXPORTED] <Importing_area>[to England]

		--
		-- Expressing_publicly
		--

		Expressing_publicly_V2 communicator_np content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Communicator>[he] would need to [VENT] <Content>[the anger she felt already gathering]

		--
		-- Extradition
		--

		Extradition_V2 crime_jurisdiction_adv suspect_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP suspect_np)) (fromMaybe Adv emptyAdv crime_jurisdiction_adv)
		} ;
		-- [EXTRADITED] <Suspect>[several suspected drug smugglers] <Crime_jurisdiction>[to the United States]

		--
		-- Fall_asleep
		--

		Fall_asleep_V sleeper_np v = lin Clause {
			np = fromMaybe NP emptyNP sleeper_np ;
			vp = mkVP v
		} ;
		-- <Sleeper>[she] had made such a fool of herself by [FAINTING]

		--
		-- Familiarity
		--

		Familiarity_V2 cognizer_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Cognizer>[I] [KNOW] <Entity>[your sort]

		--
		-- Feeling
		--

		Feeling_V emotional_state_adv experiencer_np v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv emotional_state_adv)
		} ;
		-- <Experiencer>[We] [FEEL] <Emotional_state>[sad]

		Feeling_V2 emotion_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP emotion_np)
		} ;
		-- [FEEL] <Emotion>[guilt]

		--
		-- Feigning
		--

		Feigning_V2 agent_np state_of_affairs_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP state_of_affairs_np)
		} ;
		-- <Agent>[You] can not [COUNTERFEIT] <State_of_affairs>[forty years ' honest work]

		--
		-- Filling
		--

		Filling_V2_1 agent_np goal_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP goal_np)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Agent>[He] began to redesign and [EMBELLISH] <Goal>[Strawberry Hill] <Theme>[on Gothic lines]

		Filling_V2_2 goal_adv theme_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- [PILING] <Theme>[sandbags] <Goal>[against the brightly painted railings]

		Filling_V2_Pass goal_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP goal_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Goal>[they] were [SPLATTERED] <Theme>[in paint]

		--
		-- Finish_competition
		--

		Finish_competition_V2 competition_np competitor_np opponent_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP competitor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP competition_np)) (fromMaybe Adv emptyAdv opponent_adv)
		} ;
		-- <Competitor>[McEnroe] , <Competitor>[who] [LOST] <Competition>[a tough match] <Opponent>[with Stefano Pescosolido]

		--
		-- Finish_game
		--

		Finish_game_V player_np v = lin Clause {
			np = fromMaybe NP emptyNP player_np ;
			vp = mkVP v
		} ;
		-- <Player>[gal] <Player>[that] [WON]

		--
		-- Firing
		--

		Firing_V2 employee_np employer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP employee_np)
		} ;
		-- <Employer>[they] were going to [TERMINATE] <Employee>[him]

		Firing_V2_Pass employee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Employee>[No under-aged workers] will be [TERMINATED]

		--
		-- Fleeing
		--

		Fleeing_V_1 goal_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Self_mover>[he] struggled to his feet , knocked Lucy 's hands away , kicked her legs , heaved her to one side and [BOLTED] <Goal>[for the open air]

		Fleeing_V_2 path_adv self_mover_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Self_mover>[The other three] turned and [BOLTED] <Source>[off] <Path>[down the stairs]

		--
		-- Fluidic_motion
		--

		Fluidic_motion_V_1 area_adv fluid_np v = lin Clause {
			np = fromMaybe NP emptyNP fluid_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Fluid>[the joy] [BUBBLING] <Area>[inside her]

		Fluidic_motion_V_2 fluid_np goal_adv path_adv source_adv v = lin Clause {
			np = fromMaybe NP emptyNP fluid_np ;
			vp = mkVP (mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Fluid>[a stream of molten lava] [TRICKLED] <Path>[down a curved channel] <Source>[from roof] <Goal>[to floor]

		--
		-- Forging
		--

		Forging_V2 agent_np forgery_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP forgery_np)
		} ;
		-- <Agent>[Unscrupulous sellers] could [COUNTERFEIT] <Forgery>[virtually anything]

		--
		-- Forgoing
		--

		Forgoing_V desirable_adv forgoer_np v = lin Clause {
			np = fromMaybe NP emptyNP forgoer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv desirable_adv)
		} ;
		-- <Forgoer>[The union] [ABSTAINED] <Desirable>[on the NEC proposals]

		Forgoing_VV desirable_vp forgoer_np vv = lin Clause {
			np = fromMaybe NP emptyNP forgoer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP desirable_vp)
		} ;
		-- <Forgoer>[he] [FORBORE] <Desirable>[to comment]

		--
		-- Forming_relationships
		--

		Forming_relationships_V_1 partner_1_np partner_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP partner_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv partner_2_adv)
		} ;
		-- <Partner_1>[Mandela] under pressure to [SEPARATE] <Partner_2>[from ` wayward " wife]

		Forming_relationships_V_2 partners_np v = lin Clause {
			np = fromMaybe NP emptyNP partners_np ;
			vp = mkVP v
		} ;
		-- <Partners>[we] should n't [WED]

		Forming_relationships_V2 partner_1_np partner_2_np v2 = lin Clause {
			np = fromMaybe NP emptyNP partner_1_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP partner_2_np)
		} ;
		-- <Partner_1>[you] 're [MARRYING] <Partner_2>[Miss Ingram]

		--
		-- Friction
		--

		Friction_V_1 static_object_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv static_object_adv)
		} ;
		-- <Theme>[a black substance] <Theme>[that] looked like soot , but [GRATED] <Static_object>[under the soles of her boots]

		Friction_V_2 themes_np v = lin Clause {
			np = fromMaybe NP emptyNP themes_np ;
			vp = mkVP v
		} ;
		-- <Themes>[pins] [GRATED]

		--
		-- Front_for
		--

		Front_for_V front_np v = lin Clause {
			np = fromMaybe NP emptyNP front_np ;
			vp = mkVP v
		} ;
		-- <Front>[one of those reporters] frequently accused of [FRONTING]

		--
		-- Frugality
		--

		Frugality_V2 resource_np resource_controller_np v2 = lin Clause {
			np = fromMaybe NP emptyNP resource_controller_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP resource_np)
		} ;
		-- <Resource_controller>[she] can [HUSBAND] <Resource>[her strength]

		--
		-- Gathering_up
		--

		Gathering_up_V2_1 agent_np aggregate_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP aggregate_np)
		} ;
		-- <Agent>[I] started by [ASSEMBLING] <Aggregate>[a collection of objects]

		Gathering_up_V2_2 agent_np individuals_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP individuals_np)
		} ;
		-- <Agent>[The exhibition] [BRINGS TOGETHER] <Individuals>[work from artists]

		--
		-- Gesture
		--

		Gesture_V body_part_adv communicator_np v = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv body_part_adv)
		} ;
		-- <Communicator>[Blanche] [GESTURED] <Body_part>[with her right hand]

		Gesture_V2 addressee_adv communicator_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP message_np)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Communicator>[a male bird] should [SIGNAL] <Message>[accurate information] <Addressee>[to its competitors]

		Gesture_VS addressee_adv communicator_np message_s vs = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP vs (fromMaybe S emptyS message_s)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Communicator>[Rain] [MOTIONED] <Addressee>[to Oliver] <Message>[that she was going upstairs]

		Gesture_VV communicator_np message_vp vv = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP vv (fromMaybe VP emptyVP message_vp)
		} ;
		-- <Communicator>[Sheldukher] [GESTURED] <Message>[to comply]

		--
		-- Get_a_job
		--

		Get_a_job_V_1 employee_np employer_adv v = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv employer_adv)
		} ;
		-- <Employee>[you] [SIGNED] on <Employer>[with International Models]

		Get_a_job_V_2 employee_np position_adv v = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv position_adv)
		} ;
		-- <Employee>[he] [SIGNED ON] <Position>[for a permanent career in the Air Force]

		--
		-- Getting
		--

		Getting_V2 recipient_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP recipient_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Recipient>[Macau] [WON] <Theme>[a name for international intrigue]

		--
		-- Getting_underway
		--

		Getting_underway_V self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP v
		} ;
		-- <Self_mover>[I] smiled and [HEADED OUT]

		--
		-- Getting_up
		--

		Getting_up_V protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP v
		} ;
		-- <Protagonist>[a peasant mother] [RISES]

		--
		-- Getting_vehicle_underway
		--

		Getting_vehicle_underway_V2 driver_np vehicle_np v2 = lin Clause {
			np = fromMaybe NP emptyNP driver_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP vehicle_np)
		} ;
		-- <Driver>[I] have [LAUNCHED] <Vehicle>[my boat]

		--
		-- Giving
		--

		Giving_V2 donor_np recipient_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP donor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv recipient_adv)
		} ;
		-- <Donor>[the old Kelly agency] would n't [FOIST] <Theme>[this gig] <Recipient>[on them]

		--
		-- Giving_in
		--

		Giving_in_V capitulator_np issue_adv v = lin Clause {
			np = fromMaybe NP emptyNP capitulator_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv issue_adv)
		} ;
		-- <Capitulator>[the father] had [ACQUIESCED] <Issue>[in the removal or retention of the children]

		--
		-- Go_into_shape
		--

		Go_into_shape_V theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v
		} ;
		-- <Theme>[my lip] [CURL]

		--
		-- Going_back_on_a_commitment
		--

		Going_back_on_a_commitment_V commitment_adv protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv commitment_adv)
		} ;
		-- <Protagonist>[the insurance company] ca n't [BACK OUT] <Commitment>[of the contract]

		--
		-- Grant_permission
		--

		Grant_permission_V2 action_np grantor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP grantor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP action_np)
		} ;
		-- <Grantor>[the few women in Hollywood] with the power to [GREEN-LIGHT] <Action>[her own projects]

		--
		-- Grasp
		--

		Grasp_V2 cognizer_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- <Cognizer>[she] tried to [FATHOM] <Phenomenon>[its meaning]

		Grasp_VQ cognizer_np phenomenon_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS phenomenon_qs)
		} ;
		-- <Cognizer>[Westerners] took a long time to [GRASP] <Phenomenon>[how very different it is from what we understand by matter .]

		--
		-- Grinding
		--

		Grinding_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[Mustard seeds] may be used either whole or cracked , or [PULVERIZED]

		Grinding_V2 grinder_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP grinder_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Grinder>[peasants] [PULVERISE] <Undergoer>[the plump triticale kernels]

		--
		-- Grooming
		--

		Grooming_V body_part_np v = lin Clause {
			np = fromMaybe NP emptyNP body_part_np ;
			vp = mkVP v
		} ;
		-- <Body_part>[underarm hair] [WAXED]

		Grooming_V2_1 agent_np body_part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP body_part_np)
		} ;
		-- <Agent>[He] took to cleansing , toning and [MOISTURIZING] <Body_part>[his face]

		Grooming_V2_2 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[whoever touches her bed] shall wash his clothes and [BATHE] <Patient>[himself]

		Grooming_V2_Pass body_part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP body_part_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Body_part>[my legs] [WAXED]

		--
		-- Growing_food
		--

		Growing_food_V2 food_np grower_np v2 = lin Clause {
			np = fromMaybe NP emptyNP grower_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP food_np)
		} ;
		-- <Grower>[They] farm , [RAISE] <Food>[animals]

		Growing_food_V2_Pass food_np v2 = lin Clause {
			np = fromMaybe NP emptyNP food_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Food>[the beef] [RAISED]

		--
		-- Hair_configuration
		--

		Hair_configuration_V hair_np v = lin Clause {
			np = fromMaybe NP emptyNP hair_np ;
			vp = mkVP v
		} ;
		-- <Hair>[his hair] [CURLED]

		--
		-- Halt
		--

		Halt_V theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v
		} ;
		-- <Theme>[she] [HALTED]

		--
		-- Have_as_requirement
		--

		Have_as_requirement_V2 dependent_np requirement_np v2 = lin Clause {
			np = fromMaybe NP emptyNP dependent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP requirement_np)
		} ;
		-- <Dependent>[such developments] [DEMAND] <Requirement>[fundamental changes of attitude]

		--
		-- Have_as_translation_equivalent
		--

		Have_as_translation_equivalent_V source_symbol_np target_symbol_adv v = lin Clause {
			np = fromMaybe NP emptyNP source_symbol_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv target_symbol_adv)
		} ;
		-- <Source_symbol>['' Waffenruhe ''] [TRANSLATES] <Target_symbol>[as truce , armistice , an uneasy , provisional peace]

		--
		-- Hear
		--

		Hear_V hearer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP hearer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Hearer>[We] [READ] <Topic>[of continuous victories on all fronts]

		Hear_V2 hearer_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP hearer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Hearer>[I] just [READ] <Message>[news about death]

		Hear_VS hearer_np message_s vs = lin Clause {
			np = fromMaybe NP emptyNP hearer_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Hearer>[I] was interested to [READ] <Message>[that you have started a campaign to battle for men 's rights]

		--
		-- Heralding
		--

		Heralding_V2 communicator_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Communicator>[Monsieur Grimod de La Reynière] , <Communicator>[who] [HERALDED] <Event>[the arrival of each dish]

		--
		-- Hiding_objects
		--

		Hiding_objects_V2 agent_np hidden_object_np hiding_place_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP hidden_object_np)) (fromMaybe Adv emptyAdv hiding_place_adv)
		} ;
		-- <Agent>[you] should [CONCEAL] <Hidden_object>[some small flowerpots] <Hiding_place>[under the wood]

		--
		-- Hindering
		--

		Hindering_V2_1 action_adv hindrance_np protagonist_np v2 = lin Clause {
			np = fromMaybe NP emptyNP hindrance_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP protagonist_np)) (fromMaybe Adv emptyAdv action_adv)
		} ;
		-- <Hindrance>[Press monopolies] [INHIBIT] <Protagonist>[those with different views] <Action>[from launching out on their own]

		Hindering_V2_2 action_np hindrance_np v2 = lin Clause {
			np = fromMaybe NP emptyNP hindrance_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP action_np)
		} ;
		-- <Hindrance>[the side-walls] are very definitely [CONSTRAINING] <Action>[the flow]

		--
		-- Hiring
		--

		Hiring_V2 employee_np employer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP employee_np)
		} ;
		-- <Employer>[they] 'll [HIRE] <Employee>[you]

		--
		-- Hit_target
		--

		Hit_target_V2 agent_np target_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP target_np)
		} ;
		-- <Agent>[We] [SHOT] <Target>[the two men at the boat]

		--
		-- Holding_off_on
		--

		Holding_off_on_VV agent_np desirable_action_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP desirable_action_vp)
		} ;
		-- <Agent>[I] was [HOLDING OFF] <Desirable_action>[buying an away shirt]

		--
		-- Hostile_encounter
		--

		Hostile_encounter_V sides_np v = lin Clause {
			np = fromMaybe NP emptyNP sides_np ;
			vp = mkVP v
		} ;
		-- <Sides>[Communists and Social Democrats] are [STRUGGLING]

		--
		-- Hunting
		--

		Hunting_V hunter_np v = lin Clause {
			np = fromMaybe NP emptyNP hunter_np ;
			vp = mkVP v
		} ;
		-- <Hunter>[they] [HUNT]

		--
		-- Hunting_success_or_failure
		--

		Hunting_success_or_failure_V2 food_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP food_np)
		} ;
		-- [CATCH] <Food>[trout]

		--
		-- Imitating
		--

		Imitating_V2_1 agent_np characteristic_np standard_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP characteristic_np)) (fromMaybe Adv emptyAdv standard_adv)
		} ;
		-- <Agent>[they] can not [MIMIC] <Characteristic>[the complex metabolism] <Standard>[of a living mammal]

		Imitating_V2_2 agent_np standard_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP standard_np)
		} ;
		-- <Agent>[pottery objects] <Agent>[which] [IMITATE] <Standard>[metal models]

		--
		-- Immobilization
		--

		Immobilization_V2 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[They] [SHACKLED] <Patient>[my legs]

		--
		-- Impact
		--

		Impact_V_1 impactee_adv impactor_np v = lin Clause {
			np = fromMaybe NP emptyNP impactor_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv impactee_adv)
		} ;
		-- <Impactor>[The small stones] [RAPPED] <Impactee>[under their feet]

		Impact_V_2 impactee_np v = lin Clause {
			np = fromMaybe NP emptyNP impactee_np ;
			vp = mkVP v
		} ;
		-- <Impactee>[glass] [CRUNCHED]

		Impact_V_3 impactors_np v = lin Clause {
			np = fromMaybe NP emptyNP impactors_np ;
			vp = mkVP v
		} ;
		-- <Impactors>[the glass fragments] [TINKLED]

		Impact_V2 impactee_np impactor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP impactor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP impactee_np)
		} ;
		-- <Impactor>[the horse] [THUDDED] <Impactee>[over the frozen grass of the common land]

		--
		-- Inclusion
		--

		Inclusion_V2 part_np total_np v2 = lin Clause {
			np = fromMaybe NP emptyNP total_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP part_np)
		} ;
		-- <Total>[they both] [EXCLUDE] <Part>[a great deal of fat]

		--
		-- Indicating
		--

		Indicating_V2_1 communicator_np unresolved_referent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP unresolved_referent_np)
		} ;
		-- <Communicator>[You] [NAME] <Unresolved_referent>[it]

		Indicating_V2_2 medium_np unresolved_referent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP unresolved_referent_np)
		} ;
		-- <Medium>[A government statement on June 27] had [NAMED] <Unresolved_referent>[18 individuals allegedly involved , including Col.-Gen]

		--
		-- Ingest_substance
		--

		Ingest_substance_V ingestor_np substance_adv v = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv substance_adv)
		} ;
		-- <Ingestor>[Hargreave] [PULLED] <Substance>[at his cigar]

		Ingest_substance_V2_1 delivery_device_np ingestor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP delivery_device_np)
		} ;
		-- <Ingestor>[they] [PUFF] <Delivery_device>[a cigarette]

		Ingest_substance_V2_2 ingestor_np substance_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP substance_np)
		} ;
		-- <Ingestor>[He] filled his pipe with tobacco , lit it and , [PUFFING] <Substance>[clouds of smoke]

		Ingest_substance_V2_Pass substance_np v2 = lin Clause {
			np = fromMaybe NP emptyNP substance_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Substance>[The powder] is usually [SNIFFED]

		--
		-- Ingestion
		--

		Ingestion_V_1 ingestibles_adv ingestor_np v = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv ingestibles_adv)
		} ;
		-- <Ingestor>[Private cars] [GUZZLE] <Ingestibles>[about 7% of the world 's commercial ( non-industrial ) energy or 17% of the oil used each year]

		Ingestion_V_2 ingestibles_np v = lin Clause {
			np = fromMaybe NP emptyNP ingestibles_np ;
			vp = mkVP v
		} ;
		-- <Ingestibles>[Each fish] is caught in the water , then carried to a nearby bank and delicately [DEVOURED]

		Ingestion_V2 ingestibles_np ingestor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ingestibles_np)
		} ;
		-- <Ingestor>[I] 'll [NOSH] <Ingestibles>[your sausages]

		Ingestion_V2_Pass ingestibles_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestibles_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Ingestibles>[The food] is [INGESTED]

		--
		-- Inhibit_movement
		--

		Inhibit_movement_V holding_location_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv holding_location_adv)
		} ;
		-- <Theme>[the papers] [TIED] <Holding_location>[inside the cloth]

		Inhibit_movement_V2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[the bars] <Agent>[that] [CONFINED] <Theme>[me]

		--
		-- Inspecting
		--

		Inspecting_V2 ground_np inspector_np v2 = lin Clause {
			np = fromMaybe NP emptyNP inspector_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ground_np)
		} ;
		-- <Inspector>[Mark] was [PROOF-READING] <Ground>[them]

		Inspecting_V2_Pass ground_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ground_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Ground>[The Faith No More guitarist , at No. 34 in the charts with A Small Victory] , was [FRISKED]

		--
		-- Installing
		--

		Installing_V2 agent_np component_np fixed_location_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP component_np)) (fromMaybe Adv emptyAdv fixed_location_adv)
		} ;
		-- <Agent>[she] has [INSTALLED] <Component>[a hotline] <Fixed_location>[in her gym]

		--
		-- Institutionalization
		--

		Institutionalization_V2 authority_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP authority_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Authority>[She] insisted that hospitalization was necessary and threatened to [COMMIT] <Patient>[him]

		Institutionalization_V2_Pass patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP patient_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Patient>[the subjects] were [INSTITUTIONALISED]

		--
		-- Intentional_traversing
		--

		Intentional_traversing_V path_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Self_mover>[Blazer 's forelegs] [CUT] <Path>[through the air]

		Intentional_traversing_V2 path_np self_mover_np v2 = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP path_np)
		} ;
		-- <Self_mover>[They] had to [FORD] <Path>[these hazards]

		--
		-- Intentionally_affect
		--

		Intentionally_affect_V agent_np patient_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv patient_adv)
		} ;
		-- <Agent>[Louise] was [DOING SOMETHING] <Patient>[to him]

		--
		-- Intentionally_create
		--

		Intentionally_create_V2 created_entity_np creator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP created_entity_np)
		} ;
		-- <Creator>[she] [ESTABLISHED] <Created_entity>[the Medau Society of South Africa]

		Intentionally_create_V2_Pass created_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP created_entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- [SET UP] , <Created_entity>[Radio RIN]

		--
		-- Intercepting
		--

		Intercepting_V2 interceptor_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP interceptor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Interceptor>[A man] [INTERCEPTED] <Theme>[him]

		Intercepting_V2_Pass interceptor_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP interceptor_np))
		} ;
		-- <Theme>[their vessel] was [INTERCEPTED] <Interceptor>[by an Israeli naval patrol vessel]

		--
		-- Interrupt_process
		--

		Interrupt_process_V2_Pass cause_np process_np v2 = lin Clause {
			np = fromMaybe NP emptyNP process_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP cause_np))
		} ;
		-- <Process>[its proceedings] were [INTERRUPTED] <Cause>[by the Turkish War]

		--
		-- Invading
		--

		Invading_V land_np v = lin Clause {
			np = fromMaybe NP emptyNP land_np ;
			vp = mkVP v
		} ;
		-- <Land>[Poland] [INVADED]

		Invading_V2 invader_np land_np v2 = lin Clause {
			np = fromMaybe NP emptyNP invader_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP land_np)
		} ;
		-- <Invader>[the Germans] had [OVERRUN] <Land>[Paris]

		--
		-- Judgment
		--

		Judgment_V2 cognizer_np evaluee_np reason_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP evaluee_np)) (fromMaybe Adv emptyAdv reason_adv)
		} ;
		-- <Cognizer>[The defending solicitor] tried to [FAULT] <Evaluee>[her] <Reason>[on identification]

		--
		-- Judgment_communication
		--

		Judgment_communication_V communicator_np evaluee_adv v = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv evaluee_adv)
		} ;
		-- <Communicator>[him] ready to [JIBE] <Evaluee>[at David Sylvester]

		Judgment_communication_V2 communicator_np evaluee_np reason_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP evaluee_np)) (fromMaybe Adv emptyAdv reason_adv)
		} ;
		-- <Communicator>[each side] [ACCUSED] <Evaluee>[the other] <Reason>[with ceasefire violations throughout May]

		--
		-- Judgment_direct_address
		--

		Judgment_direct_address_V2 addressee_np communicator_np reason_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP addressee_np)) (fromMaybe Adv emptyAdv reason_adv)
		} ;
		-- <Communicator>[The Armenian Bolshevik , Shahumyan] , [REPROACHED] <Addressee>[him] -- as many were to do -- <Reason>[with exaggerating the dangers here]

		Judgment_direct_address_V2_Pass_1 addressee_np communicator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP communicator_np))
		} ;
		-- <Addressee>[she] was commiserated with , patted on the back , [THANKED] <Communicator>[by the little girl 's father]

		Judgment_direct_address_V2_Pass_2 addressee_np reason_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv reason_adv)
		} ;
		-- <Addressee>[Karajan ( DG )] has been [TAKEN TO TASK] <Reason>[from making an adagio meal of Shostakovich 's andante here]

		Judgment_direct_address_V2_Pass_3 addressee_np topic_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Addressee>[Landlords] are [TAKEN TO TASK] <Topic>[over standards]

		--
		-- Justifying
		--

		Justifying_V2_1 act_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP act_np)
		} ;
		-- <Agent>[he] began to [RATIONALISE] <Act>[his behaviour]

		Justifying_V2_2 agent_np state_of_affairs_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP state_of_affairs_np)
		} ;
		-- <Agent>[I] [RATIONALIZE] <State_of_affairs>[it]

		--
		-- Kidnapping
		--

		Kidnapping_V2 perpetrator_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Perpetrator>[Karen and I] [SHANGHAIED] <Victim>[the shrinking Dennis]

		--
		-- Killing
		--

		Killing_V2_1 cause_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Cause>[it] ` [MASSACRES] <Victim>[the morals of our youth]

		Killing_V2_2 killer_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP killer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Killer>[this girl] [GARROTTED] <Victim>[two experienced agents , Calcraft and Warnham]

		--
		-- Knot_creation
		--

		Knot_creation_V2 agent_np knot_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP knot_np)
		} ;
		-- <Agent>[Stok] [TIED] <Knot>[his tie]

		--
		-- Labeling
		--

		Labeling_V2 entity_np label_adv speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP entity_np)) (fromMaybe Adv emptyAdv label_adv)
		} ;
		-- <Speaker>[you] have [LABELLED] <Entity>[it] <Label>[in a way that would sort of help yourself more]

		Labeling_V2_Pass entity_np label_adv speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP speaker_np))) (fromMaybe Adv emptyAdv label_adv)
		} ;
		-- <Entity>[PLANNED cuts in overseas aid] were [BRANDED] <Label>[` repugnant "] <Speaker>[by Mr Smith , who accused the Government of making the starving pay for their economic blunders]

		--
		-- Launch_process
		--

		Launch_process_V2 agent_np process_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP process_np)
		} ;
		-- <Agent>[you] [LAUNCHED] <Process>[a direct attack]

		Launch_process_V2_Pass process_np v2 = lin Clause {
			np = fromMaybe NP emptyNP process_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Process>[These] were [LAUNCHED]

		--
		-- Leadership
		--

		Leadership_V2_1 activity_np leader_np v2 = lin Clause {
			np = fromMaybe NP emptyNP leader_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Leader>[Fletcher Christian] <Leader>[who] [LED] <Activity>[the famous mutiny]

		Leadership_V2_2 governed_np leader_np v2 = lin Clause {
			np = fromMaybe NP emptyNP leader_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP governed_np)
		} ;
		-- <Leader>[The President] appoints and [PRESIDES] <Governed>[over the Council of Ministers]

		Leadership_V2_Pass governed_np leader_np v2 = lin Clause {
			np = fromMaybe NP emptyNP governed_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP leader_np))
		} ;
		-- <Governed>[Botswana] is [GOVERNED] <Leader>[by a legislative National Assembly]

		--
		-- Linguistic_meaning
		--

		Linguistic_meaning_V2 form_np meaning_np v2 = lin Clause {
			np = fromMaybe NP emptyNP form_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP meaning_np)
		} ;
		-- <Form>[both verbs] [DENOTE] <Meaning>[causation]

		--
		-- Lively_place
		--

		Lively_place_V activity_adv location_np v = lin Clause {
			np = fromMaybe NP emptyNP location_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv activity_adv)
		} ;
		-- <Location>[a class] [BUZZING] <Activity>[with activity]

		--
		-- Locating
		--

		Locating_V2 perceiver_np sought_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perceiver_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sought_entity_np)
		} ;
		-- <Perceiver>[We] [FOUND] <Sought_entity>[them]

		--
		-- Location_of_light
		--

		Location_of_light_V figure_np ground_adv v = lin Clause {
			np = fromMaybe NP emptyNP figure_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv ground_adv)
		} ;
		-- <Figure>[her little gold necklace] [TWINKLING] <Ground>[round her neck]

		--
		-- Locative_relation
		--

		Locative_relation_V2 figure_np ground_np v2 = lin Clause {
			np = fromMaybe NP emptyNP figure_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ground_np)
		} ;
		-- <Figure>[one of my pastures] [ABUTS] <Ground>[your garden]

		--
		-- Losing
		--

		Losing_V2 owner_np possession_np v2 = lin Clause {
			np = fromMaybe NP emptyNP owner_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP possession_np)
		} ;
		-- <Owner>[I] have n't [LOST] <Possession>[it]

		--
		-- Losing_someone
		--

		Losing_someone_V2 deceased_np sufferer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP sufferer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP deceased_np)
		} ;
		-- <Sufferer>[i] was [LOSING] <Deceased>[my family]

		--
		-- Make_agreement_on_action
		--

		Make_agreement_on_action_V party_1_np party_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP party_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv party_2_adv)
		} ;
		-- <Party_1>[it] could n't [AGREE] <Party_2>[with SGI]

		--
		-- Make_cognitive_connection
		--

		Make_cognitive_connection_V2 cognizer_np concept_1_np concept_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP concept_1_np)) (fromMaybe Adv emptyAdv concept_2_adv)
		} ;
		-- <Cognizer>[Seminars] [LINK] <Concept_1>[film] <Concept_2>[with cultural identity]

		--
		-- Make_noise
		--

		Make_noise_V noisy_event_np v = lin Clause {
			np = fromMaybe NP emptyNP noisy_event_np ;
			vp = mkVP v
		} ;
		-- <Noisy_event>[conversations] [DRONED]

		Make_noise_V2 sound_np sound_source_np v2 = lin Clause {
			np = fromMaybe NP emptyNP sound_source_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sound_np)
		} ;
		-- <Sound_source>[the Bahamian cowbell] [TINKLING] <Sound>[the end of his final , pathetic fight , a derisive goodbye sound , stark with omen]

		--
		-- Make_possible_to_do
		--

		Make_possible_to_do_V2 enabled_action_np enablement_np v2 = lin Clause {
			np = fromMaybe NP emptyNP enablement_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP enabled_action_np)
		} ;
		-- <Enablement>[the weather] [PERMITTED] <Enabled_action>[only 17.1 overs]

		Make_possible_to_do_VS enabled_action_s enablement_np vs = lin Clause {
			np = fromMaybe NP emptyNP enablement_np ;
			vp = mkVP vs (fromMaybe S emptyS enabled_action_s)
		} ;
		-- <Enablement>[nothing] to [LET] <Enabled_action>[you know that a program has been properly saved with the ` save " button]

		--
		-- Making_faces
		--

		Making_faces_V agent_np v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v
		} ;
		-- <Agent>[they] [POUT]

		--
		-- Manipulate_into_doing
		--

		Manipulate_into_doing_V2_Pass resulting_action_adv victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP victim_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv resulting_action_adv)
		} ;
		-- <Victim>[Airbus] to be [BULLIED] <Resulting_action>[out of the industry]

		--
		-- Manipulate_into_shape
		--

		Manipulate_into_shape_V2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[he] [LOOPED] <Theme>[lengths of the rope clothes ' line by his feet]

		--
		-- Manipulation
		--

		Manipulation_V agent_np bodypart_of_agent_adv entity_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv entity_adv)) (fromMaybe Adv emptyAdv bodypart_of_agent_adv)
		} ;
		-- <Agent>[Mike] [GRABBED HOLD] <Entity>[of the shirt] <Bodypart_of_agent>[with one hand]

		Manipulation_V2 agent_np bodypart_of_agent_adv entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP entity_np)) (fromMaybe Adv emptyAdv bodypart_of_agent_adv)
		} ;
		-- <Agent>[Brownlow] [PINCHED] <Entity>[his lip] <Bodypart_of_agent>[between finger and thumb]

		Manipulation_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[The letters] were [SQUEEZED]

		--
		-- Manufacturing
		--

		Manufacturing_V2 factory_np product_np v2 = lin Clause {
			np = fromMaybe NP emptyNP factory_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP product_np)
		} ;
		-- <Factory>[a plant] [PRODUCING] <Product>[lightweight aluminium cylinder heads]

		--
		-- Mass_motion
		--

		Mass_motion_V_1 area_adv mass_theme_np v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Mass_theme>[Thousands of Soviet citizens] [CROWDED] <Area>[outside the American embassy]

		Mass_motion_V_2 direction_adv mass_theme_np v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Mass_theme>[many more green-skinned warriors] [FLOCKED] <Direction>[southwards]

		Mass_motion_V_3 goal_adv mass_theme_np v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Mass_theme>[We] all [TROOPED] <Goal>[up to the altar]

		Mass_motion_V_4 mass_theme_np path_adv v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Mass_theme>[a ragged mass of dismounted Dragoons and sweating infantry] [FLOODED] <Path>[towards the bridge]

		Mass_motion_V_5 mass_theme_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Mass_theme>[Humans] were [STREAMING] <Source>[out of the building]

		--
		-- Meet_specifications
		--

		Meet_specifications_V2_1 agent_np standard_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP standard_np)
		} ;
		-- <Agent>[we] have [MET] <Standard>[these objectives]

		Meet_specifications_V2_2 entity_np standard_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP standard_np)
		} ;
		-- <Entity>[106] ( 45% ) [MET] <Standard>[RA criteria]

		--
		-- Meet_with
		--

		Meet_with_V2 party_1_np party_2_np v2 = lin Clause {
			np = fromMaybe NP emptyNP party_1_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP party_2_np)
		} ;
		-- <Party_1>[i] [MET WITH] <Party_2>[them]

		--
		-- Meet_with_response
		--

		Meet_with_response_V2_Pass response_adv trigger_np v2 = lin Clause {
			np = fromMaybe NP emptyNP trigger_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv response_adv)
		} ;
		-- <Trigger>[That] was [MET] <Response>[by stares]

		--
		-- Memorization
		--

		Memorization_V2 cognizer_np pattern_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP pattern_np)
		} ;
		-- <Cognizer>[you] write them down or [COMMIT] <Pattern>[them] [TO MEMORY]

		--
		-- Memory
		--

		Memory_V2 cognizer_np content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Cognizer>[he] [RETAINED] <Content>[memories of that time]

		Memory_VS cognizer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Cognizer>[I] do [REMEMBER] <Content>[we did a few gigs]

		--
		-- Mention
		--

		Mention_V2 communicator_np specified_content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP specified_content_np)
		} ;
		-- <Communicator>[Hilary] [MENTION] <Specified_content>[him]

		Mention_VS communicator_np message_s vs = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Communicator>[I] [MENTIONED] <Message>[that there is no substitute for good planning]

		Mention_V2_Pass specified_content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP specified_content_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Specified_content>[Cawthorne] was [MENTIONED]

		--
		-- Misdeed
		--

		Misdeed_V wrongdoer_np v = lin Clause {
			np = fromMaybe NP emptyNP wrongdoer_np ;
			vp = mkVP v
		} ;
		-- <Wrongdoer>[He] had [SINNED]

		--
		-- Motion
		--

		Motion_V_1 direction_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Theme>[George Bush] has been [SWERVING] <Direction>[from side to side]

		Motion_V_2 goal_adv source_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[All these substances] have the ability to [FLOAT] <Source>[from the lower atmosphere ( the troposphere )] <Goal>[into the upper atmosphere ( the stratosphere ) where ozone depletion takes place]

		Motion_V_3 path_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[The boat] [GLIDED] <Path>[underneath a bridge]

		--
		-- Motion_directional
		--

		Motion_directional_V_1 goal_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[a pile of letters for him] had [TOPPLED] <Goal>[toward the edge of the desk]

		Motion_directional_V_2 path_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[Jon Gittens ' over-hit back pass] was [DIPPING] <Path>[under the bar]

		Motion_directional_V_3 source_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Theme>[a steady rain] [FALLING] <Source>[out of a sky as blank as a white eye]

		--
		-- Motion_noise
		--

		Motion_noise_V path_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[the boat] [CHUGS] <Path>[under the low arched bridges]

		Motion_noise_V2 path_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP path_np)
		} ;
		-- <Theme>[streams of cars] [WHIRRED] <Path>[past]

		--
		-- Moving_in_place
		--

		Moving_in_place_V theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v
		} ;
		-- <Theme>[The doors] [JUDDERED]

		--
		-- Name_conferral
		--

		Name_conferral_V2 entity_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Speaker>[somebody] made something and [NAME] <Entity>[it]

		Name_conferral_V2_Pass entity_np name_adv speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP speaker_np))) (fromMaybe Adv emptyAdv name_adv)
		} ;
		-- <Entity>[they] were <Name>[so] [NAMED] <Speaker>[by Clerk Maxwell]

		--
		-- Needing
		--

		Needing_V2 cognizer_np requirement_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP requirement_np)
		} ;
		-- <Cognizer>[The boy] [NEEDS] <Requirement>[that]

		Needing_V2_Pass requirement_np v2 = lin Clause {
			np = fromMaybe NP emptyNP requirement_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Requirement>[treatment] is [REQUIRED]

		--
		-- Notification_of_charges
		--

		Notification_of_charges_V2 accused_np arraign_authority_np charges_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP arraign_authority_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP accused_np)) (fromMaybe Adv emptyAdv charges_adv)
		} ;
		-- <Arraign_authority>[Prosecutors] want more time to scrutinize tons of evidence and thousands of telephone records before [INDICTING] <Accused>[the two] <Charges>[in the April 19 bombing that killed 168 people and injured more than 500]

		Notification_of_charges_V2_Pass accused_np charges_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP accused_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv charges_adv)
		} ;
		-- <Accused>[two men] [ACCUSED] <Charges>[of the murder of a police informer]

		--
		-- Nuclear_process
		--

		Nuclear_process_V element_np v = lin Clause {
			np = fromMaybe NP emptyNP element_np ;
			vp = mkVP v
		} ;
		-- <Element>[The W] then [DECAYS]

		Nuclear_process_V2_Pass element_np v2 = lin Clause {
			np = fromMaybe NP emptyNP element_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Element>[heat-producing radioactive minerals] [DECAYED]

		--
		-- Obviousness
		--

		Obviousness_V phenomenon_np v = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_np ;
			vp = mkVP v
		} ;
		-- <Phenomenon>[the strain] [SHOWED]

		--
		-- Occupy_rank
		--

		Occupy_rank_V item_np v = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP v
		} ;
		-- <Item>[one name] [STANDS]

		--
		-- Offering
		--

		Offering_V2 offerer_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP offerer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Offerer>[he] [OFFERED] <Theme>[sweets]

		--
		-- Omen
		--

		Omen_V outcome_adv phenomenon_1_np v = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv outcome_adv)
		} ;
		-- <Phenomenon_1>[It] did not [AUGUR] <Outcome>[well]

		Omen_V2 phenomenon_1_np phenomenon_2_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_1_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_2_np)
		} ;
		-- <Phenomenon_1>[The 1991 season] [PROMISES] <Phenomenon_2>[at least seven big-studio releases by black directors]

		--
		-- Operate_vehicle
		--

		Operate_vehicle_V_1 area_adv driver_np v = lin Clause {
			np = fromMaybe NP emptyNP driver_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Driver>[They] [DROVE] <Area>[through the sleeping town of Bad Sachsa]

		Operate_vehicle_V_2 driver_np goal_adv path_adv source_adv v = lin Clause {
			np = fromMaybe NP emptyNP driver_np ;
			vp = mkVP (mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Driver>[I] [MOTORED] for the fun of it <Path>[through Latvia and Estonia] , <Source>[from Riga] <Goal>[to what was then still Leningrad]

		--
		-- Operating_a_system
		--

		Operating_a_system_V2 operator_np system_np v2 = lin Clause {
			np = fromMaybe NP emptyNP operator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP system_np)
		} ;
		-- <Operator>[Tom] was [MANAGING] <System>[the manor farm]

		--
		-- Operational_testing
		--

		Operational_testing_V2 product_np tester_np v2 = lin Clause {
			np = fromMaybe NP emptyNP tester_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP product_np)
		} ;
		-- <Tester>[you] can [TEST] <Product>[your programs]

		--
		-- Opinion
		--

		Opinion_VS cognizer_np opinion_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS opinion_s)
		} ;
		-- <Cognizer>[I] [EXPECT] <Opinion>[he was hot]

		--
		-- Origin
		--

		Origin_V entity_np origin_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv origin_adv)
		} ;
		-- <Entity>[it] had [ORIGINATED] <Origin>[at P]

		--
		-- Others_situation_as_stimulus
		--

		Others_situation_as_stimulus_V_1 experiencer_np other_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv other_adv)
		} ;
		-- <Experiencer>[Morris] [EMPATHIZED] <Other>[with the underdog]

		Others_situation_as_stimulus_V_2 experiencer_np situation_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv situation_adv)
		} ;
		-- <Experiencer>[Nigel] could [EMPATHIZE] <Situation>[with that]

		Others_situation_as_stimulus_V2 experiencer_np other_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP other_np)
		} ;
		-- <Experiencer>[I] [PITY] <Other>[you]

		--
		-- Pardon
		--

		Pardon_V2 authority_np offender_np v2 = lin Clause {
			np = fromMaybe NP emptyNP authority_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP offender_np)
		} ;
		-- <Authority>[he] would [PARDON] <Offender>[the guilty men]

		Pardon_V2_Pass authority_np offender_np v2 = lin Clause {
			np = fromMaybe NP emptyNP offender_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP authority_np))
		} ;
		-- <Offender>[Brampton] was finally [PARDONED] <Authority>[by Henry VII]

		--
		-- Partiality
		--

		Partiality_V2 side_1_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP side_1_np)
		} ;
		-- [PREFER] <Side_1>[the meat of female goats]

		--
		-- Participation
		--

		Participation_V participant_1_np v = lin Clause {
			np = fromMaybe NP emptyNP participant_1_np ;
			vp = mkVP v
		} ;
		-- <Participant_1>[the teaching staff] [PARTICIPATE]

		--
		-- Path_shape
		--

		Path_shape_V_1 direction_adv road_np v = lin Clause {
			np = fromMaybe NP emptyNP road_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Road>[a flight path] [DESCENDING] <Direction>[at around 15° to the horizontal]

		Path_shape_V_2 goal_adv road_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP road_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Road>[Pale roads] [SNAKED] <Source>[from them] <Goal>[down to the newer tourist settlements by the sea]

		Path_shape_V_3 path_adv road_np v = lin Clause {
			np = fromMaybe NP emptyNP road_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Road>[The road] stretched ahead , [SWERVING] <Path>[up a hill] <Path>[through fields bounded by stone walls]

		Path_shape_V2 area_np road_np v2 = lin Clause {
			np = fromMaybe NP emptyNP road_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP area_np)
		} ;
		-- <Road>[more roads] are built [CRISSCROSSING] <Area>[the countryside]

		--
		-- Perception_active
		--

		Perception_active_V_1 body_part_adv perceiver_agentive_np v = lin Clause {
			np = fromMaybe NP emptyNP perceiver_agentive_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv body_part_adv)
		} ;
		-- <Perceiver_agentive>[I] was now able to breathe properly and started to [FEEL] <Body_part>[with both hands]

		Perception_active_V_2 direction_adv perceiver_agentive_np phenomenon_adv v = lin Clause {
			np = fromMaybe NP emptyNP perceiver_agentive_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)) (fromMaybe Adv emptyAdv phenomenon_adv)
		} ;
		-- <Perceiver_agentive>[Yanto] [GLANCED] <Direction>[to the left] <Phenomenon>[at the Murchison house]

		Perception_active_V2 direction_adv perceiver_agentive_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perceiver_agentive_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP phenomenon_np)) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Perceiver_agentive>[we] [WATCHED] <Phenomenon>[British shellfire] <Direction>[on the Turkish lines]

		Perception_active_V2_Pass phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Phenomenon>[the main rides] need be [WATCHED]

		--
		-- Perception_body
		--

		Perception_body_V_1 body_part_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv body_part_adv)
		} ;
		-- [ACHED] <Body_part>[about the head and body]

		Perception_body_V_2 body_part_np v = lin Clause {
			np = fromMaybe NP emptyNP body_part_np ;
			vp = mkVP v
		} ;
		-- <Body_part>[My feet] [TICKLE]

		--
		-- Perception_experience
		--

		Perception_experience_V2 perceiver_passive_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perceiver_passive_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- <Perceiver_passive>[people] [OVERHEAR] <Phenomenon>[him]

		Perception_experience_VQ perceiver_passive_np phenomenon_qs vq = lin Clause {
			np = fromMaybe NP emptyNP perceiver_passive_np ;
			vp = mkVP vq (fromMaybe QS emptyQS phenomenon_qs)
		} ;
		-- <Perceiver_passive>[You] [OVERHEARD] <Phenomenon>[what I was saying to Victoria]

		Perception_experience_V2_Pass phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Phenomenon>[Shaking] was [FELT]

		--
		-- Performers_and_roles
		--

		Performers_and_roles_V performer1_np performer2_adv v = lin Clause {
			np = fromMaybe NP emptyNP performer1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv performer2_adv)
		} ;
		-- <Performer1>[Pamela Brown] , <Performer1>[who] was to [CO-STAR] <Performer2>[with Gielgud]

		Performers_and_roles_V2_1 performance_adv performer_np role_np v2 = lin Clause {
			np = fromMaybe NP emptyNP performer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP role_np)) (fromMaybe Adv emptyAdv performance_adv)
		} ;
		-- <Performer>[Will] was [ACTING] <Role>[four small parts] <Performance>[in two different plays]

		Performers_and_roles_V2_2 performer_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP performer_np)
		} ;
		-- [STARRING] <Performer>[Val Kilmer]

		--
		-- Permitting
		--

		Permitting_V2 principle_np state_of_affairs_np v2 = lin Clause {
			np = fromMaybe NP emptyNP principle_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP state_of_affairs_np)
		} ;
		-- <Principle>[Most building codes] do not [PERMIT] <State_of_affairs>[building in earth]

		Permitting_V2_Pass state_of_affairs_np v2 = lin Clause {
			np = fromMaybe NP emptyNP state_of_affairs_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <State_of_affairs>[no backtracking] is [PERMITTED]

		--
		-- Personal_relationship
		--

		Personal_relationship_V partner_1_np partner_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP partner_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv partner_2_adv)
		} ;
		-- <Partner_1>[a man] is [COHABITING] <Partner_2>[with a woman]

		Personal_relationship_V2 partner_1_np partner_2_np v2 = lin Clause {
			np = fromMaybe NP emptyNP partner_1_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP partner_2_np)
		} ;
		-- <Partner_1>[Boldwood] , when [COURTING] <Partner_2>[her]

		--
		-- Piracy
		--

		Piracy_V2 perpetrator_np vehicle_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP vehicle_np)
		} ;
		-- <Perpetrator>[her attacker] [HIJACKED] <Vehicle>[a taxi]

		Piracy_V2_Pass vehicle_np v2 = lin Clause {
			np = fromMaybe NP emptyNP vehicle_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Vehicle>[a Kuwaiti airliner] was [HIJACKED]

		--
		-- Place_weight_on
		--

		Place_weight_on_V agent_np consideration_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv consideration_adv)
		} ;
		-- [WEIGHT] <Agent>[John Paul] [PLACES] <Consideration>[on the issue]

		--
		-- Placing
		--

		Placing_V2_1 agent_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[Mr Attlee] was careful to [POSITION] <Theme>[himself] <Goal>[with the majority view in Cabinet]

		Placing_V2_2 goal_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP goal_np)
		} ;
		-- [DRIZZLE] <Goal>[over the cream]

		Placing_V2_Pass goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[any British or Prussian soldiers] were [BILLETED] <Goal>[within]

		--
		-- Planting
		--

		Planting_V2_1 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[they] really ought to [PLANT] <Theme>[a few flowers]

		Planting_V2_2 ground_adv theme_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv ground_adv)
		} ;
		-- [SOW] <Theme>[early carrots] <Ground>[in a cold frame or greenhouse]

		Planting_V2_Pass theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Theme>[the grass] is [SOWN]

		--
		-- Posing_as
		--

		Posing_as_V2 agent_np simulated_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP simulated_entity_np)
		} ;
		-- <Agent>[somebody] be [IMPERSONATING] <Simulated_entity>[a member]

		--
		-- Possession
		--

		Possession_V2 owner_np possession_np v2 = lin Clause {
			np = fromMaybe NP emptyNP owner_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP possession_np)
		} ;
		-- <Owner>[we] [HAD] <Possession>[everything]

		--
		-- Posture
		--

		Posture_V agent_np location_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Agent>[Sara Glynn] [SAT] <Location>[opposite Wycliffe] <Location>[in the big , rather gloomy room with its dark wallpaper , over-varnished oil paintings in gilt frames , and leather-upholstered chairs]

		--
		-- Practice
		--

		Practice_V action_adv agent_np v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv action_adv)
		} ;
		-- <Agent>[he] [PRACTISES] <Action>[on our old piano]

		Practice_V2 action_np agent_np occasion_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP action_np)) (fromMaybe Adv emptyAdv occasion_adv)
		} ;
		-- <Agent>[WE] started to [REHEARSE] <Action>[our routine] <Occasion>[for the show]

		Practice_V2_Pass action_np v2 = lin Clause {
			np = fromMaybe NP emptyNP action_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Action>[it] was [REHEARSED]

		--
		-- Precipitation
		--

		Precipitation_V_1 place_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv place_adv)
		} ;
		-- [RAINS] <Place>[on the rest of us]

		Precipitation_V_2 time_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv time_adv)
		} ;
		-- [RAIN] <Time>[on Empire Day]

		--
		-- Predicting
		--

		Predicting_V2 eventuality_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP eventuality_np)
		} ;
		-- <Speaker>[I] am , but can not [FORETELL] <Eventuality>[the future]

		Predicting_VQ eventuality_qs vq = lin Clause {
			np = emptyNP ;
			vp = mkVP vq (fromMaybe QS emptyQS eventuality_qs)
		} ;
		-- [PROPHESIED] <Eventuality>[what has come to pass]

		Predicting_VS eventuality_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS eventuality_s)
		} ;
		-- <Speaker>[Madge , the Witch] , <Speaker>[who] [FORETELLS] <Eventuality>[that he will never marry]

		--
		-- Preserving
		--

		Preserving_V2 agent_np medium_adv undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP undergoer_np)) (fromMaybe Adv emptyAdv medium_adv)
		} ;
		-- <Agent>[Bloxham] had done well , returning Dowd 's guts into the bowel of the carcass , and [MUMMIFYING] <Undergoer>[the whole sorry slab] <Medium>[in plastic and tape]

		Preserving_V2_Pass medium_adv undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv medium_adv)
		} ;
		-- <Undergoer>[bacon] is [CURED] <Medium>[by injecting fresh pork with brine]

		--
		-- Prevarication
		--

		Prevarication_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[Eisenhower and Dulles] [PREVARICATED] <Topic>[over Suez]

		--
		-- Prevent_from_having
		--

		Prevent_from_having_V3 agent_np protagonist_np v3 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v3 (fromMaybe NP emptyNP protagonist_np) emptyNP
		} ;
		-- <Agent>[you] [DENIED] <Protagonist>[her]

		--
		-- Preventing
		--

		Preventing_V2_1 agent_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Agent>[I] shall [NIP] <Event>[it] [IN THE BUD]

		Preventing_V2_2 event_np preventing_cause_np v2 = lin Clause {
			np = fromMaybe NP emptyNP preventing_cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Preventing_cause>[the receivers orders] to [STOP] <Event>[disgruntled workers taking demonstration vehicles from the site]

		--
		-- Process_continue
		--

		Process_continue_V event_np v = lin Clause {
			np = fromMaybe NP emptyNP event_np ;
			vp = mkVP v
		} ;
		-- <Event>[their poverty] will [PERSIST]

		--
		-- Process_end
		--

		Process_end_V process_np v = lin Clause {
			np = fromMaybe NP emptyNP process_np ;
			vp = mkVP v
		} ;
		-- <Process>[junior schooling] [CONCLUDING]

		--
		-- Process_resume
		--

		Process_resume_V process_np v = lin Clause {
			np = fromMaybe NP emptyNP process_np ;
			vp = mkVP v
		} ;
		-- <Process>[Talks] were to [RESUME]

		--
		-- Process_start
		--

		Process_start_V event_np v = lin Clause {
			np = fromMaybe NP emptyNP event_np ;
			vp = mkVP v
		} ;
		-- <Event>[production] [COMMENCE]

		--
		-- Process_stop
		--

		Process_stop_V process_np v = lin Clause {
			np = fromMaybe NP emptyNP process_np ;
			vp = mkVP v
		} ;
		-- <Process>[the storm] to [CEASE]

		--
		-- Processing_materials
		--

		Processing_materials_V2 agent_np material_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP material_np)
		} ;
		-- <Agent>[he] 'd [DYED] <Material>[his hair]

		Processing_materials_V2_Pass material_np v2 = lin Clause {
			np = fromMaybe NP emptyNP material_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Material>[The wood] was [STAINED]

		--
		-- Progress
		--

		Progress_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[they] would [BURGEON]

		--
		-- Prohibiting
		--

		Prohibiting_V2 principle_np state_of_affairs_np v2 = lin Clause {
			np = fromMaybe NP emptyNP principle_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP state_of_affairs_np)
		} ;
		-- <Principle>[rules] [PROHIBITING] <State_of_affairs>[legal representation]

		--
		-- Proliferating_in_number
		--

		Proliferating_in_number_V final_number_adv initial_number_adv set_np v = lin Clause {
			np = fromMaybe NP emptyNP set_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv initial_number_adv)) (fromMaybe Adv emptyAdv final_number_adv)
		} ;
		-- <Set>[Membership of the club] has [DWINDLED] <Initial_number>[from 70] <Final_number>[to 20]

		Proliferating_in_number_V2_Pass set_np v2 = lin Clause {
			np = fromMaybe NP emptyNP set_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Set>[the number of pomeshchiks to be sustained] [MULTIPLIED]

		--
		-- Protecting
		--

		Protecting_V2 asset_np protection_np v2 = lin Clause {
			np = fromMaybe NP emptyNP protection_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP asset_np)
		} ;
		-- <Protection>[someone] is [SHIELDING] <Asset>[her]

		Protecting_V2_Pass asset_np danger_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP asset_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv danger_adv)
		} ;
		-- <Asset>[they] were [GUARDED] <Danger>[against any persuasive attempts from authority]

		--
		-- Quarreling
		--

		Quarreling_V_1 arguer1_np arguer2_adv v = lin Clause {
			np = fromMaybe NP emptyNP arguer1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv arguer2_adv)
		} ;
		-- <Arguer1>[She] needs <Arguer2>[someone of her own age] to talk with -- maybe even to [QUARREL] <Arguer2>[with]

		Quarreling_V_2 arguers_np issue_adv v = lin Clause {
			np = fromMaybe NP emptyNP arguers_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv issue_adv)
		} ;
		-- <Arguers>[politicians in Bonn] [SQUABBLE] <Issue>[over whether Germany is bound by treaty to aid Turkey , a NATO partner , should it be attacked by Iraq]

		--
		-- Questioning
		--

		Questioning_V2 addressee_np speaker_np topic_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP addressee_np)) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[Police] were [QUESTIONING] <Addressee>[a 30-year-old man] <Topic>[in connection with the murder of Elizabeth Page-Alucard , 41 , the counsellor who was found dead on Saturday at a drugs advisory centre in Worcester]

		Questioning_VQ message_qs speaker_np vq = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vq (fromMaybe QS emptyQS message_qs)
		} ;
		-- <Speaker>[Isabel] wanted to [ASK] <Message>[why not]

		Questioning_V2_Pass addressee_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP speaker_np))
		} ;
		-- <Addressee>[Herr Nordern] was [QUIZZED] <Speaker>[by the entire staff]

		--
		-- Quitting
		--

		Quitting_V employee_np position_adv v = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv position_adv)
		} ;
		-- <Employee>[Gould] [RESIGNED] <Position>[from the service of the Zoological Society]

		Quitting_V2 employee_np position_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP position_np)
		} ;
		-- <Employee>[I] [QUIT] <Position>[my job]

		--
		-- Quitting_a_place
		--

		Quitting_a_place_V self_mover_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Self_mover>[The Israelis] [RETREATED] <Source>[out of almost all of Lebanon]

		Quitting_a_place_V2 source_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP source_np)
		} ;
		-- [VACATING] <Source>[the City]

		--
		-- Ratification
		--

		Ratification_V2 proposal_np ratifier_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ratifier_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP proposal_np)
		} ;
		-- <Ratifier>[The IAAF] are expected to [RATIFY] <Proposal>[the DLV decision]

		--
		-- Reading
		--

		Reading_V_1 reader_np text_adv v = lin Clause {
			np = fromMaybe NP emptyNP reader_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv text_adv)
		} ;
		-- <Reader>[Ursula Oxley] [READ] <Text>[from the memoirs of Henry Hunt]

		Reading_V_2 text_np v = lin Clause {
			np = fromMaybe NP emptyNP text_np ;
			vp = mkVP v
		} ;
		-- <Text>[The history of Hawaii] [READS]

		Reading_V2 reader_np text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP reader_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP text_np)
		} ;
		-- <Reader>[I] read and [DEVOURED] <Text>[everything I could about Rennes-le-Chateau]

		--
		-- Reading_aloud
		--

		Reading_aloud_V2 speaker_np text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP text_np)
		} ;
		-- <Speaker>[a fruity voice] was [READING OUT] <Text>[a list of figures which had something to do with the production of pig-iron]

		--
		-- Reasoning
		--

		Reasoning_V arguer_np content_adv v = lin Clause {
			np = fromMaybe NP emptyNP arguer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Arguer>[Christians , both Catholic and Protestant ,] have [ARGUED] <Content>[thus]

		Reasoning_VS arguer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP arguer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Arguer>[I] tried to [REASON] <Content>[that he should know about the baby]

		--
		-- Receiving
		--

		Receiving_V2 recipient_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP recipient_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Recipient>[I] [RECEIVED] <Theme>[your letter]

		--
		-- Recording
		--

		Recording_V2 agent_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- <Agent>[the youngest player] to [REGISTER] <Phenomenon>[20,000 runs in first-class cricket]

		--
		-- Recovery
		--

		Recovery_V_1 affliction_adv patient_np v = lin Clause {
			np = fromMaybe NP emptyNP patient_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv affliction_adv)
		} ;
		-- <Patient>[they] 're [CONVALESCING] <Affliction>[from surgery]

		Recovery_V_2 affliction_np v = lin Clause {
			np = fromMaybe NP emptyNP affliction_np ;
			vp = mkVP v
		} ;
		-- <Affliction>[all] [HEALED]

		Recovery_V2_Pass body_part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP body_part_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Body_part>[Her face] is all [HEALED]

		--
		-- Redirecting
		--

		Redirecting_V2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[We] will be [REDIRECTING] <Theme>[our overseas exploration efforts]

		Redirecting_V2_Pass goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[food aid] is [REDIRECTED] <Goal>[to the drought victims]

		--
		-- Reference_text
		--

		Reference_text_V2 source_of_information_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP source_of_information_np)
		} ;
		-- [SEE] <Source_of_information>[page 9]

		--
		-- Reforming_a_system
		--

		Reforming_a_system_V2 agent_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Agent>[We] shall need to [OVERHAUL] <Entity>[our descriptive systems]

		Reforming_a_system_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[it] is [OVERHAULED]

		--
		-- Rejuvenation
		--

		Rejuvenation_V2_1 agent_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Agent>[you] have the chance to [REVITALISE] <Entity>[the spirits of the faithful]

		Rejuvenation_V2_2 cause_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Cause>[A helping of humus] [RESTORES] <Entity>[reluctant runners]

		Rejuvenation_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[the menu] [REVITALISED]

		--
		-- Relating_concepts
		--

		Relating_concepts_V2 concept_1_np concept_2_adv evidence_np v2 = lin Clause {
			np = fromMaybe NP emptyNP evidence_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP concept_1_np)) (fromMaybe Adv emptyAdv concept_2_adv)
		} ;
		-- <Evidence>[no evidence] to [CONNECT] <Concept_1>[him] <Concept_2>[with the murder]

		Relating_concepts_V2_Pass concept_1_np concept_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP concept_1_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv concept_2_adv)
		} ;
		-- <Concept_1>[a disease] [LINKED] <Concept_2>[with fetal growth]

		--
		-- Relative_time
		--

		Relative_time_V focal_occasion_np v = lin Clause {
			np = fromMaybe NP emptyNP focal_occasion_np ;
			vp = mkVP v
		} ;
		-- <Focal_occasion>[volumes] [FOLLOWING]

		--
		-- Releasing
		--

		Releasing_V2 theme_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- [RELEASING] <Theme>[them]

		--
		-- Reliance
		--

		Reliance_V means_adv protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv means_adv)
		} ;
		-- <Protagonist>[they] tend to [RELY] <Means>[upon non-verbal communication]

		--
		-- Religious_belief
		--

		Religious_belief_V element_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv element_adv)
		} ;
		-- [BELIEVE] <Element>[not only in celibacy outside marriage , but chastity , or faithfulness , within it]

		Religious_belief_VS believer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP believer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Believer>[Christians] [BELIEVE] <Content>[that God acts in history]

		--
		-- Remainder
		--

		Remainder_V remainder_np v = lin Clause {
			np = fromMaybe NP emptyNP remainder_np ;
			vp = mkVP v
		} ;
		-- <Remainder>[No walls] [REMAIN]

		Remainder_V2 remainder_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP remainder_np)
		} ;
		-- [REMAINS] <Remainder>[a wealth of untapped experience and knowledge]

		--
		-- Remembering_experience
		--

		Remembering_experience_VQ cognizer_np experience_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS experience_qs)
		} ;
		-- <Cognizer>[i] [FORGET] <Experience>[why]

		--
		-- Remembering_information
		--

		Remembering_information_VS cognizer_np mental_content_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS mental_content_s)
		} ;
		-- <Cognizer>[she] [FORGOT] <Mental_content>[you were coming]

		--
		-- Remembering_to_do
		--

		Remembering_to_do_VV action_vp cognizer_np vv = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP action_vp)
		} ;
		-- <Cognizer>[I] [FORGOT] <Action>[to post it]

		--
		-- Removing
		--

		Removing_V agent_np theme_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Agent>[BRITISH troops] were last night preparing to [EVACUATE] <Theme>[up to 2,000 war refugees trapped in a Bosnian village]

		Removing_V2 agent_np source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Agent>[Ben Clarke] , of Bath , has the awesome task of [DISLODGING] <Theme>[Dean Richards] <Source>[at No 8]

		Removing_V2_Pass_1 source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Theme>[Donna] [TAKEN] <Source>[off us]

		Removing_V2_Pass_2 theme_adv v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- [STRIPPED] <Theme>[of powers]

		--
		-- Render_nonfunctional
		--

		Render_nonfunctional_V2 agent_np artifact_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP artifact_np)
		} ;
		-- <Agent>[He] did so ` to [INCAPACITATE] <Artifact>[him]

		--
		-- Renting
		--

		Renting_V2 goods_np lessee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP lessee_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Lessee>[Humphrey Austin] [LEASED] <Goods>[the mill]

		--
		-- Renting_out
		--

		Renting_out_V2 goods_np lessee_adv lessor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP lessor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP goods_np)) (fromMaybe Adv emptyAdv lessee_adv)
		} ;
		-- <Lessor>[an aunt] <Lessor>[who] [RENTED] <Goods>[a field] <Lessee>[to a shepherd]

		--
		-- Renunciation
		--

		Renunciation_V2 content_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Speaker>[he] had [RENOUNCED] <Content>[the world]

		--
		-- Repel
		--

		Repel_V2_1 defender_np enemy_np v2 = lin Clause {
			np = fromMaybe NP emptyNP defender_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP enemy_np)
		} ;
		-- <Defender>[she] had [REPELLED] <Enemy>[all boarders]

		Repel_V2_2 defender_np invasion_act_np v2 = lin Clause {
			np = fromMaybe NP emptyNP defender_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP invasion_act_np)
		} ;
		-- <Defender>[Spain] pledged to [REPEL] <Invasion_act>[any Allied invasion]

		--
		-- Replacing
		--

		Replacing_V2_1 agent_np new_adv old_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP old_np)) (fromMaybe Adv emptyAdv new_adv)
		} ;
		-- <Agent>[they] are having to [REPLACE] <Old>[him] , <New>[not with one , but with several people]

		Replacing_V2_2 agent_np new_np old_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP new_np)) (fromMaybe Adv emptyAdv old_adv)
		} ;
		-- <Agent>[the Government] [SUBSTITUTING] <New>[depreciation accounting] <Old>[in place of principal repayments of loans]

		--
		-- Reporting
		--

		Reporting_V informer_np wrongdoer_adv v = lin Clause {
			np = fromMaybe NP emptyNP informer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv wrongdoer_adv)
		} ;
		-- <Informer>[citizens] to [SNITCH] <Wrongdoer>[on white farmers who use racist epithets]

		--
		-- Representing
		--

		Representing_V entity_np phenomenon_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv phenomenon_adv)
		} ;
		-- <Entity>[his glasses] [WERE] a [SYMBOL] <Phenomenon>[for sight and wisdom]

		--
		-- Request
		--

		Request_V2_1 addressee_np message_adv speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP addressee_np)) (fromMaybe Adv emptyAdv message_adv)
		} ;
		-- <Speaker>[him] to [ORDER] <Addressee>[Lessing] <Message>[out of there]

		Request_V2_2 message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Speaker>[He] then staggered uphill to a courting couple and [PLEADED] : ` <Message>[Help me , I think they have murdered my girlfriend and burned her alive]

		Request_V2V addressee_np message_vp speaker_np v2v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP addressee_np) (fromMaybe VP emptyVP message_vp)
		} ;
		-- <Speaker>[you] specifically [REQUEST] <Addressee>[me] <Message>[to do so]

		Request_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[Auguste] [PLEADED] <Message>[that the Prince of Wales would not wait until September]

		Request_V2_Pass addressee_np message_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv message_adv)
		} ;
		-- <Addressee>[They] were there to be beseeched and [ENTREATED] <Message>[for their protection and aid in adversity]

		--
		-- Research
		--

		Research_V_1 field_adv researcher_np v = lin Clause {
			np = fromMaybe NP emptyNP researcher_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv field_adv)
		} ;
		-- <Researcher>[these universities] are [RESEARCHING] <Field>[in areas not covered by the mainstream journals]

		Research_V_2 researcher_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP researcher_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Researcher>[He] moved to Birmingham for his early clinical experience and to [RESEARCH] <Topic>[on aspects of hypertension in diabetes]

		--
		-- Reshaping
		--

		Reshaping_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[a newspaper] folded again and again and [SQUASHED]

		Reshaping_V2 deformer_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP deformer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Deformer>[His gob of saliva] dribbled down then clung , [WARPING] <Undergoer>[the image of the turtle head]

		Reshaping_V2_Pass undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Undergoer>[permed or curly hair] to be [SCRUNCHED]

		--
		-- Residence
		--

		Residence_V location_adv resident_np v = lin Clause {
			np = fromMaybe NP emptyNP resident_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Resident>[we] got our permit to [CAMP] for two nights <Location>[by the Colorado]

		--
		-- Resolve_problem
		--

		Resolve_problem_V_1 agent_np problem_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv problem_adv)
		} ;
		-- <Agent>[we] have to [DEAL] <Problem>[with matters as they now stand]

		Resolve_problem_V_2 problem_np v = lin Clause {
			np = fromMaybe NP emptyNP problem_np ;
			vp = mkVP v
		} ;
		-- <Problem>[treatments for such patients] tend to be chosen empirically and [WORKED THROUGH]

		Resolve_problem_V2 agent_np problem_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP problem_np)
		} ;
		-- <Agent>[they] [WORK THROUGH] <Problem>[their problems]

		Resolve_problem_V2_Pass problem_np v2 = lin Clause {
			np = fromMaybe NP emptyNP problem_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Problem>[Other structures] are [WORKED THROUGH]

		--
		-- Respond_to_proposal
		--

		Respond_to_proposal_V2 proposal_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP proposal_np)
		} ;
		-- <Speaker>[Pan Am] has [REBUFFED] <Proposal>[TWA 's first advances]

		--
		-- Response
		--

		Response_V_1 agent_np trigger_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv trigger_adv)
		} ;
		-- <Agent>[He] does n't [RESPOND] <Trigger>[to my friendly greeting]

		Response_V_2 responding_entity_np trigger_adv v = lin Clause {
			np = fromMaybe NP emptyNP responding_entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv trigger_adv)
		} ;
		-- <Responding_entity>[the body] [RESPONDS] <Trigger>[to the virus]

		--
		-- Reveal_secret
		--

		Reveal_secret_V_1 information_adv speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv information_adv)
		} ;
		-- <Speaker>[Labour] will not [COME CLEAN] <Information>[with its figures]

		Reveal_secret_V_2 speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[Spurs chief executive Terry Venables] forced to [COME CLEAN] <Topic>[over the Shreeves situation]

		Reveal_secret_V2 information_np medium_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP information_np)
		} ;
		-- <Medium>[a letter] [CONFESSING] <Information>[the weakness]

		Reveal_secret_VQ information_qs speaker_np vq = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vq (fromMaybe QS emptyQS information_qs)
		} ;
		-- <Speaker>[the Pentagon] do n't know or wo n't [DIVULGE] <Information>[what type of plane it was]

		Reveal_secret_VS_1 information_s medium_np vs = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP vs (fromMaybe S emptyS information_s)
		} ;
		-- <Information>[SPELLING everyday words is beyond the grasp of millions of Britons] , <Medium>[a survey] [REVEALED]

		Reveal_secret_VS_2 information_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS information_s)
		} ;
		-- <Speaker>[The Chief Constable] was able to [DIVULGE] <Information>[that they think Gray was killed last Thursday night]

		--
		-- Revenge
		--

		Revenge_V_1 avenger_np injury_adv v = lin Clause {
			np = fromMaybe NP emptyNP avenger_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv injury_adv)
		} ;
		-- <Avenger>[Soldiers] [RETALIATING] <Injury>[for an ambush at Girikola village]

		Revenge_V_2 avenger_np punishment_adv v = lin Clause {
			np = fromMaybe NP emptyNP avenger_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv punishment_adv)
		} ;
		-- <Avenger>[Loyalists] [RETALIATED] <Punishment>[with the gun attack on a bookmaker 's office]

		Revenge_V2_Pass avenger_np punishment_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP avenger_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv punishment_adv)
		} ;
		-- <Avenger>[They] [RETALIATED] <Punishment>[by cruelly nicknaming him ` the Chinese Jew "]

		--
		-- Rewards_and_punishments
		--

		Rewards_and_punishments_V2 agent_np evaluee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP evaluee_np)
		} ;
		-- <Agent>[the blessed Virgin] will [REWARD] <Evaluee>[you]

		--
		-- Ride_vehicle
		--

		Ride_vehicle_V_1 area_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Theme>[I] [HITCHHIKED] <Area>[round Europe]

		Ride_vehicle_V_2 path_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- [HITCHHIKING] <Path>[through the galaxy]

		Ride_vehicle_V2 goal_adv source_adv theme_np vehicle_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (mkVP v2 (fromMaybe NP emptyNP vehicle_np)) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[YOU] can [FLY] <Vehicle>[North-west Airlines] <Source>[from Gatwick] <Goal>[to San Diego]

		--
		-- Rising_to_a_challenge
		--

		Rising_to_a_challenge_V activity_adv protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv activity_adv)
		} ;
		-- <Protagonist>[they] [ROSE] <Activity>[to the occasion]

		--
		-- Rite
		--

		Rite_V member_np v = lin Clause {
			np = fromMaybe NP emptyNP member_np ;
			vp = mkVP v
		} ;
		-- <Member>[him] [BAPTISED]

		Rite_V2 object_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP object_np)
		} ;
		-- [BLESSED] <Object>[the soil]

		Rite_V2_Pass member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP member_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Member>[a woman] to be [ORDAINED]

		--
		-- Robbery
		--

		Robbery_V2 perpetrator_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Perpetrator>[We] 'll [MUG] <Victim>[a little old lady]

		--
		-- Rotting
		--

		Rotting_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[the body] was beginning to [PUTREFY]

		--
		-- Run_risk
		--

		Run_risk_V2 asset_np protagonist_np v2 = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP asset_np)
		} ;
		-- <Protagonist>[investors] [RISK] <Asset>[money]

		Run_risk_VV bad_outcome_vp protagonist_np vv = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP vv (fromMaybe VP emptyVP bad_outcome_vp)
		} ;
		-- <Protagonist>[She] will not [RISK] <Bad_outcome>[hurting Andrew]

		--
		-- Satisfying
		--

		Satisfying_V2_1 agent_np standard_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP standard_np)
		} ;
		-- <Agent>[we] can [SATISFY] <Standard>[the stringent requirements of the number system]

		Satisfying_V2_2 entity_np standard_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP standard_np)
		} ;
		-- <Entity>[this information] [SATISFIES] <Standard>[your requirements]

		--
		-- Scouring
		--

		Scouring_V2 ground_np searcher_np v2 = lin Clause {
			np = fromMaybe NP emptyNP searcher_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ground_np)
		} ;
		-- <Searcher>[The men] [RANSACKED] <Ground>[the house]

		Scouring_V2_Pass ground_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ground_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Ground>[anonymous documents] could be [SIFTED]

		--
		-- Scrutiny
		--

		Scrutiny_V cognizer_np ground_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv ground_adv)
		} ;
		-- <Cognizer>[We] [SEARCHED] , and retrieved , <Ground>[from the bottom of Gallanach Port]

		Scrutiny_V2 cognizer_np ground_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ground_np)
		} ;
		-- <Cognizer>[We] transiently expressed several cDNAs in mammalian cells , then [ASSAYED] <Ground>[both cell lysates and conditioned medium]

		Scrutiny_V2_Pass ground_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ground_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Ground>[Whole chapters] can be [SKIMMED]

		--
		-- Seeking
		--

		Seeking_V cognizer_agent_np sought_entity_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv sought_entity_adv)
		} ;
		-- <Cognizer_agent>[he] was [PANNING] <Sought_entity>[for gold]

		--
		-- Seeking_to_achieve
		--

		Seeking_to_achieve_V2_1 agent_np sought_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sought_entity_np)
		} ;
		-- <Agent>[he] had [SOUGHT] <Sought_entity>[it]

		Seeking_to_achieve_V2_2 state_of_affairs_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP state_of_affairs_np)
		} ;
		-- [SEEKING] <State_of_affairs>[a particular patterning of the stars or an instinctive orientation to the Earth 's magnetic field]

		--
		-- Self_motion
		--

		Self_motion_V_1 area_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Self_mover>[It] could not [STEAL] <Area>[upon the country unaware]

		Self_motion_V_2 direction_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Self_mover>[she] [WALKED] <Direction>[towards the staircase]

		Self_motion_V_3 goal_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Self_mover>[they] did [HASTEN] <Goal>[unto Kuwait , Saudi Arabia and Texas]

		Self_motion_V_4 path_adv self_mover_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Self_mover>[I] put the coffee down , [LEAPT] <Source>[out of my chair] and <Path>[over the couch]

		--
		-- Sending
		--

		Sending_V2 recipient_adv sender_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP sender_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv recipient_adv)
		} ;
		-- <Sender>[the Profitboss] wo n't just [SEND] <Theme>[an apologetic , defensive , stereotyped letter] <Recipient>[back]

		Sending_V2_Pass recipient_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv recipient_adv)
		} ;
		-- <Theme>[documents] have not yet been [SENT] <Recipient>[out]

		--
		-- Sentencing
		--

		Sentencing_V2_Pass convict_np offense_adv sentence_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP convict_np ;
			vp = mkVP (mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv sentence_adv)) (fromMaybe Adv emptyAdv offense_adv)
		} ;
		-- <Convict>[Ayres , from Cardiff] , was [SENTENCED] <Sentence>[to 11 years] <Offense>[for robbery]

		--
		-- Separating
		--

		Separating_V2 agent_np part_1_np part_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP part_1_np)) (fromMaybe Adv emptyAdv part_2_adv)
		} ;
		-- <Agent>[Who] would [SEPARATE] <Part_1>[the clean] <Part_2>[from the unclean]

		Separating_V2_Pass parts_adv whole_np v2 = lin Clause {
			np = fromMaybe NP emptyNP whole_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv parts_adv)
		} ;
		-- <Whole>[They] too were [SEGREGATED] <Parts>[into wagons for families and those for single men]

		--
		-- Setting_fire
		--

		Setting_fire_V flammables_np v = lin Clause {
			np = fromMaybe NP emptyNP flammables_np ;
			vp = mkVP v
		} ;
		-- <Flammables>[the garment] to [COMBUST]

		Setting_fire_V2_1 flame_np kindler_np v2 = lin Clause {
			np = fromMaybe NP emptyNP kindler_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP flame_np)
		} ;
		-- <Kindler>[Vandals] [SPARKED] <Flame>[a blaze]

		Setting_fire_V2_2 flammables_np kindler_np v2 = lin Clause {
			np = fromMaybe NP emptyNP kindler_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP flammables_np)
		} ;
		-- <Kindler>[she] [IGNITED] <Flammables>[a solid fuel heater]

		--
		-- Setting_out
		--

		Setting_out_V self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP v
		} ;
		-- <Self_mover>[I] [SET OFF]

		--
		-- Shoot_projectiles
		--

		Shoot_projectiles_V2 agent_np projectile_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP projectile_np)
		} ;
		-- <Agent>[the archers] [SHOOT] <Projectile>[two arrows]

		--
		-- Sidereal_appearance
		--

		Sidereal_appearance_V astronomical_entity_np v = lin Clause {
			np = fromMaybe NP emptyNP astronomical_entity_np ;
			vp = mkVP v
		} ;
		-- <Astronomical_entity>[the sun] [ROSE]

		--
		-- Sign_agreement
		--

		Sign_agreement_V2 agreement_np signatory_np v2 = lin Clause {
			np = fromMaybe NP emptyNP signatory_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP agreement_np)
		} ;
		-- <Signatory>[I] had to [SIGN] <Agreement>[a paper saying I 'd be responsible for the arrears]

		--
		-- Silencing
		--

		Silencing_V2 agent_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP speaker_np)
		} ;
		-- <Agent>[the strong-man] holds his arm up to [QUIET] <Speaker>[us] [DOWN]

		--
		-- Similarity
		--

		Similarity_V entity_1_np entity_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv entity_2_adv)
		} ;
		-- <Entity_1>[West Germany] [DIFFERS] <Entity_2>[from both France and Britain]

		--
		-- Simultaneity
		--

		Simultaneity_V events_np v = lin Clause {
			np = fromMaybe NP emptyNP events_np ;
			vp = mkVP v
		} ;
		-- <Events>[planning and production] to [CO-OCCUR]

		--
		-- Sleep
		--

		Sleep_V sleeper_np v = lin Clause {
			np = fromMaybe NP emptyNP sleeper_np ;
			vp = mkVP v
		} ;
		-- <Sleeper>[you] resist any temptation to [NAP]

		--
		-- Smuggling
		--

		Smuggling_V2 goods_np perpetrator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Perpetrator>[They] [SMUGGLED] <Goods>[drugs]

		Smuggling_V2_Pass goal_adv goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Goods>[a girl] was [SMUGGLED] <Goal>[into the proceedings]

		--
		-- Soaking
		--

		Soaking_V2 agent_np medium_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv medium_adv)
		} ;
		-- <Agent>[You] can [MARINATE] <Theme>[the skinned and boned whole breasts] <Medium>[in the marinade]

		--
		-- Soaking_up
		--

		Soaking_up_V2 item_np substance_np v2 = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP substance_np)
		} ;
		-- <Item>[it] [ABSORBS] <Substance>[water]

		Soaking_up_V2_Pass item_np substance_np v2 = lin Clause {
			np = fromMaybe NP emptyNP substance_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP item_np))
		} ;
		-- <Substance>[Light] is [ABSORBED] <Item>[by dark surfaces]

		--
		-- Sound_movement
		--

		Sound_movement_V sound_np v = lin Clause {
			np = fromMaybe NP emptyNP sound_np ;
			vp = mkVP v
		} ;
		-- <Sound>[A loud explosion] [ECHOED]

		--
		-- Speak_on_topic
		--

		Speak_on_topic_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[he] [TOLD] <Topic>[of being attacked by insects as big as chickens]

		--
		-- Spelling_and_pronouncing
		--

		Spelling_and_pronouncing_V2 sign_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sign_np)
		} ;
		-- <Speaker>[we] learn to [SPELL] <Sign>[it]

		--
		-- State_continue
		--

		State_continue_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[Fears] [REMAIN]

		--
		-- Statement
		--

		Statement_V_1 message_adv speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv message_adv)
		} ;
		-- <Speaker>[He] nodded and [ADDRESSED] <Message>[with , ` And how are you feeling today ? "]

		Statement_V_2 speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[Sebastian] started [TALKING] <Topic>[in terms of giving up his job]

		Statement_V2 medium_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Medium>[The decree] [REAFFIRMED] <Message>[central banking control]

		Statement_VS_1 medium_np message_s vs = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Medium>[the memo] [SAID] , <Message>[there was no confirmed reporting on Saddam cooperating with Bin Ladin on unconventional weapons]

		Statement_VS_2 message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[he] began to [PROFESS] <Message>[they were ` really just good friends "]

		Statement_VV message_vp speaker_np vv = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vv (fromMaybe VP emptyVP message_vp)
		} ;
		-- <Speaker>[Pentagon officials] [ACKNOWLEDGE] <Message>[using two Stealth fighter bombers to drop 2,000 pound bombs]

		Statement_V2_Pass_1 speaker_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP speaker_np))
		} ;
		-- [CAUTIONED] <Speaker>[by the superintendent]

		Statement_V2_Pass_2 topic_np v2 = lin Clause {
			np = fromMaybe NP emptyNP topic_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Topic>[These sections] will be broken down and [EXPLAINED]

		--
		-- Storing
		--

		Storing_V2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[You] can [STORE] <Theme>[each vehicle]

		--
		-- Studying
		--

		Studying_V institution_adv student_np v = lin Clause {
			np = fromMaybe NP emptyNP student_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv institution_adv)
		} ;
		-- <Student>[He] also [STUDIED] <Institution>[in the atelier of M. G. C. Gleyre and at the Académie des Beaux-Arts]

		Studying_V2 student_np subject_np v2 = lin Clause {
			np = fromMaybe NP emptyNP student_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP subject_np)
		} ;
		-- <Student>[I] [STUDIED] <Subject>[homoeopathy]

		--
		-- Suasion
		--

		Suasion_V2S addressee_np content_s speaker_np v2s = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2s (fromMaybe NP emptyNP addressee_np) (fromMaybe S emptyS content_s)
		} ;
		-- <Speaker>[He] [PERSUADED] <Addressee>[himself] <Content>[that they helped him]

		Suasion_V2V addressee_np content_vp speaker_np v2v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP addressee_np) (fromMaybe VP emptyVP content_vp)
		} ;
		-- <Speaker>[she] could [CONVINCE] <Addressee>[him] <Content>[to stop looking at her that way]

		Suasion_V2_Pass_1 addressee_np content_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Addressee>[I] was [CONVINCED] <Content>[of your innocence]

		Suasion_V2_Pass_2 addressee_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP speaker_np))
		} ;
		-- <Addressee>[His aunt and uncle] promised to be witnesses , but were [DISSUADED] <Speaker>[by his mother]

		--
		-- Submitting_documents
		--

		Submitting_documents_V2 authority_adv documents_np submittor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP submittor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP documents_np)) (fromMaybe Adv emptyAdv authority_adv)
		} ;
		-- <Submittor>[Armstrong] [FILED] <Documents>[the master patent on FM] <Authority>[at the US Patent Office]

		--
		-- Success_or_failure
		--

		Success_or_failure_V agent_np goal_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[we] ca n't [SUCCEED] <Goal>[with our plan]

		Success_or_failure_VV agent_np goal_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP goal_vp)
		} ;
		-- <Agent>[The Government] have [FAILED] <Goal>[to tackle or prevent crime]

		Success_or_failure_V2_Pass agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Agent>[Your men] [FAILED]

		--
		-- Successful_action
		--

		Successful_action_V_1 instrument_np v = lin Clause {
			np = fromMaybe NP emptyNP instrument_np ;
			vp = mkVP v
		} ;
		-- <Instrument>[a unified incident management system] to [SUCCEED]

		Successful_action_V_2 means_np v = lin Clause {
			np = fromMaybe NP emptyNP means_np ;
			vp = mkVP v
		} ;
		-- <Means>[That] [DID THE TRICK]

		--
		-- Successfully_communicate_message
		--

		Successfully_communicate_message_V2 communicator_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Communicator>[he] could not [CONVEY] <Message>[how the style had evolved]

		--
		-- Sufficiency
		--

		Sufficiency_V enabled_situation_adv item_np v = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv enabled_situation_adv)
		} ;
		-- <Item>[No crude display] will [SUFFICE] <Enabled_situation>[to decoy them]

		--
		-- Supply
		--

		Supply_V2_1 recipient_np supplier_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP supplier_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP recipient_np)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Supplier>[they] [SUPPLIED] <Recipient>[us] <Theme>[with typewriters]

		Supply_V2_2 supplier_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP supplier_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Supplier>[Lotus] will [SUPPLY] <Theme>[the software]

		Supply_V2_Pass recipient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP recipient_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Recipient>[These raiders] maintained contact with their base by wireless , and were [SUPPLIED]

		--
		-- Supporting
		--

		Supporting_V2 supported_np supporter_np v2 = lin Clause {
			np = fromMaybe NP emptyNP supporter_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP supported_np)
		} ;
		-- <Supporter>[Locke] [BUTTRESSED] <Supported>[Tillotson 's position]

		Supporting_V2_Pass supported_np supporter_np v2 = lin Clause {
			np = fromMaybe NP emptyNP supported_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP supporter_np))
		} ;
		-- <Supported>[its mat roof] [SUPPORTED] <Supporter>[by stone columns]

		--
		-- Surrendering
		--

		Surrendering_V authorities_adv fugitive_np v = lin Clause {
			np = fromMaybe NP emptyNP fugitive_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv authorities_adv)
		} ;
		-- <Fugitive>[the Brits] [SURRENDER] <Authorities>[to the French]

		--
		-- Surrendering_possession
		--

		Surrendering_possession_V2 recipient_adv surrenderer_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP surrenderer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv recipient_adv)
		} ;
		-- <Surrenderer>[the many places] <Surrenderer>[which] [YIELDED] <Theme>[unwanted vehicles] <Recipient>[for the collection]

		--
		-- Suspicion
		--

		Suspicion_V2_Pass incident_adv suspect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP suspect_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv incident_adv)
		} ;
		-- <Suspect>[Mills] was [SUSPECTED] <Incident>[of having worked for the KGB]

		--
		-- Take_place_of
		--

		Take_place_of_V2 new_np old_np role_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP new_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP old_np)) (fromMaybe Adv emptyAdv role_adv)
		} ;
		-- <New>[One of his daughters , Jadwiga] , [SUCCEEDED] <Old>[Louis] <Role>[in Poland]

		Take_place_of_V2_Pass new_np old_np v2 = lin Clause {
			np = fromMaybe NP emptyNP old_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP new_np))
		} ;
		-- <Old>[the number of hydrogens] [SUBSTITUTED] <New>[by alkyl groups]

		--
		-- Taking
		--

		Taking_V2 agent_np source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Agent>[they] attempted to [SEIZE] <Theme>[explosives] <Source>[from a quarry]

		Taking_V2_Pass theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Theme>[The tapes] were [SEIZED]

		--
		-- Taking_sides
		--

		Taking_sides_V2_1 action_np cognizer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP action_np)
		} ;
		-- <Cognizer>[Indians] [OPPOSE] <Action>[Arctic drilling]

		Taking_sides_V2_2 cognizer_np issue_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP issue_np)
		} ;
		-- <Cognizer>[Others] <Cognizer>[who] [OPPOSED] <Issue>[the war in Vietnam]

		--
		-- Tasting
		--

		Tasting_V2 agent_np food_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP food_np)
		} ;
		-- <Agent>[i] try to uh you know [TRY] <Food>[something else you know something with a little more vegetables or something]

		--
		-- Telling
		--

		Telling_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[its own expert] to [ADVISE] <Topic>[on technical matters]

		Telling_V2 addressee_adv message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP message_np)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Speaker>[Sanders] [ADVISES] <Message>[caution] <Addressee>[for those considering using NT for long-term mission critical applications .]

		Telling_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[he] committed himself to [ASSURING] <Message>[that he would never be party to such a thing again if he could prevent it]

		--
		-- Temporary_stay
		--

		Temporary_stay_V_1 duration_adv guest_np location_adv v = lin Clause {
			np = fromMaybe NP emptyNP guest_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv duration_adv)) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Guest>[We] [STAYED] <Duration>[overnight] <Location>[in a motor camp in Picton]

		Temporary_stay_V_2 guest_np host_adv v = lin Clause {
			np = fromMaybe NP emptyNP guest_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv host_adv)
		} ;
		-- <Guest>[I] was [STAYING] <Host>[with a friend]

		Temporary_stay_V2_Pass guest_np v2 = lin Clause {
			np = fromMaybe NP emptyNP guest_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Guest>[One of the patients] [ROOMED]

		--
		-- Text_creation
		--

		Text_creation_V2 author_np text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP author_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP text_np)
		} ;
		-- <Author>[Mr MacAulay] had himself [AUTHORED] <Text>[the history of the island of St Kilda , which bore his name]

		Text_creation_VS author_np text_s vs = lin Clause {
			np = fromMaybe NP emptyNP author_np ;
			vp = mkVP vs (fromMaybe S emptyS text_s)
		} ;
		-- <Author>[the individuals and organizations that we contacted] [SAID] <Text>[that the agencies should move to a more standardized approach]

		Text_creation_V2_Pass text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP text_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Text>[the memorandum] was [TYPED]

		--
		-- Theft
		--

		Theft_V perpetrator_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Perpetrator>[the lads] used to go and [PINCH] <Source>[out of the girls ' bags]

		Theft_V2 goods_np perpetrator_np victim_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP goods_np)) (fromMaybe Adv emptyAdv victim_adv)
		} ;
		-- <Perpetrator>[Pally] will stick out a long leg and [NICK] <Goods>[the ball] <Victim>[off him]

		--
		-- Thriving
		--

		Thriving_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[tender shrubs] [FLOURISHING]

		Thriving_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[Industry and agriculture] [FLOURISHED]

		--
		-- Thwarting
		--

		Thwarting_V2_1 action_np preventing_cause_np v2 = lin Clause {
			np = fromMaybe NP emptyNP preventing_cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP action_np)
		} ;
		-- <Preventing_cause>[action] to [PREVENT] <Action>[crime]

		Thwarting_V2_2 preventing_cause_np protagonist_np v2 = lin Clause {
			np = fromMaybe NP emptyNP preventing_cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP protagonist_np)
		} ;
		-- <Preventing_cause>[she] unintentionally [THWARTS] <Protagonist>[me]

		Thwarting_V2_Pass protagonist_np v2 = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Protagonist>[they] were [FOILED]

		--
		-- Tolerating
		--

		Tolerating_V content_adv experiencer_np v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Experiencer>[Deng] would not [TOLERATE] <Content>[serious dissent]

		--
		-- Topic
		--

		Topic_V topic_np v = lin Clause {
			np = fromMaybe NP emptyNP topic_np ;
			vp = mkVP v
		} ;
		-- <Topic>[the topics] [DISCUSSED]

		Topic_V2_1 communicator_np topic_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP topic_np)
		} ;
		-- <Communicator>[no one] has yet [ADDRESSED] <Topic>[the relationship between topic and theme in topic-prominent languages]

		Topic_V2_2 text_np topic_np v2 = lin Clause {
			np = fromMaybe NP emptyNP text_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP topic_np)
		} ;
		-- <Text>[it] [TREATS] <Topic>[its important subject]

		--
		-- Travel
		--

		Travel_V_1 area_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- [TRAVELLED] <Area>[within Europe]

		Travel_V_2 goal_adv traveler_np v = lin Clause {
			np = fromMaybe NP emptyNP traveler_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Traveler>[We] will [JOURNEY] <Goal>[onto other worlds]

		Travel_V_3 mode_of_transportation_adv path_adv traveler_np v = lin Clause {
			np = fromMaybe NP emptyNP traveler_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv mode_of_transportation_adv)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Traveler>[he] [COMMUTES] <Mode_of_transportation>[by train] <Path>[between Westminster and the railway-rooted constituency]

		--
		-- Traversing
		--

		Traversing_V path_adv source_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[Its ancestors] [CROSSED] <Source>[from mainland Asia] <Path>[on a long-vanished land bridge]

		Traversing_V2 path_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP path_np)
		} ;
		-- <Theme>[The idea] [CIRCLED] <Path>[round Barbara 's mind]

		--
		-- Trying_out
		--

		Trying_out_V2 entity_np evaluator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP evaluator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Evaluator>[they] [TRY] <Entity>[new things]

		--
		-- Unattributed_information
		--

		Unattributed_information_VS_Pass reported_fact_s vs = lin Clause {
			np = emptyNP ;
			vp = mkVP vs (fromMaybe S emptyS reported_fact_s)
		} ;
		-- [RUMOURED] <Reported_fact>[that the relationship had at times been stormy]

		--
		-- Undergo_change
		--

		Undergo_change_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[the weather] [VEERED]

		--
		-- Undergoing
		--

		Undergoing_V2 entity_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Entity>[All volunteers] [UNDERWENT] <Event>[manometry]

		--
		-- Undressing
		--

		Undressing_V2 clothing_np wearer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP wearer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP clothing_np)
		} ;
		-- <Wearer>[She] [SHED] <Clothing>[her clothes]

		--
		-- Use_firearm
		--

		Use_firearm_V2 agent_np firearm_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP firearm_np)
		} ;
		-- <Agent>[he] [DISCHARGED] <Firearm>[his second barrel]

		--
		-- Using
		--

		Using_V2 agent_np instrument_np purpose_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP instrument_np)) (fromMaybe Adv emptyAdv purpose_adv)
		} ;
		-- <Agent>[the male authority] <Agent>[who] should then [UTILIZE] <Instrument>[it] <Purpose>[solely for his own benefit]

		Using_V2_Pass instrument_np v2 = lin Clause {
			np = fromMaybe NP emptyNP instrument_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Instrument>[Treatment regimens which included ciprofloxacin and amikacin] were [USED]

		--
		-- Verdict
		--

		Verdict_V2 defendant_np finding_adv judge_np v2 = lin Clause {
			np = fromMaybe NP emptyNP judge_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP defendant_np)) (fromMaybe Adv emptyAdv finding_adv)
		} ;
		-- <Judge>[The jury] returned within minutes , [FINDING] <Defendant>[both men] <Finding>[guilty]

		--
		-- Verification
		--

		Verification_V2 inspector_np medium_adv unconfirmed_content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP inspector_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP unconfirmed_content_np)) (fromMaybe Adv emptyAdv medium_adv)
		} ;
		-- <Inspector>[Ayer] [IDENTIFIES] <Medium>[here] <Unconfirmed_content>[an error made by some philosophers]

		Verification_VS inspector_np unconfirmed_content_s vs = lin Clause {
			np = fromMaybe NP emptyNP inspector_np ;
			vp = mkVP vs (fromMaybe S emptyS unconfirmed_content_s)
		} ;
		-- <Inspector>[The Bank] [IDENTIFIED] <Unconfirmed_content>[that these studies were not completed]

		--
		-- Visiting
		--

		Visiting_V2 agent_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Agent>[they] returned to [VISIT] <Entity>[relatives]

		--
		-- Wagering
		--

		Wagering_VS gambler_np outcome_s vs = lin Clause {
			np = fromMaybe NP emptyNP gambler_np ;
			vp = mkVP vs (fromMaybe S emptyS outcome_s)
		} ;
		-- <Gambler>[I] 'd [WAGER] <Outcome>['t is of no importance to Prince Edward either]

		--
		-- Waiting
		--

		Waiting_V protagonist_np salient_entity_adv v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv salient_entity_adv)
		} ;
		-- <Protagonist>[She] [WAITED] <Salient_entity>[for a response]

		--
		-- Waking_up
		--

		Waking_up_V sleep_state_adv sleeper_np v = lin Clause {
			np = fromMaybe NP emptyNP sleeper_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv sleep_state_adv)
		} ;
		-- <Sleeper>[Tug] [WOKE] , <Sleep_state>[out of a nightmare of falling , of rushing water and ground that slipped away beneath his feet]

		--
		-- Waver_between_options
		--

		Waver_between_options_V_1 cognizer_np issue_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv issue_adv)
		} ;
		-- <Cognizer>[the UN] [VACILLATES] <Issue>[over what to do with Forand 's refugees]

		Waver_between_options_V_2 cognizer_np options_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv options_adv)
		} ;
		-- <Cognizer>[Germany] is [WAVERING] <Options>[between East and West]

		--
		-- Wearing
		--

		Wearing_V2 clothing_np wearer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP wearer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP clothing_np)
		} ;
		-- <Wearer>[lorry driver] [SPORTING] <Clothing>[gold neck chains]

		--
		-- Win_prize
		--

		Win_prize_V2 competitor_np prize_np v2 = lin Clause {
			np = fromMaybe NP emptyNP competitor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP prize_np)
		} ;
		-- <Competitor>[they] have [WON] <Prize>[awards]

		--
		-- Withdraw_from_participation
		--

		Withdraw_from_participation_V participant_np v = lin Clause {
			np = fromMaybe NP emptyNP participant_np ;
			vp = mkVP v
		} ;
		-- <Participant>[Eight opposition candidates] [WITHDREW]

}
