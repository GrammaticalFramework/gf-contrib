--# -path=../../../lexicons/translator:../semeval

concrete TestLexiconRus of TestLexicon = CatRus, DictionaryRus
- [assail_V2, commit_V2, deserve_V2, like_V2, ball_N, other_A] **
open ParadigmsRus, MorphoRus in {

	flags

		coding = utf8 ;
		language = ru_RU ;
		optimize = values ;

	lin

		play_V = play_1_V ;

		assail_V2 = mkV2 (mkV Imperfective "нападу" "нападают" "нападет" "нападем" "нападают" "нападут" "нападают" "нападайте" "напасть") "на" accusative ;
		-- DictionaryRus.assail_V2 = variants{}

		commit_V2 = dirV2 (mkV Imperfective "совершите" "совершите" "совершите" "совершите" "совершите" "совершите" "совершите" "совершите" "совершить") ;
		-- DictionaryRus.commit_V2 = variants{}

		deserve_V2 = dirV2 (mkV Imperfective "заслужу" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужите" "заслужить") ;
		-- DictionaryRus.deserve_V2 = variants{}

		like_V2 = dirV2 (regV imperfective second "нрав" "лю" "нравил" "нравь" "нравить") ;
		-- FIXME: Subj=Dat, DObj=Nom (DictionaryRus.like_V2 = variants{})

		play_V2 = play_1_V2 ;

		ball_N = mkN "мяч" "мяча" "мячу" "мяч" "мячом" "мяче" "мячами" "мячи" "мячей" "мячам" "мячи" "мячами" "мячах" Masc Inanimate ;
		game_N = game_2_N ;			-- DictionaryRus.game_1_N = variants{}
		school_N = school_1_N ;

		other_A = mkA "другой" ;	-- DictionaryRus.other_A = variants{}

}
