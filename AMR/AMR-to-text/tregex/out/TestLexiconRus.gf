concrete TestLexiconRus of TestLexicon = CatRus ** open ParadigmsRus, MorphoRus in {

	flags optimize=values ;

	lin

		live_01_V = regV imperfective firstE "жив" "у" "жил" "живи" "жить" ;
		play_02_V = regV imperfective first "игра" "ю" "играл" "играй" "играть" ;
		speak_01_V = regV imperfective secondA "говор" "ю" "говорил" "говори" "говорить" ;

		like_01_V2 = dirV2 (regV imperfective second "нрав" "лю" "нравил" "нравь" "нравить") ; -- FIXME(?)
		play_02_V2 = mkV2 (regV imperfective first "игра" "ю" "играл" "играй" "играть") "c" instructive ;
		see_01_V2 = dirV2 (regV imperfective second "ви" "жу" "видел" "видь" "видеть") ;
		speak_01_V2 = mkV2 (regV imperfective secondA "говор" "ю" "говорил" "говори" "говорить") "на" prepositional ;

		boy_N = mkN "мальчик" animate ;
		city_N = mkN "город" ;
		dog_N = mkN "собака" animate ;
		game_N = mkN "игра" ;
		girl_N = mkN "девушка" "девушки" "девушке" "девушку" "девушкою" "девушке" "девушками" "девушки" "девушек" "девушкам" "девушек" "девушками" "девушках" Fem Animate ;
		person_N = mkN "лицo" animate ;

		ball_A = mkA "" ; -- FIXME
		pretty_A = mkA "прелестный" ;

		about_Prep = {s = "перед" ; c = Inst} ;

}
