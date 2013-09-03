concrete votic of Numerals = {
-- include numerals.Abs.gf ;

param DForm = unit | attr | teen | ten | ten2 ;
param Size = sg | pl ;

oper LinDigit = {s : DForm => Str ; size : Size };
oper LinS100 = {s : Str ; size : Size} ;

oper bind : Str -> Str -> Str = \a -> \b -> a ++ b ;

lincat Numeral = {s : Str} ;
lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;
lincat Sub100 = LinS100 ;
lincat Sub1000 = LinS100 ;
lincat Sub1000000 = {s : Str} ;
lin num x0 = {s = x0.s} ; -- TODO

oper mkN2 : Str -> LinDigit = \u ->
  mkN u u (u + "ts^�mmett�") (u + "ts^�mmet") ;

oper mkN : Str -> Str -> Str -> Str -> LinDigit = \u -> \a -> \t -> \t2 ->
  {s = table {unit => u ; attr => a + "sata:"; ten => t ; ten2 => t2 ; 
              teen => a + tess} ; size = pl} ;

lin n2 = mkN "kahsi" "kahs"
             (variants {"kahs^'t's^'�mmett�" ; "kahts^�mmett�"})
             (variants {"kahs^'t's^'�mmet" ; "kahts^�mmet"});
lin n3 = mkN "keVLmeV" "keVm" "keVmts^�mmett�" "keVmts^�mmet";
lin n4 = mkN2 "nell�" ; 
lin n5 = mkN "vi:si" "vi:s" "vi:s^'t's^'�mmett�" "vi:s^'t's^'�mmet";
lin n6 = mkN "ku:si" "ku:s" "ku:s^'t's^'�mmett�" "ku:s^'t's^'�mmet"; 
lin n7 = mkN2 "seitse:" ;
lin n8 = mkN2 "kaheVsa:" ;
lin n9 = mkN2 "�hes�:" ;

oper tess : Str = (variants {"teV*s^s^eVmeVtta" ; "teV*is^'t's^'�mmeD"} ) ;

lin pot01 = {s = table {unit => "�hsi" ; attr => "sata" ; _ => "dummy" }; size = sg } ;

oper ss : Str -> LinS100 = \s1 -> {s = s1 ; size = pl } ; 

lin pot0 d = d ; 
lin pot110 = ss "ts^�mme:" ;
lin pot111 = ss ("�hs" + tess) ;
lin pot1to19 d = ss (d.s ! teen) ;
lin pot0as1 n = {s = n.s ! unit ; size = n.size } ;
lin pot1 d = ss (d.s ! ten) ;
lin pot1plus d e = ss ((d.s ! ten2) ++ (e.s ! unit)) ;
lin pot1as2 n = n ;
lin pot2 d = ss (d.s ! attr) ;
lin pot2plus d e = ss ((d.s ! attr) ++ e.s) ;
lin pot2as3 n =
  {s = n.s } ;
lin pot3 n =
  {s = selsg (variants {"tuhatta" ; "tuhaD" }) (bind n.s "tuhatta") ! n.size} ;
lin pot3plus n m =
  {s = selsg (variants {"tuhatta" ; "tuhaD" }) (bind n.s "tuhatta") ! n.size ++ m.s }; 

oper selsg : Str -> Str -> Size => Str = \a -> \b ->
  table {sg => a ; pl => b} ; 

}
