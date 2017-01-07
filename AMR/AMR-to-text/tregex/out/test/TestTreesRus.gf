--# -path=.:alltenses:../../../lexicons/translator:../semeval

concrete TestTreesRus of TestTrees = TestLexiconRus **
open SyntaxRus, (S=SyntaxRus), (E=ExtraRus), (L=TestLexiconRus), (P=ParadigmsRus), Prelude in {

	flags
		coding = utf8 ;
		language = ru_RU ;

	lin t01_girls_see_a_boy = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t02_the_boy_is_seen_by_the_girls = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t03_two_girls_see_a_boy = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t04_two_pretty_girls_see_a_boy = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.pretty_A L.girl_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.boy_N)))))) fullStopPunct) ;

	lin t05_the_boy_sees_the_two_pretty_girls = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkVP L.see_V2 (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN L.pretty_A L.girl_N)))))) fullStopPunct) ;

	lin t06_girls_and_boys_play_a_game = (mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.girl_N)) (mkNP S.a_Quant (mkCN L.boy_N)))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct) ;

	lin t07_boys_girls_and_a_dog_play_a_game = (mkText (mkUtt (mkS (mkCl (mkNP S.and_Conj (mkListNP (mkNP S.a_Quant (mkCN L.dog_N)) (mkListNP (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.girl_N))))) (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N)))))) fullStopPunct) ;

	lin t08_many_persons_live = (mkText (mkUtt (mkS (mkCl (mkNP S.many_Det (mkCN L.person_N)) (mkVP L.live_V)))) fullStopPunct) ;

	lin t19_girls_see_some_boys_who_play_a_game = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkVP L.see_V2 (mkNP S.somePl_Det (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V2 (mkNP S.a_Quant (mkCN L.game_N))))))))))) fullStopPunct) ;

	lin t21_girls_who_see_the_game_like_the_boys_who_play = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN (mkCN L.girl_N) (mkRS (mkRCl S.which_RP (mkVP L.see_V2 (mkNP S.a_Quant (mkCN L.game_N))))))) (mkVP L.like_V2 (mkNP S.a_Quant (mkCN (mkCN L.boy_N) (mkRS (mkRCl S.which_RP (mkVP L.play_V))))))))) fullStopPunct) ;

	lin t25_the_boy_is_a_person = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkNP S.a_Quant (mkCN L.person_N))))) fullStopPunct) ;

	lin t27_they_are_thugs_and_deserve_a_bullet = (mkText (mkUtt (mkS S.and_Conj (mkListS (mkS (mkCl S.they_NP (mkNP S.a_Quant (mkCN L.thug_N)))) (mkS (mkCl (mkVP L.deserve_V2 (mkNP S.a_Quant (mkCN L.bullet_N)))))))) fullStopPunct) ;

	lin t30_two_other_school_assailants_have_committed_suicide = (mkText (mkUtt (mkS (mkCl (mkNP S.a_Quant (mkNum (mkDigits "2")) (mkCN (mkCN L.other_A L.person_N) (mkRS (mkRCl S.which_RP (mkVP L.assail_V2 (mkNP S.a_Quant (mkCN L.school_N))))))) (mkVP L.commit_V2 (mkNP S.a_Quant (mkCN L.suicide_N)))))) fullStopPunct) ;

	lin t47_the_girl_is_very_nice_and_the_boy_is_very_good = (mkText (mkUtt (mkS S.and_Conj (mkListS (mkS (mkCl (mkNP S.a_Quant (mkCN L.girl_N)) (mkAP L.very_AdA (mkAP L.nice_A)))) (mkS (mkCl (mkNP S.a_Quant (mkCN L.boy_N)) (mkAP L.very_AdA (mkAP L.good_A))))))) fullStopPunct) ;

}
