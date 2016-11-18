--# -path=../../lexicons/translator

concrete TestLexiconEng of TestLexicon = CatEng, DictionaryEng - [information_N] **
open ParadigmsEng, MorphoEng in {

	flags

		coding = utf8 ;
		language = en_US ;
		optimize = values ;

	lin

		play_V = play_1_V ;

		google_V2 = mkV2 (mkV "google" "googles" "googled" "googled" "googling") ;
		play_V2 = play_1_V2 ;

		urge_VV = mkVV (mkV "urge") ;

		bar_N = mkN "bar" "bars" ;
		game_N = game_1_N ;
		information_N = mkN "information" "information" ;	-- mass noun (vs. mkN "information" in DictionaryEng)
		president_N = presidentMasc_N ;
		school_N = school_1_N ;

		ball_A = mkA "ball" "ball" "ball" "ball" ;			-- a temporary solution
		interest_A = interesting_A ;
		race_A = mkA "race" "race" "race" "race" ;			-- a temporary solution

		more_Det = mkDeterminer plural "more" ;

		DIR_Prep = from_Prep ;
		GOL_Prep = in_Prep ;

}
