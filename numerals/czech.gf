concrete czech of Numerals = {
flags coding = utf8 ;
-- include numerals.Abs.gf ;
-- flags coding=latinasupplement ;

oper bind : Str -> Str -> Str = \s1 -> \s2 -> s1 ++ s2 ;

-- [c^], [s^], [r^], [e^]

param Size = sg | twothreefour | fiveup ;
param DForm = unit | teen | ten | hundred ; 

lincat Numeral =    { s : Str } ;
oper LinDigit = {s : DForm => Str ; size : Size} ;
lincat Digit = LinDigit ;

lincat Sub10 = {s : DForm => Str ; size : Size} ;
lincat Sub100 = {s : Str; size : Size } ;
lincat Sub1000 = {s : Str; size : Size } ;
lincat Sub1000000 = { s : Str } ;

oper mkNum : Str -> Str -> Str -> Str -> Size -> LinDigit = 
  \dva -> \dvanast -> \dvadsat -> \dveste -> \sz -> 
  { s = table {unit => dva ; teen => dvanast + "náct" ; ten => dvadsat ; hundred => dveste } ; size = sz };

oper mk2Num : Str -> Str -> Str -> Str -> LinDigit = \unit -> \teenbase -> \tenbase -> \hundred ->  
  mkNum unit teenbase (tenbase + "cet") hundred twothreefour ; 

oper mk5Num : Str -> Str -> Str -> LinDigit = \unit -> \teenbase -> \tenbase ->  
  mkNum unit teenbase (tenbase + "desát") (unit ++ "set") fiveup ; 

lin num x = {s = [] ++ x.s ++ [] } ; -- Latin A supplement encoding

lin n2 = mk2Num "dva" "dva" "dva" ("dve^" ++ "ste^") ;
lin n3 = mk2Num "tr^i" "tr^i" "tr^i" ("tr^i" ++ "sta") ;
lin n4 = mk2Num "čtyr^i" "čtr" "čtyr^i" ("čtyr^i" ++ "sta") ;
lin n5 = mk5Num "pe^t" "pat" "pa" ;
lin n6 = mk5Num "šest" "šest" "še" ;
lin n7 = mk5Num "sedm" "sedm" "sedm";
lin n8 = mk5Num "osm" "osm" "osm";
lin n9 = mk5Num "deve^t" "devate" "deva" ;

lin pot01 = {s = table {unit => "jeden" ; hundred => "sto" ; _ => "dummy" } ;
             size = sg } ; 
lin pot0 d = d ; 
lin pot110 = {s = "deset" ; size = fiveup } ;
lin pot111 = {s = "jedenáct" ; size = fiveup };
lin pot1to19 d = {s = d.s ! teen ; size = fiveup} ;
lin pot0as1 n = {s = n.s ! unit ; size = n.size} ;
lin pot1 d = {s = d.s ! ten ; size = fiveup} ;
lin pot1plus d e = {s = variants { d.s ! ten ++ e.s ! unit ; bind (bind (e.s ! unit) "a") (d.s ! ten)} ; size = tfSize e.size} ;
lin pot1as2 n = n ;
lin pot2 d = {s = d.s ! hundred ; size = fiveup} ;
lin pot2plus d e = {s = d.s ! hundred ++ e.s ; size = tfSize e.size} ;
lin pot2as3 n = {s = n.s } ;
lin pot3 n = {s = (mkTh n.s) ! n.size} ;
lin pot3plus n m = {s = (mkTh n.s) ! n.size ++ m.s} ;

oper tfSize : Size -> Size = \sz -> 
  table {sg => fiveup ; other => other} ! sz ; 

oper mkTh : Str -> Size => Str = \attr -> 
  table {sg => "tisíc" ; 
         twothreefour => attr ++ "tisíce" ; 
         fiveup => attr ++ "tisíc" } ;

}
