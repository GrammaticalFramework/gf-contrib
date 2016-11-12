--# -path=../../lexicons/translator

concrete TestLexiconEng of TestLexicon = CatEng, DictionaryEng - [information_N] **
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

		assail_01_V2 = assail_V2 ;
		attack_01_V2 = attack_V2 ;
		blow_06_V2 = blow_V2 ;
		blow_up_06_V2 = blow_up_V2 ;
		commit_02_V2 = commit_V2 ;
		convict_01_V2 = convict_V2 ;
		deserve_01_V2 = deserve_V2 ;
		get_01_V2 = get_V2 ;
		google_01_V2 = mkV2 (mkV "google" "googles" "googled" "googled" "googling") ;
		hear_01_V2 = hear_V2 ;
		leave_11_V2 = leave_V2 ;
		like_01_V2 = like_V2 ;
		look_01_V2 = look_V2 ;
		obligate_01_V2 = obligate_V2 ;
		play_02_V2 = play_1_V2 ;
		protect_01_V2 = protect_V2 ;
		remain_01_V2 = remain_V2 ;
		see_01_V2 = see_V2 ;
		slaughter_01_V2 = slaughter_V2 ;
		speak_01_V2 = speak_V2 ;
		use_01_V2 = use_V2 ;
		wield_01_V2 = wield_V2 ;

		urge_01_VV = mkVV (mkV "urge") ;

		obligate_01_V2V = obligate_V2V ;

		bar_N = mkN "bar" "bars" ;
		game_N = game_1_N ;
		information_N = mkN "information" "information" ; -- mass noun (vs. mkN "information" in DictionaryEng)
		president_N = presidentMasc_N ;
		school_N = school_1_N ;

		ball_A = mkA "ball" "ball" "ball" "ball" ;

		more_Det = mkDeterminer plural "more" ;

}
