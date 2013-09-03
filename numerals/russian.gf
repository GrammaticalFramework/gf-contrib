concrete russian of Numerals = {
flags coding = utf8 ;
-- include numerals.Abs.gf ;
-- flags coding=russian ;

-- Toiska, 13/8/2000, AR with Arto Mustajoki.

param DForm = unit  | teen  | ten | hund ;
param Place = attr  | indep  ;
param Size  = nom | sgg | plg ;
param Gen = masc | fem | neut ;
lincat Numeral = {s : Str} ;
lincat Digit = {s : DForm => Gen => Str ; size : Size} ;
lincat Sub10 = {s : Place => DForm => Gen => Str ; size : Size} ;
lincat Sub100 = {s : Place => Gen => Str ; size : Size} ;
lincat Sub1000 = {s : Place => Gen => Str ; size : Size} ;
lincat Sub1000000 = {s : Gen => Str} ;

oper mille : Size => Str = table {
  nom => "тысяча" ;
  sgg => "тысячи" ;
  _     => "тысяч"} ;

oper gg : Str -> Gen => Str = \s -> table {_ => s} ;

lin num x0 =
  {s = [] ++ x0.s ! masc ++ []} ;  -- Russian environment

lin n2  =
  {s = table {unit => table {fem => "две" ; _ => "два"} ; 
            teen => gg "двенадцать" ; 
            ten  => gg "двадцать" ;
            hund => gg "двести"} ; 
   size = sgg} ;
lin n3  =
  {s = table {unit => gg "три" ; 
            teen => gg "тринадцать" ; 
            ten  => gg "тридцать" ;
            hund => gg "триста"} ; 
  size = sgg} ;
lin n4  =
  {s = table {unit => gg "четыре" ; 
            teen => gg "четырнадцать" ; 
            ten  => gg "сорок" ;
            hund => gg "четыреста"} ; 
  size = sgg} ;
lin n5  =
  {s = table {unit => gg "пять" ; 
            teen => gg "пятнадцать" ; 
            ten  => gg "пятьдесят" ;
            hund => gg "пятьсот"} ; 
  size = plg} ;
lin n6  =
  {s = table {unit => gg "шесть" ; 
            teen => gg "шестнадцать" ; 
            ten  => gg "шестьдесят" ;
            hund => gg "шестьсот"} ; 
  size = plg} ;
lin n7  =
  {s = table {unit => gg "семь" ; 
            teen => gg "семнадцать" ; 
            ten  => gg "семьдесят" ;
            hund => gg "семьсот"} ; 
  size = plg} ;
lin n8  =
  {s = table {unit => gg "восемь" ; 
            teen => gg "восемнадцать" ; 
            ten  => gg "восемьдесят" ;
            hund => gg "восемьсот"} ; 
  size = plg} ;
lin n9  =
  {s = table {unit => gg "девять" ; 
            teen => gg "девятнадцать" ; 
            ten  => gg "девяносто" ;
            hund => gg "девятьсот"} ; 
  size = plg} ;


lin pot01  =
  {s = table {attr => table {hund => gg "сто" ; _ => gg []} ; 
            _ => table {hund => gg "сто" ; 
                     _ => table {masc => "один" ; fem => "одна" ; _ => "одно"}}} ;
   size = nom} ;
lin pot0 d =
  {s = table {_ => d.s} ; size = d.size} ;
lin pot110  =
  {s = table {_ => gg "десять"} ; size = plg} ;
lin pot111  =
  {s = table {_ => gg "одиннадцать"} ; size = plg} ; --- 11
lin pot1to19 d =
  {s = table {_ => d.s ! teen} ; size = plg} ;
lin pot0as1 n =
  {s = table {p => n.s ! p ! unit} ; size = n.size} ;
lin pot1 d =
  {s = table {_ => d.s ! ten} ; size = plg} ; ---
lin pot1plus d e =
  {s = table {_ => 
            table {g => d.s ! ten ! g ++ e.s ! indep ! unit ! g}} ; size = e.size} ;
lin pot1as2 n =
  {s = n.s ; size = n.size} ;
lin pot2 d =
  {s = table {p => d.s ! p ! hund} ; size = plg} ;
lin pot2plus d e =
  {s = table {p => table {g => d.s ! p ! hund ! g ++ e.s ! indep ! g}} ; size = e.size} ;
lin pot2as3 n =
  {s = n.s ! indep} ;
lin pot3 n =
  {s = gg (n.s ! attr ! fem ++ mille ! n.size)} ;
lin pot3plus n m =
  {s = table {g => n.s ! attr ! fem ++ mille ! n.size ++ m.s ! indep ! g}} ;

--- TODO
--- raz/odin


}
