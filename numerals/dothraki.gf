concrete dothraki of Numerals = open Prelude in {

  -- http://www.dothraki.com/2011/10/numbers-numbers-everywhere/

  param Number = Sg | Pl ;
  param DForm = unit | teen | ten | hundred ;

  oper LinDigit = {s : DForm => Str ; n : Number} ;

  lincat
    Numeral = {s : Str} ;
    
    Digit = LinDigit ;
    
    Sub10 = {s : DForm => Str ; n : Number} ;
    
    Sub100, Sub1000, Sub1000000 = {s : Str ; n : Number} ;

  oper
    regNum : Str -> LinDigit ;
    regNum akat = {
      s = table {
        unit => akat ;
        teen => mkTeen akat ;
        ten => mkTen akat ;
        hundred => akat + "ken"
        } ;
      n = Pl
      } ;

    mkTeen : Str -> Str ;
    mkTeen ori = case ori of {
      or + ("i" | "a") => ori + "tthi" ;
      _ => ori + "thi"
      } ;

    mkTen : Str -> Str ;
    mkTen ori = case ori of {
      ("o" | "a") + ri => "ch" + ori ;
      _ => "chi" + ori
      } ;

    one : DForm => Str ;
    one = table {
      unit => "at" ;
      ten => "thi" ;
      teen => "atthi" ;
      hundred => "ken"
      } ;

    ma : Str ;
    -- bug: only the last 'ma' should contract
    -- 102 - ken m'akat
    -- 122 - ken ma chakat m'akat
    ma = pre {
      ("a" | "o") => "m'" ++ BIND ;
      _ => "ma"
      } ;

  lin
    num x = x ;

    n2 = regNum "akat" ;
    n3 = regNum "sen" ;
    n4 = regNum "tor" ;
    n5 = regNum "mek" ;
    n6 = regNum "zhinda" ;
    n7 = regNum "fekh" ;
    n8 = regNum "ori" ;
    n9 = regNum "qazat" ;

    pot01  = {s = one ; n = Sg} ;
    pot0 d = d ;

    pot110 = {s = one ! ten ; n = Pl} ;
    pot111 = {s = one ! teen ; n = Pl} ;
    pot1to19 d = d ** {s = d.s ! teen} ;
    pot0as1 n = n ** {s = n.s ! unit} ;
    pot1 d = d ** {s = d.s ! ten} ;
    pot1plus d e = d ** {s = d.s ! ten ++ ma ++ e.s ! unit} ;

    pot1as2 n = n ;
    pot2 d = {s = d.s ! hundred ; n = Pl} ;
    pot2plus d e =
      let
        ds = numForms d.n (one ! hundred) (d.s ! hundred)
      in
      {s = ds ++ ma ++ e.s; n = Pl} ;

    pot2as3 n = n ;
    pot3 n =
      let
        ns = numForms n.n [] n.s
      in
      {s = ns ++ "dalen" ; n = Pl} ;
    pot3plus n m =
      let
        ns = numForms n.n [] n.s
      in
      {s = ns ++ "dalen" ++ ma ++ m.s ; n = Pl} ;

  oper
    numForms : Number -> Str -> Str -> Str ;
    numForms n sg pl = case n of {
      Sg => sg ;
      _  => pl
      } ;

} ;
