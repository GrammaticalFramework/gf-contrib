concrete frisian of Numerals = open Prelude in {
  param
    DForm = unit | teen | ten ;
    Size = sg | pl | large;

  oper
    LinDigit = { s : DForm => Str; sz : Size } ;

  lincat
    Numeral =    { s : Str } ;
    Digit =      LinDigit ;
    Sub10 =      {s : Str; sz : Size} ;
    Sub100 =     { s : Str; sz : Size } ;
    Sub1000 =    { s : Str; sz : Size } ;
    Sub1000000 = { s : Str } ;

  oper
    mkTal : Str -> Str -> Str -> LinDigit = \twa, tolve, tweintich ->
      {s = table {unit => twa ; teen => tolve ; ten => tweintich}; sz = pl} ;

    sel : Size -> Str -> Str -> Str -> Str = \sz -> \a -> \b -> \c -> table {sg => a ; pl => b ; large => c} ! sz ;

  lin
    num x = x ;

    n2 = mkTal "twa" "tolve" "tweintich" ;
    n3 = mkTal "trije" "trettsjin" "tritich" ;
    n4 = mkTal "fjouwer" "fjirtsjin" "fjirtich" ;
    n5 = mkTal "fiif" "fyftsjin" "fyftich" ;
    n6 = mkTal "seis" "sechstsjin" "sechstich" ;
    n7 = mkTal "sân" "santsjin" "santich" ;
    n8 = mkTal "acht" "achttsjin" "tachtich" ;
    n9 = mkTal "njoggen" "njoggentsjin" "njoggentich" ;

    pot01 = {s = "ien";  sz = sg} ;
    pot0 d = {s = d.s ! unit; sz = pl} ;
    pot0as1 n = n ;
    pot110 = { s = "tsien"; sz = pl } ;
    pot111 = {s = "alve"; sz = pl} ;
    pot1to19 d = {s = d.s ! teen; sz = pl} ;
    pot1 d = {s = d.s ! ten; sz = pl} ;
    pot1plus d n = {s = n.s ++ BIND ++ "en" ++ BIND ++ d.s ! ten; sz = pl} ;
    pot1as2 n = n ;
    pot2 n = {s = (sel n.sz [] (n.s ++ BIND) (n.s ++ BIND)) ++ "hûndert"; sz = large} ;
    pot2plus m n = {s = (sel m.sz [] (m.s ++ BIND) (m.s ++ BIND)) ++ "hûndert" ++ n.s; sz = large} ;
    pot2as3 n = n ;
    pot3 n = {s = (sel n.sz [] (n.s ++ BIND) n.s) ++ "tûzen"} ;
    pot3plus m n = {s = (sel m.sz [] (m.s ++ BIND) m.s) ++ "tûzen" ++ n.s} ;
}
