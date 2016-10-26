--# -path=.:alltenses
concrete TestTreesEng of TestTrees = TestLexiconEng **
open SyntaxEng, (S = SyntaxEng), ParadigmsEng in {

	flags language = en_US ;

	lin t01_girls_see_a_boy = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t02_the_boy_is_seen_by_the_girls = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t03_two_girls_see_a_boy = (mkS (mkCl (mkNP a_Quant (mkNum (mkDigits "2")) (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t04_two_pretty_girls_see_a_boy = (mkS (mkCl (mkNP a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t05_the_boy_sees_the_two_pretty_girls = (mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkVP see_01_V2 (mkNP a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N))))) ;

	lin t06_girls_and_boys_play_a_game = (mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN girl_N)) (mkNP a_Quant singularNum (mkCN boy_N)))) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))))) ;

	lin t07_boys_girls_and_a_dog_play_a_game = (mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN dog_N)) (mkListNP (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN girl_N))))) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))))) ;

	lin t08_many_persons_live = (mkS (mkCl (mkNP many_Det (mkCN person_N)) (mkVP live_01_V))) ;

	lin t09_some_persons_live_in_Ventspils = (mkS (mkCl (mkNP somePl_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN "Ventspils")))))) ;

	lin t10_many_persons_live_in_Riga = (mkS (mkCl (mkNP many_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN "Riga")))))) ;

	lin t11_more_persons_live_in_New_York = (mkS (mkCl (mkNP more_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP (mkPN "New York")))))) ;

	lin t13_few_persons_live_in_Riga_and_New_York = (mkS (mkCl (mkNP few_Det (mkCN person_N)) (mkVP (mkVP live_01_V) (S.mkAdv in_Prep (mkNP and_Conj (mkListNP (mkNP (mkPN "Riga")) (mkNP (mkPN "New York")))))))) ;

	lin t14_boys_and_girls_play_games_in_Riga = (mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN girl_N)))) (mkVP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))) (S.mkAdv in_Prep (mkNP (mkPN "Riga")))))) ;

	lin t15_boys_and_girls_play_games_in_Riga_and_New_York = (mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN girl_N)))) (mkVP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))) (S.mkAdv in_Prep (mkNP and_Conj (mkListNP (mkNP (mkPN "Riga")) (mkNP (mkPN "New York")))))))) ;

	lin t16_boys_see_Ann = (mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkVP see_01_V2 (mkNP (mkPN "Ann"))))) ;

	lin t17_John_plays_a_game = (mkS (mkCl (mkNP (mkPN "John")) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))))) ;

	lin t18_John_sees_Ann = (mkS (mkCl (mkNP (mkPN "John")) (mkVP see_01_V2 (mkNP (mkPN "Ann"))))) ;

	lin t19_girls_see_some_boys_who_play_a_game = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP somePl_Det (mkCN (mkCN boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N)))))))))) ;

	lin t20_girls_see_some_pretty_boys_who_play_a_ball_game = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP somePl_Det (mkCN (mkCN pretty_A boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN ball_A game_N)))))))))) ;

	lin t21_girls_who_see_the_game_like_the_boys_who_play = (mkS (mkCl (mkNP a_Quant singularNum (mkCN (mkCN girl_N) (mkRS (mkRCl which_RP (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN game_N))))))) (mkVP like_01_V2 (mkNP a_Quant singularNum (mkCN (mkCN boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V)))))))) ;

	lin t22_Assad_spoke_about_the_city = (mkS (mkCl (mkNP (mkPN "Assad")) (mkVP (mkVP speak_01_V) (S.mkAdv about_Prep (mkNP a_Quant singularNum (mkCN city_N)))))) ;

	lin t23_Assad_spoke_about_the_two_cities = (mkS (mkCl (mkNP (mkPN "Assad")) (mkVP (mkVP speak_01_V) (S.mkAdv about_Prep (mkNP a_Quant (mkNum (mkDigits "2")) (mkCN city_N)))))) ;

	lin t24_Assad_spoke_a_word_about_the_city = (mkS (mkCl (mkNP (mkPN "Assad")) (mkVP speak_01_V2 (mkNP (mkNP a_Quant singularNum (mkCN word_N)) (S.mkAdv about_Prep (mkNP a_Quant singularNum (mkCN city_N))))))) ;

	lin t25_the_boy_is_a_person = (mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN person_N)))) ;

	lin t26_Iceland_is_a_very_interesting_example = (mkS (mkCl (mkNP (mkPN "Iceland")) (mkNP a_Quant singularNum (mkCN (mkCN example_N) (mkRS (mkRCl which_RP (mkAP very_AdA (mkAP interesting_A)))))))) ;

}
