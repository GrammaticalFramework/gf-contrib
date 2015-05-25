abstract Attempto =
Numeral, Symbols ** {

flags startcat = Text_ACE ;

cat CN_ACE ;
cat NP_ACE ;
cat Card_ACE ;
---cat Numeral ;
cat PN_ACE ;
cat A_ACE ;
cat A2_ACE ;
cat AP_ACE ;
cat RS_ACE ;
cat Pron_ACE ;
cat Prep_ACE ;
cat S_ACE ;
cat VP_ACE ;
cat V_ACE ;
cat VS_ACE ;
cat V2_ACE ;
cat V3_ACE ;
cat Adv_ACE ;
cat Conj_ACE ;
cat IP_ACE ;
cat IAdv_ACE ;
cat QS_ACE ;
cat Text_ACE ;
cat RP_ACE ;

fun aNP_ACE : CN_ACE -> NP_ACE ;
fun theNP_ACE : CN_ACE -> NP_ACE ;
fun cardNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;
fun noNP_ACE : CN_ACE -> NP_ACE ;
fun everyNP_ACE : CN_ACE -> NP_ACE ;
fun eachNP_ACE : CN_ACE -> NP_ACE ;
fun notEveryNP_ACE : CN_ACE -> NP_ACE ;
fun notEachNP_ACE : CN_ACE -> NP_ACE ;


fun theCollNP_ACE : CN_ACE -> NP_ACE ;
fun someCollNP_ACE : CN_ACE -> NP_ACE ;
fun allCollNP_ACE : CN_ACE -> NP_ACE ;
fun noCollNP_ACE : CN_ACE -> NP_ACE ;


fun eachTheNP_ACE : CN_ACE -> NP_ACE ;
fun eachSomeNP_ACE : CN_ACE -> NP_ACE ;
fun eachNumNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;

cat MCN_ACE ;

fun someMassNP_ACE : MCN_ACE -> NP_ACE ;
fun noMassNP_ACE : MCN_ACE -> NP_ACE ;
fun allMassNP_ACE : MCN_ACE -> NP_ACE ;
fun notAllMassNP_ACE : MCN_ACE -> NP_ACE ;

---fun one_Card : Card ;
---fun two_Card : Card ;
---fun five_Card : Card ;
---fun ten_Card : Card ;


fun pnNP_ACE : PN_ACE -> NP_ACE ;
fun intNP_ACE : Int -> NP_ACE ;
fun floatNP_ACE : Float -> NP_ACE ;


-- arithmetic expressions with + - * /

-- strings "foo" and "foo" & "bar

-- sets {a,b,c}

-- lists [a,b,c]

fun it_NP_ACE : NP_ACE ;
fun he_NP_ACE : NP_ACE ;
fun she_NP_ACE : NP_ACE ;
fun he_she_NP_ACE : NP_ACE ;
fun they_NP_ACE : NP_ACE ;


-- reflexive pronouns: itself, himself, herself, himself/herself, themselves

--fun someone_NP_ACE : NP_ACE ;
fun somebody_NP_ACE : NP_ACE ;
fun something_NP_ACE : NP_ACE ;
--fun noone_NP_ACE : NP_ACE ;
fun nobody_NP_ACE : NP_ACE ;
fun nothing_NP_ACE : NP_ACE ;
--fun not_everyoneNP_ACE : NP_ACE ;
fun not_everybodyNP_ACE : NP_ACE ;
fun not_everythingNP_ACE : NP_ACE ;

fun at_leastNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;
fun not_at_leastNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;
fun at_mostNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;
fun not_at_mostNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;
fun more_thanNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;
fun not_more_thanNP_ACE : Card_ACE -> CN_ACE -> NP_ACE ;

fun nothing_butNP_ACE : CN_ACE -> NP_ACE ; -- nothing but apples
fun nothing_butMassNP_ACE : MCN_ACE -> NP_ACE ; -- nothing but water
fun nobody_butNP_ACE : PN_ACE -> NP_ACE ; -- nobody but John
fun no_butNP_ACE : CN_ACE -> PN_ACE -> NP_ACE ; -- no man but John

cat Unit ; -- SI measurement units

fun unitNP_ACE : Card_ACE -> Unit -> NP_ACE ;
fun unit_ofNP_ACE : Card_ACE -> Unit -> CN_ACE -> NP_ACE ; -- 3 kg of apples
fun unit_ofMassNP_ACE : Card_ACE -> Unit -> MCN_ACE -> NP_ACE ; -- 3 l of water

fun apposVarCN_ACE : CN_ACE -> Var -> CN_ACE ; -- a man X
fun termNP_ACE : Term -> NP_ACE ;

fun conjNP_ACE : NP_ACE -> NP_ACE -> NP_ACE ;

-- 2.2.1

fun adjCN_ACE : AP_ACE -> CN_ACE -> CN_ACE ;
fun positAP_ACE : A_ACE -> AP_ACE ;
fun comparAP_ACE : A_ACE -> AP_ACE ;
fun superlAP_ACE : A_ACE -> AP_ACE ;


-- 2.2.2

fun relCN_ACE : CN_ACE -> RS_ACE -> CN_ACE ;
fun relNP_ACE : NP_ACE -> RS_ACE -> NP_ACE ;
fun andRS_ACE : RS_ACE -> RS_ACE -> RS_ACE ;
fun orRS_ACE : RS_ACE -> RS_ACE -> RS_ACE ;

fun suchCN_ACE : CN_ACE -> S_ACE -> CN_ACE ;

fun predRS_ACE : RP_ACE -> VP_ACE -> RS_ACE ;
fun slashRS_ACE : RP_ACE -> NP_ACE -> V2_ACE -> RS_ACE ;

fun which_RP_ACE : RP_ACE ;
fun eachRP_ACE : RP_ACE ;

-- 2.2.4

fun genNP_ACE : NP_ACE -> CN_ACE -> NP_ACE ; -- everybody's customer
fun ofCN_ACE : CN_ACE -> NP_ACE -> CN_ACE ; -- dog of John and Mary
fun genOwnNP_ACE : NP_ACE -> CN_ACE -> NP_ACE ; -- his own customer

-- 2.3.1

fun vpS_ACE : NP_ACE -> VP_ACE -> S_ACE ;
fun neg_vpS_ACE : NP_ACE -> VP_ACE -> S_ACE ;
fun not_provably_vpS_ACE : NP_ACE -> VP_ACE -> S_ACE ;

fun vVP_ACE : V_ACE -> VP_ACE ;
fun vsVP_ACE : VS_ACE -> S_ACE -> VP_ACE ;
fun v2VP_ACE : V2_ACE -> NP_ACE -> VP_ACE ;
fun v3VP_ACE : V3_ACE -> NP_ACE -> NP_ACE -> VP_ACE ;

-- 2.3.2

fun apVP_ACE : AP_ACE -> VP_ACE ;
fun compVP_ACE : A_ACE -> NP_ACE -> VP_ACE ; -- John is richer than Mary
fun as_asVP_ACE : AP_ACE -> NP_ACE -> VP_ACE ; -- John is as rich as Mary
fun more_thanVP_ACE : AP_ACE -> NP_ACE -> VP_ACE ; -- John is as rich as Mary

-- John is as fond-of Mary as of Sue
-- John is more fond-of Mary than of Sue

cat PP ;
--cat [PP] {1} ;
--fun ppVP_ACE : [PP] -> VP_ACE ; -- John is in the garden in the morning
fun ppVP_ACE : PP -> VP_ACE ; -- iteration is done by advPP and modVP_ACE

fun prepPP : Prep_ACE -> NP_ACE -> PP ;
fun advPP : PP -> Adv_ACE ;

-- 2.3.5

fun canVP_ACE : VP_ACE -> VP_ACE ;
fun mustVP_ACE : VP_ACE -> VP_ACE ;
fun have_toVP_ACE : VP_ACE -> VP_ACE ;

-- 2.4

fun modVP_ACE : VP_ACE -> Adv_ACE -> VP_ACE ;

-- 3.2

fun thereNP_ACE : NP_ACE -> S_ACE ; -- there is/are

-- 3.3

fun formulaS_ACE : Formula -> S_ACE ;

-- 3.4.1

fun coordS_ACE : Conj_ACE -> S_ACE -> S_ACE -> S_ACE ;

fun and_Conj_ACE : Conj_ACE ;
fun or_Conj_ACE : Conj_ACE ;
fun commaAnd_Conj_ACE : Conj_ACE ; -- lower precedence
fun commaOr_Conj_ACE : Conj_ACE ;

-- 3.4.3

fun for_everyS_ACE : CN_ACE -> S_ACE -> S_ACE ;
fun for_eachS_ACE : CN_ACE -> S_ACE -> S_ACE ;
fun for_each_ofS_ACE : Card_ACE -> CN_ACE -> S_ACE -> S_ACE ; -- for each of 3 men
fun for_allMassS_ACE : MCN_ACE -> S_ACE -> S_ACE ; -- for all water

-- 3.4.4

fun if_thenS_ACE : S_ACE -> S_ACE -> S_ACE ;
fun falseS_ACE : S_ACE -> S_ACE ; -- it is false that
fun not_provableS_ACE : S_ACE -> S_ACE ; -- it is not provable that
fun possibleS_ACE : S_ACE -> S_ACE ; -- it is possible that
fun not_possibleS_ACE : S_ACE -> S_ACE ;
fun necessaryS_ACE : S_ACE -> S_ACE ;
fun not_necessaryS_ACE : S_ACE -> S_ACE ;

-- 3.5

fun npQS_ACE : NP_ACE -> VP_ACE -> QS_ACE ;
fun ipQS_ACE : IP_ACE -> VP_ACE -> QS_ACE ;
fun iadvQS_ACE : IAdv_ACE -> NP_ACE -> VP_ACE -> QS_ACE ;

fun where_IAdv_ACE : IAdv_ACE ;
fun when_IAdv_ACE : IAdv_ACE ;
fun whoSg_IP_ACE : IP_ACE ;
fun whoPl_IP_ACE : IP_ACE ;

fun there_ipQS_ACE : IP_ACE -> QS_ACE ; -- there is who

fun whoseIP_ACE : CN_ACE -> IP_ACE ; -- whose dog

-- 3.6

fun np_impVP_ACE : NP_ACE -> VP_ACE -> Text_ACE ; -- John, go to the bank!

-- 4

---cat ACEText_ACE ;
---fun consText_ACE : Text_ACE -> ACEText_ACE -> ACEText_ACE ;

---fun baseText_ACE : Text_ACE -> ACEText_ACE ;

fun sText_ACE : S_ACE -> Text_ACE ;
fun qsText_ACE : QS_ACE -> Text_ACE ;

-- more

fun npVP_ACE : NP_ACE -> VP_ACE ; -- is a bank
fun impVP_ACE : VP_ACE -> Text_ACE ; -- go to the bank!
fun numeralCard_ACE : Numeral -> Card_ACE ; -- fifteen banks
fun digitsCard_ACE : Digits -> Card_ACE ; -- 8 banks
fun have_V2_ACE : V2_ACE ; -- has (an apple)
fun v2_byVP_ACE : V2_ACE -> NP_ACE -> VP_ACE ; -- is bought by a customer


}


