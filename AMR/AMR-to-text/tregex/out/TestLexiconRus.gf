--# -path=../../lexicons/translator

concrete TestLexiconRus of TestLexicon = CatRus, DictionaryRus **
open ParadigmsRus, MorphoRus in {

	flags

		coding = utf8 ;
		language = ru_RU ;
		optimize = values ;

	lin

		live_01_V = live_V ;
		play_02_V = play_1_V ;
		speak_01_V = speak_V ;

		deserve_01_V2 = dirV2 (mkV Imperfective "заслужу" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужить") ; -- note: deserve_V2 = variants{} ;
		like_01_V2 = dirV2 (regV imperfective second "нрав" "лю" "нравил" "нравь" "нравить") ; -- FIXME: Subj=Dat, DObj=Nom (note: like_V2 = variants{})
		play_02_V2 = play_1_V2 ;
		see_01_V2 = see_V2 ;
		speak_01_V2 = speak_V2 ;

		game_N = game_2_N ; -- note: game_1_N = variants{}

		ball_A = mkA "" ; -- FIXME

}
