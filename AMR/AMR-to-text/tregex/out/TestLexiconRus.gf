--# -path=../../lexicons/translator

concrete TestLexiconRus of TestLexicon = CatRus, DictionaryRus - [other_A] **
open ParadigmsRus, MorphoRus in {

	flags

		coding = utf8 ;
		language = ru_RU ;
		optimize = values ;

	lin

		live_01_V = live_V ;
		play_02_V = play_1_V ;
		speak_01_V = speak_V ;

		assail_01_V2 = mkV2 (mkV Imperfective "нападу" "нападают" "нападет" "нападем" "нападают" "нападут" "нападают" "нападайте" "напасть") "на" accusative ;
		-- note: assail_V2 = variants{} ;

		commit_02_V2 = dirV2 (mkV Imperfective "совершите" "совершите" "совершите" "совершите" "совершите" "совершите" "совершите" "совершите" "совершить") ;
		-- note: commit_V2 = variants{} ;

		deserve_01_V2 = dirV2 (mkV Imperfective "заслужу" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужить") ;
		-- note: deserve_V2 = variants{} ;

		like_01_V2 = dirV2 (regV imperfective second "нрав" "лю" "нравил" "нравь" "нравить") ;
		-- FIXME: Subj=Dat, DObj=Nom (note: like_V2 = variants{})

		look_01_V2 = look_V2 ;
		play_02_V2 = play_1_V2 ;
		see_01_V2 = see_V2 ;
		speak_01_V2 = speak_V2 ;

		obligate_01_V2V = obligate_V2V ;

		game_N = game_2_N ;			-- note: game_1_N = variants{}
		school_N = school_1_N ;

		ball_A = mkA "" ;			-- FIXME
		other_A = mkA "другой" ;	-- note: other_A = variants{} ;

}
