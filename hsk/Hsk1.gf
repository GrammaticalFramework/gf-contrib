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
    TTAnt,PPos,PNeg,TPres,TPast,ASimul,AAnter
    ],
  Question [
    QCl,Cl,VP,VPSlash,ClSlash,IP,IDet,IQuant,IComp,IAdv,NP,CN,Num,Prep,
    QuestCl, QuestVP, QuestSlash,QuestIAdv,QuestComp,IdetCN,IdetQuant,PrepIP,CompIAdv,CompIP
    ],
  Phrase [
   Utt,S,QS,
   UttS,UttQS
   ],


-- lexicon
  Numeral - [pot2,pot2plus,pot3,pot3plus],  -- from 1 to 99
  Structural [
    Pron,Prep,AdA,IP,V2,IAdv,VV,Conj,IDet,Det,Quant,Predet,IQuant,
    i_Pron,youSg_Pron,in_Prep,he_Pron,we_Pron,have_V2,can8know_VV,whatSg_IP,she_Pron,very_AdA,
    that_Quant,this_Quant,can_VV,and_Conj,have_V2,how_IAdv,too_AdA,who_IP,many_Det,which_IQuant,how_IAdv,how_many_IDet,
    where_IAdv,few_Det,how_much_IDet,how_many_IDet,behind_Prep,in8front_Prep
    ],
  Lexicon [
    N,A,V,V2,Adv,
    good_A,speak_V2,man_N,come_V,next_A,above_Prep,see_V2,look_V2,now_Adv,hear_V2,time_N,like_V2,big_A,small_A,young_A,
    love_V2,year_N,money_N,eat_V2,open_V2,mom_N,today_Adv,live_V,buy_V2,doctor_N,name_N,sit_V,drink_V2,write_V2,moon_N,
    dog_N,see_V2,beautiful_A,book_N,airplane_N,television_N,read_V2,sleep_V,teacher_N,cat_N,computer_N,hot_A,student_N,
    cold_A,table_N,shop_N,chair_N,apple_N,restaurant_N,fruit_N,rain_V,water_N,school_N,book_N
    ]

 ** {

flags startcat = Utt ;

fun think_VS : VS ;
fun person_N : N ;
fun both_Det : Det ;
fun go_V2 : V2 ;
fun leave_V : V ;
fun do_V2 : V2 ;
fun up_Adv : Adv ;
fun watch_V2 : V2 ;
fun oclock_Adv : Adv ;
fun how_about_QS : QS ;
fun inside_Adv : Adv ;
fun listen_V2 : V2 ;
fun fall_V : V ;
fun below_Prep : Prep ;
fun thank_you_Utt : Utt ;
fun mr_NP : PN -> NP ;
fun large_A : A ;
fun stuff_N : N ;
fun have_name_Cl : Cl ;
fun please_Utt : Utt ;
fun invite_V2 : V2 ;
fun return_V : V ;
fun reply_V : V ;
fun work_V : V ;
fun job_N : N ;
fun coin_N : N ;
fun start_VV : VV ;
fun family_N : N ;
fun home_N : N ;
fun friend_N : N ;
fun several_Det : Det ;
fun a_few_Det : Det ;
fun dad_N : N ;
fun some_Quant : Quant ;
fun several_Det : Det ;
fun a_few_Det : Det ;
fun all_Det : Det ;
fun how_about_QS : QS ;
fun sorry_Utt : Utt ;
fun reside_V : V ;
fun happy_A : A ;
fun glad_A : A ;
fun letter_N : N ;
fun character_N : N ;
fun recognize_V2 : V2 ;
fun know_V2 : V2 ;
fun month_N : N ;
fun number_N : N ;
fun monthday_N : N ;
fun years_old_AP : Card -> AP ;
fun age_N : N ;
fun telephone_V : V ;
fun hello_Utt : Utt ;
fun son_N : N ;
fun pretty_A : A ;
fun minute_N : N ;
fun goodbye_Utt : Utt ;
fun tomorrow_Adv : Adv ;
fun little_Det : Det ;
fun piece_N : N ;
fun money_NP : NP ;
fun daughter_N : N ;
fun lady_N : N ;
fun ms_NP : PN -> NP ;
fun clothes_N : N ;
fun movie_N : N ;
fun film_N : N ;
fun letter_N : N ;
fun hospital_N : N ;
fun never_mind_Utt : Utt ;
fun study_V2 : V2 ;
fun back_Adv : Adv ;
fun yesterday_Adv : Adv ;
fun week_N : N ;
fun heat_N : N ;
fun afternoon_N : N ;
fun learn_V : V ;
fun study_V : V ;
fun youre_welcome_Utt : Utt ;
fun in_front_Adv : Adv ;
fun in_front_of_Prep : Prep ;
fun china_PN : PN ;
fun dish_N : N ;
fun vegetable_N : N ;
fun desk_N : N ;
fun taxi_N : N ;
fun weather_N : N ;
fun tea_N : N ;
fun schoolmate_N : N ;
fun a_bit_Det : Det ;
fun a_few_Det : Det ;
fun noon_N : N ;
fun late_morning_N : N ;
fun cup_N : N ;
fun cooked_rice_N : N ;
fun beijing_PN : PN ;
fun chinese_PN : PN ;

}
