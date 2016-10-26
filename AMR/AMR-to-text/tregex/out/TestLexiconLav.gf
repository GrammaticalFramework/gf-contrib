concrete TestLexiconLav of TestLexicon = CatLav ** open ParadigmsLav, ResLav in {

	flags optimize=values ;

	lin

		live_01_V = mkV "dzīvot" second_conjugation ;
		play_02_V = mkV "spēlēt" second_conjugation ;
		speak_01_V = mkV "runāt" second_conjugation ;

		like_01_V2 = mkV2 (mkV "patikt" "patīku" "patiku" Dat) nom_Prep ;
		play_02_V2 = mkV2 (mkV "spēlēt" second_conjugation) acc_Prep ;
		see_01_V2 = mkV2 (mkV "redzēt" third_conjugation) acc_Prep ;
		speak_01_V2 = mkV2 (mkV "runāt" second_conjugation) acc_Prep ;

		boy_N = mkN "zēns" ;
		city_N = mkN "pilsēta" ;
		dog_N = mkN "suns" ;
		game_N = mkN "spēle" ;
		girl_N = mkN "meitene" ;
		person_N = mkN "persona" ;
		word_N = mkN "vārds" ;

		ball_A = mkA "bumbas" AIndecl ; -- FIXME(?)
		pretty_A = mkA "jauks" ;

		about_Prep = mkPrep "par" Acc Dat ;

}
