concrete miya of Numerals = {
-- include numerals.Abs.gf ;

param Size = sg | pl ;
param DForm = unit | acc ;

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
  {s = table {unit => mbili ; acc => lama }; size = pl };

-- lin n1 = mkNum "w�t`&" ; 
lin n2 = mkNum "ts`&r" "ts'&r";
lin n3 = mkNum "k�di" "k�d�" ;
lin n4 = mkNum "f`&d>&" "f'&d>&";
lin n5 = mkNum "v�atl&" "vaatl&";
lin n6 = mkNum "m�aha" "m�ah�";
lin n7 = mkNum "m�ats&r" "m�ats`&r";
lin n8 = mkNum "f�&rf�&d>&" "f`&rf�&d>&" ; 
lin n9 = mkNum "k�ciya" "k�c�ya";

oper ss : Str -> Form = \s1 -> {s = s1 ; size = pl} ;
oper behan = "b�h&n" ;
oper enaa = "'`&n�a" ;

lin pot01  =
  {s = table {unit => "w�t`&" ; acc => "wut'&"}; size = sg };
lin pot0 d = d ;
lin pot110 = ss "d'&rb>itim" ; 
lin pot111 = ss (variants {behan ++ "wut'&";"d'&rb>itim" ++ behan ++ "wut'&"});
lin pot1to19 d = ss (variants {behan ++ (d.s ! acc); "d'&rb>itim" ++ behan ++ d.s ! acc}) ;
lin pot0as1 n = {s = n.s ! unit ; size = n.size } ;
lin pot1 d = ss ("d�b>i" ++ d.s ! unit) ;
lin pot1plus d e = ss ("d�b>i" ++ d.s ! unit ++ behan ++ e.s ! acc) ; 
lin pot1as2 n = n ;
lin pot2 d = ss ("d>�riy" ++ selsg d.size (d.s ! unit));
lin pot2plus d e = ss ("d>�riy" ++ (selsg d.size (d.s ! unit)) ++ enaa ++ e.s);
lin pot2as3 n = {s = n.s } ;
lin pot3 n = {s = "d'&bu" ++ (selsg n.size n.s)} ;
lin pot3plus n m = {s = "d'&bu" ++ (selsg n.size n.s) ++ enaa ++ m.s} ;

oper selsg : Size -> Str -> Str = \sz -> \attr -> 
  table {pl => attr ; sg => variants {[] ; attr} } ! sz ; 


}
