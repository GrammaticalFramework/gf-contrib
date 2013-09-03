--# -path=.:present

concrete TestAttemptoSwe of TestAttempto = AttemptoSwe ** 
  open SyntaxSwe, ParadigmsSwe, IrregSwe, (C = ConstructX) in {

lin card_N = mkkN "kort" neutrum ;
lin water_MCN = mkCN (mkN "vatten" "vattnet" "vatten" "vattnen") ;
lin john_PN = mkPN "John" ;
lin apple_N = mkkN "�pple" neutrum ;
lin sleep_V = IrregSwe.sova_V ;
lin young_A = mkA "ung" ;
lin dog_N = mkkN "hund" utrum ;
lin animal_N = mkkN "djur" neutrum ;
lin wait_V = mkV "v�nta" ;
lin man_N = mkCN (mkN "man" "mannen" "m�n" "m�nnen") ;
lin woman_N = mkkN "kvinna" utrum ;
lin give_V3 = mkV3 giva_V (mkPrep []) (mkPrep "till") ;
lin tired_A = mkA "tr�tt" ;
lin rich_A = mkA "rik" ;
lin customer_N = mkCN (mkN "kund" "kunder") ;
lin enter_V2 = mkV2 (mkV (mkV "tr�der") "in") (mkPrep "i") ;
lin bank_N = mkCN (mkN "bank" "banker") ;
lin satisfied_A = mkA "n�jd" "n�jt" ;
lin lucky_A = mkA "lycklig" ;
lin well_known_A = mkA "v�lk�nd" ;
lin important_A = mkA "viktig" ;
lin expensive_A = mkA "dyr" ;
lin fill_in_V2 = mkV2 (mkV (mkV "fyller") "i") ;
lin form_N = mkkN "formul�r" neutrum ;
lin age_N = mkkN "�lder" utrum ;
lin teacher_N = mkkN "l�rare" utrum ;
lin successful_A = mkA "framg�ngsrik" ;
lin fond_A2 = mkA2 (mkA "f�rtjust") (mkPrep "i") ;
lin garden_N = mkkN "tr�dg�rd" utrum ;
lin morning_N = mkCN (mkN "morgon" "morgonen" "morgnar" "morgnarna") ;
lin code_N = mkCN (mkN "kod" "koder") ;
lin drinkable_A = mkA "drickbar" ;
lin work_V = mkV "arbeta" ;
lin admitted_A = mkA "godk�nd" ;
lin eat_V2 = mkV2 �ta_V ;
lin burger_N = mkkN "hamburgare" utrum ;
lin earn_V2 = mkV2 "tj�na" ;
lin income_N = mkCN (mkN "inkomst" "inkomster") ;
lin england_PN = mkPN "England" ;
lin beginning_N = mkCN (mkN "b�rjan" "b�rjan" "b�rjan" "b�rjan") ;
lin office_N = mkkN "kontor" neutrum ;
lin interested_A2 = mkA2 (compoundA (mkA "intresserad" "intresserat")) (mkPrep "i") ;
lin classroom_N = mkCN (mkN "klassrum" "klassrummet" "klassrum" "klassrummen") ;
lin manually_Adv = mkAdv "manuellt" ;
lin slot_N = mkkN "h�l" neutrum ;
lin patiently_Adv = mkAdv "t�lamodigt" ;
lin course_N = mkCN (mkN "kurs" "kurser") ;
lin carefully_Adv = mkAdv "f�rsiktigt" ;
lin time_N = mkCN (mkN "tid" "tider") ;
lin believe_VS = mkVS (mkV "tro") ;
lin seriously_Adv = mkAdv "seri�st" ;
lin clerk_N = mkCN (mkN "kontorist" "kontorister") ;
lin screen_N = mkkN "sk�rm" neutrum ;
lin blink_V = mkV "blinka" ;
lin bed_N = mkkN "s�ng" utrum ;
lin container_N = mkkN "beh�llare" utrum ;
lin automated_teller_N = mkCN (mkN "automat" "automater") ;
lin reject_V2 = mkV2 "f�rkasta" ;
lin accept_V2 = mkV2 "acceptera" ;
lin type_V2 = mkV2 skriva_V ; ----
lin know_VS = mkVS veta_V ;
lin manager_N = mkCN (mkN "chef" "chefer") ;
lin oversleep_V = mkV "f�rsova" "f�rsov" "f�rsovit" ;
lin valid_A = mkA "giltig" ;
lin see_V2 = mkV2 se_V ;
lin bark_V = mkV "sk�ller" ;
lin go_V2 = mkV2 g�_V to_Prep ;
lin brother_N = mkCN (mkN "bror" "brodern" "br�der" "br�derna") ;
lin mary_PN = mkPN "Mary" ;
lin machine_N = mkCN (mkN "maskin" "maskiner") ;
lin correct_A = mkA "korrekt" ;

oper mkkN : Str -> Gender -> CN = \n,g -> mkCN (ParadigmsSwe.mkN n g) ;

lin kilogram_Unit = mkCN (mkN "kilo" "kilot" "kilo" "kilon") ;

lin
  in_Prep = SyntaxSwe.in_Prep ;
  at_Prep = mkPrep "p�" ;
  into_Prep = mkPrep "in i" ;

}
