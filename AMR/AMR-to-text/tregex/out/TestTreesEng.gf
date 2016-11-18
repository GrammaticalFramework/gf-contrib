--# -path=.:alltenses:../../lexicons/translator

concrete TestTreesEng of TestTrees = TestLexiconEng **
open SyntaxEng, (S=SyntaxEng), (E=ExtraEng), (L=TestLexiconEng), (P=ParadigmsEng) in {

	flags
		coding = utf8 ;
		language = en_US ;

	lin t01_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N))))) ;

	lin t02_the_boy_is_seen_by_the_girls = (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N))))) ;

	lin t03_two_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N))))) ;

	lin t04_two_pretty_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.pretty_A L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N))))) ;

	lin t05_the_boy_sees_the_two_pretty_girls = (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.pretty_A L.girl_N))))) ;

	lin t06_girls_and_boys_play_a_game = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.girl_N)) (mkNP S.a_Quant (mkCN L.boy_N)))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))))) ;

	lin t07_boys_girls_and_a_dog_play_a_game = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.dog_N)) (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N))))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))))) ;

	lin t08_many_persons_live = (mkS (mkCl (mkNP S.many_Det (mkCN L.person_N)) (mkVP L.live_V))) ;

	lin t09_some_persons_live_in_Ventspils = (mkS (mkCl (mkNP S.somePl_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Ventspils")))))) ;

	lin t10_many_persons_live_in_Riga = (mkS (mkCl (mkNP S.many_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Riga")))))) ;

	lin t11_more_persons_live_in_New_York = (mkS (mkCl (mkNP L.more_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "New York")))))) ;

	lin t13_few_persons_live_in_Riga_and_New_York = (mkS (mkCl (mkNP S.few_Det (mkCN L.person_N)) (mkVP (mkVP L.live_V) (S.mkAdv L.in_Prep (mkNP S.and_Conj (mkListNP (mkNP (P.mkPN "Riga")) (mkNP (P.mkPN "New York")))))))) ;

	lin t14_boys_and_girls_play_games_in_Riga = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N)))) (mkVP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Riga")))))) ;

	lin t15_boys_and_girls_play_games_in_Riga_and_New_York = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N)))) (mkVP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))) (S.mkAdv L.in_Prep (mkNP S.and_Conj (mkListNP (mkNP (P.mkPN "Riga")) (mkNP (P.mkPN "New York")))))))) ;

	lin t16_boys_see_Ann = (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.see_V2 (mkNP (P.mkPN "Ann"))))) ;

	lin t17_John_plays_a_game = (mkS (mkCl (mkNP (P.mkPN "John")) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))))) ;

	lin t18_John_sees_Ann = (mkS (mkCl (mkNP (P.mkPN "John")) (mkVP L.see_V2 (mkNP (P.mkPN "Ann"))))) ;

	lin t19_girls_see_some_boys_who_play_a_game = (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.somePl_Det (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))))))) ;

	lin t20_girls_see_some_pretty_boys_who_play_a_ball_game = (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.somePl_Det (mkCN (mkCN L.pretty_A L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.ball_A L.game_N)))))))))) ;

	lin t21_girls_who_see_the_game_like_the_boys_who_play = (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.girl_N) (mkRS (mkRCl S.which_RP (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.game_N))))))) (mkVP L.like_V2 (mkNP S.a_Quant (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V)))))))) ;

	lin t22_Assad_spoke_about_the_city = (mkS (mkCl (mkNP (P.mkPN "Assad")) (mkVP (mkVP L.speak_V) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkCN L.city_N)))))) ;

	lin t23_Assad_spoke_about_the_two_cities = (mkS (mkCl (mkNP (P.mkPN "Assad")) (mkVP (mkVP L.speak_V) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.city_N)))))) ;

	lin t24_Assad_spoke_a_word_about_the_city = (mkS (mkCl (mkNP (P.mkPN "Assad")) (mkVP L.speak_V2 (mkNP (mkNP S.a_Quant (mkCN L.word_N)) (S.mkAdv L.about_Prep (mkNP S.a_Quant (mkCN L.city_N))))))) ;

	lin t25_the_boy_is_a_person = (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.person_N)))) ;

	lin t26_Iceland_is_a_very_interesting_example = (mkS (mkCl (mkNP (P.mkPN "Iceland")) (mkNP S.a_Quant (mkCN (mkCN L.example_N) (mkRS (mkRCl S.which_RP (mkAP L.very_AdA (mkAP L.interest_A)))))))) ;

	lin t27_they_are_thugs_and_deserve_a_bullet = (mkS S.and_Conj (mkListS (mkS (mkCl S.they_NP (mkNP S.a_Quant (mkCN L.thug_N)))) (mkS (mkCl (mkVP L.deserve_V2 (mkNP S.a_Quant (mkCN L.bullet_N))))))) ;

	lin t28_China_president_urges_child_safety = (mkS (mkCl (mkNP (mkCN (P.mkN2 L.president_N L.of_Prep) (mkNP (P.mkPN "China")))) (mkVP L.urge_VV (mkVP L.protect_V2 (mkNP S.a_Quant (mkCN L.child_N)))))) ;

	lin t29_French_far_left_killer_leaves_jail = (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN (mkCN L.far_A (mkCN L.left_A L.person_N)) (S.mkAdv L.from_Prep (mkNP (P.mkPN "France")))) (mkRS (mkRCl S.which_RP (mkVP L.kill_V))))) (mkVP L.leave_V2 (mkNP S.a_Quant (mkCN L.jail_N))))) ;

	lin t30_two_other_school_assailants_have_committed_suicide = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN (mkCN L.other_A L.person_N) (mkRS (mkRCl S.which_RP (mkVP L.assail_V2 (mkNP S.a_Quant (mkCN L.school_N))))))) (mkVP L.commit_V2 (mkNP S.a_Quant (mkCN L.suicide_N))))) ;

	lin t31_Gadhafi_attacks_US_in_speech_in_Italy = (mkS (mkCl (mkNP (P.mkPN "Gadhafi")) (mkVP (mkVP L.attack_V2 (mkNP (P.mkPN "US"))) (S.mkAdv S.when_Subj (mkS (mkCl (mkVP (mkVP L.speak_V) (S.mkAdv L.in_Prep (mkNP (P.mkPN "Italy")))))))))) ;

	lin t32_we_must_look_at_their_reasons = (mkS (mkCl S.we_NP (mkVP (passiveVP L.obligate_V2) (E.PurposeVP (mkVP L.look_V2 (mkNP S.they_Pron (mkCN L.reason_N))))))) ;

	lin t33_the_man_Xu_Yuyuan_wielded_a_knife_usually_used_to_slaughter_pigs = (mkS (mkCl (mkNP (P.mkPN "Xu Yuyuan")) (mkVP L.wield_V2 (mkNP S.a_Quant (mkCN (mkCN L.knife_N) (mkRS (mkRCl S.which_RP (mkVP (mkVP (P.mkAdV "usually") (passiveVP L.use_V2)) (E.PurposeVP (mkVP L.slaughter_V2 (mkNP S.a_Quant (mkCN L.pig_N)))))))))))) ;

	lin t34_Libyan_Abdel_Basset_Ali_al_Megrahi_was_convicted_of_blowing_up_the_plane = (mkS (mkCl (mkNP (mkNP (P.mkPN "Abdel Basset Ali al-Megrahi")) (S.mkAdv L.from_Prep (mkNP (P.mkPN "Libya")))) (mkVP (passiveVP L.convict_V2) (E.PurposeVP (mkVP L.blow_up_V2 (mkNP S.a_Quant (mkCN L.plane_N))))))) ;

	lin t35_a_fourth_member_Jean_Marc_Rouillan_remains_behind_bars = (mkS (mkCl (mkNP (mkNP (P.mkPN "Jean-Marc Rouillan")) (mkRS (mkRCl S.which_RP (mkNP (mkDet S.the_Quant (S.mkOrd (mkDigits "4"))) (mkCN (P.mkN2 L.member_N L.of_Prep)))))) (mkVP (passiveVP L.remain_V2) (S.mkAdv L.behind_Prep (mkNP S.a_Quant (mkCN L.bar_N)))))) ;

	lin t36_I_d_never_heard_of_this_case_until_now = (mkS negativePol (mkCl S.i_NP (mkVP (mkVP L.hear_V2 (mkNP S.this_Det (mkCN L.case_N))) (S.mkAdv L.until_Prep (mkNP L.now_N))))) ;

	lin t37_so_I_googled_it_to_get_more_information = (mkS (mkCl S.i_NP (mkVP (mkVP L.google_V2 S.it_NP) (E.PurposeVP (mkVP L.get_V2 (mkNP L.more_Det (mkCN L.information_N))))))) ;

	lin t38_even_the_information_that_is_available_is_fuzzy = (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.information_N) (mkRS (mkRCl S.which_RP (mkAP L.available_A))))) (mkAP L.even_AdA (mkAP L.fuzzy_A)))) ;

	lin t39_as_for_the_race_angle_it_is_unnecessary = (mkS negativePol (mkCl (mkNP S.a_Quant (mkCN L.race_A L.angle_N)) (passiveVP L.need_V2))) ;

	lin t40_it_s_a_horrible_thing_that_happened = (mkUtt (mkNP S.a_Quant (mkCN L.horrible_A L.thing_N))) ;

	lin t41_you_are_an_idiot = (mkS (mkCl S.you_NP (mkNP S.a_Quant (mkCN L.idiot_N)))) ;

	lin t42_they_need_to_throw_these_punks_in_jail = (mkS (mkCl S.they_NP (mkVP (passiveVP L.obligate_V2) (E.PurposeVP (mkVP (mkVP L.throw_V2 (mkNP S.this_Det (mkCN L.punk_N))) (S.mkAdv L.GOL_Prep (mkNP S.a_Quant (mkCN L.jail_N)))))))) ;

	lin t43_they_should_have_been_expelled_from_school_at_a_minimum = (mkS (mkCl (mkVP (passiveVP L.recommend_V2) (S.mkAdv S.that_Subj (mkS (mkCl S.they_NP (mkVP (mkVP (passiveVP L.expel_V2) (S.mkAdv L.DIR_Prep (mkNP S.a_Quant (mkCN L.school_N)))) (P.mkAdv "at a minimum")))))))) ;

	lin t44_my_opinion_is_based_on_the_information_provided = (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.thing_N) (mkRS (mkRCl S.which_RP S.i_NP L.opine_V2)))) (mkVP (passiveVP L.base_V2) (S.mkAdv L.DIR_Prep (mkNP S.a_Quant (mkCN (mkCN L.information_N) (mkRS (mkRCl S.which_RP (passiveVP L.provide_V2))))))))) ;

}
