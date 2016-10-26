concrete TestLexiconEng of TestLexicon = CatEng ** open ParadigmsEng, IrregEng, MorphoEng in {

	flags optimize=values ;

	lin

		live_01_V = mkV "live" ;
		play_02_V = mkV "play" ;
		speak_01_V = IrregEng.speak_V ;

		like_01_V2 = mkV2 (mkV "like") ;
		play_02_V2 = mkV2 (mkV "play") ;
		see_01_V2 = mkV2 IrregEng.see_V ;
		speak_01_V2 = mkV2 IrregEng.speak_V ;

		boy_N = mkN masculine (regN "boy") ;
		city_N = mkN "city" "cities" ;
		dog_N = regN "dog" ;
		example_N = mkN "example" "examples" ;
		game_N = regN "game" ;
		girl_N = mkN feminine (regN "girl") ;
		person_N = mkN human (regN "person") ;
		woman_N = mkN feminine (mkN "woman" "women") ;
		word_N = mkN "word" "words" ;

		ball_A = mkA "ball" "ball" "ball" "ball" ; -- FIXME(?)
		horny_A = mkA "horny" "hornier" ;
		interesting_A = mkA "interesting" ;
		pretty_A = irregAdv (mkA "pretty" "prettier") "pretty" ;

		more_Det = mkDeterminer plural "more" ; -- FIXME(?)

		about_Prep = mkPrep "about" ;

}
