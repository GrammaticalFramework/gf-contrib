concrete margi of Numerals = {
-- include numerals.Abs.gf ;

param DForm = unit | ten | oxy ;
param Size = sg | pl ;

oper LinDigit = {s : DForm => Str ; size : Size} ;
oper LinS100 = {s : Str ; s2 : Str ; size : Size} ;

lincat Numeral =    { s : Str } ;
lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;
lincat Sub100 = LinS100 ;
lincat Sub1000 = LinS100 ;
lincat Sub1000000 = {s : Str} ;

oper mkNum : Str -> Str -> Str -> LinDigit = \u -> \o -> \t ->
  {s = table {unit => u ; ten => t + "k�m�" ; oxy => o} ; size = pl} ;

oper mkNum2 : Str -> Str -> LinDigit = \u -> \t ->
  {s = table {unit => u ; ten => t + "k�m�" ; oxy => u} ; size = pl} ;

lin num x0 = {s = x0.s } ; -- TODO 

lin n2 = mkNum "s`&d>�N" "m'&tl�*" "m'&tl" ; 
lin n3 = mkNum2 "m�k`&r" "m�r" ; 
lin n4 = mkNum (variants {"f�d>�*" ; "fw�d>�*"}) "f�d>�*" (variants {"f�d>�" ;"f�d>"}) ;
lin n5 = mkNum (variants {"nt`&f�*" ; "mt`&f�*"}) "nt'&f�*" "nt'&f";
lin n6 = mkNum2 "Nkw�" "Nkw�";
lin n7 = mkNum2 "m'&d>'&f�*" "m'&d>'&f" ;
lin n8 = mkNum (variants {"nts�s�*" ; "nc�s�*"}) "nts�s�*" "nts�s" ;
lin n9 = mkNum "'&mdl�*" "mdl�*" "'&mdl�"  ;

oper pwaser : Size => Str = table {sg => "s'&r" ; pl => "pw�"} ; 
oper selsg : Str -> Str -> Size => Str = \s1 -> \attr ->
  table {sg => s1 ; pl => s1 ++ attr} ; 

oper ss : Str -> LinS100 = \s1 -> {s = s1 ; s2 = s1 ; size = pl } ;

lin pot01  =
  {s = table {unit => "t�N" ; oxy => "p�tl�*" ; ten => "dummy" } ; size = sg};
lin pot0 d = d ;
lin pot110 = ss (variants { "k�m�*" ; "k�m�*" }); 
lin pot111 = ss ("k�m" ++ "g�" ++ (variants {"s'&r" ; "s'&rny�"}) ++ "t�N") ;
lin pot1to19 d = ss ("k�m" ++ "g�" ++ "pw�" ++ d.s ! oxy) ;
lin pot0as1 n = {s = n.s ! unit ; s2 = n.s ! oxy ; size = n.size };
lin pot1 d = ss (d.s ! ten) ;
lin pot1plus d e = ss (d.s ! ten ++ "g�" ++ (pwaser ! e.size) ++ e.s ! oxy) ;
lin pot1as2 n = n ;
lin pot2 d = ss ((selsg "gh�r�" (d.s ! unit)) ! d.size) ; 
lin pot2plus d e = ss ((selsg "gh�r�" (d.s ! unit) ! d.size) ++ "ag�" ++ e.s2);
lin pot2as3 n = {s = n.s} ;
lin pot3 n = {s = selsg "d�b�" n.s ! n.size };
lin pot3plus n m = {s = ((selsg "d�b�" n.s) ! n.size) ++ m.s2 }; 

}
