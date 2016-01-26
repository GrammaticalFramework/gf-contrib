--# -path=.:libsrc/chinese/pinyin:libsrc/api:libsrc/chinese

concrete Hsk1Pinyin of Hsk1 =
-- syntax
CatChi [
Utt,S,Cl,QS,QCl,NP,VP,VPSlash,CN,AP,Pron,Det,Quant,Conj,N,A,Adv,AdA,V,V2,VV,Temp
],
NounChi [
NP,Det,CN,Pron,PN,Quant,Num,Card,Numeral,AP,N,
DetCN,UsePN,UsePron,DetQuant,NumSg,NumPl,NumCard,NumNumeral,IndefArt,DefArt,MassNP,PossPron,UseN,AdjCN,AdjCN,PossNP
],
AdjectiveChi [
AdA,AP,A,
PositA,AdAP
],
AdverbChi [
NP,Prep,Adv,
PrepNP
],
VerbChi [
V,VS,V2,VV,VP,VPSlash,NP,Adv,Comp,AP,S,
UseV,ComplVS,ComplVV,SlashV2a,ComplSlash,AdvVP,CompAdv,CompAP,UseComp
],
SentenceChi [
S,Cl,QCl,Temp,Pol,NP,VP,QS,ClSlash,VPSlash,
PredVP,UseCl, UseQCl,SlashVP
],
TenseX [
TTAnt,PPos,PNeg,TPres,ASimul,AAnter
],
QuestionChi [
QCl,Cl,VP,VPSlash,ClSlash,IP,IDet,IQuant,IComp,IAdv,NP,CN,Num,Prep,Tense,
QuestCl, QuestVP, QuestSlash,QuestIAdv,QuestComp,IdetCN,IdetQuant,PrepIP,CompIAdv,CompIP
],
PhraseChi [
Utt,S,QS,Interj,
UttS,UttQS,UttInterj
],
  IdiomChi [
    NP,Cl,
    ExistNP
    ],
  ConstructionChi [
    Monthday, Month, Year, Adv,
    dayMonthYearAdv, intYear, intMonthday
    ],

-- lexicon
NumeralChi - [pot2,pot2plus,pot3,pot3plus] -- from 1 to 99

-- Lexicon, Structural made explicit to maintain Hsk wordings and order


** open SyntaxChi, ParadigmsChi, (R=ResChi), Prelude in {

oper cmkN : Str -> Str -> N = \s,c -> mkN s ; --- classifier not in Hsk1

lin i_Pron = R.pronNP "wǒ" ;
lin youSg_Pron = R.pronNP "nǐ" ;
lin in_Prep = mkPrep "zài" "" (R.ATPlace True) ;
lin he_Pron = R.pronNP "tā" ;
lin we_Pron = R.pronNP "wǒmen" ;
lin good_A = mkA "hǎo" ;
lin have_V2 = SyntaxChi.have_V2 ;
lin this_Quant = mkQuant "zhè" ;
lin can8know_VV = mkVV "huì" ;
lin whatSg_IP = R.ssword "shénme" ;
lin speak_V2 = mkV2 "shuō" ;
lin she_Pron = R.pronNP "tā" ;
lin think_VS = mkVS "xiǎng" ;
lin very_AdA = mkAdA "hěn" ;
lin man_N = cmkN "rén" "個" ;
lin person_N = cmkN "rén" "個" ;
lin that_Quant = mkQuant "nà" ;
lin come_V = mkV "lái" ;
lin next_A = mkA "lái" ;
lin all_Det = R.mkDet "dōu" ;
lin both_Det = R.mkDet "dōu" ;
lin can_VV = mkVV "néng" ;
lin go_V2 = mkV2 "qù" ;
lin leave_V = mkV "qù" ;
lin and_Conj = mkConj "hé" ;
lin do_V2 = mkV2 "zuò" ;
lin above_Prep = mkPrep "shàng" "" placeAdvType ;
lin up_Adv = mkAdv "shàng" placeAdvType ;
lin see_V2 = mkV2 "kàn" | mkV2 "kànjiàn" ;
lin look_V2 = mkV2 "kàn" ;
lin watch_V2 = mkV2 "kàn" ;
lin how_IAdv = R.ssword "zěnme" | R.ssword "nǎa" ;
lin now_Adv = mkAdv "xiànzài" timeAdvType ;
lin oclock_Adv card = lin Adv {s = card.s ++ "diǎn" ; advType = timeAdvType} ;
lin how_about_Interj np = lin Interj (ss (np.s ++ "ne" )) | lin Interj (ss (np.s ++ "zěnmeyàng" )) ;
lin too_AdA = mkAdA "tài" ;
lin inside_Adv = mkAdv "lǐ" placeAdvType ;
lin listen_V2 = mkV2 "tīng" ;
lin hear_V2 = mkV2 "tīng" ;
lin whoSg_IP = R.ssword "shéi" ;
lin many_Det = R.mkDet "duō" ;
lin time_N = mkN "shíhou" "ge" ;
lin fall_V = mkV "xià" ;
lin below_Prep = mkPrep "xià" "" placeAdvType ;
lin thank_you_Interj = lin Interj (ss "xièxie" ) ;
lin mr_NP pn = lin NP (ss (pn.s ++ "xiānsheng" )) ;
lin like_V2 = mkV2 "xǐhuan" ;
lin big_A = mkA "dà, dài" ;
lin large_A = mkA "dà, dài" ;
lin stuff_N = cmkN "dōngxi" "個" ;
lin small_A = mkA "xiǎo" ;
lin young_A = mkA "xiǎo" ;
lin have_name_Cl np pn = mkCl np (mkV2 "jiào" ) (mkNP pn) ;
lin love_V2 = mkV2 "ài" ;
lin year_N = cmkN "nián" "個" ;
lin please_Interj = lin Interj (ss "qǐng" ) ;
lin invite_V2 = mkV2 "qǐng" ;
lin return_V = mkV "huí" ;
lin reply_V = mkV "huí" ;
lin work_V = mkV "gōngzuò" ;
lin job_N = cmkN "gōngzuò" "個" ;
lin coin_N = cmkN "qián" "筆" ;
lin eat_V2 = mkV2 "chī" ;
lin open_V2 = mkV2 "kāi" ;
lin start_VV = mkVV "kāi" ;
lin family_N = mkN "jiā" "ge" ;
lin home_N = mkN "jiā" "ge" ;
lin which_IQuant = mkIQuant "nǎa" ;
lin friend_N = cmkN "péngyou" "個" ;
lin mom_N = cmkN "māma" "個" ;
lin today_Adv = mkAdv "jīntiān" timeAdvType ;
lin several_Det = R.mkDet "xiē" | R.mkDet "jǐ" ;
lin dad_N = cmkN "bàba" "個" ;
lin some_Quant = mkQuant "xiē" ;
lin a_few_Det = R.mkDet "xiē" | R.mkDet "jǐ" ;
lin sorry_Interj = lin Interj (ss "duìbuqǐ" ) ;
lin live_V = mkV "zhù" ;
lin reside_V = mkV "zhù" ;
lin happy_A = mkA "gāoxìng" ;
lin glad_A = mkA "gāoxìng" ;
lin buy_V2 = mkV2 "mǎi" ;
lin doctor_N = cmkN "yīshēng" "名" ;
lin where_IAdv = R.ssword "nǎr" ;
lin letter_character_N = cmkN "zì" "個" ;
lin name_N = mkN "míngzi" "ge" ;
lin recognize_V2 = mkV2 "rènshi" ;
lin know_V2 = mkV2 "rènshi" ;
lin sit_V = mkV "zuò" ;
lin drink_V2 = mkV2 "hē" ;
lin write_V2 = mkV2 "xiě" ;
lin moon_N = cmkN "yuè" "個" ;
lin month_N = cmkN "yuè" "個" ;
lin number_N = mkN "hào" ;
lin monthday_N = mkN "hào" ;
lin dog_N = cmkN "gǒu" "隻" ;
lin years_old_AP card = mkAP (lin A (ss (card.s ++ "suì" ))) ;
lin age_N = mkN "suì" "ge" ;
lin telephone_V = mkV "dǎ diànhuà" ;
lin hello_Interj = lin Interj (ss "wèi" ) ;
lin son_N = mkN "érzi" "ge" ;
lin pretty_A = mkA "piàoliang" ;
lin beautiful_A = mkA "piàoliang" ;
lin minute_N = mkN "fēnzhōng" "ge" ;
lin goodbye_Interj = lin Interj (ss "zàijiàn" ) ;
lin book_N = mkN "shū" | mkN "běn" "běn" ;
lin tomorrow_Adv = mkAdv "míngtiān" timeAdvType ;
lin few_Det = R.mkDet "shǎo" ;
lin little_Det = R.mkDet "shǎo" ;
lin how8much_IAdv = lin IAdv (R.ssword "duōshao" ) ;
lin how8many_IDet = mkIDet "duōshao" | mkIDet "jǐ" ;
lin piece_N = mkN "kuài" "ge" ;
lin money_NP = mkNP (mkN "kuài" ) ;
lin daughter_N = mkN "nǚ'ér" "ge" ;
lin lady_N = cmkN "xiǎojie" "個" ;
lin ms_NP pn = lin NP (ss (pn.s ++ "xiǎojie" )) ;
lin clothes_N = cmkN "yīfu" "件" ;
lin water_N = cmkN "shuǐ" "滴" ;
lin school_N = cmkN "xuéxiào" "所" ;
lin movie_N = cmkN "diànyǐng" "部" ;
lin film_N = cmkN "diànyǐng" "部" ;
lin letter_document_N = mkN "shū" "běn" ;
lin hospital_N = cmkN "yīyuàn" "所" ;
lin never_mind_Interj = lin Interj (ss "méi guānxi" ) ;
lin airplane_N = cmkN "fēijī" "架" ;
lin television_N = cmkN "diànshì" "臺" ;
lin read_V2 = mkV2 "dú" ;
lin study_V2 = mkV2 "dú" ;
lin back_Adv = mkAdv "hòumian" placeAdvType ;
lin behind_Prep = mkPrep "hòumian" "" placeAdvType ;
lin yesterday_Adv = mkAdv "zuótiān" timeAdvType ;
lin sleep_V = mkV "shuì jiào" ;
lin teacher_N = cmkN "lǎoshī" "名" ;
lin week_N = cmkN "xīngqī" "個" ;
lin cat_N = cmkN "māo" "隻" ;
lin computer_N = cmkN "diànnǎo" "臺" ;
lin heat_N = mkN "rè" "ge" ;
lin hot_A = mkA "rè" ;
lin student_N = cmkN "xuésheng" "名" ;
lin afternoon_N = cmkN "xiàwǔ" "個" ;
lin learn_V = mkV "xuéxí" ;
lin study_V = mkV "xuéxí" ;
lin cold_A = mkA "lěng" ;
lin youre_welcome_Interj = lin Interj (ss "bú kèqi" ) ;
lin in_front_Adv = mkAdv "qiánmiàn" placeAdvType ;
lin in8front_Prep = mkPrep "qiánmiàn" "" placeAdvType ;
lin china_NP = mkNP (mkPN "zhōngguó") ;
lin dish_N = cmkN "cài" "盤" ;
lin vegetable_N = cmkN "cài" "盤" ;
lin table_N = cmkN "zhuōzi" "張" ;
lin desk_N = cmkN "zhuōzi" "張" ;
lin taxi_N = cmkN "chūzūchē" "辆" ;
lin weather_N = mkN "tiānqì" "ge" ;
lin tea_N = mkN "chá" "bēi" ;
lin shop_N = cmkN "shāngdiàn" "间" ;
lin chair_N = cmkN "yǐzi" "把" ;
lin schoolmate_N = cmkN "tóngxué" "名" ;
lin a_bit_Det = R.mkDet "yìdiǎnr" ;
lin apple_N = cmkN "píngguǒ" "個" ;
lin restaurant_N = cmkN "fàndiàn" "间" ;
lin noon_N = cmkN "zhōngwǔ" "個" ;
lin late_morning_N = cmkN "shàngwǔ" "個" ;
lin fruit_N = cmkN "shuǐguǒ" "個" ;
lin cup_N = cmkN "bēizi" "個" ;
lin rain_V0 = mkV "xiàyǔ" ;
lin cooked_rice_N = mkN "mǐfàn" "ge" ;
lin beijing_NP = mkNP (mkPN "běijīng") ;
lin chinese_NP = mkNP (mkPN "hànyǔ") ;
lin wang_PN = mkPN "wáng" ;

---- with arabic numerals in HSK
lin january_Month = lin N {s = "1" ++ "yuè" ; c = []} ;  
lin february_Month = lin N {s = "2" ++ "yuè" ; c = []} ;  
lin march_Month = lin N {s = "3" ++ "yuè" ; c = []} ;  
lin april_Month = lin N {s = "4" ++ "yuè" ; c = []} ;  
lin may_Month = lin N {s = "5" ++ "yuè" ; c = []} ;  
lin june_Month = lin N {s = "6" ++ "yuè" ; c = []} ;  
lin july_Month = lin N {s = "7" ++ "yuè" ; c = []} ;  
lin august_Month = lin N {s = "8" ++ "yuè" ; c = []} ;  
lin september_Month = lin N {s = "9" ++ "yuè" ; c = []} ;  
lin october_Month = lin N {s = "10" ++ "yuè" ; c = []} ;  
lin november_Month = lin N {s = "11" ++ "yuè" ; c = []} ;  
lin december_Month = lin N {s = "12" ++ "yuè" ; c = []} ;  


}


