concrete af_tunni of Numerals = {
-- include numerals.Abs.gf ;

param Size = sg | pl ;
param DForm = unit | ten ;

oper LinDigit = {s : DForm => Str ; size : Size } ;
oper Form = {s : Str ; size : Size } ;

lincat Numeral = {s : Str} ;
lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;
lincat Sub100 = Form ;
lincat Sub1000 = Form ;
lincat Sub1000000 = {s : Str} ;
lin num x0 =
  {s = x0.s} ; -- TODO: Encoding

oper mkNum : Str -> Str -> LinDigit = \mbili -> \lama ->
  {s = table {unit => mbili ; ten => lama }; size = pl };

-- lin n1 = mkNum "k�w" ; 
lin n2 = mkNum "l�mma" "labaat�n";
lin n3 = mkNum "s�ddi?" "sodd�n" ;
lin n4 = mkNum "�far" "afart�n";
lin n5 = mkNum "s^�n" "kont�n";
lin n6 = mkNum "l�?" "lihd�n";
lin n7 = mkNum "todd�bo" "toddob�tan";
lin n8 = mkNum "siy�ed" "siyye�tan" ;
lin n9 = mkNum "sag�al" "saga�s^an";

oper ss : Str -> Form = \s1 -> {s = s1 ; size = pl} ;

lin pot01  =
  {s = table {f => "k�w" }; size = sg };
lin pot0 d = d ;
lin pot110 = ss "t�mon" ; 
lin pot111 = ss ("t�mon" ++ "i" ++ "k�w") ; 
lin pot1to19 d = ss ("t�mon" ++ "i" ++ (d.s ! unit)) ;
lin pot0as1 n = {s = n.s ! unit ; size = n.size } ;
lin pot1 d = ss (d.s ! ten) ;
lin pot1plus d e = ss (d.s ! ten ++ "i" ++ e.s ! unit) ; 
lin pot1as2 n = n ;
lin pot2 d = ss (selsg d.size (d.s ! unit) ++ "boq�l" );
lin pot2plus d e = ss ((selsg d.size (d.s ! unit)) ++ "boq�l" ++ e.s) ;
lin pot2as3 n = {s = n.s } ;
lin pot3 n = {s = (selsg n.size n.s) ++ "k�n"} ;
lin pot3plus n m = {s = (selsg n.size n.s) ++ "k�n" ++ m.s} ;

oper selsg : Size -> Str -> Str = \sz -> \attr -> 
  table {pl => attr ; sg => [] } ! sz ; 

}
