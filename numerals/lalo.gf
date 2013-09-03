concrete lalo of Numerals = {
-- include numerals.Abs.gf ;

param Zero = yes | nozero  ;

oper LinS100 = {s : Str ; zero : Zero } ;

lincat Numeral = {s : Str} ;
lincat Digit = {s : Str} ;
lincat Sub10 = {s : Str} ;
lincat Sub100 = LinS100 ;
lincat Sub1000 = LinS100 ;
lincat Sub1000000 = { s : Str } ;

-- TODO encoding

oper ss : Str -> LinS100 = \s1 -> {s = s1 ; zero = nozero} ;

lin num x0 = {s = x0.s} ;
lin n2 = {s = "`n."} ;
lin n3 = {s = "sa" } ;
lin n4 = {s = "i"} ;
lin n5 = {s = "N�" } ; 
lin n6 = {s = "kh�q" } ;
lin n7 = {s = "x`&" } ;
lin n8 = {s = "h�q" } ;
lin n9 = {s = "kw" } ;
lin pot01 = {s = "tjh`&"} ;
lin pot0 d = d ;
lin pot110 = ss "tjh�" ;
lin pot111 = ss "tjh�t�" ;
lin pot1to19 d = ss ("tjh�" ++ d.s) ;
lin pot0as1 n = {s = n.s ; zero = yes } ;
lin pot1 d = ss (d.s ++ "tjh�") ;
lin pot1plus d e = ss (d.s ++ "tjh�" ++ e.s) ; 
lin pot1as2 n = {s = n.s ; zero = yes } ;
lin pot2 d = ss (d.s ++ "h�") ; 
lin pot2plus d e = ss (d.s ++ "h�" ++ if0 ! e.zero ++ e.s) ;
lin pot2as3 n = {s = n.s };
lin pot3 n = {s = n.s ++ "t'w" };
lin pot3plus n m = ss (n.s ++ "t'w" ++ if0 ! m.zero ++ m.s) ;

oper if0 = table {yes => "ni" ++ "ka" ; nozero => []} ;

}
