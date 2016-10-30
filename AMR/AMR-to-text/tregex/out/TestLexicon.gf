--# -path=../../lexicons/translator

abstract TestLexicon = Cat, Dictionary ** {

	fun

		live_01_V : V ;
		play_02_V : V ; -- note: play_1_V (etc.) in Dictionary (no default play_V)
		speak_01_V : V ;

		deserve_01_V2 : V2 ;
		like_01_V2 : V2 ;
		play_02_V2 : V2 ; -- note: play_1_V2 (etc.) in Dictionary (no default play_V2)
		see_01_V2 : V2 ;
		speak_01_V2 : V2 ;

		game_N : N ; -- because of game_1_N (etc.) in Dictionary (no default game_N)

		ball_A : A ; -- FIXME: how to represent e.g. "ball game"?

		more_Det : Det ; -- vs. more_Quant (because of automatic agreement in number)

}
