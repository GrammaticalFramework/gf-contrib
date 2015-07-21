abstract Hsk1 =

-- syntax
  Cat [
    Utt,S,Cl,QS,QCl,NP,VP,VPSlash,CN,AP,Pron,Det,Quant,Conj,N,A,Adv,AdA,V,V2,VV
    ],
  Noun [
    NP,Det,CN,Pron,PN,Quant,Num,Card,Numeral,AP,N,
    DetCN,UsePN,UsePron,DetQuant,NumSg,NumPl,NumCard,NumNumeral,IndefArt,DefArt,MassNP,PossPron,UseN,AdjCN,AdjCN,PossNP
    ],
  Adjective [
    AdA,AP,A,
    PositA,AdAP
    ],
  Adverb [
    NP,Prep,Adv,
    PrepNP
    ],
  Verb [
    V,VS,V2,VV,VP,VPSlash,NP,Adv,Comp,AP,S,
    UseV,ComplVS,ComplVV,SlashV2a,ComplSlash,AdvVP,CompAdv,CompAP,UseComp
    ],
  Sentence [
    S,Cl,QCl,Temp,Pol,NP,VP,QS,ClSlash,VPSlash,
    PredVP,UseCl, UseQCl,SlashVP
    ],
  Tense [
    Temp,Pol,Tense,Ant,
    TTAnt,PPos,PNeg,TPres,ASimul,AAnter
    ],
  Question [
    QCl,Cl,VP,VPSlash,ClSlash,IP,IDet,IQuant,IComp,IAdv,NP,CN,Num,Prep,
    QuestCl, QuestVP, QuestSlash,QuestIAdv,QuestComp,IdetCN,IdetQuant,PrepIP,CompIAdv,CompIP
    ],
  Phrase [
   Utt,S,QS,Interj,
   UttS,UttQS,UttInterj
   ],
  Idiom [
    NP,Cl,
    ExistNP
    ],
  Construction [
    Monthday, Month, Year, Adv,
    dayMonthYearAdv, intYear, intMonthday,
    january_Month, february_Month, march_Month, april_Month,  
    may_Month, june_Month, july_Month, august_Month, september_Month,  
    october_Month, november_Month, december_Month
    ],

-- lexicon
  Numeral - [pot2,pot2plus,pot3,pot3plus]  -- from 1 to 99

  -- Lexicon, Structural made explicit to maintain Hsk list in order

 ** {

flags startcat = Utt ;

fun i_Pron : Pron ;
fun youSg_Pron : Pron ;
fun in_Prep : Prep ;
fun he_Pron : Pron ;
fun we_Pron : Pron ;
fun good_A : A ;
fun have_V2 : V2 ;
fun this_Quant : Quant ;
fun can8know_VV : VV ;
fun whatSg_IP : IP ;
fun speak_V2 : V2 ;
fun she_Pron : Pron ;
fun think_VS : VS ;
fun very_AdA : AdA ;
fun man_N : N ;
fun person_N : N ;
fun that_Quant : Quant ;
fun come_V : V ;
fun next_A : A ;
fun all_Det : Det ;
fun both_Det : Det ;
fun can_VV : VV ;
fun go_V2 : V2 ;
fun leave_V : V ;
fun and_Conj : Conj ;
fun do_V2 : V2 ;
fun above_Prep : Prep ;
fun up_Adv : Adv ;
fun see_V2 : V2 ;
fun look_V2 : V2 ;
fun how_IAdv : IAdv ;
fun now_Adv : Adv ;
fun oclock_Adv : Card -> Adv ;
fun how_about_Interj : NP -> Interj ; -- how about you
fun too_AdA : AdA ;
fun inside_Adv : Adv ;
fun listen_V2 : V2 ;
fun hear_V2 : V2 ;
fun whoSg_IP : IP ;
fun many_Det : Det ;
fun time_N : N ;
fun fall_V : V ;
fun below_Prep : Prep ;
fun thank_you_Interj : Interj ;
fun mr_NP : PN -> NP ;
fun like_V2 : V2 ;
fun big_A : A ;
fun large_A : A ;
fun stuff_N : N ;
fun small_A : A ;
fun young_A : A ;
fun have_name_Cl : NP -> PN -> Cl ; -- my name is Wang
fun love_V2 : V2 ;
fun year_N : N ;
fun please_Interj : Interj ;
fun invite_V2 : V2 ;
fun return_V : V ;
fun reply_V : V ;
fun work_V : V ;
fun job_N : N ;
fun coin_N : N ;
fun eat_V2 : V2 ;
fun open_V2 : V2 ;
fun start_VV : VV ;
fun family_N : N ;
fun home_N : N ;
fun which_IQuant : IQuant ;
fun friend_N : N ;
fun mom_N : N ;
fun today_Adv : Adv ;
fun several_Det : Det ;
fun dad_N : N ;
fun some_Quant : Quant ;
fun a_few_Det : Det ;
fun sorry_Interj : Interj ;
fun live_V : V ;
fun reside_V : V ;
fun happy_A : A ;
fun glad_A : A ;
fun buy_V2 : V2 ;
fun doctor_N : N ;
fun where_IAdv : IAdv ;
fun letter_character_N : N ;
fun name_N : N ;
fun recognize_V2 : V2 ;
fun know_V2 : V2 ;
fun sit_V : V ;
fun drink_V2 : V2 ;
fun write_V2 : V2 ;
fun moon_N : N ;
fun month_N : N ;
fun number_N : N ;
fun monthday_N : N ;
fun dog_N : N ;
fun years_old_AP : Card -> AP ;
fun age_N : N ;
fun telephone_V : V ;
fun hello_Interj : Interj ;
fun son_N : N ;
fun pretty_A : A ;
fun beautiful_A : A ;
fun minute_N : N ;
fun goodbye_Interj : Interj ;
fun book_N : N ;
fun tomorrow_Adv : Adv ;
fun few_Det : Det ;
fun little_Det : Det ;
fun how8much_IAdv : IAdv ;
fun how8many_IDet : IDet ;
fun piece_N : N ;
fun money_NP : NP ;
fun daughter_N : N ;
fun lady_N : N ;
fun ms_NP : PN -> NP ;
fun clothes_N : N ;
fun water_N : N ;
fun school_N : N ;
fun movie_N : N ;
fun film_N : N ;
fun letter_document_N : N ;
fun hospital_N : N ;
fun never_mind_Interj : Interj ;
fun airplane_N : N ;
fun television_N : N ;
fun read_V2 : V2 ;
fun study_V2 : V2 ;
fun back_Adv : Adv ;
fun behind_Prep : Prep ;
fun yesterday_Adv : Adv ;
fun sleep_V : V ;
fun teacher_N : N ;
fun week_N : N ;
fun cat_N : N ;
fun computer_N : N ;
fun heat_N : N ;
fun hot_A : A ;
fun student_N : N ;
fun afternoon_N : N ;
fun learn_V : V ;
fun study_V : V ;
fun cold_A : A ;
fun youre_welcome_Interj : Interj ;
fun in_front_Adv : Adv ;
fun in8front_Prep : Prep ;
fun china_NP : NP ;
fun dish_N : N ;
fun vegetable_N : N ;
fun table_N : N ;
fun desk_N : N ;
fun taxi_N : N ;
fun weather_N : N ;
fun tea_N : N ;
fun shop_N : N ;
fun chair_N : N ;
fun schoolmate_N : N ;
fun a_bit_Det : Det ;
fun apple_N : N ;
fun restaurant_N : N ;
fun noon_N : N ;
fun late_morning_N : N ;
fun fruit_N : N ;
fun cup_N : N ;
fun rain_V0 : V ;
fun cooked_rice_N : N ;
fun beijing_NP : NP ;
fun chinese_NP : NP ;
fun wang_PN : PN ;

}
