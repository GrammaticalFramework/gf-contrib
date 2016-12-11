--# -path=../../../lexicons/translator

abstract TestLexicon = Cat, Dictionary ** {

	fun

		play_V : V ;			-- play_1_V
		prosecute_V : V ;		-- only prosecute_V2 in Dictionary

		google_V2 : V2 ;		-- no entry in Dictionary or DictEng
		play_V2 : V2 ;			-- play_1_V2

		urge_VV : VV ;			-- no urge_VV in Dictionary

		bar_N : N ;				-- bar_1_N
		court_N : N ;			-- court_1_N
		game_N : N ;			-- game_1_N
		issue_N : N ;			-- issue_1_N
		president_N : N ;		-- presidentMasc_N
		race_N : N ;			-- race_1_N
		school_N : N ;			-- school_1_N

		interest_A : A ;		-- the mapping between "interest" and "interesting" is not straightforward

		all_Det : Det ;			-- vs. more_Quant
		more_Det : Det ;		-- vs. more_Quant

		part_Prep : Prep ;		-- see Structural

		DIR_Prep : Prep ;		-- temporary
		GOL_Prep : Prep ;		-- temporary

}
