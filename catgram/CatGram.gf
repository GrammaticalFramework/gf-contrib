abstract CatGram = {

  flags startcat = S ;

  cat 
    S ; NP ; 
    Cat ; Obj Cat ;

  fun
    Prove        : NP -> NP -> S ;
    Conjecture   : NP -> NP -> S ;
    Walk         : NP -> S ;
    Sleep        : NP -> S ;
    Marcel       : NP ;
    Completeness : NP ;
    Small        : NP -> NP ;
  --  And          : (X : Cat) -> Obj X -> Obj X  ;
    AndVP        : (NP -> S) -> (NP -> S) -> (NP -> S) ;
    AndV2        : (NP -> NP -> S) -> (NP -> NP -> S) -> (NP -> NP -> S) ;


}