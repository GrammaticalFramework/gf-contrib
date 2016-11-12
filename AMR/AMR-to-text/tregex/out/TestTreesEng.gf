--# -path=.:alltenses:../../lexicons/translator

concrete TestTreesEng of TestTrees = TestLexiconEng **
open SyntaxEng, (S=SyntaxEng), (E=ExtraEng), ParadigmsEng in {

	flags
		coding = utf8 ;
		language = en_US ;

	lin t01_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t02_the_boy_is_seen_by_the_girls = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t03_two_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t04_two_pretty_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t05_the_boy_sees_the_two_pretty_girls = (mkS (mkCl (mkNP S.a_Quant (mkCN boy_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N))))) ;

	lin t06_girls_and_boys_play_a_game = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN girl_N)) (mkNP S.a_Quant (mkCN boy_N)))) (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N))))) ;

	lin t07_boys_girls_and_a_dog_play_a_game = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN dog_N)) (mkListNP (mkNP S.a_Quant (mkCN boy_N)) (mkNP S.a_Quant (mkCN girl_N))))) (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N))))) ;

	lin t08_many_persons_live = (mkS (mkCl (mkNP S.many_Det (mkCN person_N)) (mkVP live_01_V))) ;

	lin t09_some_persons_live_in_Ventspils = (mkS (mkCl (mkNP S.somePl_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN "Ventspils")))))) ;

	lin t10_many_persons_live_in_Riga = (mkS (mkCl (mkNP S.many_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN "Riga")))))) ;

	lin t11_more_persons_live_in_New_York = (mkS (mkCl (mkNP more_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN "New York")))))) ;

	lin t13_few_persons_live_in_Riga_and_New_York = (mkS (mkCl (mkNP S.few_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP S.and_Conj (mkListNP (mkNP (mkPN "Riga")) (mkNP (mkPN "New York")))))))) ;

	lin t14_boys_and_girls_play_games_in_Riga = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN boy_N)) (mkNP S.a_Quant (mkCN girl_N)))) (mkVP (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N))) (S.mkAdv in_Prep (mkNP (mkPN "Riga")))))) ;

	lin t15_boys_and_girls_play_games_in_Riga_and_New_York = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN boy_N)) (mkNP S.a_Quant (mkCN girl_N)))) (mkVP (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N))) (S.mkAdv in_Prep (mkNP S.and_Conj (mkListNP (mkNP (mkPN "Riga")) (mkNP (mkPN "New York")))))))) ;

	lin t16_boys_see_Ann = (mkS (mkCl (mkNP S.a_Quant (mkCN boy_N)) (mkVP see_01_V2 (mkNP (mkPN "Ann"))))) ;

	lin t17_John_plays_a_game = (mkS (mkCl (mkNP (mkPN "John")) (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N))))) ;

	lin t18_John_sees_Ann = (mkS (mkCl (mkNP (mkPN "John")) (mkVP see_01_V2 (mkNP (mkPN "Ann"))))) ;

	lin t19_girls_see_some_boys_who_play_a_game = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.somePl_Det (mkCN (mkCN boy_N) (mkRS (mkRCl S.which_RP (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N)))))))))) ;

	lin t20_girls_see_some_pretty_boys_who_play_a_ball_game = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.somePl_Det (mkCN (mkCN pretty_A boy_N) (mkRS (mkRCl S.which_RP (mkVP play_02_V2 (mkNP S.a_Quant (mkCN ball_A game_N)))))))))) ;

	lin t21_girls_who_see_the_game_like_the_boys_who_play = (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN girl_N) (mkRS (mkRCl S.which_RP (mkVP see_01_V2 (mkNP S.a_Quant (mkCN game_N))))))) (mkVP like_01_V2 (mkNP S.a_Quant (mkCN (mkCN boy_N) (mkRS (mkRCl S.which_RP (mkVP play_02_V)))))))) ;

	lin t22_Assad_spoke_about_the_city = (mkS (mkCl (mkNP (mkPN "Assad")) (mkVP (mkVP speak_01_V) (S.mkAdv about_Prep (mkNP S.a_Quant (mkCN city_N)))))) ;

	lin t23_Assad_spoke_about_the_two_cities = (mkS (mkCl (mkNP (mkPN "Assad")) (mkVP (mkVP speak_01_V) (S.mkAdv about_Prep (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN city_N)))))) ;

	lin t24_Assad_spoke_a_word_about_the_city = (mkS (mkCl (mkNP (mkPN "Assad")) (mkVP speak_01_V2 (mkNP (mkNP S.a_Quant (mkCN word_N)) (S.mkAdv about_Prep (mkNP S.a_Quant (mkCN city_N))))))) ;

	lin t25_the_boy_is_a_person = (mkS (mkCl (mkNP S.a_Quant (mkCN boy_N)) (mkNP S.a_Quant (mkCN person_N)))) ;

	lin t26_Iceland_is_a_very_interesting_example = (mkS (mkCl (mkNP (mkPN "Iceland")) (mkNP S.a_Quant (mkCN (mkCN example_N) (mkRS (mkRCl S.which_RP (mkAP S.very_AdA (mkAP interesting_A)))))))) ;

	lin t27_they_are_thugs_and_deserve_a_bullet = (mkS S.and_Conj (mkListS (mkS (mkCl S.they_NP (mkNP S.a_Quant (mkCN thug_N)))) (mkS (mkCl (mkVP deserve_01_V2 (mkNP S.a_Quant (mkCN bullet_N))))))) ;

	lin t28_China_president_urges_child_safety = (mkS (mkCl (mkNP (mkCN (mkN2 president_N of_Prep) (mkNP (mkPN "China")))) (mkVP urge_01_VV (mkVP protect_01_V2 (mkNP S.a_Quant (mkCN child_N)))))) ;

	lin t29_French_far_left_killer_leaves_jail = (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN (mkCN far_A (mkCN left_A person_N)) (S.mkAdv from_Prep (mkNP (mkPN "France")))) (mkRS (mkRCl S.which_RP (mkVP kill_01_V))))) (mkVP leave_11_V2 (mkNP S.a_Quant (mkCN jail_N))))) ;

	lin t30_two_other_school_assailants_have_committed_suicide = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN (mkCN other_A person_N) (mkRS (mkRCl S.which_RP (mkVP assail_01_V2 (mkNP S.a_Quant (mkCN school_N))))))) (mkVP commit_02_V2 (mkNP S.a_Quant (mkCN suicide_N))))) ;

	lin t31_Gadhafi_attacks_US_in_speech_in_Italy = (mkS (mkCl (mkNP (mkPN "Gadhafi")) (mkVP (mkVP attack_01_V2 (mkNP (mkPN "US"))) (S.mkAdv S.when_Subj (mkS (mkCl (mkVP (mkVP speak_01_V) (S.mkAdv in_Prep (mkNP (mkPN "Italy")))))))))) ;

	lin t32_we_must_look_at_their_reasons = (mkS (mkCl S.we_NP (mkVP (passiveVP obligate_01_V2) (E.PurposeVP (mkVP look_01_V2 (mkNP S.they_Pron (mkCN reason_N))))))) ;

	lin t33_the_man_Xu_Yuyuan_wielded_a_knife_usually_used_to_slaughter_pigs = (mkS (mkCl (mkNP (mkPN "Xu Yuyuan")) (mkVP wield_01_V2 (mkNP S.a_Quant (mkCN (mkCN knife_N) (mkRS (mkRCl S.which_RP (mkVP (mkVP (mkAdV "usually") (passiveVP use_01_V2)) (E.PurposeVP (mkVP slaughter_01_V2 (mkNP S.a_Quant (mkCN pig_N)))))))))))) ;

	lin t34_Libyan_Abdel_Basset_Ali_al_Megrahi_was_convicted_of_blowing_up_the_plane = (mkS (mkCl (mkNP (mkNP (mkPN "Abdel Basset Ali al-Megrahi")) (S.mkAdv from_Prep (mkNP (mkPN "Libya")))) (mkVP (passiveVP convict_01_V2) (E.PurposeVP (mkVP blow_up_06_V2 (mkNP S.a_Quant (mkCN plane_N))))))) ;

	lin t35_a_fourth_member_Jean_Marc_Rouillan_remains_behind_bars = (mkS (mkCl (mkNP (mkNP (mkPN "Jean-Marc Rouillan")) (mkRS (mkRCl S.which_RP (mkNP (mkDet S.the_Quant (S.mkOrd (mkDigits "4"))) (mkCN (mkN2 member_N of_Prep)))))) (mkVP (passiveVP remain_01_V2) (S.mkAdv behind_Prep (mkNP S.a_Quant (mkCN bar_N)))))) ;

	lin t36_I_d_never_heard_of_this_case_until_now = (mkS negativePol (mkCl S.i_NP (mkVP (mkVP hear_01_V2 (mkNP S.this_Det (mkCN case_N))) (S.mkAdv until_Prep (mkNP now_N))))) ;

	lin t37_so_I_googled_it_to_get_more_information = (mkS (mkCl S.i_NP (mkVP (mkVP google_01_V2 S.it_NP) (E.PurposeVP (mkVP get_01_V2 (mkNP more_Det (mkCN information_N))))))) ;

}
