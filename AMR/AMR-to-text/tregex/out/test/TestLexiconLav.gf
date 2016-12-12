--# -path=../../../lexicons/translator:../semeval

concrete TestLexiconLav of TestLexicon = CatLav ** open ParadigmsLav, ResLav in {

	flags

		coding = utf8 ;
		language = lv_LV ;
		optimize = values ;

	lin

		live_V = mkV "dzīvot" second_conjugation ;
		play_V = mkV "spēlēt" second_conjugation ;
		speak_V = mkV "runāt" second_conjugation ;

		assail_V2 = mkV2 (mkV "uzbrukt" "uzbrūku" "uzbruku") dat_Prep ;
		commit_V2 = mkV2 (mkV "izdarīt" third_conjugation) acc_Prep ;
		deserve_V2 = mkV2 (mkV "pelnīt" third_conjugation) acc_Prep ;
		like_V2 = mkV2 (mkV "patikt" "patīku" "patiku" Dat) nom_Prep ;
		look_V2 = mkV2 (mkV "skatīties" third_conjugation) acc_Prep ;
		play_V2 = mkV2 (mkV "spēlēt" second_conjugation) acc_Prep ;
		see_V2 = mkV2 (mkV "redzēt" third_conjugation) acc_Prep ;
		speak_V2 = mkV2 (mkV "runāt" second_conjugation) acc_Prep ;

		obligate_V2V = mkV2V (mkV "uzdot" "uzdodu" "uzdevu") dat_Prep ;

		ball_N = mkN "bumba" ;
		boy_N = mkN "zēns" ;
		bullet_N = mkN "lode" ;
		city_N = mkN "pilsēta" ;
		dog_N = mkN "suns" ;
		game_N = mkN "spēle" ;
		girl_N = mkN "meitene" ;
		person_N = mkN "persona" ;
		reason_N = mkN "iemesls" ;
		school_N = mkN "skola" ;
		suicide_N = mkN "pašnāvība" ;
		thug_N = mkN "slepkava" ;
		word_N = mkN "vārds" ;

		good_A = mkA "labs" ;
		nice_A = mkA "jauks" ;
		other_A = mkA "cits" ;
		pretty_A = mkA "jauks" ;

		very_AdA = mkAdA "ļoti" ;

		about_Prep = mkPrep "par" Acc Dat ;

}
