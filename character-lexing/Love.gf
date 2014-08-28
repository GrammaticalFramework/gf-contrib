abstract Love = {

  flags startcat = Comment ;

  cat
    Comment ;
    NP ; Pron ; CN ; V2 ;

  fun
    Pred : NP -> V2 -> NP -> Comment ;
    Person : Pron -> CN -> NP ;
    UsePron : Pron -> NP ;
    i_Pron, youSg_Pron, he_Pron, she_Pron, we_Pron, youPl_Pron, they_Pron : Pron ;
    Mother : CN ;
    Love : V2 ;
}
