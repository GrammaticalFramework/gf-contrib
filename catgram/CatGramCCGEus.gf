concrete CatGramCCGEus of CatGram = open Prelude in {

  lincat
    Phr = Str ;
    S  = Sent ;
    NP = SS ;

  lin
    MkPhr        = \x -> x.s ++ x.co ++ x.v ;
    Prove        = \x,y -> lin S ( transS "frogatu" x.s y.s ) ; 
    Conjecture   = \x,y -> lin S ( transS "aierua_egin" x.s y.s ) ;
    Walk         = \x -> lin S (intransS "ibili" x.s ) ;
    Sleep        = \x -> lin S (intransS "lo_egin" x.s ) ;
    Marcel       = ss "Marcel" ;
    Completeness = ss "osotasun" ;

    AndVP V1 V2  = \x   -> {s = glue x.s ":NP?" ; -----
			    v = usv ("(" ++ V1.co ++ V1.v ++ and
				        ++ V2.co ++ V2.v ++ ")") ;
			    co = []};
 
    AndV2 V1 V2  = \x,y -> {s = erg x.s ;
			    co = abs y.s ;
			    v  = tv ("(" ++ V1.v ++ and ++ V2.v ++ ")")} ;

  oper
    Sent : Type = SS ** {v, co : Str} ;
    and : Str = "eta:(X\\X)/X" ;

    erg : Str -> Str = \x -> glue x "ek:NPe" ;
    abs : Str -> Str = \x -> glue x ":NPa" ;
    tv  : Str -> Str = \x -> glue x ":(S\\NPe)\\NPa" ;
    iv  : Str -> Str = \x -> glue x ":S\\NPa" ;
    usv : Str -> Str = \x -> glue x ":(S\\NP?)\\NP?" ; --underspecified


    transS : Str -> Str -> Str -> Sent ;
    transS verb x y  = {s = erg x ; co = abs y ; v = tv verb } ;

    intransS : Str -> Str -> Sent ;
    intransS verb x = {s = abs x ; v = iv verb ; co = []} ;


}