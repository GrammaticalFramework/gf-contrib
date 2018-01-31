concrete yiddish of Numerals = {

  param
    DForm = unit  | teen  | ten  ;
    Place = indep  | prae  | attr  ;

  oper
    LinDigit = {s : DForm => Str} ;

  lincat
    Numeral =    {s : Str} ;
    Digit =      LinDigit ;
    Sub10 =      {s : DForm*Place => Str} ;
    Sub100 =     {s : Place => Str} ;
    Sub1000 =    {s : Place => Str} ;
    Sub1000000 = {s : Str} ;

  oper
    mkZahl : Str -> Str -> Str -> LinDigit =
      \två -> \tolv -> \tjugo ->
      {s = table {unit => två ; teen => tolv ; ten => tjugo}} ;
    ss : Str -> {s : Str} = \s -> {s = s} ;

  lin
    num x = x ;

    n2 = mkZahl "צװײ" "טװעלף" "צװאַנציק"  ;
    n3 = mkZahl "דרײַ" "דרײַצן" "דרײַסיק" ;
    n4 = mkZahl "פֿיר" "פֿערצן" "פֿערציק" ;
    n5 = mkZahl "פֿינף" "פֿנפֿצן" "פֿופֿציק" ;
    n6 = mkZahl "זעקס" "זעכצן" "זעכציק" ;
    n7 = mkZahl "זיבן" "זיבעצן" "זיבעציק" ;
    n8 = mkZahl "אַכט" "אַכצן" "אַכציק" ;
    n9 = mkZahl "נײַן" "נײַנצן" "נײַנציק" ;

    pot01 = {s = table {<f,indep> => "אַײנס" ; <f,prae> => "אַײן" ; <f,attr> => []}} ;
    pot0 d = {s = table {<f,p> => d.s ! f}} ;
    pot110 = {s = table {p => "צען"}} ;
    pot111 = {s = table {p => "עלף"}} ;
    pot1to19 d = {s = table {p => d.s ! teen}} ;
    pot0as1 n = {s = table {p => n.s ! <unit,p>}} ;
    pot1 d = {s = table {p => d.s ! ten}} ;
    pot1plus d e = {s = table {p => e.s ! <unit,prae> ++ "אַון" ++ d.s ! ten}} ;
    pot1as2 n = {s = table {p => n.s ! p}} ;
    pot2 d = {s = table {p => d.s ! <unit,attr> ++  "הונדערט" }} ;
    pot2plus d e = {s = table {
        attr => d.s ! <unit,attr> ++ "הונדערט" ++ e.s ! prae ;
        _    => d.s ! <unit,attr> ++  "הונדערט" ++ e.s ! indep}} ;
    pot2as3 n = ss (n.s ! indep) ;
    pot3 n = ss (n.s ! attr ++ "טױזנט") ;
    pot3plus n m = ss (n.s ! attr ++ "טױזנט" ++ m.s ! prae) ;

}
