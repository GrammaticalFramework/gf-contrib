--# -path=../../lexicons/translator

abstract TestLexicon = Cat, Dictionary ** {

	fun

		kill_01_V : V ;
		live_01_V : V ;
		play_02_V : V ;			-- note: play_1_V (etc.) in Dictionary (no default play_V)
		speak_01_V : V ;

		assail_01_V2 : V2 ;
		attack_01_V2 : V2 ;
		blow_06_V2 : V2 ;
		blow_up_06_V2 : V2 ;
		commit_02_V2 : V2 ;
		convict_01_V2 : V2 ;
		deserve_01_V2 : V2 ;
		get_01_V2 : V2 ;
		google_01_V2 : V2 ;		-- no entry in Dictionary or DictEng
		hear_01_V2 : V2 ;
		leave_11_V2 : V2 ;
		like_01_V2 : V2 ;
		look_01_V2 : V2 ;
		obligate_01_V2 : V2 ;
		play_02_V2 : V2 ;		-- note: play_1_V2 (etc.) in Dictionary (no default play_V2)
		protect_01_V2 : V2 ;
		remain_01_V2 : V2 ;
		see_01_V2 : V2 ;
		slaughter_01_V2 : V2 ;
		speak_01_V2 : V2 ;
		use_01_V2 : V2 ;
		wield_01_V2 : V2 ;

		urge_01_VV : VV ;		-- note: no urge_VV in Dictionary

		obligate_01_V2V : V2V ;

		available_02_A : A ;
		interest_01_A : A ;

		bar_N : N ;				-- no entry in Dictionary, but there is one in DictEng
		game_N : N ;			-- because of game_1_N (etc.) in Dictionary (no default game_N)
		president_N : N ;		-- because of presidentFem_N (etc.) in Dictionary (no default president_N)
		school_N : N ;			-- because of school_1_N (etc.) in Dictionary (no default school_N)

		ball_A : A ;			-- FIXME: how to represent e.g. "ball game"?

		more_Det : Det ;		-- vs. more_Quant (because of automatic agreement in number)

}
