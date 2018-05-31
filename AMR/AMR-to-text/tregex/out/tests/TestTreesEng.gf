--# -path=.:alltenses:../../../lexicons/translator:../semeval

concrete TestTreesEng of TestTrees = TestLexiconEng **
open SyntaxEng, (S=SyntaxEng), (E=ExtraEng), (L=TestLexiconEng), (P=ParadigmsEng), ConstructionEng, Prelude in {

	flags
		coding = utf8 ;
		language = en_US ;

	lin t01_girls_see_a_boy = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t02_the_boy_is_seen_by_the_girls = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t03_two_girls_see_a_boy = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t04_two_pretty_girls_see_a_boy = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.pretty_A L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t05_the_boy_sees_the_two_pretty_girls = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.pretty_A L.girl_N)))))) fullStopPunct) ;

	lin t06_girls_and_boys_play_a_game = (mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.girl_N)) (mkNP S.a_Quant (mkCN L.boy_N)))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct) ;

	lin t07_boys_girls_and_a_dog_play_a_game = (mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.dog_N)) (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N))))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct) ;

	lin t08_many_persons_live = (mkText (mkUtt (mkS (mkCl (mkNP S.many_Det (mkCN L.person_N)) (mkVP L.live_V)))) fullStopPunct) ;

	lin t09_some_persons_live_in_Ventspils = (mkText (mkUtt (mkS (mkCl (mkNP S.somePl_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Ventspils"))))))) fullStopPunct) ;

	lin t10_many_persons_live_in_Riga = (mkText (mkUtt (mkS (mkCl (mkNP S.many_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Riga"))))))) fullStopPunct) ;

	lin t11_more_persons_live_in_New_York = (mkText (mkUtt (mkS (mkCl (mkNP L.more_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "New York"))))))) fullStopPunct) ;

	lin t13_few_persons_live_in_Riga_and_New_York = (mkText (mkUtt (mkS (mkCl (mkNP S.few_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP S.and_Conj (mkListNP (mkNP (P.mkPN "Riga")) (mkNP (P.mkPN "New York"))))))))) fullStopPunct) ;

	lin t14_boys_and_girls_play_games_in_Riga = (mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N)))) (mkVP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Riga"))))))) fullStopPunct) ;

	lin t15_boys_and_girls_play_games_in_Riga_and_New_York = (mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N)))) (mkVP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))) (S.mkAdv L.in_Prep (mkNP S.and_Conj (mkListNP (mkNP (P.mkPN "Riga")) (mkNP (P.mkPN "New York"))))))))) fullStopPunct) ;

	lin t16_boys_see_Ann = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.see_V2 (mkNP (P.mkPN "Ann")))))) fullStopPunct) ;

	lin t17_John_plays_a_game = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "John")) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct) ;

	lin t18_John_sees_Ann = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "John")) (mkVP L.see_V2 (mkNP (P.mkPN "Ann")))))) fullStopPunct) ;

	lin t19_girls_see_some_boys_who_play_a_game = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.somePl_Det (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))))))))))) fullStopPunct) ;

	lin t20_girls_see_some_pretty_boys_who_play_a_ball_game = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.somePl_Det (mkCN (mkCN L.pretty_A L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V2 (mkNP S.a_Quant (E.CompoundCN L.ball_N L.game_N))))))))))) fullStopPunct) ;

	lin t21_girls_who_see_the_game_like_the_boys_who_play = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.girl_N) (mkRS (mkRCl S.which_RP (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.game_N))))))) (mkVP L.like_V2 (mkNP S.a_Quant (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V))))))))) fullStopPunct) ;

	lin t22_Assad_spoke_about_the_city = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Assad")) (mkVP (mkVP L.speak_V) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkCN L.city_N))))))) fullStopPunct) ;

	lin t23_Assad_spoke_about_the_two_cities = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Assad")) (mkVP (mkVP L.speak_V) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.city_N))))))) fullStopPunct) ;

	lin t24_Assad_spoke_a_word_about_the_city = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Assad")) (mkVP L.speak_V2 (mkNP S.a_Quant (mkCN (mkCN L.word_N) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkCN L.city_N))))))))) fullStopPunct) ;

	lin t25_the_boy_is_a_person = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.person_N))))) fullStopPunct) ;

	lin t26_Iceland_is_a_very_interesting_example = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Iceland")) (mkNP S.a_Quant (mkCN (mkCN L.example_N) (mkRS (mkRCl S.which_RP (mkAP L.very_AdA (mkAP L.interest_A))))))))) fullStopPunct) ;

	lin t27_they_are_thugs_and_deserve_a_bullet = (mkText (mkUtt (mkS S.and_Conj (mkListS (mkS (mkCl S.they_NP (mkNP S.a_Quant (mkCN L.thug_N)))) (mkS (mkCl (mkVP L.deserve_V2 (mkNP S.a_Quant (mkCN L.bullet_N)))))))) fullStopPunct) ;

	lin t28_China_president_urges_child_safety = (mkText (mkUtt (mkS (mkCl (mkNP (mkCN (P.mkN2 L.president_N L.of_Prep) (mkNP (P.mkPN "China")))) (mkVP L.urge_VV (mkVP L.protect_V2 (mkNP S.a_Quant (mkCN L.child_N))))))) fullStopPunct) ;

	lin t29_French_far_left_killer_leaves_jail = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN (mkCN L.far_A (mkCN L.left_A L.person_N)) (S.mkAdv L.from_Prep (mkNP (P.mkPN "France")))) (mkRS (mkRCl S.which_RP (mkVP L.kill_V))))) (mkVP L.leave_V2 (mkNP S.a_Quant (mkCN L.jail_N)))))) fullStopPunct) ;

	lin t30_two_other_school_assailants_have_committed_suicide = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN (mkCN L.other_A L.person_N) (mkRS (mkRCl S.which_RP (mkVP L.assail_V2 (mkNP S.a_Quant (mkCN L.school_N))))))) (mkVP L.commit_V2 (mkNP S.a_Quant (mkCN L.suicide_N)))))) fullStopPunct) ;

	lin t31_Gadhafi_attacks_US_in_speech_in_Italy = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Gadhafi")) (mkVP (mkVP L.attack_V2 (mkNP (P.mkPN "US"))) (S.mkAdv S.when_Subj (mkS (mkCl (mkVP (mkVP L.speak_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Italy"))))))))))) fullStopPunct) ;

	lin t32_we_must_look_at_their_reasons = (mkText (mkUtt (mkS (mkCl S.we_NP (mkVP (passiveVP L.obligate_V2) (E.PurposeVP (mkVP L.look_V2 (mkNP S.they_Pron (mkCN L.reason_N)))))))) fullStopPunct) ;

	lin t33_the_man_Xu_Yuyuan_wielded_a_knife_usually_used_to_slaughter_pigs = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Xu Yuyuan")) (mkVP L.wield_V2 (mkNP S.a_Quant (mkCN (mkCN L.knife_N) (mkRS (mkRCl S.which_RP (mkVP (mkVP (P.mkAdV "usually") (passiveVP L.use_V2)) (E.PurposeVP (mkVP L.slaughter_V2 (mkNP S.a_Quant (mkCN L.pig_N))))))))))))) fullStopPunct) ;

	lin t34_Libyan_Abdel_Basset_Ali_al_Megrahi_was_convicted_of_blowing_up_the_plane = (mkText (mkUtt (mkS (mkCl (mkNP (mkNP (P.mkPN "Abdel Basset Ali al-Megrahi")) (S.mkAdv L.from_Prep (mkNP (P.mkPN "Libya")))) (mkVP (passiveVP L.convict_V2) (E.PurposeVP (mkVP L.blow_up_V2 (mkNP S.a_Quant (mkCN L.plane_N)))))))) fullStopPunct) ;

	lin t35_a_fourth_member_Jean_Marc_Rouillan_remains_behind_bars = (mkText (mkUtt (mkS (mkCl (mkNP (mkNP (P.mkPN "Jean-Marc Rouillan")) (mkRS (mkRCl S.which_RP (mkNP (mkDet S.the_Quant (S.mkOrd (mkDigits "4"))) (mkCN (P.mkN2 L.member_N L.of_Prep)))))) (mkVP (passiveVP L.remain_V2) (S.mkAdv L.behind_Prep (mkNP S.a_Quant (mkCN L.bar_N))))))) fullStopPunct) ;

	lin t36_I_d_never_heard_of_this_case_until_now = (mkText (mkUtt (mkS negativePol (mkCl S.i_NP (mkVP (mkVP L.hear_V2 (mkNP S.this_Det (mkCN L.case_N))) (S.mkAdv L.until_Prep (mkNP L.now_N)))))) fullStopPunct) ;

	lin t37_so_I_googled_it_to_get_more_information = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.google_V2 S.it_NP) (E.PurposeVP (mkVP L.get_V2 (mkNP L.more_Det (mkCN L.information_N)))))))) fullStopPunct) ;

	lin t38_even_the_information_that_is_available_is_fuzzy = (mkText (mkUtt (mkS (mkCl (mkNP (mkCN L.available_A (mkCN L.information_N))) (mkAP L.even_AdA (mkAP L.fuzzy_A))))) fullStopPunct) ;

	lin t39_as_for_the_race_angle_it_is_unnecessary = (mkText (mkUtt (mkS negativePol (mkCl (mkNP S.a_Quant (E.CompoundCN L.race_N L.angle_N)) (passiveVP L.need_V2)))) fullStopPunct) ;

	lin t40_it_s_a_horrible_thing_that_happened = (mkText (mkUtt (mkNP S.a_Quant (mkCN L.horrible_A L.thing_N)))) ;

	lin t41_you_are_an_idiot = (mkText (mkUtt (mkS (mkCl S.you_NP (mkNP S.a_Quant (mkCN L.idiot_N))))) fullStopPunct) ;

	lin t42_they_need_to_throw_these_punks_in_jail = (mkText (mkUtt (mkS (mkCl S.they_NP (mkVP (passiveVP L.obligate_V2) (E.PurposeVP (mkVP (mkVP L.throw_V2 (mkNP S.this_Det (mkCN L.punk_N))) (S.mkAdv L.GOL_Prep (mkNP S.a_Quant (mkCN L.jail_N))))))))) fullStopPunct) ;

	lin t43_they_should_have_been_expelled_from_school_at_a_minimum = (mkText (mkUtt (mkS (mkCl (mkVP (passiveVP L.recommend_V2) (S.mkAdv S.that_Subj (mkS (mkCl S.they_NP (mkVP (mkVP (passiveVP L.expel_V2) (S.mkAdv L.DIR_Prep (mkNP S.a_Quant (mkCN L.school_N)))) (P.mkAdv "at a minimum"))))))))) fullStopPunct) ;

	lin t44_my_opinion_is_based_on_the_information_provided = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.thing_N) (mkRS (mkRCl S.which_RP S.i_NP L.opine_V2)))) (mkVP (passiveVP L.base_V2) (S.mkAdv L.DIR_Prep (mkNP (mkCN (mkCN L.information_N) (mkRS (mkRCl S.which_RP (passiveVP L.provide_V2)))))))))) fullStopPunct) ;

	lin t45_Texas_criminal_courts_and_prosecutors_do_not_coddle_to_anyone = (mkText (mkUtt (mkS negativePol (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.criminal_A (mkCN (mkCN L.court_N) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Texas")))))) (mkNP S.a_Quant (mkCN (mkCN L.person_N) (mkRS (mkRCl S.which_RP (mkVP L.prosecute_V))))))) (mkVP L.coddle_V2 L.anyone_NP)))) fullStopPunct) ;

	lin t46_I_don_t_think_it_is_a_race_issue_either = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (P.mkAdV "either") (mkVP L.think_VS (mkS negativePol (mkCl S.it_NP (mkNP S.a_Quant (E.CompoundCN L.race_N L.issue_N))))))))) fullStopPunct) ;

	lin t47_the_girl_is_very_nice_and_the_boy_is_very_good = (mkText (mkUtt (mkS S.and_Conj (mkListS (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkAP L.very_AdA (mkAP L.nice_A)))) (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkAP L.very_AdA (mkAP L.good_A))))))) fullStopPunct) ;

	lin t48_women_are_horny_as_hell = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.woman_N)) (mkAP (P.mkAdA "as hell") (mkAP L.horny_A))))) exclMarkPunct) ;

	lin t49_is_it_a_possibility_there_is_another_side_to_this = (mkText (mkUtt (mkQS (mkQCl (mkCl S.it_NP (mkAP (mkAP L.possible_A) (mkS (mkCl (mkNP L.another_Det (mkCN (mkCN L.side_N) (S.mkAdv L.part_Prep S.this_NP)))))))))) questMarkPunct) ;

	lin t50_the_girl_left_because_the_boy_arrived = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP (mkVP L.leave_V) (S.mkAdv S.because_Subj (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.arrive_V)))))))) fullStopPunct) ;

	lin t51_due_to_historical_reasons_what_originally_belongs_us_has_become_controversial = (mkText (mkUtt (mkS (S.mkAdv S.because_Subj (mkS (mkCl (mkNP S.a_Quant (E.CompoundCN L.history_N L.reason_N))))) (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.thing_N) (mkRS (mkRCl S.which_RP (mkVP (P.mkAdV "originally") (mkVP L.belong_V2 S.we_NP)))))) (mkVP (passiveVP L.become_V2) (S.mkAdv L.PRD_Prep (mkNP S.a_Quant (mkCN L.controversy_N)))))))) fullStopPunct) ;

	lin t52_the_people_are_already_incredibly_fully_equipped = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.person_N)) (mkVP (P.mkAdV "fully") (mkVP (P.mkAdV "incredibly") (mkVP (P.mkAdV "already") (passiveVP L.equip_V2))))))) fullStopPunct) ;

	lin t53_never_go_back_to_that_time_when_signing_the_treaties = (mkText (mkUtt (mkS negativePol (mkCl S.you_NP (mkVP (mkVP (P.mkAdV "ever") (mkVP L.go_back_V)) (S.mkAdv L.DIR_Prep (mkNP S.that_Det (mkCN (mkCN L.time_N) (S.mkAdv S.when_Subj (mkS (mkCl S.we_NP (mkVP L.sign_V2 (mkNP S.a_Quant (mkCN L.treaty_N))))))))))))) exclMarkPunct) ;

	lin t54_Radio_Nepal_reported_that_3_policemen_were_killed_and_19_others_wounded_when_their_vehicle_was_ambushed_by_guerrillas_in_western_Nepal = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Radio Nepal")) (mkVP L.report_VS (mkS S.and_Conj (mkListS (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "3")) (mkCN L.policeman_N)) (passiveVP L.kill_V2))) (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "19")) (mkCN L.other_A L.policeman_N)) (mkVP (passiveVP L.wound_V2) (S.mkAdv S.when_Subj (mkS (mkCl (mkNP S.a_Quant (mkCN L.guerrilla_N)) (mkVP (mkVP L.ambush_V2 (mkNP S.a_Quant (mkCN L.vehicle_N))) (S.mkAdv L.in_Prep (mkNP S.the_Quant (mkCN (mkCN L.west_N) (S.mkAdv L.part_Prep (mkNP (P.mkPN "Nepal"))))))))))))))))))) fullStopPunct) ;

	lin t55_I_don_t_know_if_anyone_will_read_this = (mkText (mkUtt (mkS negativePol (mkCl S.i_NP (mkVP (mkVP L.know_V) (S.mkAdv S.if_Subj (mkS (mkCl L.anyone_NP (mkVP L.read_V2 S.this_NP)))))))) fullStopPunct) ;

	lin t56_it_was_unclear_whether_combat_had_taken_place_between_Russian_and_Georgian_soldiers_or_had_been_limited_to_fighting_between_separatists_and_Georgian_forces = (mkText (mkUtt (mkS negativePol (mkCl (mkVP (mkVP (mkAP L.clear_A)) (S.mkAdv S.if_Subj (mkS S.or_Conj (mkListS (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN (mkCN L.soldier_N) (S.mkAdv L.from_Prep (mkNP (P.mkPN "Russia"))))) (mkNP S.a_Quant (mkCN (mkCN L.soldier_N) (S.mkAdv L.from_Prep (mkNP (P.mkPN "Georgia"))))))) (mkVP L.combat_V))) (mkS (mkCl (mkVP (passiveVP L.limit_V2) (E.PurposeVP (mkVP (mkVP L.fight_V) (S.mkAdv L.between_Prep (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.separatist_N)) (mkNP S.a_Quant (mkCN L.force_N))))))))))))))))) fullStopPunct) ;

	lin t57_especially_China_suffered_the_ravages_of_Japan = (mkText (mkUtt (mkS (mkCl (mkNP (ss "especially") (mkNP (P.mkPN "China"))) (mkVP L.suffer_VS (mkS (mkCl (mkNP (P.mkPN "Japan")) (mkVP L.ravage_V))))))) fullStopPunct) ;

	lin t58_I_started_university_in_September = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.start_V2 (mkNP S.a_Quant (mkCN L.university_N))) (monthAdv september_Month))))) fullStopPunct) ;

	lin t59_we_have_been_broken_up_since_August = (mkText (mkUtt (mkS (mkCl S.we_NP (mkVP (passiveVP L.break_up_V2) (S.mkAdv L.since_Prep (mkNP (monthPN august_Month))))))) fullStopPunct) ;

	lin t60_I_started_university_on_1_September_1999 = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.start_V2 (mkNP S.a_Quant (mkCN L.university_N))) (dayMonthYearAdv (intMonthday (ss "1")) september_Month (intYear (ss "1999"))))))) fullStopPunct) ;

	lin t61_I_started_university_in_1999 = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP (mkVP L.start_V2 (mkNP S.a_Quant (mkCN L.university_N))) (yearAdv (intYear (ss "1999"))))))) fullStopPunct) ;

	lin t64_youngest_brother_is_a_tender_youth = (mkText (mkUtt (mkS (mkCl (mkNP (mkCN (mkAP (S.mkOrd L.young_A)) (mkCN (P.mkN2 L.brother_N L.of_Prep)))) (mkNP (mkCN L.tender_A (mkCN L.youth_N)))))) fullStopPunct) ;

	lin t65_I_d_recommend_you_go_and_see_your_doctor = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.recommend_VS (mkS (mkCl S.you_NP (mkVP (mkVP L.go_V) (E.PurposeVP (mkVP L.see_V2 (mkNP (mkCN (P.mkN2 L.doctor_N L.of_Prep)))))))))))) fullStopPunct) ;

	lin t66_two_successful_companies_enter_the_market_in_a_big_way = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.successful_A L.company_N)) (mkVP (mkVP L.enter_V2 (mkNP S.a_Quant (mkCN L.market_N))) (S.mkAdv L.in_Prep (mkNP S.a_Det (mkCN L.big_A L.way_N))))))) fullStopPunct) ;

	lin t67_how_long_are_we_going_to_tolerate_Japan = (mkText (mkUtt (mkQS (mkQCl (mkIAdv S.how_IAdv (S.mkAdv L.long_A)) (mkCl S.we_NP (mkVP L.tolerate_V2 (mkNP (P.mkPN "Japan"))))))) questMarkPunct) ;

	lin t68_how_do_we_fly = (mkText (mkUtt (mkQS (mkQCl S.how_IAdv (mkCl S.we_NP (mkVP L.fly_V))))) questMarkPunct) ;

	lin t69_how_can_we_fly = (mkText (mkUtt (mkQS (mkQCl S.how_IAdv (mkCl S.it_NP (mkAP (mkAP L.possible_A) (mkS (mkCl S.we_NP (mkVP L.fly_V)))))))) questMarkPunct) ;

	lin t70_what_did_the_girl_find = (mkText (mkUtt (mkQS (mkQCl L.what_IAdv (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.find_V))))) questMarkPunct) ;

	lin t71_where_did_the_girl_find_the_boy = (mkText (mkUtt (mkQS (mkQCl S.where_IAdv (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.find_V2 (mkNP S.a_Quant (mkCN L.boy_N))))))) questMarkPunct) ;

	lin t72_create_a_few_battle_groups = (mkText (mkUtt (mkS (mkCl (mkNP S.few_Det (E.CompoundCN L.battle_N L.group_N)) (passiveVP L.create_V2)))) fullStopPunct) ;

	lin t73_I_suffer_from_random_panic_attacks = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.suffer_V2 (mkNP S.a_Quant (mkCN L.random_A (E.CompoundCN L.panic_N L.attack_N))))))) fullStopPunct) ;

	lin t74_the_list_names_companies_that_were_prevented_from_carrying_out_deals = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.list_N)) (mkVP L.name_V2 (mkNP S.a_Quant (mkCN (mkCN L.company_N) (mkRS (mkRCl S.which_RP (mkVP (passiveVP L.prevent_V2) (E.PurposeVP (mkVP L.carry_out_V2 (mkNP S.a_Quant (mkCN L.deal_N))))))))))))) fullStopPunct) ;

	lin t75_I_have_tried_to_solve_my_problems = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.try_VV (mkVP L.solve_V2 (mkNP S.a_Quant (mkCN L.problem_N))))))) fullStopPunct) ;

	lin t77_if_you_tell_people_they_can_help_you = (mkText (mkUtt (mkS (mkCl (mkVP (mkVP (mkAP (mkAP L.possible_A) (mkS (mkCl (mkNP S.a_Quant (mkCN L.person_N)) (mkVP L.help_V2 S.you_NP))))) (S.mkAdv S.if_Subj (mkS (mkCl (mkVP L.tell_V)))))))) fullStopPunct) ;

	lin t78_what_do_Chinese_still_tolerate = (mkText (mkUtt (mkQS (mkQCl L.what_IAdv (mkCl (mkNP S.a_Quant (mkCN (mkCN L.person_N) (S.mkAdv L.from_Prep (mkNP (P.mkPN "China"))))) (mkVP (P.mkAdV "still") (mkVP L.tolerate_V)))))) questMarkPunct) ;

	lin t79_Xinhua_News_Agency_Tokyo_September_1st_by_reporter_Yiguo_Yu = (mkText (mkUtt (mkS (mkCl (mkNP (P.mkPN "Xinhua News Agency")) (mkVP (mkVP (mkVP L.byline_V2 (mkNP (P.mkPN "Yiguo Yu"))) (dayMonthAdv (intMonthday (ss "1")) september_Month)) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Tokyo"))))))) fullStopPunct) ;

	lin t80_i_have_sevral_slits_on_my_arm = (mkText (mkUtt (mkS (mkCl S.i_NP (mkVP L.have_V2 (mkNP L.several_Det (mkCN (mkCN L.slit_N) (S.mkAdv L.in_Prep (mkNP S.i_Pron (mkCN L.arm_N))))))))) fullStopPunct) ;

	lin t81_Looks_like_we_still_need_to_train_more_outdoors = (mkText (mkUtt (mkS (mkCl (mkVP (passiveVP L.look_V2) (S.mkAdv S.that_Subj (mkS (mkCl S.we_NP (mkVP (P.mkAdV "still") (mkVP L.need_VV (mkVP (mkVP (mkVP L.train_V) L.more_Adv) L.outdoors_Adv)))))))))) fullStopPunct) ;

}
