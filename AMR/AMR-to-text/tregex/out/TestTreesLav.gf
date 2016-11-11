--# -path=.:alltenses:../../lexicons/translator

concrete TestTreesLav of TestTrees = TestLexiconLav **
open SyntaxLav, (S=SyntaxLav), (E=ExtraLav), ParadigmsLav in {

	flags
		coding = utf8 ;
		language = lv_LV ;

	lin t01_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t02_the_boy_is_seen_by_the_girls = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t03_two_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t04_two_pretty_girls_see_a_boy = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkCN boy_N))))) ;

	lin t05_the_boy_sees_the_two_pretty_girls = (mkS (mkCl (mkNP S.a_Quant (mkCN boy_N)) (mkVP see_01_V2 (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN pretty_A girl_N))))) ;

	lin t06_girls_and_boys_play_a_game = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN girl_N)) (mkNP S.a_Quant (mkCN boy_N)))) (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N))))) ;

	lin t07_boys_girls_and_a_dog_play_a_game = (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN dog_N)) (mkListNP (mkNP S.a_Quant (mkCN boy_N)) (mkNP S.a_Quant (mkCN girl_N))))) (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N))))) ;

	lin t08_many_persons_live = (mkS (mkCl (mkNP S.many_Det (mkCN person_N)) (mkVP live_01_V))) ;

	lin t19_girls_see_some_boys_who_play_a_game = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.somePl_Det (mkCN (mkCN boy_N) (mkRS (mkRCl S.which_RP (mkVP play_02_V2 (mkNP S.a_Quant (mkCN game_N)))))))))) ;

	lin t20_girls_see_some_pretty_boys_who_play_a_ball_game = (mkS (mkCl (mkNP S.a_Quant (mkCN girl_N)) (mkVP see_01_V2 (mkNP S.somePl_Det (mkCN (mkCN pretty_A boy_N) (mkRS (mkRCl S.which_RP (mkVP play_02_V2 (mkNP S.a_Quant (mkCN ball_A game_N)))))))))) ;

	lin t21_girls_who_see_the_game_like_the_boys_who_play = (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN girl_N) (mkRS (mkRCl S.which_RP (mkVP see_01_V2 (mkNP S.a_Quant (mkCN game_N))))))) (mkVP like_01_V2 (mkNP S.a_Quant (mkCN (mkCN boy_N) (mkRS (mkRCl S.which_RP (mkVP play_02_V)))))))) ;

	lin t25_the_boy_is_a_person = (mkS (mkCl (mkNP S.a_Quant (mkCN boy_N)) (mkNP S.a_Quant (mkCN person_N)))) ;

	lin t27_they_are_thugs_and_deserve_a_bullet = (mkS S.and_Conj (mkListS (mkS (mkCl S.they_NP (mkNP S.a_Quant (mkCN thug_N)))) (mkS (mkCl (mkVP deserve_01_V2 (mkNP S.a_Quant (mkCN bullet_N))))))) ;

	lin t30_two_other_school_assailants_have_committed_suicide = (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN (mkCN other_A person_N) (mkRS (mkRCl S.which_RP (mkVP assail_01_V2 (mkNP S.a_Quant (mkCN school_N))))))) (mkVP commit_02_V2 (mkNP S.a_Quant (mkCN suicide_N))))) ;

}
