abstract Patterns = Elements ** {

	fun

		Abandonment_V2 : Agent_NP -> Theme_NP -> V2 -> Clause ;
		Abandonment_V2_Pass : Theme_NP -> V2 -> Clause ;

		Abounding_with_V : Location_NP -> Theme_Adv -> V -> Clause ;

		Absorb_heat_V : Entity_NP -> Heat_source_Adv -> V -> Clause ;

		Abundance_V : Collection_NP -> Place_Adv -> V -> Clause ;

		Abusing_V2 : Abuser_NP -> Victim_NP -> V2 -> Clause ;

		Accomplishment_V2 : Agent_NP -> Goal_NP -> V2 -> Clause ;
		Accomplishment_V2_Pass : Goal_NP -> V2 -> Clause ;

		Achieving_first_V2 : Cognizer_NP -> New_idea_NP -> V2 -> Clause ;
		Achieving_first_VS : Cognizer_NP -> New_idea_S -> VS -> Clause ;

		Activity_finish_V2 : Activity_NP -> Agent_NP -> V2 -> Clause ;
		Activity_finish_V2_Pass : Activity_NP -> V2 -> Clause ;

		Activity_ongoing_VV : Activity_VP -> Agent_NP -> VV -> Clause ;

		Activity_pause_V2 : Activity_NP -> Agent_NP -> V2 -> Clause ;

		Activity_prepare_V : Activity_Adv -> Agent_NP -> V -> Clause ;

		Activity_resume_V2 : Activity_NP -> Agent_NP -> V2 -> Clause ;
		Activity_resume_V2_Pass : Activity_NP -> V2 -> Clause ;

		Activity_start_V : Activity_Adv -> V -> Clause ;
		Activity_start_V2 : Activity_NP -> Agent_NP -> V2 -> Clause ;
		Activity_start_VV : Activity_VP -> Agent_NP -> VV -> Clause ;
		Activity_start_V2_Pass : Activity_NP -> V2 -> Clause ;

		Activity_stop_V2 : Activity_NP -> Agent_NP -> V2 -> Clause ;
		Activity_stop_VV : Activity_VP -> Agent_NP -> VV -> Clause ;
		Activity_stop_V2_Pass : Activity_NP -> V2 -> Clause ;

		Adding_up_V2_1 : Numbers_NP -> V2 -> Clause ;
		Adding_up_V2_2 : Result_NP -> V2 -> Clause ;

		Adducing_V2 : Speaker_NP -> Specified_entity_NP -> V2 -> Clause ;
		Adducing_V2_Pass : Specified_entity_NP -> V2 -> Clause ;

		Adjusting_V : Part_NP -> V -> Clause ;
		Adjusting_V2_1 : Agent_NP -> Feature_NP -> V2 -> Clause ;
		Adjusting_V2_2 : Agent_NP -> Part_NP -> V2 -> Clause ;
		Adjusting_V2_Pass : Part_NP -> V2 -> Clause ;

		Adopt_selection_V2 : Agent_NP -> Value_NP -> V2 -> Clause ;
		Adopt_selection_V2_Pass : Value_NP -> V2 -> Clause ;

		Adorning_V2 : Location_NP -> Theme_NP -> V2 -> Clause ;
		Adorning_V2_Pass : Location_NP -> Theme_NP -> V2 -> Clause ;

		Aging_V : Entity_NP -> V -> Clause ;
		Aging_V2_Pass : Entity_NP -> V2 -> Clause ;

		Agree_or_refuse_to_act_VV : Proposed_action_VP -> Speaker_NP -> VV -> Clause ;

		Agriculture_V2 : Agriculturist_NP -> Ground_NP -> V2 -> Clause ;

		Aiming_V2 : Agent_NP -> Instrument_NP -> Targeted_Adv -> V2 -> Clause ;

		Amassing_V2 : Mass_theme_NP -> Recipient_NP -> V2 -> Clause ;
		Amassing_V2_Pass : Mass_theme_NP -> V2 -> Clause ;

		Amounting_to_V : Attribute_NP -> Value_Adv -> V -> Clause ;

		Appeal_V : Convict_NP -> Decision_Adv -> V -> Clause ;

		Apply_heat_V2_1 : Container_Adv -> Food_NP -> V2 -> Clause ;
		Apply_heat_V2_2 : Cook_NP -> Food_NP -> Heating_instrument_Adv -> V2 -> Clause ;
		Apply_heat_V2_3 : Food_NP -> Temperature_setting_Adv -> V2 -> Clause ;
		Apply_heat_V2_Pass : Food_NP -> V2 -> Clause ;

		Appointing_V2_Pass : Official_NP -> Role_Adv -> V2 -> Clause ;

		Arranging_V2 : Agent_NP -> Configuration_Adv -> Theme_NP -> V2 -> Clause ;

		Arrest_V2 : Authorities_NP -> Suspect_NP -> V2 -> Clause ;

		Arriving_V : Goal_Adv -> Theme_NP -> V -> Clause ;

		Assemble_V : Group_NP -> V -> Clause ;

		Assessing_V2 : Assessor_NP -> Phenomenon_NP -> V2 -> Clause ;
		Assessing_V2_Pass : Assessor_NP -> Phenomenon_NP -> V2 -> Clause ;

		Assistance_V2 : Benefited_party_NP -> Focal_entity_Adv -> Helper_NP -> V2 -> Clause ;
		Assistance_V2V : Benefited_party_NP -> Goal_VP -> Helper_NP -> V2V -> Clause ;

		Atonement_V2 : Agent_NP -> Wrong_NP -> V2 -> Clause ;
		Atonement_V2_Pass : Amends_Adv -> Wrong_NP -> V2 -> Clause ;

		Attaching_V2_1 : Agent_NP -> Goal_Adv -> Item_NP -> V2 -> Clause ;
		Attaching_V2_2 : Agent_NP -> Items_NP -> V2 -> Clause ;
		Attaching_V2_3 : Connector_Adv -> Goal_Adv -> Item_NP -> V2 -> Clause ;
		Attaching_V2_Pass : Connector_Adv -> Goal_Adv -> Item_NP -> V2 -> Clause ;

		Attack_V2 : Assailant_NP -> Victim_NP -> V2 -> Clause ;

		Attempt_V : Agent_NP -> Goal_Adv -> V -> Clause ;
		Attempt_VV : Agent_NP -> Goal_VP -> VV -> Clause ;

		Attempt_means_V2 : Agent_NP -> Means_NP -> V2 -> Clause ;
		Attempt_means_VV : Means_VP -> VV -> Clause ;

		Attempt_suasion_V : Content_Adv -> Speaker_NP -> V -> Clause ;
		Attempt_suasion_V2_1 : Addressee_NP -> Speaker_NP -> V2 -> Clause ;
		Attempt_suasion_V2_2 : Content_NP -> Speaker_NP -> V2 -> Clause ;

		Attending_V2 : Agent_NP -> Event_NP -> V2 -> Clause ;

		Avoiding_V2 : Agent_NP -> Undesirable_situation_NP -> V2 -> Clause ;
		Avoiding_VV : Agent_NP -> Undesirable_situation_VP -> VV -> Clause ;

		Awareness_V : Cognizer_NP -> Content_Adv -> V -> Clause ;
		Awareness_V2 : Cognizer_NP -> Content_NP -> V2 -> Clause ;
		Awareness_VS : Cognizer_NP -> Content_S -> VS -> Clause ;
		Awareness_VV : Cognizer_NP -> Content_VP -> VV -> Clause ;

		Be_in_agreement_on_assessment_V : Cognizer_1_NP -> Cognizer_2_Adv -> V -> Clause ;

		Beat_opponent_V2 : Loser_NP -> Winner_NP -> V2 -> Clause ;

		Become_silent_V : Speaker_NP -> V -> Clause ;

		Becoming_V : Entity_NP -> Final_state_Adv -> V -> Clause ;
		Becoming_V2 : Entity_NP -> Final_category_NP -> V2 -> Clause ;

		Becoming_a_member_V : Group_Adv -> New_member_NP -> V -> Clause ;
		Becoming_a_member_V2 : Group_NP -> New_member_NP -> V2 -> Clause ;

		Becoming_aware_V : Cognizer_NP -> Phenomenon_Adv -> V -> Clause ;
		Becoming_aware_V2 : Cognizer_NP -> Phenomenon_NP -> V2 -> Clause ;
		Becoming_aware_VQ : Cognizer_NP -> Phenomenon_QS -> VQ -> Clause ;
		Becoming_aware_VS : Phenomenon_S -> VS -> Clause ;

		Becoming_detached_V : Item_NP -> Source_Adv -> V -> Clause ;

		Becoming_dry_V : Entity_NP -> V -> Clause ;

		Becoming_separated_V : Parts_Adv -> Whole_NP -> V -> Clause ;

		Behind_the_scenes_V2_1 : Artist_NP -> Production_NP -> V2 -> Clause ;
		Behind_the_scenes_V2_2 : Artist_NP -> Scene_NP -> V2 -> Clause ;

		Being_attached_V : Goal_Adv -> Item_NP -> V -> Clause ;

		Being_born_V2_Pass : Child_NP -> V2 -> Clause ;

		Being_employed_V : Employee_NP -> Place_of_employment_Adv -> V -> Clause ;

		Being_located_V : Location_Adv -> Theme_NP -> V -> Clause ;

		Besieging_V2 : Assailant_NP -> Victim_NP -> V2 -> Clause ;

		Board_vehicle_V2 : Traveller_NP -> Vehicle_NP -> V2 -> Clause ;

		Body_movement_V : Agent_NP -> Body_part_Adv -> V -> Clause ;
		Body_movement_V2 : Agent_NP -> Body_part_NP -> V2 -> Clause ;

		Bond_maturation_V : Financial_instrument_NP -> V -> Clause ;

		Bragging_V : Speaker_NP -> Topic_Adv -> V -> Clause ;

		Breathing_V2 : Agent_NP -> Air_NP -> V2 -> Clause ;
		Breathing_V2_Pass : Air_NP -> V2 -> Clause ;

		Bringing_V2_1 : Agent_NP -> Goal_Adv -> Theme_NP -> V2 -> Clause ;
		Bringing_V2_2 : Carrier_NP -> Goal_Adv -> Theme_NP -> V2 -> Clause ;
		Bringing_V2_Pass : Path_Adv -> Theme_NP -> V2 -> Clause ;

		Building_V2_1 : Agent_NP -> Components_Adv -> Created_entity_NP -> V2 -> Clause ;
		Building_V2_2 : Agent_NP -> Components_NP -> V2 -> Clause ;

		Bungling_V2 : Agent_NP -> Patient_NP -> V2 -> Clause ;
		Bungling_V2_Pass : Patient_NP -> V2 -> Clause ;

		Carry_goods_V2 : Distributor_NP -> Goods_NP -> V2 -> Clause ;
		Carry_goods_V2_Pass : Goods_NP -> V2 -> Clause ;

		Catastrophe_V : Undergoer_NP -> Undesirable_Event_Adv -> V -> Clause ;
		Catastrophe_V2 : Undergoer_NP -> Undesirable_Event_NP -> V2 -> Clause ;

		Categorization_V2 : Cognizer_NP -> Item_NP -> V2 -> Clause ;
		Categorization_V2_Pass : Criteria_Adv -> Item_NP -> V2 -> Clause ;

		Causation_V : Cause_NP -> Effect_Adv -> V -> Clause ;
		Causation_V2_1 : Actor_NP -> Affected_Adv -> Effect_NP -> V2 -> Clause ;
		Causation_V2_2 : Actor_NP -> Affected_NP -> Effect_Adv -> V2 -> Clause ;
		Causation_V2_3 : Cause_NP -> Effect_NP -> V2 -> Clause ;
		Causation_V2V : Affected_NP -> Cause_NP -> Effect_VP -> V2V -> Clause ;

		Cause_change_V2_1 : Agent_NP -> Attribute_NP -> V2 -> Clause ;
		Cause_change_V2_2 : Agent_NP -> Entity_NP -> Final_category_Adv -> V2 -> Clause ;
		Cause_change_V2_3 : Cause_NP -> Entity_NP -> V2 -> Clause ;
		Cause_change_V2_Pass : Entity_NP -> Final_category_Adv -> V2 -> Clause ;

		Cause_change_of_consistency_V2 : Agent_NP -> Undergoer_NP -> V2 -> Clause ;
		Cause_change_of_consistency_V2_Pass : Undergoer_NP -> V2 -> Clause ;

		Cause_change_of_phase_V2 : Agent_NP -> Undergoer_NP -> V2 -> Clause ;
		Cause_change_of_phase_V2_Pass : Undergoer_NP -> V2 -> Clause ;

		Cause_change_of_strength_V2_1 : Agent_NP -> Patient_NP -> V2 -> Clause ;
		Cause_change_of_strength_V2_2 : Cause_NP -> Patient_NP -> V2 -> Clause ;
		Cause_change_of_strength_V2_Pass : Patient_NP -> V2 -> Clause ;

		Cause_emotion_V2 : Agent_NP -> Experiencer_NP -> V2 -> Clause ;
		Cause_emotion_V2_Pass : Experiencer_NP -> V2 -> Clause ;

		Cause_fluidic_motion_V2 : Agent_NP -> Fluid_NP -> Goal_Adv -> V2 -> Clause ;

		Cause_harm_V : Agent_NP -> Victim_Adv -> V -> Clause ;
		Cause_harm_V2 : Agent_NP -> Body_part_Adv -> Victim_NP -> V2 -> Clause ;
		Cause_harm_V2_Pass : Agent_NP -> Victim_NP -> V2 -> Clause ;

		Cause_impact_V : Agent_NP -> Impactee_Adv -> Impactor_Adv -> V -> Clause ;
		Cause_impact_V2_1 : Agent_NP -> Impactee_Adv -> Impactor_NP -> V2 -> Clause ;
		Cause_impact_V2_2 : Agent_NP -> Impactee_NP -> Impactor_Adv -> V2 -> Clause ;
		Cause_impact_V2_3 : Agent_NP -> Impactors_NP -> V2 -> Clause ;
		Cause_impact_V2_Pass : Impactor_NP -> V2 -> Clause ;

		Cause_motion_V : Theme_NP -> V -> Clause ;
		Cause_motion_V2_1 : Agent_NP -> Area_Adv -> Theme_NP -> V2 -> Clause ;
		Cause_motion_V2_2 : Agent_NP -> Goal_Adv -> Source_Adv -> Theme_NP -> V2 -> Clause ;
		Cause_motion_V2_3 : Agent_NP -> Path_Adv -> Theme_NP -> V2 -> Clause ;
		Cause_motion_V2_4 : Cause_NP -> Goal_Adv -> Theme_NP -> V2 -> Clause ;
		Cause_motion_V3 : Agent_NP -> Theme_NP -> V3 -> Clause ;
		Cause_motion_V2_Pass : Theme_NP -> V2 -> Clause ;

		Cause_temperature_change_V2_1 : Agent_NP -> Hot_Cold_source_Adv -> Item_NP -> V2 -> Clause ;
		Cause_temperature_change_V2_2 : Cause_NP -> Item_NP -> V2 -> Clause ;

		Cause_to_amalgamate_V2_1 : Agent_NP -> Part_1_NP -> Part_2_Adv -> V2 -> Clause ;
		Cause_to_amalgamate_V2_2 : Agent_NP -> Parts_NP -> Whole_Adv -> V2 -> Clause ;
		Cause_to_amalgamate_V2_Pass : Part_1_NP -> Part_2_Adv -> V2 -> Clause ;

		Cause_to_be_dry_V2_1 : Agent_NP -> Dryee_NP -> V2 -> Clause ;
		Cause_to_be_dry_V2_2 : Cause_NP -> Dryee_NP -> V2 -> Clause ;
		Cause_to_be_dry_V2_Pass : Dryee_NP -> V2 -> Clause ;

		Cause_to_be_included_V2 : Agent_NP -> Group_Adv -> New_member_NP -> V2 -> Clause ;
		Cause_to_be_included_V2_Pass : Group_Adv -> New_member_NP -> V2 -> Clause ;

		Cause_to_be_sharp_V2 : Agent_NP -> Patient_NP -> V2 -> Clause ;

		Cause_to_be_wet_V2 : Agent_NP -> Liquid_Adv -> Undergoer_NP -> V2 -> Clause ;
		Cause_to_be_wet_V2_Pass : Liquid_Adv -> Undergoer_NP -> V2 -> Clause ;

		Cause_to_continue_VV : Agent_NP -> Process_VP -> VV -> Clause ;

		Cause_to_end_V2_1 : Agent_NP -> Process_NP -> V2 -> Clause ;
		Cause_to_end_V2_2 : Agent_NP -> State_NP -> V2 -> Clause ;

		Cause_to_experience_V2 : Agent_NP -> Experiencer_NP -> V2 -> Clause ;

		Cause_to_fragment_V2 : Agent_NP -> Whole_patient_NP -> V2 -> Clause ;

		Cause_to_make_noise_V2 : Agent_NP -> Sound_maker_NP -> V2 -> Clause ;

		Cause_to_make_progress_V2 : Agent_NP -> Project_NP -> V2 -> Clause ;
		Cause_to_make_progress_V2_Pass : Project_NP -> V2 -> Clause ;

		Cause_to_move_in_place_V2 : Agent_NP -> Theme_NP -> V2 -> Clause ;
		Cause_to_move_in_place_V2_Pass : Theme_NP -> V2 -> Clause ;

		Cause_to_perceive_V2 : Phenomenon_NP -> V2 -> Clause ;

		Cause_to_resume_V2 : Agent_NP -> Process_NP -> V2 -> Clause ;

		Cause_to_start_V2 : Cause_NP -> Effect_NP -> V2 -> Clause ;
		Cause_to_start_V2_Pass : Cause_NP -> Effect_NP -> V2 -> Clause ;

		Cause_to_wake_V2_1 : Agent_NP -> Sleeper_NP -> V2 -> Clause ;
		Cause_to_wake_V2_2 : Cause_NP -> Sleeper_NP -> V2 -> Clause ;

		Ceasing_to_be_V : Entity_NP -> V -> Clause ;
		Ceasing_to_be_V2_Pass : Entity_NP -> V2 -> Clause ;

		Certainty_V : Cognizer_NP -> Content_Adv -> V -> Clause ;
		Certainty_VS : Cognizer_NP -> Content_S -> VS -> Clause ;

		Change_direction_V : Direction_Adv -> Theme_NP -> V -> Clause ;

		Change_event_duration_V2_1 : Agent_NP -> Event_NP -> V2 -> Clause ;
		Change_event_duration_V2_2 : Cause_NP -> Event_NP -> V2 -> Clause ;

		Change_event_time_V2 : Cause_NP -> Event_NP -> V2 -> Clause ;
		Change_event_time_V2_Pass : Event_NP -> V2 -> Clause ;

		Change_of_consistency_V : Undergoer_NP -> V -> Clause ;

		Change_of_leadership_V2_1 : New_leader_NP -> Role_Adv -> Selector_NP -> V2 -> Clause ;
		Change_of_leadership_V2_2 : Old_order_NP -> Selector_NP -> V2 -> Clause ;

		Change_of_phase_V : Undergoer_NP -> V -> Clause ;

		Change_of_quantity_of_possession_V2 : Owner_NP -> Possession_NP -> V2 -> Clause ;

		Change_operational_state_V2_1 : Agent_NP -> Device_NP -> V2 -> Clause ;
		Change_operational_state_V2_2 : Cause_NP -> Device_NP -> V2 -> Clause ;

		Change_position_on_a_scale_V_1 : Attribute_NP -> V -> Clause ;
		Change_position_on_a_scale_V_2 : Item_NP -> V -> Clause ;

		Change_posture_V : Protagonist_NP -> V -> Clause ;

		Change_tool_V : Agent_NP -> New_tool_Adv -> V -> Clause ;

		Chatting_V_1 : Interlocutor_1_NP -> Interlocutor_2_Adv -> V -> Clause ;
		Chatting_V_2 : Interlocutors_NP -> V -> Clause ;

		Choosing_V2 : Chosen_NP -> Cognizer_NP -> Possibilities_Adv -> V2 -> Clause ;
		Choosing_VV : Chosen_VP -> Cognizer_NP -> VV -> Clause ;
		Choosing_V2_Pass : Chosen_NP -> V2 -> Clause ;

		Claim_ownership_V2 : Claimant_NP -> Property_NP -> V2 -> Clause ;

		Closure_V2_1 : Agent_NP -> Container_portal_NP -> V2 -> Clause ;
		Closure_V2_2 : Agent_NP -> Containing_object_NP -> V2 -> Clause ;
		Closure_V2_3 : Containing_object_NP -> Fastener_Adv -> V2 -> Clause ;
		Closure_V2_Pass : Containing_object_NP -> V2 -> Clause ;

		Cogitation_V : Cognizer_NP -> Topic_Adv -> V -> Clause ;
		Cogitation_VQ : Cognizer_NP -> Topic_QS -> VQ -> Clause ;
		Cogitation_VS : Cognizer_NP -> Topic_S -> VS -> Clause ;

		Collaboration_V_1 : Partner_1_NP -> Partner_2_Adv -> Undertaking_Adv -> V -> Clause ;
		Collaboration_V_2 : Partners_NP -> Undertaking_Adv -> V -> Clause ;

		Come_together_V_1 : Configuration_NP -> V -> Clause ;
		Come_together_V_2 : Party_1_NP -> Party_2_Adv -> V -> Clause ;
		Come_together_V2_Pass : Individuals_NP -> V2 -> Clause ;

		Coming_to_be_V : Entity_NP -> V -> Clause ;

		Coming_to_believe_V2 : Content_NP -> V2 -> Clause ;
		Coming_to_believe_VS : Cognizer_NP -> Content_S -> VS -> Clause ;
		Coming_to_believe_VV : Cognizer_NP -> Content_VP -> VV -> Clause ;

		Coming_up_with_V2 : Cognizer_NP -> Idea_NP -> V2 -> Clause ;
		Coming_up_with_V2_Pass : Idea_NP -> V2 -> Clause ;

		Commerce_buy_V2 : Buyer_NP -> Goods_NP -> V2 -> Clause ;

		Commerce_collect_V2 : Buyer_NP -> Seller_NP -> V2 -> Clause ;

		Commerce_pay_V2_1 : Buyer_NP -> Goods_Adv -> Money_NP -> V2 -> Clause ;
		Commerce_pay_V2_2 : Buyer_NP -> Goods_NP -> V2 -> Clause ;

		Commerce_sell_V : Goods_NP -> V -> Clause ;
		Commerce_sell_V2 : Buyer_Adv -> Goods_NP -> Seller_NP -> V2 -> Clause ;
		Commerce_sell_V2_Pass : Goods_NP -> V2 -> Clause ;

		Commitment_V : Message_Adv -> Speaker_NP -> V -> Clause ;
		Commitment_VS : Addressee_Adv -> Message_S -> Speaker_NP -> VS -> Clause ;
		Commitment_VV : Message_VP -> Speaker_NP -> VV -> Clause ;

		Committing_crime_V2_Pass : Crime_NP -> V2 -> Clause ;

		Communication_V2_1 : Communicator_NP -> Message_NP -> V2 -> Clause ;
		Communication_V2_2 : Medium_NP -> Message_NP -> V2 -> Clause ;
		Communication_VS : Communicator_NP -> Message_S -> VS -> Clause ;

		Communication_manner_V : Speaker_NP -> Topic_Adv -> V -> Clause ;
		Communication_manner_V2 : Addressee_Adv -> Message_NP -> Speaker_NP -> V2 -> Clause ;

		Communication_means_V : Addressee_Adv -> Communicator_NP -> V -> Clause ;
		Communication_means_V2_1 : Addressee_Adv -> Message_NP -> V2 -> Clause ;
		Communication_means_V2_2 : Addressee_NP -> V2 -> Clause ;
		Communication_means_V2_3 : Communicator_NP -> Message_NP -> V2 -> Clause ;

		Communication_noise_V2 : Message_NP -> Speaker_NP -> V2 -> Clause ;
		Communication_noise_VS : Message_S -> Speaker_NP -> VS -> Clause ;

		Communication_response_V : Speaker_NP -> Trigger_Adv -> V -> Clause ;
		Communication_response_VS : Message_S -> Speaker_NP -> VS -> Clause ;

		Commutation_V2 : Executive_authority_NP -> Original_punishment_NP -> V2 -> Clause ;
		Commutation_V2_Pass : Original_punishment_NP -> V2 -> Clause ;

		Compatibility_V : Item_1_NP -> Item_2_Adv -> V -> Clause ;
		Compatibility_V2_Pass : Item_1_NP -> Item_2_Adv -> V2 -> Clause ;

		Competition_V_1 : Competition_Adv -> Participants_NP -> V -> Clause ;
		Competition_V_2 : Participant_1_NP -> Participant_2_Adv -> V -> Clause ;

		Complaining_V_1 : Complainer_NP -> Complaint_Adv -> V -> Clause ;
		Complaining_V_2 : Complainer_NP -> Topic_Adv -> V -> Clause ;
		Complaining_V2 : Complainer_NP -> Complaint_NP -> V2 -> Clause ;

		Compliance_V : Norm_Adv -> V -> Clause ;
		Compliance_V2 : Norm_NP -> Protagonist_NP -> V2 -> Clause ;

		Conduct_V : Agent_NP -> Manner_Adv -> V -> Clause ;

		Confronting_problem_V2 : Agent_NP -> Issue_NP -> V2 -> Clause ;

		Conquering_V : Conqueror_Adv -> Theme_NP -> V -> Clause ;
		Conquering_V2 : Conqueror_NP -> Theme_NP -> V2 -> Clause ;

		Contacting_V2 : Address_Adv -> Addressee_NP -> Communicator_NP -> V2 -> Clause ;

		Containing_V2 : Container_NP -> Contents_NP -> V2 -> Clause ;

		Contingency_V : Determinant_Adv -> Outcome_NP -> V -> Clause ;

		Contrition_V : Action_Adv -> Experiencer_NP -> V -> Clause ;

		Convey_importance_V2 : Medium_NP -> Message_NP -> V2 -> Clause ;
		Convey_importance_VS : Message_S -> Speaker_NP -> VS -> Clause ;
		Convey_importance_V2_Pass : Message_NP -> V2 -> Clause ;

		Cooking_creation_V : Produced_food_NP -> V -> Clause ;
		Cooking_creation_V2 : Cook_NP -> Produced_food_NP -> V2 -> Clause ;
		Cooking_creation_V2_Pass : Produced_food_NP -> V2 -> Clause ;

		Corroding_V : Undergoer_NP -> V -> Clause ;

		Cotheme_V2_1 : Cotheme_NP -> Direction_Adv -> Theme_NP -> V2 -> Clause ;
		Cotheme_V2_2 : Cotheme_NP -> Goal_Adv -> Theme_NP -> V2 -> Clause ;
		Cotheme_V2_3 : Cotheme_NP -> Path_Adv -> Theme_NP -> V2 -> Clause ;
		Cotheme_V2_4 : Cotheme_NP -> Source_Adv -> Theme_NP -> V2 -> Clause ;
		Cotheme_V2_Pass : Cotheme_NP -> Theme_NP -> V2 -> Clause ;

		Court_examination_V2 : Witness_NP -> V2 -> Clause ;

		Create_physical_artwork_V2 : Creator_NP -> Representation_NP -> V2 -> Clause ;

		Create_representation_V2 : Creator_NP -> Represented_NP -> V2 -> Clause ;
		Create_representation_V2_Pass : Creator_NP -> Represented_NP -> V2 -> Clause ;

		Creating_V2_1 : Cause_NP -> Created_entity_NP -> V2 -> Clause ;
		Creating_V2_2 : Created_entity_NP -> Creator_NP -> V2 -> Clause ;

		Criminal_investigation_V2 : Incident_NP -> Investigator_NP -> V2 -> Clause ;

		Cutting_V2 : Agent_NP -> Item_NP -> V2 -> Clause ;
		Cutting_V2_Pass : Item_NP -> V2 -> Clause ;

		Damaging_V2_1 : Agent_NP -> Patient_NP -> V2 -> Clause ;
		Damaging_V2_2 : Cause_NP -> Patient_NP -> V2 -> Clause ;

		Daring_V2 : Action_NP -> Agent_NP -> V2 -> Clause ;
		Daring_VV : Action_VP -> Agent_NP -> VV -> Clause ;

		Death_V : Protagonist_NP -> V -> Clause ;

		Deciding_VV : Cognizer_NP -> Decision_VP -> VV -> Clause ;

		Delimitation_of_diversity_V : Limit1_Adv -> Limit2_Adv -> Variable_NP -> V -> Clause ;

		Delivery_V2 : Deliverer_NP -> Recipient_Adv -> Theme_NP -> V2 -> Clause ;
		Delivery_V2_Pass_1 : Goal_Adv -> Theme_NP -> V2 -> Clause ;
		Delivery_V2_Pass_2 : Recipient_Adv -> Theme_NP -> V2 -> Clause ;

		Deny_permission_V2V : Action_VP -> Authority_NP -> Protagonist_NP -> V2V -> Clause ;

		Departing_V2 : Source_NP -> Theme_NP -> V2 -> Clause ;

		Deserving_V2 : Action_NP -> State_of_affairs_NP -> V2 -> Clause ;

		Desiring_V : Experiencer_NP -> Focal_participant_Adv -> V -> Clause ;
		Desiring_V2 : Experiencer_NP -> Focal_participant_NP -> V2 -> Clause ;
		Desiring_VV : Event_VP -> Experiencer_NP -> VV -> Clause ;

		Destroying_V2_1 : Cause_NP -> Undergoer_NP -> V2 -> Clause ;
		Destroying_V2_2 : Destroyer_NP -> Undergoer_NP -> V2 -> Clause ;
		Destroying_V2_Pass_1 : Destroyer_NP -> V2 -> Clause ;
		Destroying_V2_Pass_2 : Undergoer_NP -> V2 -> Clause ;

		Detaching_V2 : Agent_NP -> Item_NP -> Source_Adv -> V2 -> Clause ;
		Detaching_V2_Pass : Item_NP -> V2 -> Clause ;

		Detaining_V2 : Authorities_NP -> Suspect_NP -> V2 -> Clause ;
		Detaining_V2_Pass : Suspect_NP -> V2 -> Clause ;

		Differentiation_V2_1 : Cognizer_NP -> Phenomena_NP -> V2 -> Clause ;
		Differentiation_V2_2 : Phenomenon_1_NP -> Phenomenon_2_Adv -> V2 -> Clause ;
		Differentiation_V2_Pass : Phenomena_NP -> V2 -> Clause ;

		Discussion_V : Interlocutors_NP -> Topic_Adv -> V -> Clause ;

		Dispersal_V2 : Agent_NP -> Individuals_NP -> V2 -> Clause ;

		Distinctiveness_V2 : Entity_NP -> Feature_NP -> V2 -> Clause ;

		Dodging_V2 : Bad_entity_NP -> Dodger_NP -> V2 -> Clause ;

		Dominate_competitor_V2 : Agent_NP -> Patient_NP -> V2 -> Clause ;

		Dominate_situation_V2 : Agent_NP -> Situation_NP -> V2 -> Clause ;

		Dressing_V : Clothing_Adv -> Wearer_NP -> V -> Clause ;
		Dressing_V2 : Clothing_NP -> Wearer_NP -> V2 -> Clause ;

		Drop_in_on_V : Visitor_NP -> V -> Clause ;

		Dunking_V2 : Agent_NP -> Substance_Adv -> Theme_NP -> V2 -> Clause ;

		Duplication_V2 : Creator_NP -> Original_NP -> V2 -> Clause ;
		Duplication_V2_Pass : Original_NP -> V2 -> Clause ;

		Duration_relation_V_1 : Duration_Adv -> Eventuality_NP -> V -> Clause ;
		Duration_relation_V_2 : Entity_NP -> V -> Clause ;

		Earnings_and_losses_V : Earner_NP -> Earnings_Adv -> V -> Clause ;
		Earnings_and_losses_V2 : Earner_NP -> Earnings_NP -> V2 -> Clause ;

		Eclipse_V : Eclipsed_NP -> Obstruction_Adv -> V -> Clause ;
		Eclipse_V2 : Eclipsed_NP -> Obstruction_NP -> V2 -> Clause ;
		Eclipse_V2_Pass : Eclipsed_NP -> V2 -> Clause ;

		Education_teaching_V : Qualification_Adv -> Student_NP -> V -> Clause ;
		Education_teaching_V2_1 : Role_Adv -> Student_NP -> Teacher_NP -> V2 -> Clause ;
		Education_teaching_V2_2 : Student_NP -> Subject_Adv -> V2 -> Clause ;
		Education_teaching_V2V : Skill_VP -> Student_NP -> V2V -> Clause ;

		Elusive_goal_V2 : Desired_goal_NP -> Experiencer_NP -> V2 -> Clause ;

		Emanating_V : Emission_NP -> Source_Adv -> V -> Clause ;

		Emitting_V2 : Emission_NP -> Source_emitter_NP -> V2 -> Clause ;
		Emitting_V2_Pass : Emission_NP -> V2 -> Clause ;

		Emotion_active_V : Experiencer_NP -> Topic_Adv -> V -> Clause ;

		Emotion_heat_V : Emotion_Adv -> Experiencer_NP -> V -> Clause ;

		Emotions_of_mental_activity_V : Experiencer_NP -> Stimulus_Adv -> V -> Clause ;

		Employing_V2 : Employee_NP -> Employer_NP -> V2 -> Clause ;
		Employing_V2_Pass : Employee_NP -> Employer_NP -> V2 -> Clause ;

		Emptying_V : Source_NP -> Theme_Adv -> V -> Clause ;
		Emptying_V2_1 : Agent_NP -> Source_NP -> Theme_Adv -> V2 -> Clause ;
		Emptying_V2_2 : Cause_NP -> Source_NP -> V2 -> Clause ;
		Emptying_V2_Pass : Source_NP -> Theme_Adv -> V2 -> Clause ;

		Encoding_V : Manner_Adv -> Message_NP -> V -> Clause ;
		Encoding_V2_Pass : Manner_Adv -> Message_NP -> V2 -> Clause ;

		Encounter_V2 : Party_1_NP -> Party_2_NP -> V2 -> Clause ;

		Endangering_V2 : Agent_NP -> Valued_entity_NP -> V2 -> Clause ;
		Endangering_V2_Pass : Valued_entity_NP -> V2 -> Clause ;

		Enforcing_V2 : Agent_NP -> Rule_NP -> V2 -> Clause ;

		Entering_of_plea_V : Accused_NP -> Charges_Adv -> Plea_Adv -> V -> Clause ;

		Escaping_V : Escapee_NP -> Undesirable_location_Adv -> V -> Clause ;

		Estimating_VS : Cognizer_NP -> Estimation_S -> VS -> Clause ;
		Estimating_VS_Pass : Estimation_S -> VS -> Clause ;

		Evading_V : Evader_NP -> Pursuer_Adv -> V -> Clause ;
		Evading_V2 : Evader_NP -> Pursuer_NP -> V2 -> Clause ;

		Evaluative_comparison_V : Attribute_Adv -> Profiled_item_NP -> Standard_item_Adv -> V -> Clause ;

		Event_V : Event_NP -> Place_Adv -> Time_Adv -> V -> Clause ;

		Evidence_V2 : Proposition_NP -> Support_NP -> V2 -> Clause ;
		Evidence_VQ : Proposition_QS -> Support_NP -> VQ -> Clause ;
		Evidence_VS : Proposition_S -> Support_NP -> VS -> Clause ;

		Evoking_V2 : Cognizer_NP -> Phenomenon_Adv -> Stimulus_NP -> V2 -> Clause ;

		Exchange_V2 : Exchanger_1_NP -> Exchanger_2_Adv -> Themes_NP -> V2 -> Clause ;
		Exchange_V2_Pass : Theme_1_NP -> Theme_2_Adv -> V2 -> Clause ;

		Exclude_member_V2 : Authority_NP -> Member_NP -> V2 -> Clause ;

		Excreting_V : Source_NP -> V -> Clause ;
		Excreting_V2 : Excreta_NP -> Excreter_NP -> V2 -> Clause ;

		Execute_plan_V2 : Agent_NP -> Plan_NP -> V2 -> Clause ;

		Execution_V2 : Executed_NP -> Executioner_NP -> V2 -> Clause ;
		Execution_V2_Pass : Executed_NP -> Executioner_NP -> V2 -> Clause ;

		Existence_V : Entity_NP -> V -> Clause ;
		Existence_V2_Pass : Entity_NP -> V2 -> Clause ;

		Expectation_VQ : Cognizer_NP -> Phenomenon_QS -> VQ -> Clause ;
		Expectation_VS_Pass : Phenomenon_S -> VS -> Clause ;

		Expensiveness_V : Asset_Adv -> Goods_NP -> V -> Clause ;

		Experience_bodily_harm_V2 : Body_part_NP -> Experiencer_NP -> V2 -> Clause ;

		Experiencer_focus_V : Content_Adv -> Experiencer_NP -> V -> Clause ;
		Experiencer_focus_V2 : Content_NP -> Experiencer_NP -> V2 -> Clause ;

		Experiencer_obj_V : Experiencer_Adv -> Stimulus_NP -> V -> Clause ;
		Experiencer_obj_V2 : Experiencer_NP -> Stimulus_NP -> V2 -> Clause ;
		Experiencer_obj_V2S : Experiencer_NP -> Stimulus_S -> V2S -> Clause ;
		Experiencer_obj_V2_Pass : Experiencer_NP -> Stimulus_NP -> V2 -> Clause ;
		Experiencer_obj_VS_Pass : Experiencer_NP -> Stimulus_S -> VS -> Clause ;

		Explaining_the_facts_VQ_1 : Fact_NP -> Question_QS -> VQ -> Clause ;
		Explaining_the_facts_VQ_2 : State_of_affairs_QS -> VQ -> Clause ;

		Exporting_V2_Pass : Goods_NP -> Importing_area_Adv -> V2 -> Clause ;

		Expressing_publicly_V2 : Communicator_NP -> Content_NP -> V2 -> Clause ;

		Extradition_V2 : Crime_jurisdiction_Adv -> Suspect_NP -> V2 -> Clause ;

		Fall_asleep_V : Sleeper_NP -> V -> Clause ;

		Familiarity_V2 : Cognizer_NP -> Entity_NP -> V2 -> Clause ;

		Feeling_V : Emotional_state_Adv -> Experiencer_NP -> V -> Clause ;
		Feeling_V2 : Emotion_NP -> V2 -> Clause ;

		Feigning_V2 : Agent_NP -> State_of_affairs_NP -> V2 -> Clause ;

		Filling_V2_1 : Agent_NP -> Goal_NP -> Theme_Adv -> V2 -> Clause ;
		Filling_V2_2 : Goal_Adv -> Theme_NP -> V2 -> Clause ;
		Filling_V2_Pass : Goal_NP -> Theme_Adv -> V2 -> Clause ;

		Finish_competition_V2 : Competition_NP -> Competitor_NP -> Opponent_Adv -> V2 -> Clause ;

		Finish_game_V : Player_NP -> V -> Clause ;

		Firing_V2 : Employee_NP -> Employer_NP -> V2 -> Clause ;
		Firing_V2_Pass : Employee_NP -> V2 -> Clause ;

		Fleeing_V_1 : Goal_Adv -> Self_mover_NP -> V -> Clause ;
		Fleeing_V_2 : Path_Adv -> Self_mover_NP -> Source_Adv -> V -> Clause ;

		Fluidic_motion_V_1 : Area_Adv -> Fluid_NP -> V -> Clause ;
		Fluidic_motion_V_2 : Fluid_NP -> Goal_Adv -> Path_Adv -> Source_Adv -> V -> Clause ;

		Forging_V2 : Agent_NP -> Forgery_NP -> V2 -> Clause ;

		Forgoing_V : Desirable_Adv -> Forgoer_NP -> V -> Clause ;
		Forgoing_VV : Desirable_VP -> Forgoer_NP -> VV -> Clause ;

		Forming_relationships_V_1 : Partner_1_NP -> Partner_2_Adv -> V -> Clause ;
		Forming_relationships_V_2 : Partners_NP -> V -> Clause ;
		Forming_relationships_V2 : Partner_1_NP -> Partner_2_NP -> V2 -> Clause ;

		Friction_V_1 : Static_object_Adv -> Theme_NP -> V -> Clause ;
		Friction_V_2 : Themes_NP -> V -> Clause ;

		Front_for_V : Front_NP -> V -> Clause ;

		Frugality_V2 : Resource_NP -> Resource_controller_NP -> V2 -> Clause ;

		Gathering_up_V2_1 : Agent_NP -> Aggregate_NP -> V2 -> Clause ;
		Gathering_up_V2_2 : Agent_NP -> Individuals_NP -> V2 -> Clause ;

		Gesture_V : Body_part_Adv -> Communicator_NP -> V -> Clause ;
		Gesture_V2 : Addressee_Adv -> Communicator_NP -> Message_NP -> V2 -> Clause ;
		Gesture_VS : Addressee_Adv -> Communicator_NP -> Message_S -> VS -> Clause ;
		Gesture_VV : Communicator_NP -> Message_VP -> VV -> Clause ;

		Get_a_job_V_1 : Employee_NP -> Employer_Adv -> V -> Clause ;
		Get_a_job_V_2 : Employee_NP -> Position_Adv -> V -> Clause ;

		Getting_V2 : Recipient_NP -> Theme_NP -> V2 -> Clause ;

		Getting_underway_V : Self_mover_NP -> V -> Clause ;

		Getting_up_V : Protagonist_NP -> V -> Clause ;

		Getting_vehicle_underway_V2 : Driver_NP -> Vehicle_NP -> V2 -> Clause ;

		Giving_V2 : Donor_NP -> Recipient_Adv -> Theme_NP -> V2 -> Clause ;

		Giving_in_V : Capitulator_NP -> Issue_Adv -> V -> Clause ;

		Go_into_shape_V : Theme_NP -> V -> Clause ;

		Going_back_on_a_commitment_V : Commitment_Adv -> Protagonist_NP -> V -> Clause ;

		Grant_permission_V2 : Action_NP -> Grantor_NP -> V2 -> Clause ;

		Grasp_V2 : Cognizer_NP -> Phenomenon_NP -> V2 -> Clause ;
		Grasp_VQ : Cognizer_NP -> Phenomenon_QS -> VQ -> Clause ;

		Grinding_V : Undergoer_NP -> V -> Clause ;
		Grinding_V2 : Grinder_NP -> Undergoer_NP -> V2 -> Clause ;

		Grooming_V : Body_part_NP -> V -> Clause ;
		Grooming_V2_1 : Agent_NP -> Body_part_NP -> V2 -> Clause ;
		Grooming_V2_2 : Agent_NP -> Patient_NP -> V2 -> Clause ;
		Grooming_V2_Pass : Body_part_NP -> V2 -> Clause ;

		Growing_food_V2 : Food_NP -> Grower_NP -> V2 -> Clause ;
		Growing_food_V2_Pass : Food_NP -> V2 -> Clause ;

		Hair_configuration_V : Hair_NP -> V -> Clause ;

		Halt_V : Theme_NP -> V -> Clause ;

		Have_as_requirement_V2 : Dependent_NP -> Requirement_NP -> V2 -> Clause ;

		Have_as_translation_equivalent_V : Source_symbol_NP -> Target_symbol_Adv -> V -> Clause ;

		Hear_V : Hearer_NP -> Topic_Adv -> V -> Clause ;
		Hear_V2 : Hearer_NP -> Message_NP -> V2 -> Clause ;
		Hear_VS : Hearer_NP -> Message_S -> VS -> Clause ;

		Heralding_V2 : Communicator_NP -> Event_NP -> V2 -> Clause ;

		Hiding_objects_V2 : Agent_NP -> Hidden_object_NP -> Hiding_place_Adv -> V2 -> Clause ;

		Hindering_V2_1 : Action_Adv -> Hindrance_NP -> Protagonist_NP -> V2 -> Clause ;
		Hindering_V2_2 : Action_NP -> Hindrance_NP -> V2 -> Clause ;

		Hiring_V2 : Employee_NP -> Employer_NP -> V2 -> Clause ;

		Hit_target_V2 : Agent_NP -> Target_NP -> V2 -> Clause ;

		Holding_off_on_VV : Agent_NP -> Desirable_action_VP -> VV -> Clause ;

		Hostile_encounter_V : Sides_NP -> V -> Clause ;

		Hunting_V : Hunter_NP -> V -> Clause ;

		Hunting_success_or_failure_V2 : Food_NP -> V2 -> Clause ;

		Imitating_V2_1 : Agent_NP -> Characteristic_NP -> Standard_Adv -> V2 -> Clause ;
		Imitating_V2_2 : Agent_NP -> Standard_NP -> V2 -> Clause ;

		Immobilization_V2 : Agent_NP -> Patient_NP -> V2 -> Clause ;

		Impact_V_1 : Impactee_Adv -> Impactor_NP -> V -> Clause ;
		Impact_V_2 : Impactee_NP -> V -> Clause ;
		Impact_V_3 : Impactors_NP -> V -> Clause ;
		Impact_V2 : Impactee_NP -> Impactor_NP -> V2 -> Clause ;

		Inclusion_V2 : Part_NP -> Total_NP -> V2 -> Clause ;

		Indicating_V2_1 : Communicator_NP -> Unresolved_referent_NP -> V2 -> Clause ;
		Indicating_V2_2 : Medium_NP -> Unresolved_referent_NP -> V2 -> Clause ;

		Ingest_substance_V : Ingestor_NP -> Substance_Adv -> V -> Clause ;
		Ingest_substance_V2_1 : Delivery_device_NP -> Ingestor_NP -> V2 -> Clause ;
		Ingest_substance_V2_2 : Ingestor_NP -> Substance_NP -> V2 -> Clause ;
		Ingest_substance_V2_Pass : Substance_NP -> V2 -> Clause ;

		Ingestion_V_1 : Ingestibles_Adv -> Ingestor_NP -> V -> Clause ;
		Ingestion_V_2 : Ingestibles_NP -> V -> Clause ;
		Ingestion_V2 : Ingestibles_NP -> Ingestor_NP -> V2 -> Clause ;
		Ingestion_V2_Pass : Ingestibles_NP -> V2 -> Clause ;

		Inhibit_movement_V : Holding_location_Adv -> Theme_NP -> V -> Clause ;
		Inhibit_movement_V2 : Agent_NP -> Theme_NP -> V2 -> Clause ;

		Inspecting_V2 : Ground_NP -> Inspector_NP -> V2 -> Clause ;
		Inspecting_V2_Pass : Ground_NP -> V2 -> Clause ;

		Installing_V2 : Agent_NP -> Component_NP -> Fixed_location_Adv -> V2 -> Clause ;

		Institutionalization_V2 : Authority_NP -> Patient_NP -> V2 -> Clause ;
		Institutionalization_V2_Pass : Patient_NP -> V2 -> Clause ;

		Intentional_traversing_V : Path_Adv -> Self_mover_NP -> V -> Clause ;
		Intentional_traversing_V2 : Path_NP -> Self_mover_NP -> V2 -> Clause ;

		Intentionally_affect_V : Agent_NP -> Patient_Adv -> V -> Clause ;

		Intentionally_create_V2 : Created_entity_NP -> Creator_NP -> V2 -> Clause ;
		Intentionally_create_V2_Pass : Created_entity_NP -> V2 -> Clause ;

		Intercepting_V2 : Interceptor_NP -> Theme_NP -> V2 -> Clause ;
		Intercepting_V2_Pass : Interceptor_NP -> Theme_NP -> V2 -> Clause ;

		Interrupt_process_V2_Pass : Cause_NP -> Process_NP -> V2 -> Clause ;

		Invading_V : Land_NP -> V -> Clause ;
		Invading_V2 : Invader_NP -> Land_NP -> V2 -> Clause ;

		Judgment_V2 : Cognizer_NP -> Evaluee_NP -> Reason_Adv -> V2 -> Clause ;

		Judgment_communication_V : Communicator_NP -> Evaluee_Adv -> V -> Clause ;
		Judgment_communication_V2 : Communicator_NP -> Evaluee_NP -> Reason_Adv -> V2 -> Clause ;

		Judgment_direct_address_V2 : Addressee_NP -> Communicator_NP -> Reason_Adv -> V2 -> Clause ;
		Judgment_direct_address_V2_Pass_1 : Addressee_NP -> Communicator_NP -> V2 -> Clause ;
		Judgment_direct_address_V2_Pass_2 : Addressee_NP -> Reason_Adv -> V2 -> Clause ;
		Judgment_direct_address_V2_Pass_3 : Addressee_NP -> Topic_Adv -> V2 -> Clause ;

		Justifying_V2_1 : Act_NP -> Agent_NP -> V2 -> Clause ;
		Justifying_V2_2 : Agent_NP -> State_of_affairs_NP -> V2 -> Clause ;

		Kidnapping_V2 : Perpetrator_NP -> Victim_NP -> V2 -> Clause ;

		Killing_V2_1 : Cause_NP -> Victim_NP -> V2 -> Clause ;
		Killing_V2_2 : Killer_NP -> Victim_NP -> V2 -> Clause ;

		Knot_creation_V2 : Agent_NP -> Knot_NP -> V2 -> Clause ;

		Labeling_V2 : Entity_NP -> Label_Adv -> Speaker_NP -> V2 -> Clause ;
		Labeling_V2_Pass : Entity_NP -> Label_Adv -> Speaker_NP -> V2 -> Clause ;

		Launch_process_V2 : Agent_NP -> Process_NP -> V2 -> Clause ;
		Launch_process_V2_Pass : Process_NP -> V2 -> Clause ;

		Leadership_V2_1 : Activity_NP -> Leader_NP -> V2 -> Clause ;
		Leadership_V2_2 : Governed_NP -> Leader_NP -> V2 -> Clause ;
		Leadership_V2_Pass : Governed_NP -> Leader_NP -> V2 -> Clause ;

		Linguistic_meaning_V2 : Form_NP -> Meaning_NP -> V2 -> Clause ;

		Lively_place_V : Activity_Adv -> Location_NP -> V -> Clause ;

		Locating_V2 : Perceiver_NP -> Sought_entity_NP -> V2 -> Clause ;

		Location_of_light_V : Figure_NP -> Ground_Adv -> V -> Clause ;

		Locative_relation_V2 : Figure_NP -> Ground_NP -> V2 -> Clause ;

		Losing_V2 : Owner_NP -> Possession_NP -> V2 -> Clause ;

		Losing_someone_V2 : Deceased_NP -> Sufferer_NP -> V2 -> Clause ;

		Make_agreement_on_action_V : Party_1_NP -> Party_2_Adv -> V -> Clause ;

		Make_cognitive_connection_V2 : Cognizer_NP -> Concept_1_NP -> Concept_2_Adv -> V2 -> Clause ;

		Make_noise_V : Noisy_event_NP -> V -> Clause ;
		Make_noise_V2 : Sound_NP -> Sound_source_NP -> V2 -> Clause ;

		Make_possible_to_do_V2 : Enabled_action_NP -> Enablement_NP -> V2 -> Clause ;
		Make_possible_to_do_VS : Enabled_action_S -> Enablement_NP -> VS -> Clause ;

		Making_faces_V : Agent_NP -> V -> Clause ;

		Manipulate_into_doing_V2_Pass : Resulting_action_Adv -> Victim_NP -> V2 -> Clause ;

		Manipulate_into_shape_V2 : Agent_NP -> Theme_NP -> V2 -> Clause ;

		Manipulation_V : Agent_NP -> Bodypart_of_agent_Adv -> Entity_Adv -> V -> Clause ;
		Manipulation_V2 : Agent_NP -> Bodypart_of_agent_Adv -> Entity_NP -> V2 -> Clause ;
		Manipulation_V2_Pass : Entity_NP -> V2 -> Clause ;

		Manufacturing_V2 : Factory_NP -> Product_NP -> V2 -> Clause ;

		Mass_motion_V_1 : Area_Adv -> Mass_theme_NP -> V -> Clause ;
		Mass_motion_V_2 : Direction_Adv -> Mass_theme_NP -> V -> Clause ;
		Mass_motion_V_3 : Goal_Adv -> Mass_theme_NP -> V -> Clause ;
		Mass_motion_V_4 : Mass_theme_NP -> Path_Adv -> V -> Clause ;
		Mass_motion_V_5 : Mass_theme_NP -> Source_Adv -> V -> Clause ;

		Meet_specifications_V2_1 : Agent_NP -> Standard_NP -> V2 -> Clause ;
		Meet_specifications_V2_2 : Entity_NP -> Standard_NP -> V2 -> Clause ;

		Meet_with_V2 : Party_1_NP -> Party_2_NP -> V2 -> Clause ;

		Meet_with_response_V2_Pass : Response_Adv -> Trigger_NP -> V2 -> Clause ;

		Memorization_V2 : Cognizer_NP -> Pattern_NP -> V2 -> Clause ;

		Memory_V2 : Cognizer_NP -> Content_NP -> V2 -> Clause ;
		Memory_VS : Cognizer_NP -> Content_S -> VS -> Clause ;

		Mention_V2 : Communicator_NP -> Specified_content_NP -> V2 -> Clause ;
		Mention_VS : Communicator_NP -> Message_S -> VS -> Clause ;
		Mention_V2_Pass : Specified_content_NP -> V2 -> Clause ;

		Misdeed_V : Wrongdoer_NP -> V -> Clause ;

		Motion_V_1 : Direction_Adv -> Theme_NP -> V -> Clause ;
		Motion_V_2 : Goal_Adv -> Source_Adv -> Theme_NP -> V -> Clause ;
		Motion_V_3 : Path_Adv -> Theme_NP -> V -> Clause ;

		Motion_directional_V_1 : Goal_Adv -> Theme_NP -> V -> Clause ;
		Motion_directional_V_2 : Path_Adv -> Theme_NP -> V -> Clause ;
		Motion_directional_V_3 : Source_Adv -> Theme_NP -> V -> Clause ;

		Motion_noise_V : Path_Adv -> Theme_NP -> V -> Clause ;
		Motion_noise_V2 : Path_NP -> Theme_NP -> V2 -> Clause ;

		Moving_in_place_V : Theme_NP -> V -> Clause ;

		Name_conferral_V2 : Entity_NP -> Speaker_NP -> V2 -> Clause ;
		Name_conferral_V2_Pass : Entity_NP -> Name_Adv -> Speaker_NP -> V2 -> Clause ;

		Needing_V2 : Cognizer_NP -> Requirement_NP -> V2 -> Clause ;
		Needing_V2_Pass : Requirement_NP -> V2 -> Clause ;

		Notification_of_charges_V2 : Accused_NP -> Arraign_authority_NP -> Charges_Adv -> V2 -> Clause ;
		Notification_of_charges_V2_Pass : Accused_NP -> Charges_Adv -> V2 -> Clause ;

		Nuclear_process_V : Element_NP -> V -> Clause ;
		Nuclear_process_V2_Pass : Element_NP -> V2 -> Clause ;

		Obviousness_V : Phenomenon_NP -> V -> Clause ;

		Occupy_rank_V : Item_NP -> V -> Clause ;

		Offering_V2 : Offerer_NP -> Theme_NP -> V2 -> Clause ;

		Omen_V : Outcome_Adv -> Phenomenon_1_NP -> V -> Clause ;
		Omen_V2 : Phenomenon_1_NP -> Phenomenon_2_NP -> V2 -> Clause ;

		Operate_vehicle_V_1 : Area_Adv -> Driver_NP -> V -> Clause ;
		Operate_vehicle_V_2 : Driver_NP -> Goal_Adv -> Path_Adv -> Source_Adv -> V -> Clause ;

		Operating_a_system_V2 : Operator_NP -> System_NP -> V2 -> Clause ;

		Operational_testing_V2 : Product_NP -> Tester_NP -> V2 -> Clause ;

		Opinion_VS : Cognizer_NP -> Opinion_S -> VS -> Clause ;

		Origin_V : Entity_NP -> Origin_Adv -> V -> Clause ;

		Others_situation_as_stimulus_V_1 : Experiencer_NP -> Other_Adv -> V -> Clause ;
		Others_situation_as_stimulus_V_2 : Experiencer_NP -> Situation_Adv -> V -> Clause ;
		Others_situation_as_stimulus_V2 : Experiencer_NP -> Other_NP -> V2 -> Clause ;

		Pardon_V2 : Authority_NP -> Offender_NP -> V2 -> Clause ;
		Pardon_V2_Pass : Authority_NP -> Offender_NP -> V2 -> Clause ;

		Partiality_V2 : Side_1_NP -> V2 -> Clause ;

		Participation_V : Participant_1_NP -> V -> Clause ;

		Path_shape_V_1 : Direction_Adv -> Road_NP -> V -> Clause ;
		Path_shape_V_2 : Goal_Adv -> Road_NP -> Source_Adv -> V -> Clause ;
		Path_shape_V_3 : Path_Adv -> Road_NP -> V -> Clause ;
		Path_shape_V2 : Area_NP -> Road_NP -> V2 -> Clause ;

		Perception_active_V_1 : Body_part_Adv -> Perceiver_agentive_NP -> V -> Clause ;
		Perception_active_V_2 : Direction_Adv -> Perceiver_agentive_NP -> Phenomenon_Adv -> V -> Clause ;
		Perception_active_V2 : Direction_Adv -> Perceiver_agentive_NP -> Phenomenon_NP -> V2 -> Clause ;
		Perception_active_V2_Pass : Phenomenon_NP -> V2 -> Clause ;

		Perception_body_V_1 : Body_part_Adv -> V -> Clause ;
		Perception_body_V_2 : Body_part_NP -> V -> Clause ;

		Perception_experience_V2 : Perceiver_passive_NP -> Phenomenon_NP -> V2 -> Clause ;
		Perception_experience_VQ : Perceiver_passive_NP -> Phenomenon_QS -> VQ -> Clause ;
		Perception_experience_V2_Pass : Phenomenon_NP -> V2 -> Clause ;

		Performers_and_roles_V : Performer1_NP -> Performer2_Adv -> V -> Clause ;
		Performers_and_roles_V2_1 : Performance_Adv -> Performer_NP -> Role_NP -> V2 -> Clause ;
		Performers_and_roles_V2_2 : Performer_NP -> V2 -> Clause ;

		Permitting_V2 : Principle_NP -> State_of_affairs_NP -> V2 -> Clause ;
		Permitting_V2_Pass : State_of_affairs_NP -> V2 -> Clause ;

		Personal_relationship_V : Partner_1_NP -> Partner_2_Adv -> V -> Clause ;
		Personal_relationship_V2 : Partner_1_NP -> Partner_2_NP -> V2 -> Clause ;

		Piracy_V2 : Perpetrator_NP -> Vehicle_NP -> V2 -> Clause ;
		Piracy_V2_Pass : Vehicle_NP -> V2 -> Clause ;

		Place_weight_on_V : Agent_NP -> Consideration_Adv -> V -> Clause ;

		Placing_V2_1 : Agent_NP -> Goal_Adv -> Theme_NP -> V2 -> Clause ;
		Placing_V2_2 : Goal_NP -> V2 -> Clause ;
		Placing_V2_Pass : Goal_Adv -> Theme_NP -> V2 -> Clause ;

		Planting_V2_1 : Agent_NP -> Theme_NP -> V2 -> Clause ;
		Planting_V2_2 : Ground_Adv -> Theme_NP -> V2 -> Clause ;
		Planting_V2_Pass : Theme_NP -> V2 -> Clause ;

		Posing_as_V2 : Agent_NP -> Simulated_entity_NP -> V2 -> Clause ;

		Possession_V2 : Owner_NP -> Possession_NP -> V2 -> Clause ;

		Posture_V : Agent_NP -> Location_Adv -> V -> Clause ;

		Practice_V : Action_Adv -> Agent_NP -> V -> Clause ;
		Practice_V2 : Action_NP -> Agent_NP -> Occasion_Adv -> V2 -> Clause ;
		Practice_V2_Pass : Action_NP -> V2 -> Clause ;

		Precipitation_V_1 : Place_Adv -> V -> Clause ;
		Precipitation_V_2 : Time_Adv -> V -> Clause ;

		Predicting_V2 : Eventuality_NP -> Speaker_NP -> V2 -> Clause ;
		Predicting_VQ : Eventuality_QS -> VQ -> Clause ;
		Predicting_VS : Eventuality_S -> Speaker_NP -> VS -> Clause ;

		Preserving_V2 : Agent_NP -> Medium_Adv -> Undergoer_NP -> V2 -> Clause ;
		Preserving_V2_Pass : Medium_Adv -> Undergoer_NP -> V2 -> Clause ;

		Prevarication_V : Speaker_NP -> Topic_Adv -> V -> Clause ;

		Prevent_from_having_V3 : Agent_NP -> Protagonist_NP -> V3 -> Clause ;

		Preventing_V2_1 : Agent_NP -> Event_NP -> V2 -> Clause ;
		Preventing_V2_2 : Event_NP -> Preventing_cause_NP -> V2 -> Clause ;

		Process_continue_V : Event_NP -> V -> Clause ;

		Process_end_V : Process_NP -> V -> Clause ;

		Process_resume_V : Process_NP -> V -> Clause ;

		Process_start_V : Event_NP -> V -> Clause ;

		Process_stop_V : Process_NP -> V -> Clause ;

		Processing_materials_V2 : Agent_NP -> Material_NP -> V2 -> Clause ;
		Processing_materials_V2_Pass : Material_NP -> V2 -> Clause ;

		Progress_V : Entity_NP -> V -> Clause ;

		Prohibiting_V2 : Principle_NP -> State_of_affairs_NP -> V2 -> Clause ;

		Proliferating_in_number_V : Final_number_Adv -> Initial_number_Adv -> Set_NP -> V -> Clause ;
		Proliferating_in_number_V2_Pass : Set_NP -> V2 -> Clause ;

		Protecting_V2 : Asset_NP -> Protection_NP -> V2 -> Clause ;
		Protecting_V2_Pass : Asset_NP -> Danger_Adv -> V2 -> Clause ;

		Quarreling_V_1 : Arguer1_NP -> Arguer2_Adv -> V -> Clause ;
		Quarreling_V_2 : Arguers_NP -> Issue_Adv -> V -> Clause ;

		Questioning_V2 : Addressee_NP -> Speaker_NP -> Topic_Adv -> V2 -> Clause ;
		Questioning_VQ : Message_QS -> Speaker_NP -> VQ -> Clause ;
		Questioning_V2_Pass : Addressee_NP -> Speaker_NP -> V2 -> Clause ;

		Quitting_V : Employee_NP -> Position_Adv -> V -> Clause ;
		Quitting_V2 : Employee_NP -> Position_NP -> V2 -> Clause ;

		Quitting_a_place_V : Self_mover_NP -> Source_Adv -> V -> Clause ;
		Quitting_a_place_V2 : Source_NP -> V2 -> Clause ;

		Ratification_V2 : Proposal_NP -> Ratifier_NP -> V2 -> Clause ;

		Reading_V_1 : Reader_NP -> Text_Adv -> V -> Clause ;
		Reading_V_2 : Text_NP -> V -> Clause ;
		Reading_V2 : Reader_NP -> Text_NP -> V2 -> Clause ;

		Reading_aloud_V2 : Speaker_NP -> Text_NP -> V2 -> Clause ;

		Reasoning_V : Arguer_NP -> Content_Adv -> V -> Clause ;
		Reasoning_VS : Arguer_NP -> Content_S -> VS -> Clause ;

		Receiving_V2 : Recipient_NP -> Theme_NP -> V2 -> Clause ;

		Recording_V2 : Agent_NP -> Phenomenon_NP -> V2 -> Clause ;

		Recovery_V_1 : Affliction_Adv -> Patient_NP -> V -> Clause ;
		Recovery_V_2 : Affliction_NP -> V -> Clause ;
		Recovery_V2_Pass : Body_part_NP -> V2 -> Clause ;

		Redirecting_V2 : Agent_NP -> Theme_NP -> V2 -> Clause ;
		Redirecting_V2_Pass : Goal_Adv -> Theme_NP -> V2 -> Clause ;

		Reference_text_V2 : Source_of_information_NP -> V2 -> Clause ;

		Reforming_a_system_V2 : Agent_NP -> Entity_NP -> V2 -> Clause ;
		Reforming_a_system_V2_Pass : Entity_NP -> V2 -> Clause ;

		Rejuvenation_V2_1 : Agent_NP -> Entity_NP -> V2 -> Clause ;
		Rejuvenation_V2_2 : Cause_NP -> Entity_NP -> V2 -> Clause ;
		Rejuvenation_V2_Pass : Entity_NP -> V2 -> Clause ;

		Relating_concepts_V2 : Concept_1_NP -> Concept_2_Adv -> Evidence_NP -> V2 -> Clause ;
		Relating_concepts_V2_Pass : Concept_1_NP -> Concept_2_Adv -> V2 -> Clause ;

		Relative_time_V : Focal_occasion_NP -> V -> Clause ;

		Releasing_V2 : Theme_NP -> V2 -> Clause ;

		Reliance_V : Means_Adv -> Protagonist_NP -> V -> Clause ;

		Religious_belief_V : Element_Adv -> V -> Clause ;
		Religious_belief_VS : Believer_NP -> Content_S -> VS -> Clause ;

		Remainder_V : Remainder_NP -> V -> Clause ;
		Remainder_V2 : Remainder_NP -> V2 -> Clause ;

		Remembering_experience_VQ : Cognizer_NP -> Experience_QS -> VQ -> Clause ;

		Remembering_information_VS : Cognizer_NP -> Mental_content_S -> VS -> Clause ;

		Remembering_to_do_VV : Action_VP -> Cognizer_NP -> VV -> Clause ;

		Removing_V : Agent_NP -> Theme_Adv -> V -> Clause ;
		Removing_V2 : Agent_NP -> Source_Adv -> Theme_NP -> V2 -> Clause ;
		Removing_V2_Pass_1 : Source_Adv -> Theme_NP -> V2 -> Clause ;
		Removing_V2_Pass_2 : Theme_Adv -> V2 -> Clause ;

		Render_nonfunctional_V2 : Agent_NP -> Artifact_NP -> V2 -> Clause ;

		Renting_V2 : Goods_NP -> Lessee_NP -> V2 -> Clause ;

		Renting_out_V2 : Goods_NP -> Lessee_Adv -> Lessor_NP -> V2 -> Clause ;

		Renunciation_V2 : Content_NP -> Speaker_NP -> V2 -> Clause ;

		Repel_V2_1 : Defender_NP -> Enemy_NP -> V2 -> Clause ;
		Repel_V2_2 : Defender_NP -> Invasion_act_NP -> V2 -> Clause ;

		Replacing_V2_1 : Agent_NP -> New_Adv -> Old_NP -> V2 -> Clause ;
		Replacing_V2_2 : Agent_NP -> New_NP -> Old_Adv -> V2 -> Clause ;

		Reporting_V : Informer_NP -> Wrongdoer_Adv -> V -> Clause ;

		Representing_V : Entity_NP -> Phenomenon_Adv -> V -> Clause ;

		Request_V2_1 : Addressee_NP -> Message_Adv -> Speaker_NP -> V2 -> Clause ;
		Request_V2_2 : Message_NP -> Speaker_NP -> V2 -> Clause ;
		Request_V2V : Addressee_NP -> Message_VP -> Speaker_NP -> V2V -> Clause ;
		Request_VS : Message_S -> Speaker_NP -> VS -> Clause ;
		Request_V2_Pass : Addressee_NP -> Message_Adv -> V2 -> Clause ;

		Research_V_1 : Field_Adv -> Researcher_NP -> V -> Clause ;
		Research_V_2 : Researcher_NP -> Topic_Adv -> V -> Clause ;

		Reshaping_V : Undergoer_NP -> V -> Clause ;
		Reshaping_V2 : Deformer_NP -> Undergoer_NP -> V2 -> Clause ;
		Reshaping_V2_Pass : Undergoer_NP -> V2 -> Clause ;

		Residence_V : Location_Adv -> Resident_NP -> V -> Clause ;

		Resolve_problem_V_1 : Agent_NP -> Problem_Adv -> V -> Clause ;
		Resolve_problem_V_2 : Problem_NP -> V -> Clause ;
		Resolve_problem_V2 : Agent_NP -> Problem_NP -> V2 -> Clause ;
		Resolve_problem_V2_Pass : Problem_NP -> V2 -> Clause ;

		Respond_to_proposal_V2 : Proposal_NP -> Speaker_NP -> V2 -> Clause ;

		Response_V_1 : Agent_NP -> Trigger_Adv -> V -> Clause ;
		Response_V_2 : Responding_entity_NP -> Trigger_Adv -> V -> Clause ;

		Reveal_secret_V_1 : Information_Adv -> Speaker_NP -> V -> Clause ;
		Reveal_secret_V_2 : Speaker_NP -> Topic_Adv -> V -> Clause ;
		Reveal_secret_V2 : Information_NP -> Medium_NP -> V2 -> Clause ;
		Reveal_secret_VQ : Information_QS -> Speaker_NP -> VQ -> Clause ;
		Reveal_secret_VS_1 : Information_S -> Medium_NP -> VS -> Clause ;
		Reveal_secret_VS_2 : Information_S -> Speaker_NP -> VS -> Clause ;

		Revenge_V_1 : Avenger_NP -> Injury_Adv -> V -> Clause ;
		Revenge_V_2 : Avenger_NP -> Punishment_Adv -> V -> Clause ;
		Revenge_V2_Pass : Avenger_NP -> Punishment_Adv -> V2 -> Clause ;

		Rewards_and_punishments_V2 : Agent_NP -> Evaluee_NP -> V2 -> Clause ;

		Ride_vehicle_V_1 : Area_Adv -> Theme_NP -> V -> Clause ;
		Ride_vehicle_V_2 : Path_Adv -> V -> Clause ;
		Ride_vehicle_V2 : Goal_Adv -> Source_Adv -> Theme_NP -> Vehicle_NP -> V2 -> Clause ;

		Rising_to_a_challenge_V : Activity_Adv -> Protagonist_NP -> V -> Clause ;

		Rite_V : Member_NP -> V -> Clause ;
		Rite_V2 : Object_NP -> V2 -> Clause ;
		Rite_V2_Pass : Member_NP -> V2 -> Clause ;

		Robbery_V2 : Perpetrator_NP -> Victim_NP -> V2 -> Clause ;

		Rotting_V : Undergoer_NP -> V -> Clause ;

		Run_risk_V2 : Asset_NP -> Protagonist_NP -> V2 -> Clause ;
		Run_risk_VV : Bad_outcome_VP -> Protagonist_NP -> VV -> Clause ;

		Satisfying_V2_1 : Agent_NP -> Standard_NP -> V2 -> Clause ;
		Satisfying_V2_2 : Entity_NP -> Standard_NP -> V2 -> Clause ;

		Scouring_V2 : Ground_NP -> Searcher_NP -> V2 -> Clause ;
		Scouring_V2_Pass : Ground_NP -> V2 -> Clause ;

		Scrutiny_V : Cognizer_NP -> Ground_Adv -> V -> Clause ;
		Scrutiny_V2 : Cognizer_NP -> Ground_NP -> V2 -> Clause ;
		Scrutiny_V2_Pass : Ground_NP -> V2 -> Clause ;

		Seeking_V : Cognizer_agent_NP -> Sought_entity_Adv -> V -> Clause ;

		Seeking_to_achieve_V2_1 : Agent_NP -> Sought_entity_NP -> V2 -> Clause ;
		Seeking_to_achieve_V2_2 : State_of_affairs_NP -> V2 -> Clause ;

		Self_motion_V_1 : Area_Adv -> Self_mover_NP -> V -> Clause ;
		Self_motion_V_2 : Direction_Adv -> Self_mover_NP -> V -> Clause ;
		Self_motion_V_3 : Goal_Adv -> Self_mover_NP -> V -> Clause ;
		Self_motion_V_4 : Path_Adv -> Self_mover_NP -> Source_Adv -> V -> Clause ;

		Sending_V2 : Recipient_Adv -> Sender_NP -> Theme_NP -> V2 -> Clause ;
		Sending_V2_Pass : Recipient_Adv -> Theme_NP -> V2 -> Clause ;

		Sentencing_V2_Pass : Convict_NP -> Offense_Adv -> Sentence_Adv -> V2 -> Clause ;

		Separating_V2 : Agent_NP -> Part_1_NP -> Part_2_Adv -> V2 -> Clause ;
		Separating_V2_Pass : Parts_Adv -> Whole_NP -> V2 -> Clause ;

		Setting_fire_V : Flammables_NP -> V -> Clause ;
		Setting_fire_V2_1 : Flame_NP -> Kindler_NP -> V2 -> Clause ;
		Setting_fire_V2_2 : Flammables_NP -> Kindler_NP -> V2 -> Clause ;

		Setting_out_V : Self_mover_NP -> V -> Clause ;

		Shoot_projectiles_V2 : Agent_NP -> Projectile_NP -> V2 -> Clause ;

		Sidereal_appearance_V : Astronomical_entity_NP -> V -> Clause ;

		Sign_agreement_V2 : Agreement_NP -> Signatory_NP -> V2 -> Clause ;

		Silencing_V2 : Agent_NP -> Speaker_NP -> V2 -> Clause ;

		Similarity_V : Entity_1_NP -> Entity_2_Adv -> V -> Clause ;

		Simultaneity_V : Events_NP -> V -> Clause ;

		Sleep_V : Sleeper_NP -> V -> Clause ;

		Smuggling_V2 : Goods_NP -> Perpetrator_NP -> V2 -> Clause ;
		Smuggling_V2_Pass : Goal_Adv -> Goods_NP -> V2 -> Clause ;

		Soaking_V2 : Agent_NP -> Medium_Adv -> Theme_NP -> V2 -> Clause ;

		Soaking_up_V2 : Item_NP -> Substance_NP -> V2 -> Clause ;
		Soaking_up_V2_Pass : Item_NP -> Substance_NP -> V2 -> Clause ;

		Sound_movement_V : Sound_NP -> V -> Clause ;

		Speak_on_topic_V : Speaker_NP -> Topic_Adv -> V -> Clause ;

		Spelling_and_pronouncing_V2 : Sign_NP -> Speaker_NP -> V2 -> Clause ;

		State_continue_V : Entity_NP -> V -> Clause ;

		Statement_V_1 : Message_Adv -> Speaker_NP -> V -> Clause ;
		Statement_V_2 : Speaker_NP -> Topic_Adv -> V -> Clause ;
		Statement_V2 : Medium_NP -> Message_NP -> V2 -> Clause ;
		Statement_VS_1 : Medium_NP -> Message_S -> VS -> Clause ;
		Statement_VS_2 : Message_S -> Speaker_NP -> VS -> Clause ;
		Statement_VV : Message_VP -> Speaker_NP -> VV -> Clause ;
		Statement_V2_Pass_1 : Speaker_NP -> V2 -> Clause ;
		Statement_V2_Pass_2 : Topic_NP -> V2 -> Clause ;

		Storing_V2 : Agent_NP -> Theme_NP -> V2 -> Clause ;

		Studying_V : Institution_Adv -> Student_NP -> V -> Clause ;
		Studying_V2 : Student_NP -> Subject_NP -> V2 -> Clause ;

		Suasion_V2S : Addressee_NP -> Content_S -> Speaker_NP -> V2S -> Clause ;
		Suasion_V2V : Addressee_NP -> Content_VP -> Speaker_NP -> V2V -> Clause ;
		Suasion_V2_Pass_1 : Addressee_NP -> Content_Adv -> V2 -> Clause ;
		Suasion_V2_Pass_2 : Addressee_NP -> Speaker_NP -> V2 -> Clause ;

		Submitting_documents_V2 : Authority_Adv -> Documents_NP -> Submittor_NP -> V2 -> Clause ;

		Success_or_failure_V : Agent_NP -> Goal_Adv -> V -> Clause ;
		Success_or_failure_VV : Agent_NP -> Goal_VP -> VV -> Clause ;
		Success_or_failure_V2_Pass : Agent_NP -> V2 -> Clause ;

		Successful_action_V_1 : Instrument_NP -> V -> Clause ;
		Successful_action_V_2 : Means_NP -> V -> Clause ;

		Successfully_communicate_message_V2 : Communicator_NP -> Message_NP -> V2 -> Clause ;

		Sufficiency_V : Enabled_situation_Adv -> Item_NP -> V -> Clause ;

		Supply_V2_1 : Recipient_NP -> Supplier_NP -> Theme_Adv -> V2 -> Clause ;
		Supply_V2_2 : Supplier_NP -> Theme_NP -> V2 -> Clause ;
		Supply_V2_Pass : Recipient_NP -> V2 -> Clause ;

		Supporting_V2 : Supported_NP -> Supporter_NP -> V2 -> Clause ;
		Supporting_V2_Pass : Supported_NP -> Supporter_NP -> V2 -> Clause ;

		Surrendering_V : Authorities_Adv -> Fugitive_NP -> V -> Clause ;

		Surrendering_possession_V2 : Recipient_Adv -> Surrenderer_NP -> Theme_NP -> V2 -> Clause ;

		Suspicion_V2_Pass : Incident_Adv -> Suspect_NP -> V2 -> Clause ;

		Take_place_of_V2 : New_NP -> Old_NP -> Role_Adv -> V2 -> Clause ;
		Take_place_of_V2_Pass : New_NP -> Old_NP -> V2 -> Clause ;

		Taking_V2 : Agent_NP -> Source_Adv -> Theme_NP -> V2 -> Clause ;
		Taking_V2_Pass : Theme_NP -> V2 -> Clause ;

		Taking_sides_V2_1 : Action_NP -> Cognizer_NP -> V2 -> Clause ;
		Taking_sides_V2_2 : Cognizer_NP -> Issue_NP -> V2 -> Clause ;

		Tasting_V2 : Agent_NP -> Food_NP -> V2 -> Clause ;

		Telling_V : Speaker_NP -> Topic_Adv -> V -> Clause ;
		Telling_V2 : Addressee_Adv -> Message_NP -> Speaker_NP -> V2 -> Clause ;
		Telling_VS : Message_S -> Speaker_NP -> VS -> Clause ;

		Temporary_stay_V_1 : Duration_Adv -> Guest_NP -> Location_Adv -> V -> Clause ;
		Temporary_stay_V_2 : Guest_NP -> Host_Adv -> V -> Clause ;
		Temporary_stay_V2_Pass : Guest_NP -> V2 -> Clause ;

		Text_creation_V2 : Author_NP -> Text_NP -> V2 -> Clause ;
		Text_creation_VS : Author_NP -> Text_S -> VS -> Clause ;
		Text_creation_V2_Pass : Text_NP -> V2 -> Clause ;

		Theft_V : Perpetrator_NP -> Source_Adv -> V -> Clause ;
		Theft_V2 : Goods_NP -> Perpetrator_NP -> Victim_Adv -> V2 -> Clause ;

		Thriving_V : Entity_NP -> V -> Clause ;
		Thriving_V2_Pass : Entity_NP -> V2 -> Clause ;

		Thwarting_V2_1 : Action_NP -> Preventing_cause_NP -> V2 -> Clause ;
		Thwarting_V2_2 : Preventing_cause_NP -> Protagonist_NP -> V2 -> Clause ;
		Thwarting_V2_Pass : Protagonist_NP -> V2 -> Clause ;

		Tolerating_V : Content_Adv -> Experiencer_NP -> V -> Clause ;

		Topic_V : Topic_NP -> V -> Clause ;
		Topic_V2_1 : Communicator_NP -> Topic_NP -> V2 -> Clause ;
		Topic_V2_2 : Text_NP -> Topic_NP -> V2 -> Clause ;

		Travel_V_1 : Area_Adv -> V -> Clause ;
		Travel_V_2 : Goal_Adv -> Traveler_NP -> V -> Clause ;
		Travel_V_3 : Mode_of_transportation_Adv -> Path_Adv -> Traveler_NP -> V -> Clause ;

		Traversing_V : Path_Adv -> Source_Adv -> Theme_NP -> V -> Clause ;
		Traversing_V2 : Path_NP -> Theme_NP -> V2 -> Clause ;

		Trying_out_V2 : Entity_NP -> Evaluator_NP -> V2 -> Clause ;

		Unattributed_information_VS_Pass : Reported_fact_S -> VS -> Clause ;

		Undergo_change_V : Entity_NP -> V -> Clause ;

		Undergoing_V2 : Entity_NP -> Event_NP -> V2 -> Clause ;

		Undressing_V2 : Clothing_NP -> Wearer_NP -> V2 -> Clause ;

		Use_firearm_V2 : Agent_NP -> Firearm_NP -> V2 -> Clause ;

		Using_V2 : Agent_NP -> Instrument_NP -> Purpose_Adv -> V2 -> Clause ;
		Using_V2_Pass : Instrument_NP -> V2 -> Clause ;

		Verdict_V2 : Defendant_NP -> Finding_Adv -> Judge_NP -> V2 -> Clause ;

		Verification_V2 : Inspector_NP -> Medium_Adv -> Unconfirmed_content_NP -> V2 -> Clause ;
		Verification_VS : Inspector_NP -> Unconfirmed_content_S -> VS -> Clause ;

		Visiting_V2 : Agent_NP -> Entity_NP -> V2 -> Clause ;

		Wagering_VS : Gambler_NP -> Outcome_S -> VS -> Clause ;

		Waiting_V : Protagonist_NP -> Salient_entity_Adv -> V -> Clause ;

		Waking_up_V : Sleep_state_Adv -> Sleeper_NP -> V -> Clause ;

		Waver_between_options_V_1 : Cognizer_NP -> Issue_Adv -> V -> Clause ;
		Waver_between_options_V_2 : Cognizer_NP -> Options_Adv -> V -> Clause ;

		Wearing_V2 : Clothing_NP -> Wearer_NP -> V2 -> Clause ;

		Win_prize_V2 : Competitor_NP -> Prize_NP -> V2 -> Clause ;

		Withdraw_from_participation_V : Participant_NP -> V -> Clause ;

}
