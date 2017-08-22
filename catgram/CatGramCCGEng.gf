concrete CatGramCCGEng of CatGram = open Prelude in {

  lincat
--    Phr = Str ;
    S = Sent ;
    NP = Str ;

  lin
    Prove        = transS "proved" ;
    Conjecture   = transS "conjectured" ;
    Walk         = intransS "walked" ;
    Sleep        = intransS "slept" ;
    Marcel       = np "Marcel" ;
    Completeness = np "completeness" ;
    Small        = modNP "small" ;

    AndVP V1 V2 = \x -> {s = x ; 
			 v = iv ("(" ++ V1.v ++ V1.co ++ and 
			             ++ V2.v ++ V2.co ++ ")") ; 
			 co = []}; 
    AndV2 V1 V2 = \x,y -> {s = x ; 
			   v = tv ("(" ++ V1.v ++ and ++ V2.v ++ ")") ;
			   co = y }; 


  linref
    S = \x -> x.s ++ x.v ++ x.co ;

  oper
    Sent : Type = {s, v, co : Str } ;

    iv : Str -> Str = \v -> glue v ":S\\NP" ;
    tv : Str -> Str = \v -> glue v ":(S\\NP)/NP" ;

    np : Str -> Str = \x -> glue x ":NP" ;


    modNP : Str -> Str -> Str ;
    modNP adj n = "(" ++ glue adj ":NP/NP" ++ n ++ "):NP" ;

    transS : Str -> Str -> Str -> Sent ;
    transS verb x y = {s = x ;  v = tv verb ; co = y } ;

    intransS : Str -> Str -> Sent ;
    intransS verb x = {s = x ; v = iv verb ; co = []} ;

    and : Str = "and:(X\\X)/X" ;



}