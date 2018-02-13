--# -path=.:danish:alltenses
-- --# -path=.:present

concrete TestAttemptoDan of TestAttempto = AttemptoDan ** 
  open SyntaxDan, ParadigmsDan, IrregDan, (C = ConstructX) in {

lin card_N = mkkN "kort" neutrum ;
lin water_MCN = mkCN (mkN "vand" "vandet" "vand" "vandet") ;
lin john_PN = mkPN "John" ;
lin apple_N = mkkN "æble" neutrum ;
lin sleep_V = IrregDan.sove_V ;
lin young_A = mkA "ung" ;
--lin dog_N = mkkN "hund" utrum ;
lin dog_N = mkCN (mkN "hund" "hunden" "hunde" "hundene") ;
lin animal_N = mkkN "dyr" neutrum ;
lin wait_V = mkV "vente" ;
lin man_N = mkCN (mkN "mand" "manden" "mænd" "mændene") ;
lin woman_N = mkkN "kvinde" utrum ;
lin give_V3 = mkV3 give_V (mkPrep []) (mkPrep "til") ;
lin tired_A = mkA "træt" ;
lin rich_A = mkA "rig" ;
lin customer_N = mkCN (mkN "kunde" "kunder") ;
lin enter_V2 = mkV2 (mkV (mkV "træde") "ind") (mkPrep "i") ;
lin bank_N = mkCN (mkN "bank" "banker") ;
lin satisfied_A = mkA "tilfreds" "tilfredse" ;
lin lucky_A = mkA "lykkelig" ;
lin well_known_A = mkA "velkendt" ;
lin important_A = mkA "vigtig" ;
lin expensive_A = mkA "dyr" ;
lin fill_in_V2 = mkV2 (mkV (mkV "fylde") "i") ;
lin form_N = mkkN "formular" neutrum ;
lin age_N = mkkN "alder" utrum ;
--lin teacher_N = mkkN "lærer" utrum ;
lin teacher_N = mkCN (mkN "lærer" "læreren" "lærere" "lærerne") ;
lin successful_A = mkA "succesfuld" ;
lin fond_A2 = mkA2 (mkA "glad") (mkPrep "for") ;
lin garden_N = mkkN "have" utrum ;
lin morning_N = mkCN (mkN "morgen" "morgenen" "morgener" "morgenerne") ;
--lin code_N = mkCN (mkN "kode" "koder") ;
lin code_N = mkkN "kode" utrum ;
lin drinkable_A = mkA "drikkelig" ;
lin work_V = mkV "arbejde" ;
lin admitted_A = mkA "optaget" ;
lin eat_V2 = mkV2 (mkV "spise") ;
lin burger_N = mkkN "burger" utrum ;
lin earn_V2 = mkV2 "tjene" ;
lin income_N = mkCN (mkN "indkomst" "indkomster") ;
lin england_PN = mkPN "England" ;
lin beginning_N = mkCN (mkN "begyndelse" "begyndelsen" "begyndelser" "begyndelserne") ;
lin office_N = mkkN "kontor" neutrum ;
lin interested_A2 = mkA2 (compoundA (mkA "intresseret" "intresserede")) (mkPrep "i") ;
lin classroom_N = mkCN (mkN "klasseværelse" "klasseværelset" "klasseværelser" "klasseværelserne") ;
lin manually_Adv = mkAdv "manuelt" ;
lin slot_N = mkkN "hul" neutrum ;
lin patiently_Adv = mkAdv "tålmodigt" ;
lin course_N = mkCN (mkN "kurs" "kurser") ;
lin carefully_Adv = mkAdv "forsigtigt" ;
lin time_N = mkCN (mkN "tid" "tider") ;
lin believe_VS = mkVS (mkV "tro") ;
lin seriously_Adv = mkAdv "seriøst" ;
lin clerk_N = mkCN (mkN "ekspedient" "ekspedient") ;
lin screen_N = mkkN "skærm" neutrum ;
lin blink_V = mkV "blinke" ;
lin bed_N = mkkN "seng" utrum ;
lin container_N = mkkN "beholder" utrum ;
lin automated_teller_N = mkCN (mkN "automat" "automater") ;
lin reject_V2 = mkV2 "afvise" ;
lin accept_V2 = mkV2 "acceptere" ;
lin type_V2 = mkV2 skrive_V ; ----
lin know_VS = mkVS vide_V ;
lin manager_N = mkCN (mkN "chef" "chefer") ;
lin oversleep_V = mkV "forsove" "forsov" "forsovet" ;
lin valid_A = mkA "gyldig" ;
lin see_V2 = mkV2 se_V ;
lin bark_V = mkV "gø" ;
lin go_V2 = mkV2 gå_V to_Prep ;
lin brother_N = mkCN (mkN "bror" "broderen" "brødre" "brødrene") ;
lin mary_PN = mkPN "Mary" ;
lin machine_N = mkCN (mkN "maskine" "maskiner") ;
lin correct_A = mkA "korrekt" ;

oper mkkN : Str -> Gender -> CN = \n,g -> mkCN (ParadigmsDan.mkN n g) ;

lin kilogram_Unit = mkCN (mkN "kilo" "kiloet" "kilo" "kiloerne") ;

lin
  in_Prep = SyntaxDan.in_Prep ;
  at_Prep = mkPrep "på" ;
  into_Prep = mkPrep "ind i" ;

}

