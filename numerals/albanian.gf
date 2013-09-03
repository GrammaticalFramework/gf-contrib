concrete albanian of Numerals = {
-- include numerals.Abs.gf ;

oper bind : Str -> Str -> Str = \a -> \b -> a ++ b ;

param DForm = unit | teen | ten ;

oper LinDigit = {s : DForm => Str };
oper LinSub100 = {s : Str } ;

lincat Numeral =    { s : Str } ;
lincat Digit =      LinDigit ;
lincat Sub10 =      LinDigit ;
lincat Sub100 =     LinSub100 ;
lincat Sub1000 =    LinSub100 ;
lincat Sub1000000 = { s : Str } ;

oper mkNum : Str -> LinDigit = \tri -> 
  { s = table {unit => tri ; teen => tri + "mb�" + "dhjet�" ; ten => tri + "dhjet�" }};

lin num x = {s = x.s } ; 

lin n2 = {s = table {unit => "dy" ; teen => "dy" + "mb�" + "dhjet�" ; ten => "nj�zet" }};
lin n3 = mkNum "tre" ;
lin n4 = {s = table {unit => "kat�r" ; teen => "kat�r" + "mb�" + "dhjet�" ; ten => "dyzet" } };
lin n5 = mkNum "pes�" ;
lin n6 = mkNum "gjasht�";
lin n7 = mkNum "shtat�";
lin n8 = mkNum "tet�";
lin n9 = mkNum "n�nt�";

oper mkR : Str -> LinSub100 = \n -> {s = n } ;

lin pot01 = { s = table {_ => "nj�" }};
lin pot0 d = d ;
lin pot110 = mkR "dhjet�" ;
lin pot111 = mkR ("nj�" + "mb�" + "dhjet�") ;
lin pot1to19 d = mkR (d.s ! teen) ;
lin pot0as1 n = mkR (n.s ! unit) ;
lin pot1 d = mkR (d.s ! ten) ;
lin pot1plus d e = mkR ((d.s ! ten) ++ "e" ++ (e.s ! unit)) ;
lin pot1as2 n = n ;
lin pot2 d = mkR (bind (d.s ! unit) "qind") ;
lin pot2plus d e = mkR ((bind (d.s ! unit) "qind") ++ "e" ++ e.s) ;
lin pot2as3 n = {s = n.s };
lin pot3 n = {s = n.s ++ "mij�" } ;
lin pot3plus n m = {s = n.s ++ "mij�" ++ m.s} ;


}
