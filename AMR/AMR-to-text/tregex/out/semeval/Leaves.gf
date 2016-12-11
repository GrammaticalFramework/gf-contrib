--# -path=../../../lexicons/translator

abstract Leaves = Cat, Dictionary ** {

	fun

		play_V : V ;			-- play_1_V (etc.) in Dictionary (no default play_V)
		prosecute_V : V ;		-- only prosecute_V2 in Dictionary

		google_V2 : V2 ;		-- no entry in Dictionary or DictEng
		play_V2 : V2 ;			-- play_1_V2 (etc.) in Dictionary (no default play_V2)

		urge_VV : VV ;			-- no urge_VV in Dictionary

		bar_N : N ;				-- no entry in Dictionary, but there is one in DictEng
		court_N : N ;			-- because of court_1_N (etc.) in Dictionary (no default court_N)
		game_N : N ;			-- because of game_1_N (etc.) in Dictionary (no default game_N)
		issue_N : N ;			-- because of issue_1_N (etc.) in Dictionary (no default issue_N)
		president_N : N ;		-- because of presidentFem_N (etc.) in Dictionary (no default president_N)
		school_N : N ;			-- because of school_1_N (etc.) in Dictionary (no default school_N)

		ball_A : A ;			-- FIXME: how to represent e.g. "ball game"? avoiding the of-construction and N2 entries
		interest_A : A ;		-- the mapping between "interest" and "interesting" is not straightforward
		race_A : A ;			-- FIXME: the same issue (no "mkCN : N -> N -> CN")

		all_Det : Det ;			-- vs. all_Quant (because of automatic agreement in number)
		more_Det : Det ;		-- vs. more_Quant (because of automatic agreement in number)

		part_Prep : Prep ;		-- see Structural (RGL)

		DIR_Prep : Prep ;		-- a temporary experiment
		GOL_Prep : Prep ;		-- a temporary experiment

}
