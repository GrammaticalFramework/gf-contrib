concrete lithuanian of Numerals = {
-- include numerals.Abs.gf ;

-- y:
-- e:
-- i~
-- s^
-- m~
-- n~
-- �:
-- u,

param Size = sg | pl ;
param DForm = unit | teen | ten ;

oper LinDigit = {s : DForm => Str ; size : Size };
oper LinSub100 = {s : Str ; size : Size } ;

lincat Numeral =    { s : Str } ;
lincat Digit =      LinDigit ;
lincat Sub10 =      LinDigit ;
lincat Sub100 =     LinSub100 ;
lincat Sub1000 =    LinSub100 ;
lincat Sub1000000 = { s : Str } ;

oper mkNum : Str -> Str -> Str -> LinDigit = \tri -> \dvylika -> \tribase ->
  { s = table {unit => tri ; teen => dvylika ; ten => tribase + "des^imt" } ; size = pl};

lin num x = {s = x.s} ; -- TODO ;

lin n2 = mkNum "d�" "dv�lika" "dv�" ;
lin n3 = mkNum "try:s" "tr�lika" "tr�s" ;
lin n4 = mkNum "ketur�" "keturi�lika" "ke:turias" ;
lin n5 = mkNum "penk�" "penki�lika" "pen~kias" ;
lin n6 = mkNum "s^es^�" "s^es^i�lika" "s^e:s^ias" ;
lin n7 = mkNum "septyn�" "septyni�lika" "sept�nias" ;
lin n8 = mkNum "as^tuon�" "as^tuoni�lika" "as^t�onias" ;
lin n9 = mkNum "devyn�" "devyni�lika" "dev�nias" ;

oper mkR : Str -> LinSub100 = \n -> {s = n ; size = pl } ;

lin pot01 = { s = table {_ => "v�enas" } ; size = sg };
lin pot0 d = d ;
lin pot110 = mkR (variants {"de:s^imt"; "des^imt�s" });
lin pot111 = mkR "vien�olika" ;
lin pot1to19 d = mkR (d.s ! teen) ;
lin pot0as1 n = mkR (n.s ! unit) ;
lin pot1 d = mkR (d.s ! ten) ;
lin pot1plus d e = mkR ((d.s ! ten) ++ (e.s ! unit)) ;
lin pot1as2 n = n ;
lin pot2 d = mkR (selsg d.size "s^im~tas" ((d.s ! unit) ++ "s^imtai~")) ;
lin pot2plus d e = mkR ((selsg d.size "s^im~tas" ((d.s ! unit) ++ "s^imtai~")) ++ e.s) ;
lin pot2as3 n = {s = n.s };
lin pot3 n = {s = selsg n.size "t�:kstantis" (n.s ++ "t�:kstanc^iu,") } ;
lin pot3plus n m = {s = (selsg n.size "t�:kstantis" (n.s ++ "t�:kstanc^iu,")) ++ m.s} ;

oper selsg : Size -> Str -> Str -> Str = \sz -> \s1 -> \s2 -> 
  table {sg => s1 ; pl => s2} ! sz ;


}
