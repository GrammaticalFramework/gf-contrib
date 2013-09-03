concrete maale of Numerals = {
-- include numerals.Abs.gf ;

param Size = sg | pl ;
param DForm = unit | ten ;

oper LinDigit = {s : DForm => Str ; size : Size } ;
oper Form = {s : Str ; size : Size } ;

lincat Numeral = {s : Str} ;
lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;
lincat Sub100 = Form ;
lincat Sub1000 = {s : Str} ;
lincat Sub1000000 = {s : Str} ;
lin num x0 =
  {s = x0.s} ; -- TODO: Encoding

oper mkNum : Str -> Str -> LinDigit = \mbili -> \lama ->
  {s = table {unit => mbili ; ten => lama + "-t�mmi" }; size = pl };

-- b> is b with right bend
-- ? without dot
-- $ IPA [sh]

-- lin n1 = mkNum "p�tte" ; 
lin n2 = mkNum "lam?�" "lam�";
lin n3 = mkNum "haits�" "hayts�" ;
lin n4 = mkNum "?oid�" "?oyd�";
lin n5 = mkNum "d�ngo" "d�ngi";
lin n6 = mkNum "l�hh�" "l�hhi";
lin n7 = mkNum "l�nkayi" "l�nkayi";
lin n8 = mkNum "s�lli" "s�lli" ;
lin n9 = mkNum "t�sub>a" "t�zub>i";

oper ss : Str -> Form = \s1 -> {s = s1 ; size = pl} ;

lin pot01  =
  {s = table {f => "p�tte" }; size = sg };
lin pot0 d = d ;
lin pot110 = ss "t�b>b>�" ; 
lin pot111 = ss ("t�b>b>�" ++ "p�tte") ; 
lin pot1to19 d = ss ("t�b>b>�" ++ (d.s ! unit)) ;
lin pot0as1 n = {s = n.s ! unit ; size = n.size } ;
lin pot1 d = ss (d.s ! ten) ;
lin pot1plus d e = ss (d.s ! ten ++ e.s ! unit) ; 
lin pot1as2 n = n ;
lin pot2 d = {s = mkseeta d.size (d.s ! unit) };
lin pot2plus d e = {s = (mkseeta d.size (d.s ! unit)) ++ e.s} ;
lin pot2as3 n = {s = n.s } ;
lin pot3 n = {s = n.s ++ "$�ya"} ;
lin pot3plus n m = {s = n.s ++ "$�ya" ++ m.s} ;

oper mkseeta : Size -> Str -> Str = \sz -> \attr -> 
  table {pl => attr ++ "s'��ta" ; 
         sg => "s'��ta" } ! sz ; 

}
