concrete yasin_burushaski of Numerals = {
-- include numerals.Abs.gf ;

oper LinDigit = {s : DForm => Str ; even20 : Even20 ; size : Size} ;

oper mk20Ten : Str -> Str -> LinDigit = \tri -> \tw -> 
  {s = table {unit => tri ; teen => "turma-" + tri ; twenty => tw+"-�ltar"} ; 
   even20 = ten ; size = pl} ;

oper mkEven20 : Str -> Str -> LinDigit = \tri -> \tw ->
  {s = table {unit => tri ; teen => "turma-" + tri ; twenty => tw+"-�ltar"} ; 
   even20 = even ; size = pl} ;

param Even20 = ten | even ;
param DForm = unit | teen | twenty ;
param Size = sg | pl ;
 
lincat Numeral = {s : Str} ;
lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;
lincat Sub100 = {s : Str ; size : Size} ;
lincat Sub1000 = {s : Str ; size : Size } ;
lincat Sub1000000 = {s : Str} ;
lin num x0 =
  {s = x0.s} ;
lin n2 = {s = table {unit => "alt�" ; teen => "turma-" + "alt�" ; twenty => "�ltar" } ; even20 = even ; size = pl} ;
lin n3  = {s = table {unit => "isk�" ; teen => "turma-" + "isk�" ; twenty => "�ltar" } ; even20 = ten ; size = pl} ;
lin n4  = mkEven20 "w�lte" "alt�";
lin n5  = mk20Ten "cend�" "alt�";
lin n6  = mkEven20 "bis'�nde" "isk�" ;
lin n7  = mk20Ten "thal�" "isk�";
lin n8  = mkEven20 "alt�mbe" "w�lte";
lin n9  = mk20Ten "hut�" "w�lte";

lin pot01  =
  {s = table {unit => "hek" ; teen => "turma-" + "h�k" ; twenty => []} ; even20 = ten ; size = sg};
lin pot0 d = d ; 
lin pot110 = {s = "t�rum" ; size = pl} ;
lin pot111 = {s = "turma-" + "h�k" ; size = pl} ;
lin pot1to19 d = {s = d.s ! teen ; size = pl} ;
lin pot0as1 n = {s = n.s ! unit ; size = n.size} ;
lin pot1 d =
  {s = table {even => d.s ! twenty ;  
              ten => d.s ! twenty ++ "t�rum"} ! d.even20 ;
   size = pl} ;
lin pot1plus d e =
  {s = table {even => d.s ! twenty ++ e.s ! unit;  
              ten => d.s ! twenty ++ e.s ! teen} ! (d.even20) ; 
   size = pl} ;

lin pot1as2 n = n ; 
lin pot2 d = {s = (selsg d.size (d.s ! unit)) ++ "tha" ; size = pl} ;
lin pot2plus d e =
  {s = (selsg d.size (d.s ! unit)) ++ "tha" ++ e.s ; size = pl} ;
lin pot2as3 n =
  {s = n.s } ;
lin pot3 n =
  {s = selsg n.size n.s ++ "haz�r"} ;
lin pot3plus n m =
  {s = selsg n.size n.s ++ "haz�r" ++ m.s } ;

oper selsg : Size -> Str -> Str = \sz -> \attr ->
  table {sg => [] ; _ => attr} ! sz ;

}
