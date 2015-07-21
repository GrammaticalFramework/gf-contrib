concrete Hsk1Eng of Hsk1 =
-- syntax
  CatEng [
    Utt,S,Cl,QS,QCl,NP,VP,VPSlash,CN,AP,Pron,Det,Quant,Conj,N,A,Adv,AdA,V,V2,VV
    ],
  NounEng [
    NP,Det,CN,Pron,PN,Quant,Num,Card,Numeral,AP,N,
    DetCN,UsePN,UsePron,DetQuant,NumSg,NumPl,NumCard,NumNumeral,IndefArt,DefArt,MassNP,PossPron,UseN,AdjCN,AdjCN,PossNP
    ],
  AdjectiveEng [
    AdA,AP,A,
    PositA,AdAP
    ],
  AdverbEng [
    NP,Prep,Adv,
    PrepNP
    ],
  VerbEng [
    V,VS,V2,VV,VP,VPSlash,NP,Adv,Comp,AP,S,
    UseV,ComplVS,ComplVV,SlashV2a,ComplSlash,AdvVP,CompAdv,CompAP,UseComp
    ],
  SentenceEng [
    S,Cl,QCl,Temp,Pol,NP,VP,QS,ClSlash,VPSlash,
    PredVP,UseCl, UseQCl,SlashVP
    ],
  TenseX [
    Temp,Tense,Ant,
    TTAnt,PPos,PNeg,TPres,ASimul,AAnter
    ],
  QuestionEng [
    QCl,Cl,VP,VPSlash,ClSlash,IP,IDet,IQuant,IComp,IAdv,NP,CN,Num,Prep,Tense,
    QuestCl, QuestVP, QuestSlash,QuestIAdv,QuestComp,IdetCN,IdetQuant,PrepIP,CompIAdv,CompIP
    ],
  PhraseEng [
   Utt,S,QS,Interj,
   UttS,UttQS,UttInterj
   ],
  IdiomEng [
    NP,Cl,
    ExistNP
    ],
  ConstructionEng [
    Monthday, Month, Year, Adv,
    dayMonthYearAdv, intYear, intMonthday,
    january_Month, february_Month, march_Month, april_Month,  
    may_Month, june_Month, july_Month, august_Month, september_Month,  
    october_Month, november_Month, december_Month
    ],

-- lexicon
  NumeralEng - [pot2,pot2plus,pot3,pot3plus],  -- from 1 to 99
  StructuralEng [
    Pron,Prep,AdA,IP,V2,IAdv,VV,Conj,IDet,Det,Quant,Predet,IQuant,
    i_Pron,youSg_Pron,in_Prep,he_Pron,we_Pron,have_V2,can8know_VV,whatSg_IP,she_Pron,very_AdA,
    that_Quant,this_Quant,can_VV,and_Conj,have_V2,how_IAdv,too_AdA,whoSg_IP,many_Det,which_IQuant,how_IAdv,how_many_IDet,
    where_IAdv,few_Det,how8much_IAdv,how8many_IDet,behind_Prep,in8front_Prep,
    above_Prep
    ],
  LexiconEng [
    N,A,V,V2,Adv,
    good_A,speak_V2,man_N,come_V,above_Prep,see_V2,now_Adv,hear_V2,like_V2,big_A,small_A,young_A,
    love_V2,year_N,money_N,eat_V2,open_V2,today_Adv,live_V,buy_V2,doctor_N,name_N,sit_V,drink_V2,write_V2,moon_N,
    dog_N,see_V2,beautiful_A,book_N,airplane_N,television_N,read_V2,sleep_V,teacher_N,cat_N,computer_N,hot_A,student_N,
    cold_A,table_N,shop_N,chair_N,apple_N,restaurant_N,fruit_N,rain_V0,water_N,school_N,book_N
    ]

 ** open SyntaxEng,ParadigmsEng, (M = MorphoEng), (E = ExtraEng) in {

oper pmkAdv : Str -> Adv = \s -> ParadigmsEng.mkAdv s ;

lin think_VS = mkVS think_V ;
lin person_N = mkN "person" ;
lin both_Det = M.mkDeterminer singular "both" ;
lin go_V2 = mkV2 "go" ;
lin leave_V = mkV "leave" ;
lin do_V2 = mkV2 "do" ;
lin up_Adv = pmkAdv "up" ;
lin look_V2 = mkV2 (mkV "look") (mkPrep "at") | mkV2 "watch" ;
lin oclock_Adv card = pmkAdv ((mkUtt card).s ++ "oclock") ;
lin how_about_Interj np = lin Interj {s = "how about" ++ (mkUtt np).s} ;
lin inside_Adv = pmkAdv "inside" ;
lin listen_V2 = mkV2 "listen" ;
lin time_N = mkN "time" ;
lin fall_V = mkV "fall" ;
lin below_Prep = mkPrep "below" ;
lin thank_you_Interj = mkInterj "thank you" ;
lin mr_NP pn = mkNP (mkCN (mkN "Mr") (mkNP pn)) ;
lin large_A = mkA "large" ;
lin stuff_N = mkN "stuff" ;
lin have_name_Cl np pn = mkCl (mkNP (E.GenNP np) (mkN "name")) (mkNP pn) ;
lin please_Interj = mkInterj "please" ;
lin invite_V2 = mkV2 "invite" ;
lin return_V = mkV "return" ;
lin reply_V = mkV "reply" ;
lin work_V = mkV "work" ;
lin job_N = mkN "job" ;
lin coin_N = mkN "coin" ;
lin start_VV = mkVV (mkV "start") ;
lin family_N = mkN "family" ;
lin home_N = mkN "home" ;
lin friend_N = mkN "friend" ;
lin mom_N = mkN "mom" ;
lin several_Det = M.mkDeterminer plural "several" ;
lin dad_N = mkN "dad" ;
lin some_Quant = mkQuant "some" "some" ;
lin next_A = mkA "next" ;
lin all_Det = M.mkDeterminer plural "all" ;
lin a_few_Det = M.mkDeterminer plural "a few" ;
lin sorry_Interj = mkInterj "sorry" ;
lin reside_V = mkV "reside" ;
lin happy_A = mkA "happy" ;
lin glad_A = mkA "glad" ;
lin letter_character_N = mkN "character" | mkN "letter" ;
lin recognize_V2 = mkV2 "recognize" ;
lin know_V2 = mkV2 "know" ;
lin month_N = mkN "month" ;
lin number_N = mkN "number" ;
lin monthday_N = mkN "monthday" ;
lin years_old_AP card = mkAP (lin AdA (mkUtt (mkNP card (mkCN (mkN "year"))))) (mkA "old") ;
lin age_N = mkN "age" ;
lin telephone_V = mkV "telephone" ;
lin hello_Interj = mkInterj "hello" ;
lin son_N = mkN "son" ;
lin pretty_A = mkA "pretty" ;
lin minute_N = mkN "minute" ;
lin goodbye_Interj = mkInterj "goodbye" ;
lin tomorrow_Adv = pmkAdv "tomorrow" ;
lin little_Det = M.mkDeterminer singular "little" ;
lin piece_N = mkN "piece" ;
lin money_NP = mkNP (mkN "money") ;
lin daughter_N = mkN "daughter" ;
lin lady_N = mkN "lady" ;
lin ms_NP pn = mkNP (mkCN (mkN "Ms") (mkNP pn)) ;
lin clothes_N = mkN "clothes" ;
lin movie_N = mkN "movie" ;
lin film_N = mkN "film" ;
lin letter_document_N = mkN "letter" ;
lin hospital_N = mkN "hospital" ;
lin never_mind_Interj = mkInterj "never mind" ;
lin study_V2 = mkV2 "study" ;
lin back_Adv = pmkAdv "back" ;
lin yesterday_Adv = pmkAdv "yesterday" ;
lin week_N = mkN "week" ;
lin heat_N = mkN "heat" ;
lin afternoon_N = mkN "afternoon" ;
lin learn_V = mkV "learn" ;
lin study_V = mkV "study" ;
lin youre_welcome_Interj = mkInterj "you're welcome" ;
lin in_front_Adv = pmkAdv "in front" ;
lin china_NP = mkNP (mkPN "China") ;
lin dish_N = mkN "dish" ;
lin vegetable_N = mkN "vegetable" ;
lin desk_N = mkN "desk" ;
lin taxi_N = mkN "taxi" ;
lin weather_N = mkN "weather" ;
lin tea_N = mkN "tea" ;
lin schoolmate_N = mkN "schoolmate" ;
lin a_bit_Det = M.mkDeterminer singular "a bit" ;
lin a_few_Det = M.mkDeterminer plural "a few" ;
lin noon_N = mkN "noon" ;
lin late_morning_N = mkN "late morning" ;
lin cup_N = mkN "cup" ;
lin cooked_rice_N = mkN "cooked rice" ;
lin beijing_NP = mkNP (mkPN "Beijing") ;
lin chinese_NP = mkNP (mkPN "Chinese") ;
lin wang_PN = mkPN "Wang" ;

}