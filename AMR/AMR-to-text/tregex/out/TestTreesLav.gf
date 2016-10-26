--# -path=.:alltenses
concrete TestTreesLav of TestTrees = TestLexiconLav **
open SyntaxLav, (S = SyntaxLav), ParadigmsLav in {

	flags language = lv_LV ;

	lin t01_girls_see_a_boy = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t02_the_boy_is_seen_by_the_girls = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t03_two_girls_see_a_boy = (mkS (mkCl (mkNP a_Quant (mkNum (mkDigits "2")) (mkCN girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t04_two_pretty_girls_see_a_boy = (mkS (mkCl (mkNP a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N)) (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN boy_N))))) ;

	lin t05_the_boy_sees_the_two_pretty_girls = (mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkVP see_01_V2 (mkNP a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N))))) ;

	lin t06_girls_and_boys_play_a_game = (mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN girl_N)) (mkNP a_Quant singularNum (mkCN boy_N)))) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))))) ;

	lin t07_boys_girls_and_a_dog_play_a_game = (mkS (mkCl (mkNP and_Conj (mkListNP (mkNP a_Quant singularNum (mkCN dog_N)) (mkListNP (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN girl_N))))) (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N))))) ;

	lin t08_many_persons_live = (mkS (mkCl (mkNP many_Det (mkCN person_N)) (mkVP live_01_V))) ;

	lin t19_girls_see_some_boys_who_play_a_game = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP somePl_Det (mkCN (mkCN boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN game_N)))))))))) ;

	lin t20_girls_see_some_pretty_boys_who_play_a_ball_game = (mkS (mkCl (mkNP a_Quant singularNum (mkCN girl_N)) (mkVP see_01_V2 (mkNP somePl_Det (mkCN (mkCN pretty_A boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V2 (mkNP a_Quant singularNum (mkCN ball_A game_N)))))))))) ;

	lin t21_girls_who_see_the_game_like_the_boys_who_play = (mkS (mkCl (mkNP a_Quant singularNum (mkCN (mkCN girl_N) (mkRS (mkRCl which_RP (mkVP see_01_V2 (mkNP a_Quant singularNum (mkCN game_N))))))) (mkVP like_01_V2 (mkNP a_Quant singularNum (mkCN (mkCN boy_N) (mkRS (mkRCl which_RP (mkVP play_02_V)))))))) ;

	lin t25_the_boy_is_a_person = (mkS (mkCl (mkNP a_Quant singularNum (mkCN boy_N)) (mkNP a_Quant singularNum (mkCN person_N)))) ;

}
