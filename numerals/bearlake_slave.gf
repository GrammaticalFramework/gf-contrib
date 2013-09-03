concrete bearlake_slave of Numerals = {
-- include numerals.Abs.gf ;

param DForm = unit | hundred ;

oper LinDigit = {s : Str } ;

lincat Numeral =    { s : Str } ;
lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;
lincat Sub100 = {s : Str } ;
lincat Sub1000 = {s : Str } ; 
lincat Sub1000000 = { s : Str } ;

oper mkNum : Str -> LinDigit = \two ->  
  {s = two } ;

-- TODO: Transl.

lin num x = x ;
-- lin n1 mkNum "l-�e" ;
lin n2 = mkNum "n�kee" ;
lin n3 = mkNum "tai" ;
lin n4 = mkNum "di,i," ;
lin n5 = mkNum "so,l�i" ;
lin n6 = mkNum "?ehts'�,tai" ;
lin n7 = mkNum "l-�,hdi,i," ;
lin n8 = mkNum "?ehts'�,di,i," ;
lin n9 = mkNum "l-�to," ;

oper o : Str = "?�," ; 

lin pot01 = {s = "l-�e" } ;
lin pot0 d = d ; 
lin pot110 = {s = variants {"hon�no," ; "h�no" }} ;
lin pot111 = {s = variants {"hon�no," ; "h�no" } ++ o ++ "l-�e" } ;
lin pot1to19 d = {s = (variants {"hon�no," ; "h�no" }) ++ o ++ d.s } ;  
lin pot0as1 n = n ;
lin pot1 d = {s = d.s ++ (variants {"hon�no," ; "�no,"})} ;
lin pot1plus d e = {s = d.s ++ (variants {"hon�no," ; "�no,"}) ++ o ++ e.s } ;
lin pot1as2 n = n ;
lin pot2 d = {s = d.s ++ "lak'o, �no,"} ;
lin pot2plus d e = {s = d.s ++ "lak'o, �no," ++ e.s} ;
lin pot2as3 n = n ;
lin pot3 n = {s = n.s ++ "lam�l"} ;
lin pot3plus n m = {s = n.s ++ "lam�l" ++ m.s } ;


}
