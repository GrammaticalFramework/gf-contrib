interface ResFinnic = DiffFinnic ** open CommonFinnic, Prelude in {


-- Aiming for more consistent naming: Possessive suffix is always called ps, not s2.

--------------
-- Determiners

oper 
  emptyDet : Number -> Det = \num -> {
    s,sp = \\_ => [] ;
    ps = \\_ => [] ;
    n = num ;
    isNum,isPoss,isDef,isNeg = False 
    } ;

--------------
-- Pronoun, NP

  NP : Type = { 
    s : NPForm => Str ; 
    a : Agr ; 
    isPron : Bool ;
    isNeg : Bool -- TODO is this relevant for Estonian?
    } ; 

  Pronoun : Type = { 
    s : NPForm => Str ; 
    a : Agr ; 
    hasPoss : Bool ; -- Only Finnish
    poss : Str       -- Only Finnish
  } ; 

-- Compl is used as a Prep, as well as for verb complements.
-- appCompl does part of the work in choosing the right case for the args of a verb.

  Compl : Type = {
    s1 : Str ; -- Using 2 strings to cover pre- and postpositions, 
    s2 : Str ; -- instead of isPre:Bool. Both are empty if the Prep is only case.
    ps : Agr => Str ; -- Finnish needs the 3th field because of possessive suffixes
    c : NPForm ; -- Case
    } ;

  appCompl : Bool -> Polarity -> Compl -> NP -> Str = \isFin,b,co,np ->
    let
      c = case co.c of {
        NPAcc => case b of {
          Neg => NPCase Part ; -- en näe taloa/sinua
          Pos => case isFin of {
               True => NPAcc ; -- näen/täytyy nähdä sinut
               _ => case np.isPron of {
                  False => NPCase Nom ;  -- täytyy nähdä talo
                  _ => NPAcc
                  }
               }
          } ;
        _        => co.c
        } ;
      nps = np.s ! c ;
      cos1 = co.s1 ;
      cos2 = case c of {
           NPCase Gen => case np.isPron of {
               True  => co.ps ! np.a ;
               False => co.s2
              } ;
           _ => co.s2
           } ;
    in
    cos1 ++ nps ++ cos2 ; 


---------------
-- Clauses, VPs




} 