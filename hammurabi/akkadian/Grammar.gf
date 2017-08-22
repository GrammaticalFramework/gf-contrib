abstract Grammar = {

  flags startcat = S ;

  cat 
    S ; Cl ; NP ; VP ; ModP ; CN ; 
    Det ; N ; V ; V2 ; Adv ; 
    Tense ; 
    Conj ;
  data
    UseCl   : Tense -> Cl -> S ;
    PredVP  : NP -> VP -> Cl ;
    ProDrop : NP -> VP -> Cl ;
    PassVP  : NP -> V -> Cl ;
    ComplV2 : V2 -> NP -> VP ;
    DetCN   : Det -> CN -> NP ;
    ModCN   : ModP -> CN -> CN ;
    ModN    : ModP -> N  -> CN ;

    ConjS   : Conj -> S  -> S  -> S ;
    AdvS    : Adv  -> S  -> S ; 
    ConjNP  : Conj -> NP -> NP -> NP ;

    UseV    : V  -> VP ;
    UseN    : N  -> CN ;
    UseMod  : NP -> ModP ;

    sg_Det, pl_Det : Det ;
    that_Det, thatDu_Det, those_Det : Det ;

    Present, Perfect : Tense ;

    and_Conj, or_Conj, if_Conj : Conj ;

  
}
