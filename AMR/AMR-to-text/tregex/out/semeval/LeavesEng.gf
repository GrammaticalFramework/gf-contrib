--# -path=../../../lexicons/translator

concrete LeavesEng of Leaves = CatEng, DictionaryEng - [information_N] **
open ParadigmsEng, MorphoEng, (S = SyntaxEng) in {

	flags

		coding = utf8 ;
		language = en_US ;
		optimize = values ;

	lin

		play_V = play_1_V ;
		prosecute_V = mkV "prosecute" "prosecutes" "prosecuted" "prosecuted" "prosecuting";

		google_V2 = mkV2 (mkV "google" "googles" "googled" "googled" "googling") ;
		play_V2 = play_1_V2 ;

		urge_VV = mkVV (mkV "urge") ;

		bar_N = mkN "bar" "bars" ;
		court_N = court_1_N ;
		game_N = game_1_N ;
		information_N = mkN "information" "information" ;	-- mass noun (vs. mkN "information" in DictionaryEng)
		issue_N = issue_1_N ;
		president_N = presidentMasc_N ;
		school_N = school_1_N ;

		ball_A = mkA "ball" "ball" "ball" "ball" ;			-- a temporary solution
		interest_A = interesting_A ;
		race_A = mkA "race" "race" "race" "race" ;			-- a temporary solution

		all_Det = mkDeterminer plural "all" ;
		more_Det = mkDeterminer plural "more" ;

		part_Prep = S.part_Prep ;

		DIR_Prep = from_Prep ;
		GOL_Prep = in_Prep ;

}
