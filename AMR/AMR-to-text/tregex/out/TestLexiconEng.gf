--# -path=../../lexicons/translator

concrete TestLexiconEng of TestLexicon = CatEng, DictionaryEng **
open ParadigmsEng, MorphoEng in {

	flags

		coding = utf8 ;
		language = en_US ;
		optimize = values ;

	lin

		kill_01_V = kill_V ;
		live_01_V = live_V ;
		play_02_V = play_1_V ;
		speak_01_V = speak_V ;

		deserve_01_V2 = deserve_V2 ;
		leave_11_V2 = leave_V2 ;
		like_01_V2 = like_V2 ;
		play_02_V2 = play_1_V2 ;
		protect_01_V2 = protect_V2 ;
		see_01_V2 = see_V2 ;
		speak_01_V2 = speak_V2 ;

		urge_01_VV = mkVV (mkV "urge") ;

		game_N = game_1_N ;
		president_N = presidentMasc_N ;

		ball_A = mkA "ball" "ball" "ball" "ball" ;

		more_Det = mkDeterminer plural "more" ;

}
