concrete icelandic of Numerals = {
-- include numerals.Abs.gf ;

param DForm = unit | teen | ten | neuter ;
param Gen = com | neut ; 
param Size = sg | less10 | pl ;

oper LinDigit = {s : DForm => Str} ;

lincat Numeral =    { s : Str } ;
lincat Digit = LinDigit ;
lincat Sub10 = {s : DForm => Str ; size : Size} ;
lincat Sub100 = {s : Gen => Str ; size : Size} ;
lincat Sub1000 = {s : Gen => Str ; size : Size} ;
lincat Sub1000000 = { s : Str } ;

oper mkNum : Str -> Str -> Str -> Str -> LinDigit = 
  \two -> \twelve -> \twenty -> \tvo -> 
  {s = table {unit => two ; teen => twelve ; ten => twenty ; neuter => tvo}} ;
oper regNum : Str -> LinDigit = 
  \fimm -> mkNum fimm (fimm + "t�n") (fimm + "t�u") fimm;

oper ss : Str -> {s : Gen => Str ; size : Size} = \s -> {s = table {_ => s } ; size = pl};

lin num x = x ;
lin n2 = mkNum "tveir" "t�lf" "tuttugu" "tv�" ;
lin n3 = mkNum "�r�r" "�r�tt�n" "�rj�t�u" "�rj�" ;
lin n4 = mkNum "fj�rir"  "fj�rt�n" "fj�rut�u" "fj�gur";
lin n5 = regNum "fimm" ;
lin n6 = regNum "sex" ;
lin n7 = mkNum "sj�" "sautj�n" "sj�t�u" "sj�" ; 
lin n8 = mkNum "�tta" "�tj�n" "�tt�u" "�tta" ;
lin n9 = mkNum "n�u" "n�tj�n" "n�ut�u" "n�u" ;

lin pot01 = {s = table {f => "einn"} ; size = sg } ;
lin pot0 d = {s = d.s ; size = less10 } ;
lin pot110 = ss "t�u" ;
lin pot111 = ss "ellefu" ;
lin pot1to19 d = ss (d.s ! teen) ;
lin pot0as1 n = {s = table {com => n.s ! unit ; neut => n.s ! neuter } ; size = n.size } ;
lin pot1 d = {s = table {_ => d.s ! ten } ; size = pl};
lin pot1plus d e = {s = table {com => d.s ! ten ++ "og" ++ e.s ! unit ; 
                               neut => d.s ! ten ++ "og" ++ e.s ! neuter} ; size = pl} ;
lin pot1as2 n = n ;
lin pot2 d = {s = table {_ => omitsg (d.s ! neuter) d.size ++ "hundra�" } ; size = pl} ; 
lin pot2plus d e = {s = table {f => omitsg (d.s ! neuter) d.size ++ "hundra�" ++ (maybeog) e.size ++ e.s ! f} ; size = pl} ; 

lin pot2as3 n = {s = n.s ! com } ;
lin pot3 n = {s = omitsg (n.s ! neut) n.size ++ "��sund"} ;
lin pot3plus n m = {s = omitsg (n.s ! neut) n.size ++ "��sund" ++ (maybeog m.size) ++ m.s ! com} ;


oper maybeog : Size -> Str = \sz -> table {pl => [] ; _ => "og" } ! sz ;  
oper omitsg : Str -> Size -> Str = \s -> \sz -> table {sg => [] ; _ => s } ! sz ;

}
