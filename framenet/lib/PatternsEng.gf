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
		-- <Agent>[The council] [ABANDONED] <Theme>[its plans to widen the highway]

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
		-- <Location>[a desert] [SWARMING] <Theme>[with snakes]

		--
		-- Absorb_heat
		--

		Absorb_heat_V entity_np heat_source_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv heat_source_adv)
		} ;
		-- <Entity>[the spit] [SIZZLED] <Heat_source>[on the iron]

		--
		-- Abusing
		--

		Abusing_V2 abuser_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP abuser_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Abuser>[They] [ABUSE] <Victim>[us]

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
		-- <Goal>[Much] was [ACCOMPLISHED]

		--
		-- Achieving_first
		--

		Achieving_first_V2 cognizer_np new_idea_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP new_idea_np)
		} ;
		-- <Cognizer>[the APU] has [PIONEERED] <New_idea>[new testing methods]

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
		-- <Agent>[you] [FINISH] <Activity>[it]

		--
		-- Activity_ongoing
		--

		Activity_ongoing_VV activity_vp agent_np vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP activity_vp)
		} ;
		-- <Agent>[they] [CONTINUE] <Activity>[searching]

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
		-- <Agent>[Jackson] was [PREPARING] <Activity>[for the first of two concerts in Bangkok]

		--
		-- Activity_resume
		--

		Activity_resume_V2 activity_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Agent>[The fat woman] [RESUMED] <Activity>[the journey]

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
		-- [ENTER] <Activity>[into negotiations]

		Activity_start_V2 activity_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP activity_np)
		} ;
		-- <Agent>[Kawasaki] [BEGAN] <Activity>[operations in their US plant at Nebraska]

		Activity_start_VV activity_vp agent_np vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP activity_vp)
		} ;
		-- <Agent>[Robbie] [BEGAN] <Activity>[preparing a meal]

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
		-- <Agent>[Soap] [CEASED] <Activity>[his fantastic monologue]

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
		-- <Speaker>[The respondent] may also [ADDUCE] <Specified_entity>[argument]

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
		-- <Agent>[The ambulance man] [ADJUSTS] <Feature>[the flow of oxygen into the mask]

		Adjusting_V2_2 agent_np part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP part_np)
		} ;
		-- <Agent>[He] [ADJUSTED] <Part>[his earphones]

		Adjusting_V2_Pass part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP part_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Part>[The solution] was [ADJUSTED]

		--
		-- Adopt_selection
		--

		Adopt_selection_V2 agent_np value_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP value_np)
		} ;
		-- <Agent>[you] to [ADOPT] <Value>[this perspective]

		Adopt_selection_V2_Pass value_np v2 = lin Clause {
			np = fromMaybe NP emptyNP value_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Value>[The cruciform plan] was [ADOPTED]

		--
		-- Aging
		--

		Aging_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[she] had [AGED]

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
		-- <Speaker>[He] [REFUSED] <Proposed_action>[to send his horses to be shod at our smithy]

		--
		-- Agriculture
		--

		Agriculture_V2 agriculturist_np ground_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agriculturist_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ground_np)
		} ;
		-- <Agriculturist>[I] stay and [FARM] <Ground>[the land]

		--
		-- Aiming
		--

		Aiming_V2 agent_np instrument_np targeted_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP instrument_np)) (fromMaybe Adv emptyAdv targeted_adv)
		} ;
		-- <Agent>[I] 'm [AIMING] <Instrument>[a gun] <Targeted>[at you]

		--
		-- Amassing
		--

		Amassing_V2 mass_theme_np recipient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP recipient_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP mass_theme_np)
		} ;
		-- <Recipient>[he] [AMASSED] <Mass_theme>[a large fortune]

		--
		-- Amounting_to
		--

		Amounting_to_V attribute_np value_adv v = lin Clause {
			np = fromMaybe NP emptyNP attribute_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv value_adv)
		} ;
		-- <Attribute>[profit] [AMOUNTING] <Value>[to £3,691]

		--
		-- Apply_heat
		--

		Apply_heat_V2_1 container_adv food_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP food_np)) (fromMaybe Adv emptyAdv container_adv)
		} ;
		-- [FRY] <Food>[the pork] <Container>[in the pan]

		Apply_heat_V2_2 cook_np food_np heating_instrument_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP cook_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP food_np)) (fromMaybe Adv emptyAdv heating_instrument_adv)
		} ;
		-- <Cook>[Mother] and I [COOK] <Food>[all these things] <Heating_instrument>[on our barbecue]

		Apply_heat_V2_Pass food_np v2 = lin Clause {
			np = fromMaybe NP emptyNP food_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Food>[McDonald 's French Fries and Hash Browns] are [COOKED]

		--
		-- Appointing
		--

		Appointing_V2_Pass official_np role_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP official_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv role_adv)
		} ;
		-- <Official>[You] 've just been [APPOINTED] <Role>[as a care assistant]

		--
		-- Arranging
		--

		Arranging_V2 agent_np configuration_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv configuration_adv)
		} ;
		-- <Agent>[They] [ARRANGE] <Theme>[them] <Configuration>[in series]

		--
		-- Arriving
		--

		Arriving_V goal_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[I] [CAME] <Goal>[back]

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
		-- <Assessor>[a district nurse] should visit , [ASSESS] <Phenomenon>[the wound]

		Assessing_V2_Pass assessor_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP assessor_np))
		} ;
		-- <Phenomenon>[all of these cases] are [ASSESSED] <Assessor>[by a Consultant Obstetrician]

		--
		-- Assistance
		--

		Assistance_V2 benefited_party_np focal_entity_adv helper_np v2 = lin Clause {
			np = fromMaybe NP emptyNP helper_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP benefited_party_np)) (fromMaybe Adv emptyAdv focal_entity_adv)
		} ;
		-- <Helper>[you] will [ASSIST] <Benefited_party>[Monsieur Boris] <Focal_entity>[in the preparations for the ball on Saturday]

		Assistance_V2V benefited_party_np goal_vp helper_np v2v = lin Clause {
			np = fromMaybe NP emptyNP helper_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP benefited_party_np) (fromMaybe VP emptyVP goal_vp)
		} ;
		-- <Helper>[I] [HELPED] <Benefited_party>[my dad] <Goal>[clear up the house]

		--
		-- Atonement
		--

		Atonement_V2 agent_np wrong_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP wrong_np)
		} ;
		-- <Agent>[she] had to [EXPIATE] <Wrong>[her failure]

		--
		-- Attaching
		--

		Attaching_V2_1 agent_np goal_adv item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP item_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[I] [FIX] <Item>[a gate post] <Goal>[to a wall]

		Attaching_V2_2 agent_np items_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP items_np)
		} ;
		-- <Agent>[I] 've spent years reconstructing , integrating , analysing and just plain digging through mud ; cataloguing alien ruins square centimetre by square centimetre and [STICKING] <Items>[the pieces of damaged artifacts]

		Attaching_V2_3 connector_adv goal_adv item_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP (mkVP v2 (fromMaybe NP emptyNP item_np)) (fromMaybe Adv emptyAdv goal_adv)) (fromMaybe Adv emptyAdv connector_adv)
		} ;
		-- [FIX] <Item>[rails] <Goal>[in place] <Connector>[with screws sunk below the surface of the wood]

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
		-- <Assailant>[Rioters] [ATTACKED] <Victim>[one man]

		--
		-- Attempt
		--

		Attempt_V agent_np goal_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[the sepoy] [TRIED] discreetly <Goal>[to shoo her away]

		Attempt_VV agent_np goal_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP goal_vp)
		} ;
		-- <Agent>[he] 'd [TRY] <Goal>[to outdo me]

		--
		-- Avoiding
		--

		Avoiding_V2 agent_np undesirable_situation_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undesirable_situation_np)
		} ;
		-- <Agent>[we] [AVOID] <Undesirable_situation>[that bit of road]

		Avoiding_VV agent_np undesirable_situation_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP undesirable_situation_vp)
		} ;
		-- <Agent>[them] to [AVOID] <Undesirable_situation>[committing themselves]

		--
		-- Awareness
		--

		Awareness_V cognizer_np content_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Cognizer>[we] [KNOW] <Content>[of each other , you and I]

		Awareness_V2 cognizer_np content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Cognizer>[you] [KNOW] <Content>[it]

		Awareness_VS cognizer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Cognizer>[we] [KNOW] <Content>[you do]

		Awareness_VV cognizer_np content_vp vv = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP content_vp)
		} ;
		-- <Cognizer>[I] kept [IMAGINING] <Content>[coming up to London to see you]

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
		-- <Winner>[He] wo n't [BEAT] <Loser>[me]

		--
		-- Become_silent
		--

		Become_silent_V speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v
		} ;
		-- <Speaker>[The bar] [QUIETENED]

		--
		-- Becoming
		--

		Becoming_V entity_np final_state_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv final_state_adv)
		} ;
		-- <Entity>[Lizzie] [BECAME] <Final_state>[visible]

		--
		-- Becoming_a_member
		--

		Becoming_a_member_V group_adv new_member_np v = lin Clause {
			np = fromMaybe NP emptyNP new_member_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv group_adv)
		} ;
		-- <New_member>[they] needed all this money to [JOIN] up <Group>[with Scientology]

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
		-- <Cognizer>[We] [SPOTTED] <Phenomenon>[you]

		Becoming_aware_VQ cognizer_np phenomenon_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS phenomenon_qs)
		} ;
		-- <Cognizer>[You] [SPOT] <Phenomenon>[what season of the year is appropriate]

		Becoming_aware_VS phenomenon_s vs = lin Clause {
			np = emptyNP ;
			vp = mkVP vs (fromMaybe S emptyS phenomenon_s)
		} ;
		-- [SPOTS] <Phenomenon>[that there are no tin roofs]

		--
		-- Becoming_dry
		--

		Becoming_dry_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[he] 's [DRYING]

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

		Behind_the_scenes_V2 artist_np production_np v2 = lin Clause {
			np = fromMaybe NP emptyNP artist_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP production_np)
		} ;
		-- <Artist>[he] was [FILMING] <Production>[The Girl in Black]

		--
		-- Being_attached
		--

		Being_attached_V goal_adv item_np v = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Item>[the mud] will [STICK] <Goal>[to me]

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
		-- <Employee>[we] [WORKED] <Place_of_employment>[abroad]

		--
		-- Being_located
		--

		Being_located_V location_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Theme>[the kettle] [SAT] <Location>[on the hob]

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

		--
		-- Bragging
		--

		Bragging_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[we] do n't [BOAST] <Topic>[about it]

		--
		-- Breathing
		--

		Breathing_V2 agent_np air_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP air_np)
		} ;
		-- <Agent>[he] [BREATHED] <Air>[his last]

		Breathing_V2_Pass air_np v2 = lin Clause {
			np = fromMaybe NP emptyNP air_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Air>[some life] might be [BREATHED]

		--
		-- Bringing
		--

		Bringing_V2_1 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[they] [BROUGHT] <Theme>[iced drinks]

		Bringing_V2_2 carrier_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP carrier_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Carrier>[car 4] spent the First World War [FERRYING] <Theme>[bread] <Goal>[to the military camp at Squires Gate]

		--
		-- Building
		--

		Building_V2_1 agent_np components_adv created_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP created_entity_np)) (fromMaybe Adv emptyAdv components_adv)
		} ;
		-- <Agent>[We] [BUILT] <Created_entity>[rockets] <Components>[from nothing]

		Building_V2_2 agent_np components_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP components_np)
		} ;
		-- <Agent>[one] can often [GLUE] <Components>[a broken vase]

		--
		-- Bungling
		--

		Bungling_V agent_np v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v
		} ;
		-- <Agent>[I] [SCREW] [up]

		Bungling_V2_Pass patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP patient_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Patient>[His uniform] would be [RUINED]

		--
		-- Carry_goods
		--

		Carry_goods_V2 distributor_np goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP distributor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Distributor>[I] did n't [STOCK] <Goods>[those]

		--
		-- Catastrophe
		--

		Catastrophe_V undergoer_np undesirable_event_adv v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv undesirable_event_adv)
		} ;
		-- <Undergoer>[the piano] [SUFFERED] <Undesirable_Event>[from being too low in the sound-mix]

		Catastrophe_V2 undergoer_np undesirable_event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undesirable_event_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Undesirable_Event>[anything] should [BEFALL] <Undergoer>[myself]

		--
		-- Categorization
		--

		Categorization_V2_Pass criteria_adv item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv criteria_adv)
		} ;
		-- <Item>[Books and files] are [CLASSIFIED] <Criteria>[by subject]

		--
		-- Causation
		--

		Causation_V2_1 actor_np affected_adv effect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP actor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP effect_np)) (fromMaybe Adv emptyAdv affected_adv)
		} ;
		-- <Actor>[Maggie] , it quickly emerged , [INDUCED] <Effect>[a turning of mood] <Affected>[in the rest of them]

		Causation_V2_2 actor_np affected_np effect_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP actor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP affected_np)) (fromMaybe Adv emptyAdv effect_adv)
		} ;
		-- <Actor>[They] [MAKE] <Affected>[me] <Effect>[sick]

		Causation_V2_3 cause_np effect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP effect_np)
		} ;
		-- <Cause>[What] had [CAUSED] <Effect>[the change]

		Causation_V2V affected_np cause_np effect_vp v2v = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP affected_np) (fromMaybe VP emptyVP effect_vp)
		} ;
		-- <Cause>[It] [MADE] <Affected>[her] <Effect>[feel happy]

		--
		-- Cause_change
		--

		Cause_change_V2_1 agent_np entity_np final_category_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP entity_np)) (fromMaybe Adv emptyAdv final_category_adv)
		} ;
		-- <Agent>[We] will [TRANSFORM] <Entity>[that sorrow] <Final_category>[into strength]

		Cause_change_V2_2 cause_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Cause>[Some of them] [MODIFY] <Entity>[mental as well as bodily functions]

		Cause_change_V2_Pass entity_np final_category_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv final_category_adv)
		} ;
		-- <Entity>[Women] are [TRANSFORMED] <Final_category>[into a single constituency]

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
		-- <Undergoer>[all] [THICKENED]

		--
		-- Cause_change_of_phase
		--

		Cause_change_of_phase_V2 agent_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Agent>[She] [MELTED] <Undergoer>[another lump of butter]

		Cause_change_of_phase_V2_Pass undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Undergoer>[The wax] is [MELTED]

		--
		-- Cause_change_of_strength
		--

		Cause_change_of_strength_V2_1 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[her kinsmen] [FORTIFIED] <Patient>[their castles]

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
		-- <Agent>[He] has [INSULTED] <Experiencer>[me]

		Cause_emotion_V2_Pass experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Experiencer>[he] [INSULTED]

		--
		-- Cause_fluidic_motion
		--

		Cause_fluidic_motion_V2 agent_np fluid_np goal_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP fluid_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[The priest] took the basin of blood and [SPATTERED] <Fluid>[it] <Goal>[against the altar]

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
		-- <Agent>[He] [PUNCHED] <Victim>[me] <Body_part>[in the eye]

		Cause_harm_V2_Pass agent_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP victim_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP agent_np))
		} ;
		-- <Victim>[he] was kicked and [PUNCHED] <Agent>[by four people]

		--
		-- Cause_impact
		--

		Cause_impact_V agent_np impactee_adv impactor_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv impactor_adv)) (fromMaybe Adv emptyAdv impactee_adv)
		} ;
		-- <Agent>[Charlotte] [RAPPED] <Impactor>[on the window] <Impactee>[with her knuckles]

		Cause_impact_V2_1 agent_np impactee_adv impactor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP impactor_np)) (fromMaybe Adv emptyAdv impactee_adv)
		} ;
		-- <Agent>[some prisoners] sang and [RATTLED] <Impactor>[their tin mugs] <Impactee>[against the bars]

		Cause_impact_V2_2 agent_np impactee_np impactor_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP impactee_np)) (fromMaybe Adv emptyAdv impactor_adv)
		} ;
		-- <Agent>[Maxim] [SLAMMED] <Impactee>[the steering wheel] <Impactor>[with both hands]

		Cause_impact_V2_3 agent_np impactors_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP impactors_np)
		} ;
		-- <Agent>[He] [RATTLED] <Impactors>[the keys]

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
		-- <Theme>[the chairs] [PUSHED]

		Cause_motion_V2_1 agent_np area_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Agent>[Randhawa] [THROWING] <Theme>[the stolen jewellery] <Area>[around the kitchen]

		Cause_motion_V2_2 agent_np goal_adv source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[Lucie] [THREW] <Theme>[him] <Source>[from the parapet of a bridge] <Goal>[into deep water]

		Cause_motion_V2_3 agent_np path_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Agent>[she] [THREW] <Theme>[her pencil] <Path>[across the room]

		Cause_motion_V2_4 cause_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Cause>[The street light] [THREW] <Theme>[strange shadows] <Goal>[among the hoardings]

		Cause_motion_V3 agent_np theme_np v3 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v3 (fromMaybe NP emptyNP theme_np) emptyNP
		} ;
		-- <Agent>[Tommy] had [THRUST] <Theme>[a bayonet]

		Cause_motion_V2_Pass theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Theme>[The living turtle] is then [THROWN]

		--
		-- Cause_to_amalgamate
		--

		Cause_to_amalgamate_V2_1 agent_np part_1_np part_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP part_1_np)) (fromMaybe Adv emptyAdv part_2_adv)
		} ;
		-- <Agent>[one] [COMBINED] <Part_1>[farming] <Part_2>[with tourism]

		Cause_to_amalgamate_V2_2 agent_np parts_np whole_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP parts_np)) (fromMaybe Adv emptyAdv whole_adv)
		} ;
		-- <Agent>[the Minoans] always tended to [COMBINE] <Parts>[their goddesses] <Whole>[into a single deity]

		--
		-- Cause_to_be_dry
		--

		Cause_to_be_dry_V2_1 agent_np dryee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP dryee_np)
		} ;
		-- <Agent>[She] [DRIED] <Dryee>[herself]

		Cause_to_be_dry_V2_2 cause_np dryee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP dryee_np)
		} ;
		-- <Cause>[the sun] [DRIES] <Dryee>[the tent]

		Cause_to_be_dry_V2_Pass dryee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP dryee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Dryee>[the frisbee] had to be [DRIED]

		--
		-- Cause_to_be_included
		--

		Cause_to_be_included_V2 agent_np new_member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP new_member_np)
		} ;
		-- <Agent>[they] do n't [ADD] <New_member>[anything]

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
		-- <Agent>[Frankie] had scrubbed his hands and feet and [DAMPENED] <Undergoer>[his hair] <Liquid>[with water]

		Cause_to_be_wet_V2_Pass liquid_adv undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv liquid_adv)
		} ;
		-- <Undergoer>[the rock] was [DOUSED] <Liquid>[with cold water]

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
		-- <Agent>[They] 'll [BREAK] <Whole_patient>[the glass]

		--
		-- Cause_to_make_noise
		--

		Cause_to_make_noise_V2 agent_np sound_maker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sound_maker_np)
		} ;
		-- <Agent>[he] [TOOTED] <Sound_maker>[his car horn]

		--
		-- Cause_to_make_progress
		--

		Cause_to_make_progress_V2 agent_np project_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP project_np)
		} ;
		-- <Agent>[Ward] [DEVELOPED] <Project>[one of his own]

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
		-- <Agent>[Blunt] [ROTATE] <Theme>[his head]

		Cause_to_move_in_place_V2_Pass theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Theme>[the sails] could be [ROTATED]

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
		-- <Cause>[publicity] to [GENERATE] <Effect>[interest]

		Cause_to_start_V2_Pass cause_np effect_np v2 = lin Clause {
			np = fromMaybe NP emptyNP effect_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP cause_np))
		} ;
		-- <Effect>[the excitement] [GENERATED] <Cause>[by this debate]

		--
		-- Cause_to_wake
		--

		Cause_to_wake_V2_1 agent_np sleeper_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sleeper_np)
		} ;
		-- <Agent>[I] 'll [WAKE] <Sleeper>[you]

		Cause_to_wake_V2_2 cause_np sleeper_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sleeper_np)
		} ;
		-- <Cause>[My watch alarm] [WOKE] <Sleeper>[us]

		--
		-- Ceasing_to_be
		--

		Ceasing_to_be_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[The symptoms] [DISAPPEARED]

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
		-- <Cognizer>[I] [DOUBT] <Content>[she actually noticed]

		--
		-- Change_direction
		--

		Change_direction_V direction_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Theme>[the plane] [VEERED] <Direction>[sharply to the right]

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

		Change_event_time_V agent_np event_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv event_adv)
		} ;
		-- <Agent>[people] [DELAYED] <Event>[before going out into the rain]

		Change_event_time_V2 cause_np event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Cause>[what] was [DELAYING] <Event>[the arrival of his wife]

		Change_event_time_V2_Pass event_np v2 = lin Clause {
			np = fromMaybe NP emptyNP event_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Event>[the kick-off] [DELAYED]

		--
		-- Change_of_consistency
		--

		Change_of_consistency_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[the skin] [HARDENS]

		--
		-- Change_of_phase
		--

		Change_of_phase_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[butter] [MELTED]

		--
		-- Change_operational_state
		--

		Change_operational_state_V2_1 agent_np device_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP device_np)
		} ;
		-- <Agent>[we] [ACTIVATE] <Device>[the circuit]

		Change_operational_state_V2_2 cause_np device_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP device_np)
		} ;
		-- <Cause>[the accumulation of calcium] [ACTIVATES] <Device>[the negative feedback component]

		--
		-- Change_position_on_a_scale
		--

		Change_position_on_a_scale_V_1 attribute_np v = lin Clause {
			np = fromMaybe NP emptyNP attribute_np ;
			vp = mkVP v
		} ;
		-- <Attribute>[House prices] have [FALLEN]

		Change_position_on_a_scale_V_2 item_np v = lin Clause {
			np = fromMaybe NP emptyNP item_np ;
			vp = mkVP v
		} ;
		-- <Item>[the Tory vote] has [FALLEN]

		--
		-- Change_posture
		--

		Change_posture_V protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP v
		} ;
		-- <Protagonist>[Sam] [LEANT]

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
		-- <Interlocutor_1>[The Queen] paused briefly to [CHAT] <Interlocutor_2>[with children from the base]

		Chatting_V_2 interlocutors_np v = lin Clause {
			np = fromMaybe NP emptyNP interlocutors_np ;
			vp = mkVP v
		} ;
		-- <Interlocutors>[we] [CHATTED]

		--
		-- Choosing
		--

		Choosing_V2 chosen_np cognizer_np possibilities_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP chosen_np)) (fromMaybe Adv emptyAdv possibilities_adv)
		} ;
		-- <Cognizer>[you] [PICK] <Chosen>[one] <Possibilities>[of the big pawpaws]

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
		-- <Agent>[Laura] was just [FASTENING] <Container_portal>[the last button]

		Closure_V2_2 agent_np containing_object_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP containing_object_np)
		} ;
		-- <Agent>[Sara] [FASTENED] <Containing_object>[her bra]

		Closure_V2_Pass containing_object_np v2 = lin Clause {
			np = fromMaybe NP emptyNP containing_object_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Containing_object>[his gloves] [LACED]

		--
		-- Cogitation
		--

		Cogitation_V cognizer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Cognizer>[she] [PONDERED] <Topic>[on her good fortune]

		Cogitation_VQ cognizer_np topic_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS topic_qs)
		} ;
		-- <Cognizer>[Control] [PONDERED] <Topic>[what to do]

		Cogitation_VS cognizer_np topic_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS topic_s)
		} ;
		-- <Cognizer>[the Act] apparently [CONTEMPLATES] <Topic>[that one may be produced from the other]

		--
		-- Collaboration
		--

		Collaboration_V_1 partner_1_np partner_2_adv undertaking_adv v = lin Clause {
			np = fromMaybe NP emptyNP partner_1_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv partner_2_adv)) (fromMaybe Adv emptyAdv undertaking_adv)
		} ;
		-- <Partner_1>[we] should [CONSPIRE] <Partner_2>[with the enemy] <Undertaking>[against our emperor]

		Collaboration_V_2 partners_np undertaking_adv v = lin Clause {
			np = fromMaybe NP emptyNP partners_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv undertaking_adv)
		} ;
		-- <Partners>[the working class] [CONSPIRED] <Undertaking>[against him]

		--
		-- Come_together
		--

		Come_together_V party_1_np party_2_adv v = lin Clause {
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
		-- <Entity>[illness] [DEVELOPS]

		--
		-- Coming_to_believe
		--

		Coming_to_believe_V2 content_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- [LEARNING] <Content>[a language]

		Coming_to_believe_VS cognizer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Cognizer>[I] soon [LEARNT] <Content>[that her name was Sophie]

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
		-- <Cognizer>[Who on earth] [DESIGNS] <Idea>[them]

		Coming_up_with_V2_Pass idea_np v2 = lin Clause {
			np = fromMaybe NP emptyNP idea_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Idea>[the world] was not [DESIGNED]

		--
		-- Commerce_buy
		--

		Commerce_buy_V2 buyer_np goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP buyer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Buyer>[he] [BOUGHT] <Goods>[a ticket]

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
		-- <Seller>[Renoir] even [SOLD] <Goods>[two canvases] <Buyer>[to Zborowski]

		Commerce_sell_V2_Pass goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Goods>[the rugs] being [SOLD]

		--
		-- Commitment
		--

		Commitment_V message_adv speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv message_adv)
		} ;
		-- <Speaker>[vote-hungry Mr Clinton] [PROMISED] <Message>[to side with California]

		Commitment_VS addressee_adv message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP vs (fromMaybe S emptyS message_s)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Speaker>[I] [SWEAR] <Addressee>[to you] <Message>[this is ending]

		Commitment_VV message_vp speaker_np vv = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vv (fromMaybe VP emptyVP message_vp)
		} ;
		-- <Speaker>[he] [PROMISED] <Message>[to marry you]

		--
		-- Committing_crime
		--

		Committing_crime_V2_Pass crime_np v2 = lin Clause {
			np = fromMaybe NP emptyNP crime_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Crime>[a crime] had been [COMMITTED]

		--
		-- Communication
		--

		Communication_V2 communicator_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Communicator>[art] to [COMMUNICATE] <Message>[what the artist has felt]

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
		-- <Speaker>[she] was still [SHOUTING] <Topic>[about killing him]

		Communication_manner_V2 message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Speaker>[Daak] was [SHOUTING] <Message>[curses]

		--
		-- Communication_means
		--

		Communication_means_V addressee_adv communicator_np v = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- <Communicator>[I] at once [TELEGRAPHED] <Addressee>[to Churchill]

		Communication_means_V2 addressee_adv message_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP message_np)) (fromMaybe Adv emptyAdv addressee_adv)
		} ;
		-- [TELEGRAPHED] <Message>[the request] personally <Addressee>[to the Tsar]

		--
		-- Communication_noise
		--

		Communication_noise_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[him] [SCREAMING] <Message>[he 'd kill her]

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
		-- <Speaker>[He] [ANSWERED] <Message>[that he had gone too far now and that the Country expected a dissolution]

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
		-- <Item_1>[it] [CLASHED] <Item_2>[with News at Ten]

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
		-- <Complainer>[He] [COMPLAINED] <Complaint>[of increasing abdominal discomfort]

		Complaining_V_2 complainer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP complainer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Complainer>[it] [COMPLAINS] <Topic>[about the success of Japanese business]

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
		-- <Protagonist>[he] had [VIOLATED] <Norm>[the law]

		--
		-- Conduct
		--

		Conduct_V agent_np manner_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv manner_adv)
		} ;
		-- <Agent>[We] must [ACT] <Manner>[responsibly]

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

		Contacting_V2 addressee_np communicator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP addressee_np)
		} ;
		-- <Communicator>[He] [PHONED] <Addressee>[me]

		--
		-- Containing
		--

		Containing_V2 container_np contents_np v2 = lin Clause {
			np = fromMaybe NP emptyNP container_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP contents_np)
		} ;
		-- <Container>[This] [HOUSED] <Contents>[oriental manuscripts]

		--
		-- Contingency
		--

		Contingency_V determinant_adv outcome_np v = lin Clause {
			np = fromMaybe NP emptyNP outcome_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv determinant_adv)
		} ;
		-- <Outcome>[his life] [DEPENDED] <Determinant>[on it]

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

		Convey_importance_V2_1 medium_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Medium>[The two tunes] [UNDERLINE] <Message>[the conflict between good and evil]

		Convey_importance_V2_2 message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Speaker>[Makhoul] [UNDERLINES] <Message>[this]

		Convey_importance_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[The adviser] [STRESSED] <Message>[that it needed to be a constructive exercise]

		Convey_importance_V2_Pass medium_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP message_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP medium_np))
		} ;
		-- <Message>[The backbenchers ' unrest] was [UNDERLINED] <Medium>[by the rousing ovation they gave to Chancellor Nor-man Lamont at a private meeting yesterday]

		--
		-- Cooking_creation
		--

		Cooking_creation_V2 cook_np produced_food_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cook_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP produced_food_np)
		} ;
		-- <Cook>[I] had [COOKED] <Produced_food>[her supper]

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
		-- <Undergoer>[the barbed wire] [RUSTS]

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
		-- <Theme>[I] [FOLLOW] <Cotheme>[his gaze] <Goal>[to a landscape like a sheet of cartridge paper]

		Cotheme_V2_3 cotheme_np path_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP cotheme_np)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[He] [FOLLOWED] <Cotheme>[her] <Path>[across the landing]

		Cotheme_V2_4 cotheme_np source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP cotheme_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Theme>[Eleanor] repeated mechanically and [FOLLOWED] <Cotheme>[Melissa] <Source>[from the church]

		Cotheme_V2_Pass cotheme_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cotheme_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP theme_np))
		} ;
		-- <Cotheme>[She] then arrived at Zaidie 's house [FOLLOWED] <Theme>[by the defendant]

		--
		-- Create_physical_artwork
		--

		Create_physical_artwork_V2 creator_np representation_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP representation_np)
		} ;
		-- <Creator>[Modigliani] [PAINTED] <Representation>[his wedding portrait]

		--
		-- Create_representation
		--

		Create_representation_V2 creator_np represented_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP represented_np)
		} ;
		-- <Creator>[I] [PHOTOGRAPHED] <Represented>[the cow]

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
		-- <Cause>[a chemical buffer] to [CREATE] <Created_entity>[alkaline conditions]

		Creating_V2_2 created_entity_np creator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP created_entity_np)
		} ;
		-- <Creator>[God] [CREATED] <Created_entity>[this world]

		--
		-- Criminal_investigation
		--

		Criminal_investigation_V2 incident_np investigator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP investigator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP incident_np)
		} ;
		-- <Investigator>[Officers] [INVESTIGATING] <Incident>[the murder]

		--
		-- Cutting
		--

		Cutting_V2 agent_np item_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP item_np)
		} ;
		-- <Agent>[Sara] did not [CHOP] <Item>[parsley]

		--
		-- Damaging
		--

		Damaging_V2 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[Dougal 's fingers] tightened involuntarily , [DENTING] <Patient>[the cigarette]

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
		-- <Agent>[You] [DARE] <Action>[say thus]

		--
		-- Death
		--

		Death_V protagonist_np v = lin Clause {
			np = fromMaybe NP emptyNP protagonist_np ;
			vp = mkVP v
		} ;
		-- <Protagonist>[he] [DROWNS]

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
		-- <Theme>[me] [DEPART] <Source>[your presence]

		--
		-- Deserving
		--

		Deserving_V2 action_np state_of_affairs_np v2 = lin Clause {
			np = fromMaybe NP emptyNP state_of_affairs_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP action_np)
		} ;
		-- <State_of_affairs>[the end] [JUSTIFIES] <Action>[the means]

		--
		-- Desiring
		--

		Desiring_V experiencer_np focal_participant_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv focal_participant_adv)
		} ;
		-- <Experiencer>[he] [WANTED] <Focal_participant>[more]

		Desiring_V2 experiencer_np focal_participant_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP focal_participant_np)
		} ;
		-- <Experiencer>[you] [WANT] <Focal_participant>[one]

		Desiring_VV event_vp experiencer_np vv = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP vv (fromMaybe VP emptyVP event_vp)
		} ;
		-- <Experiencer>[I] would n't [WANT] <Event>[to know]

		--
		-- Destroying
		--

		Destroying_V2_1 cause_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Cause>[his minimum wage policy] would [DESTROY] <Undergoer>[jobs]

		Destroying_V2_2 destroyer_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP destroyer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Destroyer>[we] [DESTROY] <Undergoer>[it]

		Destroying_V2_Pass_1 destroyer_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP destroyer_np))
		} ;
		-- [DESTROYED] <Destroyer>[by the hero Bellepheron]

		Destroying_V2_Pass_2 undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Undergoer>[the cemetery] was not [DESTROYED]

		--
		-- Detaching
		--

		Detaching_V2 agent_np item_np source_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP item_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Agent>[the figure] [DETACH] <Item>[itself] <Source>[from the wall]

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
		-- <Authorities>[I] must n't [DETAIN] <Suspect>[you]

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
		-- [DIFFERENTIATE] <Phenomenon_1>[it] <Phenomenon_2>[from a quasi-marital partnership]

		Differentiation_V2_Pass phenomena_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomena_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Phenomena>[more and more elements] come to be [DISCRIMINATED]

		--
		-- Dispersal
		--

		Dispersal_V2 agent_np individuals_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP individuals_np)
		} ;
		-- <Agent>[Hippopotamuses] [SPREAD] <Individuals>[their scents]

		--
		-- Dodging
		--

		Dodging_V2 bad_entity_np dodger_np v2 = lin Clause {
			np = fromMaybe NP emptyNP dodger_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP bad_entity_np)
		} ;
		-- <Dodger>[She] [DODGED] <Bad_entity>[a wet sponge]

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
		-- <Wearer>[Students] [DRESS] <Clothing>[in colourful garb]

		Dressing_V2 clothing_np wearer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP wearer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP clothing_np)
		} ;
		-- <Wearer>[I] [PUT] [on] <Clothing>[my kilt]

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

		Dunking_V2 substance_adv theme_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv substance_adv)
		} ;
		-- [DIPPING] <Theme>[them] <Substance>[in fine sand]

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
		-- <Eclipsed>[Claudia 's face] is [OBSCURED] <Obstruction>[by the dust which rises]

		Eclipse_V2 eclipsed_np obstruction_np v2 = lin Clause {
			np = fromMaybe NP emptyNP obstruction_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP eclipsed_np)
		} ;
		-- <Obstruction>[the mist] [HID] <Eclipsed>[the water]

		Eclipse_V2_Pass eclipsed_np v2 = lin Clause {
			np = fromMaybe NP emptyNP eclipsed_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Eclipsed>[they] would be [HIDDEN]

		--
		-- Education_teaching
		--

		Education_teaching_V qualification_adv student_np v = lin Clause {
			np = fromMaybe NP emptyNP student_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv qualification_adv)
		} ;
		-- <Student>[he] was [STUDYING] <Qualification>[for his degree in environmental biology]

		Education_teaching_V2 role_adv student_np teacher_np v2 = lin Clause {
			np = fromMaybe NP emptyNP teacher_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP student_np)) (fromMaybe Adv emptyAdv role_adv)
		} ;
		-- <Teacher>[veteran boxer Laurie Degnan] is [TRAINING] <Student>[eight-year-old boys] <Role>[as future champion fighters]

		--
		-- Elusive_goal
		--

		Elusive_goal_V2 desired_goal_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP desired_goal_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP experiencer_np)
		} ;
		-- <Desired_goal>[Sleep] [ELUDED] <Experiencer>[him]

		--
		-- Emanating
		--

		Emanating_V emission_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP emission_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Emission>[Energy] [RADIATING] <Source>[from one focus]

		--
		-- Emitting
		--

		Emitting_V2 emission_np source_emitter_np v2 = lin Clause {
			np = fromMaybe NP emptyNP source_emitter_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP emission_np)
		} ;
		-- <Source_emitter>[They] [SECRETE] <Emission>[lime]

		Emitting_V2_Pass emission_np v2 = lin Clause {
			np = fromMaybe NP emptyNP emission_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Emission>[drugs] <Emission>[that] are [SECRETED]

		--
		-- Emotion_active
		--

		Emotion_active_V experiencer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Experiencer>[The family] [WORRIED] <Topic>[about it]

		--
		-- Emotion_heat
		--

		Emotion_heat_V_1 emotion_adv experiencer_np v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv emotion_adv)
		} ;
		-- <Experiencer>[she] [SEETHED] <Emotion>[with anger]

		Emotion_heat_V_2 experiencer_np seat_of_emotion_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv seat_of_emotion_adv)
		} ;
		-- <Experiencer>[Sister Cooney] [SEETHED] <Seat_of_emotion>[under her blotched skin]

		--
		-- Employing
		--

		Employing_V2 employee_np employer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP employee_np)
		} ;
		-- <Employer>[I] [EMPLOY] <Employee>[someone]

		--
		-- Emptying
		--

		Emptying_V source_np v = lin Clause {
			np = fromMaybe NP emptyNP source_np ;
			vp = mkVP v
		} ;
		-- <Source>[towns] [GUTTED]

		Emptying_V2 agent_np source_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP source_np)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Agent>[He] [CLEARED] <Source>[it] <Theme>[of leaves]

		Emptying_V2_Pass source_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP source_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Source>[the ground] has been [CLEARED] <Theme>[of the previous crop]

		--
		-- Encoding
		--

		Encoding_V manner_adv message_np v = lin Clause {
			np = fromMaybe NP emptyNP message_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv manner_adv)
		} ;
		-- <Message>[the message] [COUCHED] <Manner>[in fairly bland terms]

		Encoding_V2_Pass manner_adv message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP message_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv manner_adv)
		} ;
		-- <Message>[something] is [COUCHED] <Manner>[in general terms]

		--
		-- Endangering
		--

		Endangering_V2 agent_np valued_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP valued_entity_np)
		} ;
		-- <Agent>[the riders] <Agent>[who] [ENDANGER] <Valued_entity>[the whole group]

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
		-- <Evader>[it] [EVADED] <Pursuer>[him]

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
		-- <Event>[The incident] [TOOK PLACE] <Place>[at a house on Jerviston Street in New Stevenson] <Time>[at around eight o'clock last night]

		Event_V2 event_np place_adv time_np v2 = lin Clause {
			np = fromMaybe NP emptyNP event_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP time_np)) (fromMaybe Adv emptyAdv place_adv)
		} ;
		-- <Event>[The first performance] [TAKES PLACE] <Place>[here] <Place>[at the Unicorn theatre] <Place>[in Abingdon] <Time>[tomorrow]

		--
		-- Evidence
		--

		Evidence_V2 proposition_np support_np v2 = lin Clause {
			np = fromMaybe NP emptyNP support_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP proposition_np)
		} ;
		-- <Support>[the letters] [REVEALING] <Proposition>[his generosity]

		Evidence_VQ proposition_qs support_np vq = lin Clause {
			np = fromMaybe NP emptyNP support_np ;
			vp = mkVP vq (fromMaybe QS emptyQS proposition_qs)
		} ;
		-- <Support>[The Queen 's Speech in November] will broadly [REVEAL] <Proposition>[what the Bill is likely to contain]

		Evidence_VS proposition_s support_np vs = lin Clause {
			np = fromMaybe NP emptyNP support_np ;
			vp = mkVP vs (fromMaybe S emptyS proposition_s)
		} ;
		-- <Support>[Checks] [REVEALED] <Proposition>[they were from the infected zone]

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
		-- <Exchanger_1>[Kathleen] [EXCHANGED] <Themes>[glances] <Exchanger_2>[with Jack]

		--
		-- Exclude_member
		--

		Exclude_member_V2 authority_np member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP authority_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP member_np)
		} ;
		-- <Authority>[Innocent III] [EXCOMMUNICATED] <Member>[him]

		--
		-- Excreting
		--

		Excreting_V2 excreta_np excreter_np v2 = lin Clause {
			np = fromMaybe NP emptyNP excreter_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP excreta_np)
		} ;
		-- <Excreter>[you] [SWEAT] <Excreta>[blood and tears]

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

		Execution_V2_Pass executed_np executioner_np v2 = lin Clause {
			np = fromMaybe NP emptyNP executed_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP executioner_np))
		} ;
		-- <Executed>[The family] was [EXECUTED] <Executioner>[by Bolsheviks]

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
		-- [ANTICIPATED] <Phenomenon>[that LMS will bring any difference]

		--
		-- Expensiveness
		--

		Expensiveness_V asset_adv goods_np v = lin Clause {
			np = fromMaybe NP emptyNP goods_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv asset_adv)
		} ;
		-- <Goods>[The guide] [COSTS] <Asset>[£12]

		--
		-- Experience_bodily_harm
		--

		Experience_bodily_harm_V2 body_part_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP body_part_np)
		} ;
		-- <Experiencer>[another] [BROKE] <Body_part>[a wrist]

		--
		-- Experiencer_focus
		--

		Experiencer_focus_V2 content_np experiencer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Experiencer>[I] [RESENTED] <Content>[it]

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
		-- <Stimulus>[they] [SHOCKED] <Experiencer>[you]

		Experiencer_obj_V2S experiencer_np stimulus_s v2s = lin Clause {
			np = emptyNP ;
			vp = mkVP v2s (fromMaybe NP emptyNP experiencer_np) (fromMaybe S emptyS stimulus_s)
		} ;
		-- [SHOCKED] <Experiencer>[her] <Stimulus>[that she could make such a cool analysis of the situation]

		Experiencer_obj_V2_Pass experiencer_np stimulus_np v2 = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP stimulus_np))
		} ;
		-- <Experiencer>[I] [SHOCKED] <Stimulus>[by this decision]

		Experiencer_obj_VS_Pass experiencer_np stimulus_s vs = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP vs (fromMaybe S emptyS stimulus_s)
		} ;
		-- <Experiencer>[he] was [INTRIGUED] <Stimulus>[that her journalistic methods were unlike those of any other journalist he had met]

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

		Exporting_V2 exporter_np goods_np v2 = lin Clause {
			np = fromMaybe NP emptyNP exporter_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP goods_np)
		} ;
		-- <Exporter>[It] [EXPORTED] <Goods>[their manufactured goods]

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
		-- <Communicator>[I] [EXPRESS] <Content>[our deep sympathy]

		--
		-- Extradition
		--

		Extradition_V2 crime_jurisdiction_adv suspect_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP suspect_np)) (fromMaybe Adv emptyAdv crime_jurisdiction_adv)
		} ;
		-- [EXTRADITED] <Suspect>[several suspected drug smugglers] <Crime_jurisdiction>[to the United States]

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
		-- <Agent>[She] could at least [PRETEND] <State_of_affairs>[some sorrow]

		--
		-- Filling
		--

		Filling_V2_1 agent_np goal_np theme_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP goal_np)) (fromMaybe Adv emptyAdv theme_adv)
		} ;
		-- <Agent>[I] [PAINT] <Goal>[an area] <Theme>[with retouching varnish mixed with pigment as a glaze]

		Filling_V2_2 goal_adv theme_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- [PILED] <Theme>[them] <Goal>[in the sink]

		--
		-- Finish_competition
		--

		Finish_competition_V2 competition_np competitor_np opponent_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP competitor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP competition_np)) (fromMaybe Adv emptyAdv opponent_adv)
		} ;
		-- <Competitor>[he] [LOST] <Competition>[a competition] <Opponent>[to Norman Foster]

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
		-- <Employer>[the boss] decides to [FIRE] <Employee>[the colleague]

		Firing_V2_Pass employee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Employee>[seven civil servants] were [FIRED]

		--
		-- Fleeing
		--

		Fleeing_V_1 goal_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Self_mover>[Robbie] [FLED] <Goal>[back to her cabin]

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
		-- <Fluid>[blood] [FLOWED] <Area>[in Parma]

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
		-- <Agent>[he] [FORGED] <Forgery>[her will]

		--
		-- Forgoing
		--

		Forgoing_V desirable_adv forgoer_np v = lin Clause {
			np = fromMaybe NP emptyNP forgoer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv desirable_adv)
		} ;
		-- <Forgoer>[homosexuals] must [ABSTAIN] <Desirable>[from sex]

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
		-- <Partners>[her parents] [DIVORCED]

		Forming_relationships_V2 partner_1_np partner_2_np v2 = lin Clause {
			np = fromMaybe NP emptyNP partner_1_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP partner_2_np)
		} ;
		-- <Partner_1>[I] can [DIVORCE] <Partner_2>[him]

		--
		-- Friction
		--

		Friction_V_1 static_object_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv static_object_adv)
		} ;
		-- <Theme>[my spoon] [SCRAPING] <Static_object>[on the bottom of the bowl]

		Friction_V_2 themes_np v = lin Clause {
			np = fromMaybe NP emptyNP themes_np ;
			vp = mkVP v
		} ;
		-- <Themes>[pins] [GRATED]

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
		-- <Agent>[Peasants] tilled the soil and [HERDED] <Individuals>[sheep]

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
		-- <Communicator>[I] went to [WAVE] <Message>[goodbye] <Addressee>[to grandma]

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
		-- Getting
		--

		Getting_V2 recipient_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP recipient_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Recipient>[them] to [OBTAIN] <Theme>[a set of fingerprints]

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
		-- <Donor>[I] will [DONATE] <Theme>[the money] <Recipient>[to charity]

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
		-- <Protagonist>[they] [RENEGE] <Commitment>[on that]

		--
		-- Grasp
		--

		Grasp_V2 cognizer_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- <Cognizer>[I] [UNDERSTOOD] <Phenomenon>[why]

		Grasp_VQ cognizer_np phenomenon_qs vq = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP vq (fromMaybe QS emptyQS phenomenon_qs)
		} ;
		-- <Cognizer>[she] found it difficult to [UNDERSTAND] <Phenomenon>[what he was talking about]

		--
		-- Grinding
		--

		Grinding_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[mustard seeds] are soaked and then [GROUND]

		Grinding_V2 grinder_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP grinder_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Grinder>[you] [GRIND] <Undergoer>[nuts]

		--
		-- Grooming
		--

		Grooming_V body_part_np v = lin Clause {
			np = fromMaybe NP emptyNP body_part_np ;
			vp = mkVP v
		} ;
		-- <Body_part>[the pale-gold hair] [PLAITED]

		Grooming_V2 agent_np body_part_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP body_part_np)
		} ;
		-- <Agent>[I] [WASH] <Body_part>[my hair]

		--
		-- Halt
		--

		Halt_V theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v
		} ;
		-- <Theme>[she] [HALTED]

		--
		-- Hear
		--

		Hear_V hearer_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP hearer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Hearer>[you] 've [HEARD] <Topic>[about Francis Garland]

		Hear_V2 hearer_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP hearer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Hearer>[you] [HEAR] <Message>[that]

		Hear_VS hearer_np message_s vs = lin Clause {
			np = fromMaybe NP emptyNP hearer_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Hearer>[We] [HEARD] <Message>[it was a good school]

		--
		-- Hiding_objects
		--

		Hiding_objects_V2 agent_np hidden_object_np hiding_place_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP hidden_object_np)) (fromMaybe Adv emptyAdv hiding_place_adv)
		} ;
		-- <Agent>[They] [CAMOUFLAGED] <Hidden_object>[the vehicles] <Hiding_place>[in a wadi]

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
		-- <Hindrance>[they] also [INHIBITED] <Action>[change]

		--
		-- Hiring
		--

		Hiring_V2 employee_np employer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP employer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP employee_np)
		} ;
		-- <Employer>[they] 'll [HIRE] <Employee>[you]

		--
		-- Hostile_encounter
		--

		Hostile_encounter_V sides_np v = lin Clause {
			np = fromMaybe NP emptyNP sides_np ;
			vp = mkVP v
		} ;
		-- <Sides>[the Dark Elves] [FOUGHT]

		--
		-- Hunting
		--

		Hunting_V hunter_np v = lin Clause {
			np = fromMaybe NP emptyNP hunter_np ;
			vp = mkVP v
		} ;
		-- <Hunter>[they] [HUNT]

		--
		-- Imitating
		--

		Imitating_V2 agent_np standard_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP standard_np)
		} ;
		-- <Agent>[I] still [MIMIC] <Standard>[Brando]

		--
		-- Immobilization
		--

		Immobilization_V2 agent_np patient_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP patient_np)
		} ;
		-- <Agent>[they] [HANDCUFFED] <Patient>[us]

		--
		-- Impact
		--

		Impact_V_1 impactee_adv impactor_np v = lin Clause {
			np = fromMaybe NP emptyNP impactor_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv impactee_adv)
		} ;
		-- <Impactor>[Rune 's hand] [SLAMMED] <Impactee>[against the door]

		Impact_V_2 impactee_np v = lin Clause {
			np = fromMaybe NP emptyNP impactee_np ;
			vp = mkVP v
		} ;
		-- <Impactee>[it] 's [HIT]

		Impact_V2 impactee_np impactor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP impactor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP impactee_np)
		} ;
		-- <Impactor>[the ball] [HIT] <Impactee>[a post]

		--
		-- Inclusion
		--

		Inclusion_V2 part_np total_np v2 = lin Clause {
			np = fromMaybe NP emptyNP total_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP part_np)
		} ;
		-- <Total>[Few] , [INCLUDING] <Part>[me]

		--
		-- Indicating
		--

		Indicating_V2 communicator_np unresolved_referent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP unresolved_referent_np)
		} ;
		-- <Communicator>[You] [NAME] <Unresolved_referent>[it]

		--
		-- Ingest_substance
		--

		Ingest_substance_V2_1 delivery_device_np ingestor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP delivery_device_np)
		} ;
		-- <Ingestor>[a tramp] [SMOKING] <Delivery_device>[a pipe]

		Ingest_substance_V2_2 ingestor_np substance_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP substance_np)
		} ;
		-- <Ingestor>[We] [SMOKED] <Substance>[dope]

		Ingest_substance_V2_Pass substance_np v2 = lin Clause {
			np = fromMaybe NP emptyNP substance_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Substance>[Freebase] is a compound that can be inhaled or [SMOKED]

		--
		-- Ingestion
		--

		Ingestion_V_1 ingestibles_adv ingestor_np v = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv ingestibles_adv)
		} ;
		-- <Ingestor>[Michael] , [SIPPING] <Ingestibles>[on a full beer]

		Ingestion_V_2 ingestibles_np v = lin Clause {
			np = fromMaybe NP emptyNP ingestibles_np ;
			vp = mkVP v
		} ;
		-- <Ingestibles>[white appellation contrôlée wine] [CONSUMED]

		Ingestion_V2 ingestibles_np ingestor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestor_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ingestibles_np)
		} ;
		-- <Ingestor>[Others] [SIP] <Ingestibles>[nectar]

		Ingestion_V2_Pass ingestibles_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ingestibles_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Ingestibles>[it] is [DRUNK]

		--
		-- Inhibit_movement
		--

		Inhibit_movement_V holding_location_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv holding_location_adv)
		} ;
		-- <Theme>[corals] are essentially tropical and virtually [CONFINED] <Holding_location>[within 30 degrees of the equator]

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
		-- <Inspector>[Benjamin] [EXAMINED] <Ground>[the yellowing teeth]

		Inspecting_V2_Pass ground_np inspector_np v2 = lin Clause {
			np = fromMaybe NP emptyNP ground_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP inspector_np))
		} ;
		-- <Ground>[your client] [EXAMINED] <Inspector>[by their medical expert]

		--
		-- Installing
		--

		Installing_V2 agent_np component_np fixed_location_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP component_np)) (fromMaybe Adv emptyAdv fixed_location_adv)
		} ;
		-- <Agent>[the BCR] had [INSTALLED] <Component>[a turntable] <Fixed_location>[at Stretford Bridge]

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
		-- Intentionally_create
		--

		Intentionally_create_V2 created_entity_np creator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP creator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP created_entity_np)
		} ;
		-- <Creator>[you] [SET] <Created_entity>[it] [up]

		Intentionally_create_V2_Pass created_entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP created_entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- [SET] [up] , <Created_entity>[Radio RIN]

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
		-- <Invader>[Iraq] [INVADED] <Land>[Iran]

		--
		-- Judgment
		--

		Judgment_V2 cognizer_np evaluee_np reason_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP evaluee_np)) (fromMaybe Adv emptyAdv reason_adv)
		} ;
		-- <Cognizer>[he] [BLAMES] <Evaluee>[sheep dip] <Reason>[for his condition]

		--
		-- Judgment_communication
		--

		Judgment_communication_V2 communicator_np evaluee_np v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP evaluee_np)
		} ;
		-- <Communicator>[I] 'm [CRITICISING] <Evaluee>[Faye]

		--
		-- Judgment_direct_address
		--

		Judgment_direct_address_V2 addressee_np communicator_np reason_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP communicator_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP addressee_np)) (fromMaybe Adv emptyAdv reason_adv)
		} ;
		-- <Communicator>[I] [THANKED] <Addressee>[God] <Reason>[for typecasting]

		Judgment_direct_address_V2_Pass_1 addressee_np communicator_np v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP communicator_np))
		} ;
		-- <Addressee>[she] was commiserated with , patted on the back , [THANKED] <Communicator>[by the little girl 's father]

		Judgment_direct_address_V2_Pass_2 addressee_np reason_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv reason_adv)
		} ;
		-- <Addressee>[the informant] will be [THANKED] <Reason>[for co-operating]

		Judgment_direct_address_V2_Pass_3 addressee_np topic_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Addressee>[Landlords] are [TAKEN] [to task] <Topic>[over standards]

		--
		-- Justifying
		--

		Justifying_V2 act_np agent_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP act_np)
		} ;
		-- <Agent>[they] use to [JUSTIFY] <Act>[that]

		--
		-- Kidnapping
		--

		Kidnapping_V2 perpetrator_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Perpetrator>[He] 's [ABDUCTED] <Victim>[me]

		--
		-- Killing
		--

		Killing_V2_1 cause_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Cause>[radiation] could [KILL] <Victim>[humans]

		Killing_V2_2 killer_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP killer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Killer>[he] [KILLED] <Victim>[her]

		--
		-- Knot_creation
		--

		Knot_creation_V2 agent_np knot_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP knot_np)
		} ;
		-- <Agent>[Stok] [TIED] <Knot>[his tie]

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
		-- <Leader>[you] could [RULE] <Governed>[the world]

		Leadership_V2_Pass governed_np leader_np v2 = lin Clause {
			np = fromMaybe NP emptyNP governed_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP leader_np))
		} ;
		-- <Governed>[The lands] [RULED] <Leader>[by the Yek]

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
		-- Location_of_light
		--

		Location_of_light_V figure_np ground_adv v = lin Clause {
			np = fromMaybe NP emptyNP figure_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv ground_adv)
		} ;
		-- <Figure>[her eyes] are [SHINING] <Ground>[in the dark]

		--
		-- Losing
		--

		Losing_V2 owner_np possession_np v2 = lin Clause {
			np = fromMaybe NP emptyNP owner_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP possession_np)
		} ;
		-- <Owner>[I] have n't [LOST] <Possession>[it]

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
		-- <Sound_source>[The naughty monkeys] [SCREECHED] <Sound>[their high-pitched calls]

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
		-- <Agent>[him] [SMILE]

		--
		-- Manipulate_into_doing
		--

		Manipulate_into_doing_V2_Pass resulting_action_adv victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP victim_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv resulting_action_adv)
		} ;
		-- <Victim>[I] sort of got [CONNED] <Resulting_action>[into this]

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
		-- <Agent>[He] [GRABBED] <Entity>[me] <Bodypart_of_agent>[with one hand]

		Manipulation_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[He] was [GRABBED]

		--
		-- Manufacturing
		--

		Manufacturing_V2 product_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP product_np)
		} ;
		-- [MANUFACTURE] <Product>[fuels]

		--
		-- Mass_motion
		--

		Mass_motion_V_1 area_adv mass_theme_np v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Mass_theme>[boards] [CROWDED] <Area>[around you]

		Mass_motion_V_2 direction_adv mass_theme_np v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Mass_theme>[Falling debris] [RAINED] <Direction>[down]

		Mass_motion_V_3 goal_adv mass_theme_np v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Mass_theme>[doubts] [CROWDED] <Goal>[into my mind]

		Mass_motion_V_4 mass_theme_np path_adv v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Mass_theme>[They] [CROWDED] <Path>[forward]

		Mass_motion_V_5 mass_theme_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP mass_theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Mass_theme>[creatures] [STREAMING] <Source>[from the rear of the shuttle]

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
		-- <Trigger>[they] were [MET] <Response>[with some resistance]

		--
		-- Memorization
		--

		Memorization_V2 cognizer_np pattern_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP pattern_np)
		} ;
		-- <Cognizer>[I] 'll [MEMORIZE] <Pattern>[this lot]

		--
		-- Memory
		--

		Memory_V2 cognizer_np content_np v2 = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP content_np)
		} ;
		-- <Cognizer>[I] [REMEMBER] <Content>[it]

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
		-- <Theme>[She] [WEAVED] <Direction>[towards it]

		Motion_V_2 goal_adv source_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[Her foot] [MOVED] <Source>[from the brake] <Goal>[to the accelerator]

		Motion_V_3 path_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[dissolved metals] [MOVE] <Path>[through membranes]

		--
		-- Motion_directional
		--

		Motion_directional_V_1 goal_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[they] [FALL] <Goal>[into the sea]

		Motion_directional_V_2 path_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[The laundered clothes] had [FALLEN] <Path>[every which way]

		Motion_directional_V_3 source_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Theme>[rocks and earth] [FALLING] <Source>[from behind them]

		--
		-- Motion_noise
		--

		Motion_noise_V area_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Theme>[Mrs Chalk] was [CLATTERING] <Area>[round] <Area>[in the kitchen]

		--
		-- Moving_in_place
		--

		Moving_in_place_V theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP v
		} ;
		-- <Theme>[His lashes] [QUIVERED]

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
		-- <Requirement>[A banquet] is [NEEDED]

		--
		-- Notification_of_charges
		--

		Notification_of_charges_V2 accused_np arraign_authority_np charges_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP arraign_authority_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP accused_np)) (fromMaybe Adv emptyAdv charges_adv)
		} ;
		-- <Arraign_authority>[prosecutors] plan to formally [INDICT] <Accused>[Chun] <Charges>[on corruption charges]

		Notification_of_charges_V2_Pass_1 accused_np arraign_authority_np v2 = lin Clause {
			np = fromMaybe NP emptyNP accused_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP arraign_authority_np))
		} ;
		-- <Accused>[he] has not been [INDICTED] <Arraign_authority>[by a war crimes tribunal]

		Notification_of_charges_V2_Pass_2 accused_np charges_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP accused_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv charges_adv)
		} ;
		-- <Accused>[the promoter] was [INDICTED] <Charges>[on federal wire fraud charges]

		--
		-- Nuclear_process
		--

		Nuclear_process_V element_np v = lin Clause {
			np = fromMaybe NP emptyNP element_np ;
			vp = mkVP v
		} ;
		-- <Element>[A neutron] [DECAYS]

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
		-- <Item>[Fujitsu Ltd] [RANKED]

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
		-- <Phenomenon_1>[this] [HERALDS] <Phenomenon_2>[a new era for flat roofing]

		--
		-- Operate_vehicle
		--

		Operate_vehicle_V_1 area_adv driver_np v = lin Clause {
			np = fromMaybe NP emptyNP driver_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv area_adv)
		} ;
		-- <Driver>[you] ramble or [CYCLE] <Area>[around this little island]

		Operate_vehicle_V_2 driver_np goal_adv path_adv source_adv v = lin Clause {
			np = fromMaybe NP emptyNP driver_np ;
			vp = mkVP (mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv path_adv)) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Driver>[I] [MOTORED] for the fun of it <Path>[through Latvia and Estonia] , <Source>[from Riga] <Goal>[to what was then still Leningrad]

		Operate_vehicle_V2 driver_np vehicle_np v2 = lin Clause {
			np = fromMaybe NP emptyNP driver_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP vehicle_np)
		} ;
		-- <Driver>[Tom] , <Driver>[who] [ROWS] <Vehicle>[the baggage boat]

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
		-- <Cognizer>[I] [SUPPOSE] <Opinion>[it 's natural]

		--
		-- Origin
		--

		Origin_V entity_np origin_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv origin_adv)
		} ;
		-- <Entity>[the tiger] did [ORIGINATE] <Origin>[in the frozen north]

		--
		-- Others_situation_as_stimulus
		--

		Others_situation_as_stimulus_V_1 experiencer_np other_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv other_adv)
		} ;
		-- <Experiencer>[I] [SYMPATHISE] <Other>[with Sally]

		Others_situation_as_stimulus_V_2 experiencer_np situation_adv v = lin Clause {
			np = fromMaybe NP emptyNP experiencer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv situation_adv)
		} ;
		-- <Experiencer>[I] may not [SYMPATHIZE] <Situation>[with the bombing]

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

		--
		-- Partiality
		--

		Partiality_V2 side_1_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP side_1_np)
		} ;
		-- [PREFER] <Side_1>[white wine]

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
		-- <Road>[An arc of pale sand-colored hessian] [REACHES] <Source>[from floor] <Goal>[to beyond eyeview]

		Path_shape_V2 area_np road_np v2 = lin Clause {
			np = fromMaybe NP emptyNP road_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP area_np)
		} ;
		-- <Road>[more roads] are built [CRISSCROSSING] <Area>[the countryside]

		--
		-- Perception_body
		--

		Perception_body_V_1 body_part_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv body_part_adv)
		} ;
		-- [ACHED] <Body_part>[in odd parts]

		Perception_body_V_2 body_part_np v = lin Clause {
			np = fromMaybe NP emptyNP body_part_np ;
			vp = mkVP v
		} ;
		-- <Body_part>[My arm] [ACHED]

		--
		-- Perception_experience
		--

		Perception_experience_V2 perceiver_passive_np phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perceiver_passive_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP phenomenon_np)
		} ;
		-- <Perceiver_passive>[you] [SEE] <Phenomenon>[the face]

		Perception_experience_VQ perceiver_passive_np phenomenon_qs vq = lin Clause {
			np = fromMaybe NP emptyNP perceiver_passive_np ;
			vp = mkVP vq (fromMaybe QS emptyQS phenomenon_qs)
		} ;
		-- <Perceiver_passive>[you] [HEAR] <Phenomenon>[what I said]

		Perception_experience_V2_Pass phenomenon_np v2 = lin Clause {
			np = fromMaybe NP emptyNP phenomenon_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Phenomenon>[They] are n't [SEEN]

		--
		-- Performers_and_roles
		--

		Performers_and_roles_V2_1 performance_adv performer_np role_np v2 = lin Clause {
			np = fromMaybe NP emptyNP performer_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP role_np)) (fromMaybe Adv emptyAdv performance_adv)
		} ;
		-- <Performer>[a girl] <Performer>[who] [PLAYS] <Role>[Gemma] <Performance>[in Neighbours]

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
		-- <Partner_1>[I] [DATED] <Partner_2>[her]

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
		-- [weight] <Agent>[John Paul] [PLACES] <Consideration>[on the issue]

		--
		-- Placing
		--

		Placing_V2_1 agent_np goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[They] should [PUT] <Theme>[some water] <Goal>[on]

		Placing_V2_2 goal_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP goal_np)
		} ;
		-- [DRIZZLE] <Goal>[over the cream]

		Placing_V2_Pass goal_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Theme>[Toad tadpoles] [PUT] <Goal>[into acid water]

		--
		-- Planting
		--

		Planting_V2_1 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[She] had [PLANTED] <Theme>[some runner beans]

		Planting_V2_2 ground_adv theme_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv ground_adv)
		} ;
		-- [PLANT] <Theme>[a single , carefully selected plant] <Ground>[in the chosen spot]

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
		-- <Owner>[the person] [POSSESSING] <Possession>[the goods]

		--
		-- Posture
		--

		Posture_V agent_np location_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Agent>[Ruth] , [STANDING] <Location>[on the circular floor]

		--
		-- Practice
		--

		Practice_V action_adv agent_np v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv action_adv)
		} ;
		-- <Agent>[The 20-stone Italian tenor] was [REHEARSING] <Action>[as painter Mario Cavaradossi]

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
		-- [RAINS] <Place>[in Amantani]

		Precipitation_V_2 time_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv time_adv)
		} ;
		-- [RAIN] <Time>[tomorrow]

		--
		-- Preserving
		--

		Preserving_V2 agent_np medium_adv undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP undergoer_np)) (fromMaybe Adv emptyAdv medium_adv)
		} ;
		-- <Agent>[they] [CURED] <Undergoer>[it] <Medium>[in jading substances]

		Preserving_V2_Pass medium_adv undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv medium_adv)
		} ;
		-- <Undergoer>[most bacon] is [CURED] <Medium>[in brine]

		--
		-- Prevarication
		--

		Prevarication_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[I] was just [KIDDING] <Topic>[about that]

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
		-- <Agent>[he] still hoped to [AVERT] <Event>[war]

		Preventing_V2_2 event_np preventing_cause_np v2 = lin Clause {
			np = fromMaybe NP emptyNP preventing_cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP event_np)
		} ;
		-- <Preventing_cause>[A global concerted effort] is required to [AVERT] <Event>[a global health crisis]

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
		-- <Process>[the War] [ENDED]

		--
		-- Process_start
		--

		Process_start_V event_np v = lin Clause {
			np = fromMaybe NP emptyNP event_np ;
			vp = mkVP v
		} ;
		-- <Event>[the season] [BEGINS]

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
		-- <Protection>[They] [GUARDED] <Asset>[it]

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
		-- <Arguer1>[Ken] [ARGUED] <Arguer2>[with him]

		Quarreling_V_2 arguers_np issue_adv v = lin Clause {
			np = fromMaybe NP emptyNP arguers_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv issue_adv)
		} ;
		-- <Arguers>[They] [ARGUED] endlessly <Issue>[about it]

		--
		-- Questioning
		--

		Questioning_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[We] [ASKED] <Topic>[about going into Finland]

		Questioning_V2 addressee_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP addressee_np)
		} ;
		-- <Speaker>[they] 'll [QUESTION] <Addressee>[your friends]

		Questioning_VQ message_qs speaker_np vq = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vq (fromMaybe QS emptyQS message_qs)
		} ;
		-- <Speaker>[Isabel] wanted to [ASK] <Message>[why not]

		Questioning_V2_Pass addressee_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP speaker_np))
		} ;
		-- <Addressee>[Two men] have been arrested and [QUESTIONED] <Speaker>[by police]

		--
		-- Quitting
		--

		Quitting_V employee_np position_adv v = lin Clause {
			np = fromMaybe NP emptyNP employee_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv position_adv)
		} ;
		-- <Employee>[he] [RESIGNED] <Position>[as chairman]

		--
		-- Quitting_a_place
		--

		Quitting_a_place_V self_mover_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Self_mover>[the whole unit] could [RETREAT] <Source>[from its desert base]

		Quitting_a_place_V2 source_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP source_np)
		} ;
		-- [DESERTING] <Source>[it]

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
		-- <Reader>[I] [READ] <Text>[through the papers]

		Reading_V_2 text_np v = lin Clause {
			np = fromMaybe NP emptyNP text_np ;
			vp = mkVP v
		} ;
		-- <Text>[The history of Hawaii] [READS]

		Reading_V2 reader_np text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP reader_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP text_np)
		} ;
		-- <Reader>[i] 've [READ] <Text>[it]

		--
		-- Reading_aloud
		--

		Reading_aloud_V2 speaker_np text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP text_np)
		} ;
		-- <Speaker>[somebody] [READ] <Text>[it]

		--
		-- Reasoning
		--

		Reasoning_V arguer_np content_adv v = lin Clause {
			np = fromMaybe NP emptyNP arguer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv content_adv)
		} ;
		-- <Arguer>[he] [ARGUED] <Content>[for the cut-off in American aid to Pakistan]

		Reasoning_VS arguer_np content_s vs = lin Clause {
			np = fromMaybe NP emptyNP arguer_np ;
			vp = mkVP vs (fromMaybe S emptyS content_s)
		} ;
		-- <Arguer>[I] have [PROVED] <Content>[I can play on all surfaces]

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
		-- <Agent>[Generations of philosophers] have [DOCUMENTED] <Phenomenon>[this process]

		--
		-- Recovery
		--

		Recovery_V_1 affliction_adv patient_np v = lin Clause {
			np = fromMaybe NP emptyNP patient_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv affliction_adv)
		} ;
		-- <Patient>[he] 's [RECOVERED] <Affliction>[from the flu]

		Recovery_V_2 affliction_np v = lin Clause {
			np = fromMaybe NP emptyNP affliction_np ;
			vp = mkVP v
		} ;
		-- <Affliction>[all] [HEALED]

		--
		-- Redirecting
		--

		Redirecting_V2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[the government] should [REDIRECT] <Theme>[its spending]

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
		-- <Agent>[the company] [RESTRUCTURED] <Entity>[its operation]

		Reforming_a_system_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[MAFF] to be [RESTRUCTURED]

		--
		-- Rejuvenation
		--

		Rejuvenation_V2 agent_np entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP entity_np)
		} ;
		-- <Agent>[my cousin] [RESTORE] <Entity>[it]

		Rejuvenation_V2_Pass entity_np v2 = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Entity>[The exterior portal] has been [RESTORED]

		--
		-- Relating_concepts
		--

		Relating_concepts_V2 concept_1_np concept_2_adv evidence_np v2 = lin Clause {
			np = fromMaybe NP emptyNP evidence_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP concept_1_np)) (fromMaybe Adv emptyAdv concept_2_adv)
		} ;
		-- <Evidence>[Swedish studies] [LINK] <Concept_1>[cancers] <Concept_2>[to power lines]

		Relating_concepts_V2_Pass concept_1_np concept_2_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP concept_1_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv concept_2_adv)
		} ;
		-- <Concept_1>[Skin cancer] , <Concept_1>[which] is [LINKED] <Concept_2>[to sun exposure and damage]

		--
		-- Relative_time
		--

		Relative_time_V focal_occasion_np v = lin Clause {
			np = fromMaybe NP emptyNP focal_occasion_np ;
			vp = mkVP v
		} ;
		-- <Focal_occasion>[volumes] [FOLLOWING]

		--
		-- Religious_belief
		--

		Religious_belief_V element_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv element_adv)
		} ;
		-- [BELIEVE] <Element>[in Jesus]

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
		-- <Agent>[Improved public health and hygiene measures -- the " sanitary revolution " from the mid-years of the century --] were also important and [ELIMINATED] <Theme>[up to one-quarter of deaths]

		Removing_V2_1 agent_np source_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP source_np)
		} ;
		-- <Agent>[they] [STRIPPED] <Source>[him]

		Removing_V2_2 agent_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Agent>[I] [WITHDREW] <Theme>[the money]

		Removing_V2_3 source_adv theme_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- [TAKE] <Theme>[your hands] <Source>[off me]

		Removing_V3 source_np theme_np v3 = lin Clause {
			np = emptyNP ;
			vp = mkVP v3 (fromMaybe NP emptyNP source_np) (fromMaybe NP emptyNP theme_np)
		} ;
		-- [TOOK] <Source>[out] <Theme>[his handkerchief]

		Removing_V2_Pass_1 source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Theme>[four cassettes] [TAKEN] <Source>[from the Peugeot]

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
		-- <Lessee>[we] could [RENT] <Goods>[it]

		--
		-- Renting_out
		--

		Renting_out_V2 goods_np lessee_adv lessor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP lessor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP goods_np)) (fromMaybe Adv emptyAdv lessee_adv)
		} ;
		-- <Lessor>[we] can [LEASE] <Goods>[the cellars] <Lessee>[to the Italians]

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
		-- <Agent>[He] [REPLACED] <Old>[me] <New>[with Peter O'Toole]

		Replacing_V2_2 agent_np new_np old_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP new_np)) (fromMaybe Adv emptyAdv old_adv)
		} ;
		-- <Agent>[we] [SUBSTITUTE] <New>[numbers] <Old>[for letters]

		--
		-- Reporting
		--

		Reporting_V informer_np wrongdoer_adv v = lin Clause {
			np = fromMaybe NP emptyNP informer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv wrongdoer_adv)
		} ;
		-- <Informer>[We] have n't [RATTED] <Wrongdoer>[on our friends]

		--
		-- Representing
		--

		Representing_V entity_np phenomenon_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv phenomenon_adv)
		} ;
		-- [IS] <Entity>[this] a [symbol] <Phenomenon>[of hope]

		--
		-- Request
		--

		Request_V message_adv speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv message_adv)
		} ;
		-- <Speaker>[the obstetrician] specifically [REQUESTS] <Message>[otherwise]

		Request_V2 message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Speaker>[Anarchists] [URGED] <Message>[acts of terror]

		Request_V2V addressee_np message_vp speaker_np v2v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2v (fromMaybe NP emptyNP addressee_np) (fromMaybe VP emptyVP message_vp)
		} ;
		-- <Speaker>[UK] [URGES] <Addressee>[Savimbi] <Message>[to keep the peace]

		Request_V2_Pass addressee_np message_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP addressee_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv message_adv)
		} ;
		-- <Addressee>[Departments] were [REQUESTED] <Message>[to forward questionnaires to students not in the department during September , and also to those whose grant entitlement had ended earlier in the year]

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
		-- <Researcher>[I] began [RESEARCHING] <Topic>[into the role of women in trade unions]

		--
		-- Reshaping
		--

		Reshaping_V2 deformer_np undergoer_np v2 = lin Clause {
			np = fromMaybe NP emptyNP deformer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP undergoer_np)
		} ;
		-- <Deformer>[Newman] [FOLDED] <Undergoer>[the document]

		--
		-- Residence
		--

		Residence_V location_adv resident_np v = lin Clause {
			np = fromMaybe NP emptyNP resident_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Resident>[I] [LIVED] <Location>[in Paradise Street]

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
		-- <Problem>[treatments for such patients] tend to be chosen empirically and [WORKED] [through]

		Resolve_problem_V2 agent_np problem_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP problem_np)
		} ;
		-- <Agent>[outside bodies] wish to [DEAL] with <Problem>[the civil service]

		--
		-- Respond_to_proposal
		--

		Respond_to_proposal_V2 proposal_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP proposal_np)
		} ;
		-- <Speaker>[He] [REJECTED] <Proposal>[an initial request for a meeting]

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

		Reveal_secret_V information_adv speaker_np v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv information_adv)
		} ;
		-- <Speaker>[I] [CONFESS] <Information>[to this failing]

		Reveal_secret_V2 information_np medium_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP information_np)
		} ;
		-- <Medium>[a letter] [CONFESSING] <Information>[the weakness]

		Reveal_secret_VQ information_qs speaker_np vq = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vq (fromMaybe QS emptyQS information_qs)
		} ;
		-- <Speaker>[She] once [CONFESSED] <Information>[how unhappy she had been at home]

		Reveal_secret_VS information_s medium_np vs = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP vs (fromMaybe S emptyS information_s)
		} ;
		-- <Information>[a " provocatively contentious and quite unacceptable " conclusion] , [CONFESSED] <Medium>[the report]

		--
		-- Revenge
		--

		Revenge_V_1 avenger_np injury_adv v = lin Clause {
			np = fromMaybe NP emptyNP avenger_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv injury_adv)
		} ;
		-- <Avenger>[local citizens] [RETALIATED] <Injury>[against the Zulus ' attacks]

		Revenge_V_2 avenger_np punishment_adv v = lin Clause {
			np = fromMaybe NP emptyNP avenger_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv punishment_adv)
		} ;
		-- <Avenger>[they] will [RETALIATE] <Punishment>[by boosting tariffs on US goods]

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
		-- <Agent>[God] [PUNISHES] <Evaluee>[those who do evil]

		--
		-- Ride_vehicle
		--

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

		Rite_V2 object_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP v2 (fromMaybe NP emptyNP object_np)
		} ;
		-- [BLESSED] <Object>[the soil]

		Rite_V2_Pass member_np v2 = lin Clause {
			np = fromMaybe NP emptyNP member_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Member>[he] had been [BAPTISED]

		--
		-- Robbery
		--

		Robbery_V2 perpetrator_np victim_np v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP victim_np)
		} ;
		-- <Perpetrator>[He] could have [ROBBED] <Victim>[someone]

		--
		-- Rotting
		--

		Rotting_V undergoer_np v = lin Clause {
			np = fromMaybe NP emptyNP undergoer_np ;
			vp = mkVP v
		} ;
		-- <Undergoer>[the fruit] to [ROT]

		--
		-- Ruling_legally
		--

		Ruling_legally_VS authority_np finding_s vs = lin Clause {
			np = fromMaybe NP emptyNP authority_np ;
			vp = mkVP vs (fromMaybe S emptyS finding_s)
		} ;
		-- <Authority>[the High Court] [RULED] <Finding>[it was illegal]

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
		-- Scouring
		--

		Scouring_V2 ground_np searcher_np v2 = lin Clause {
			np = fromMaybe NP emptyNP searcher_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP ground_np)
		} ;
		-- <Searcher>[Dorothy James] has [SCOURED] <Ground>[the country]

		--
		-- Seeking
		--

		Seeking_V cognizer_agent_np sought_entity_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv sought_entity_adv)
		} ;
		-- <Cognizer_agent>[I] [FUMBLED] <Sought_entity>[for my gun]

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
		-- <Self_mover>[She] [SWAM] <Area>[around]

		Self_motion_V_2 direction_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv direction_adv)
		} ;
		-- <Self_mover>[she] [WALKED] <Direction>[towards the staircase]

		Self_motion_V_3 goal_adv self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Self_mover>[it] [SWIMS] <Goal>[in]

		Self_motion_V_4 path_adv self_mover_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Self_mover>[Some of the dogs] , too , had slithered down from the bank and were [SWIMMING] <Source>[out] <Path>[towards the boar]

		--
		-- Sending
		--

		Sending_V2 recipient_adv sender_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP sender_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv recipient_adv)
		} ;
		-- <Sender>[Univel Inc] will [SHIP] <Theme>[the English language version of UnixWare , its shrink-wrapped SVR4.2-based operating system ,] on 30th November <Recipient>[to European distributors]

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
		-- <Agent>[the Provisionals and the property owners] [SPLIT] <Part_1>[the profit] <Part_2>[from the government compensation]

		Separating_V2_Pass parts_adv whole_np v2 = lin Clause {
			np = fromMaybe NP emptyNP whole_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv parts_adv)
		} ;
		-- <Whole>[the Empire] was finally [SPLIT] up <Parts>[into an eastern and a western part]

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
		-- <Kindler>[I] would have [LIT] <Flame>[the fire]

		Setting_fire_V2_2 flammables_np kindler_np v2 = lin Clause {
			np = fromMaybe NP emptyNP kindler_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP flammables_np)
		} ;
		-- <Kindler>[Foley] [LIT] <Flammables>[a match]

		--
		-- Setting_out
		--

		Setting_out_V self_mover_np v = lin Clause {
			np = fromMaybe NP emptyNP self_mover_np ;
			vp = mkVP v
		} ;
		-- <Self_mover>[I] [SET] [off]

		--
		-- Shoot_projectiles
		--

		Shoot_projectiles_V2 agent_np projectile_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP projectile_np)
		} ;
		-- <Agent>[who] had [FIRED] <Projectile>[the fatal arrow]

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
		-- <Agent>[she] did her best to [SILENCE] <Speaker>[them]

		--
		-- Similarity
		--

		Similarity_V entity_1_np entity_2_adv v = lin Clause {
			np = fromMaybe NP emptyNP entity_1_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv entity_2_adv)
		} ;
		-- <Entity_1>[West Germany] [DIFFERS] <Entity_2>[from both France and Britain]

		--
		-- Sleep
		--

		Sleep_V sleeper_np v = lin Clause {
			np = fromMaybe NP emptyNP sleeper_np ;
			vp = mkVP v
		} ;
		-- <Sleeper>[Darnley] [SLEPT]

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
		-- <Agent>[I] [SOAKED] <Theme>[it] <Medium>[in biological liquid]

		--
		-- Soaking_up
		--

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
		-- <Sound>[Big Ben 's bongs] [REVERBERATE]

		--
		-- Speak_on_topic
		--

		Speak_on_topic_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[he] [LECTURED] <Topic>[on " The Music of Poetry "]

		--
		-- Spelling_and_pronouncing
		--

		Spelling_and_pronouncing_V2 sign_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP sign_np)
		} ;
		-- <Speaker>[you] [PRONOUNCE] <Sign>[it]

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
		-- <Speaker>[I] [SAID] <Message>[no]

		Statement_V_2 speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[a three-man commission] to [REPORT] <Topic>[on " the nature , extent and magnitude " of construction work on the disputed site of Ayodhya]

		Statement_V2 medium_np message_np v2 = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Medium>[The Times] [NOTED] <Message>[` fruit trees which had begun to blossom after having long ceased "]

		Statement_VS_1 medium_np message_s vs = lin Clause {
			np = fromMaybe NP emptyNP medium_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Medium>[the memo] [SAID] , <Message>[there was no confirmed reporting on Saddam cooperating with Bin Ladin on unconventional weapons]

		Statement_VS_2 message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[I] [SAID] <Message>[the United Nations]

		Statement_VV message_vp speaker_np vv = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vv (fromMaybe VP emptyVP message_vp)
		} ;
		-- <Speaker>[you] [REPORTED] <Message>[finding a body]

		Statement_V2_Pass speaker_np v2 = lin Clause {
			np = emptyNP ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP speaker_np))
		} ;
		-- [CAUTIONED] <Speaker>[by the superintendent]

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
		-- <Student>[a student] [STUDYING] <Institution>[at Oxford]

		Studying_V2 student_np subject_np v2 = lin Clause {
			np = fromMaybe NP emptyNP student_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP subject_np)
		} ;
		-- <Student>[I] [STUDIED] <Subject>[homoeopathy]

		--
		-- Suasion
		--

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
		-- <Addressee>[Northern Ireland] treated the election as a referendum on the power-sharing system and was [CONVINCED] <Speaker>[by the loyalists]

		--
		-- Submitting_documents
		--

		Submitting_documents_V2 authority_adv documents_np submittor_np v2 = lin Clause {
			np = fromMaybe NP emptyNP submittor_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP documents_np)) (fromMaybe Adv emptyAdv authority_adv)
		} ;
		-- <Submittor>[It] [FILED] <Documents>[a petition] <Authority>[to the US Trade Representative]

		--
		-- Success_or_failure
		--

		Success_or_failure_V agent_np goal_adv v = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[we] always [SUCCEEDED] <Goal>[in this aim]

		Success_or_failure_VV agent_np goal_vp vv = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP vv (fromMaybe VP emptyVP goal_vp)
		} ;
		-- <Agent>[The Government] have [FAILED] <Goal>[to tackle or prevent crime]

		Success_or_failure_V2_Pass agent_np goal_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)) (fromMaybe Adv emptyAdv goal_adv)
		} ;
		-- <Agent>[The plaintiff] [SUCCEEDED] <Goal>[in her action]

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
		-- <Means>[the bid] [SUCCEEDS]

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
		-- <Item>[A draw] could [SUFFICE] <Enabled_situation>[for Barcelona]

		--
		-- Supply
		--

		Supply_V2 recipient_np supplier_np v2 = lin Clause {
			np = fromMaybe NP emptyNP supplier_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP recipient_np)
		} ;
		-- <Supplier>[they] [SUPPLIED] <Recipient>[us]

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
		-- <Supporter>[the chain] [SUPPORTING] <Supported>[a wooden or iron flail sprouting spikes]

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

		Surrendering_possession_V2 surrenderer_np theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP surrenderer_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP theme_np)
		} ;
		-- <Surrenderer>[I] shall [RELINQUISH] <Theme>[my claim]

		--
		-- Take_place_of
		--

		Take_place_of_V2 new_np old_np role_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP new_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP old_np)) (fromMaybe Adv emptyAdv role_adv)
		} ;
		-- <New>[cotton] had [REPLACED] <Old>[wool] <Role>[as Britain 's leading export]

		Take_place_of_V2_Pass new_np old_np v2 = lin Clause {
			np = fromMaybe NP emptyNP old_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep (fromMaybe NP emptyNP new_np))
		} ;
		-- <Old>[words] are [REPLACED] <New>[by integers]

		--
		-- Taking
		--

		Taking_V2 agent_np source_adv theme_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP theme_np)) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Agent>[they] attempted to [SEIZE] <Theme>[explosives] <Source>[from a quarry]

		--
		-- Telling
		--

		Telling_V speaker_np topic_adv v = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv topic_adv)
		} ;
		-- <Speaker>[many people] [TELL] <Topic>[of brief experiences of déjà vu]

		Telling_V2 message_np speaker_np v2 = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP message_np)
		} ;
		-- <Speaker>[You] [TOLD] <Message>[a fib]

		Telling_VS message_s speaker_np vs = lin Clause {
			np = fromMaybe NP emptyNP speaker_np ;
			vp = mkVP vs (fromMaybe S emptyS message_s)
		} ;
		-- <Speaker>[we] strongly [ADVISE] <Message>[you consider Gold Cover]

		--
		-- Temporary_stay
		--

		Temporary_stay_V_1 guest_np host_adv v = lin Clause {
			np = fromMaybe NP emptyNP guest_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv host_adv)
		} ;
		-- <Guest>[I] was [STAYING] <Host>[with a friend]

		Temporary_stay_V_2 guest_np location_adv v = lin Clause {
			np = fromMaybe NP emptyNP guest_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv location_adv)
		} ;
		-- <Guest>[I] [STAYED] <Location>[at the Hotel Corrieu]

		--
		-- Text_creation
		--

		Text_creation_V author_adv v = lin Clause {
			np = emptyNP ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv author_adv)
		} ;
		-- [DRAFTED] <Author>[by Parents against Tobacco]

		Text_creation_V2 author_np text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP author_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP text_np)
		} ;
		-- <Author>[I] [WRITE] <Text>[my diary]

		Text_creation_V2_Pass text_np v2 = lin Clause {
			np = fromMaybe NP emptyNP text_np ;
			vp = mkVP (passiveVP v2) (mkAdv by8agent_Prep emptyNP)
		} ;
		-- <Text>[This passionate article] was [WRITTEN]

		--
		-- Theft
		--

		Theft_V perpetrator_np source_adv v = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)
		} ;
		-- <Perpetrator>[Everyone I know] [NICKS] <Source>[from shops]

		Theft_V2 goods_np perpetrator_np victim_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP perpetrator_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP goods_np)) (fromMaybe Adv emptyAdv victim_adv)
		} ;
		-- <Perpetrator>[We] did n't [NICK] <Goods>[the riff] <Victim>[from ` Elves "]

		--
		-- Thriving
		--

		Thriving_V entity_np v = lin Clause {
			np = fromMaybe NP emptyNP entity_np ;
			vp = mkVP v
		} ;
		-- <Entity>[probation] was [THRIVING]

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
		-- <Preventing_cause>[her policies] [THWARTED] <Action>[these energies]

		Thwarting_V2_2 preventing_cause_np protagonist_np v2 = lin Clause {
			np = fromMaybe NP emptyNP preventing_cause_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP protagonist_np)
		} ;
		-- <Preventing_cause>[she] unintentionally [THWARTS] <Protagonist>[me]

		--
		-- Topic
		--

		Topic_V2 text_np topic_np v2 = lin Clause {
			np = fromMaybe NP emptyNP text_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP topic_np)
		} ;
		-- <Text>[This article] [DISCUSSES] <Topic>[these issues]

		--
		-- Travel
		--

		Travel_V traveler_np v = lin Clause {
			np = fromMaybe NP emptyNP traveler_np ;
			vp = mkVP v
		} ;
		-- <Traveler>[you] [TRAVEL]

		--
		-- Traversing
		--

		Traversing_V path_adv source_adv theme_np v = lin Clause {
			np = fromMaybe NP emptyNP theme_np ;
			vp = mkVP (mkVP (mkVP v) (fromMaybe Adv emptyAdv source_adv)) (fromMaybe Adv emptyAdv path_adv)
		} ;
		-- <Theme>[Its ancestors] [CROSSED] <Source>[from mainland Asia] <Path>[on a long-vanished land bridge]

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
		-- <Entity>[The pendulum] has [SWUNG]

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
		-- <Wearer>[he] [TOOK] <Clothing>[it] [off]

		--
		-- Use_firearm
		--

		Use_firearm_V2 agent_np firearm_np v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP v2 (fromMaybe NP emptyNP firearm_np)
		} ;
		-- <Agent>[she] 'd [FIRED] <Firearm>[a pistol]

		--
		-- Using
		--

		Using_V2 agent_np instrument_np purpose_adv v2 = lin Clause {
			np = fromMaybe NP emptyNP agent_np ;
			vp = mkVP (mkVP v2 (fromMaybe NP emptyNP instrument_np)) (fromMaybe Adv emptyAdv purpose_adv)
		} ;
		-- <Agent>[you] [USE] <Instrument>[a serial file] <Purpose>[for information retrieval]

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
		-- <Sleeper>[they] [WAKE] <Sleep_state>[from sleep]

		--
		-- Waver_between_options
		--

		Waver_between_options_V_1 cognizer_np issue_adv v = lin Clause {
			np = fromMaybe NP emptyNP cognizer_np ;
			vp = mkVP (mkVP v) (fromMaybe Adv emptyAdv issue_adv)
		} ;
		-- <Cognizer>[people] have been [WAVERING] <Issue>[about giving us information]

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
		-- <Wearer>[he] [WEAR] <Clothing>[a corset]

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
		-- <Participant>[the firm] [PULLED OUT]

}
