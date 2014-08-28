concrete LoveMlt of Love = ResMlt ** open Prelude in {

  flags
    coding=utf8;

  oper
    lil : Str = "lil" ;

  lin
    Pred s v o =
      case o.isPron of {
        True  => ss (s.s ! Nom ++ v.s ! s.a ++ BIND ++ o.s ! Dat) ;
        False => ss (s.s ! Nom ++ v.s ! s.a ++ lil ++ o.s ! Dat)
      } ;
    Person pron n = {
      s = \\c => n.s ++ BIND ++ pron.s ! Gen ;
      a = P3 Sg n.g ;
      isPron = False ;
      } ;
    UsePron pron = pron ;

    i_Pron     = mkPron (P1 Sg)      "jien"  "ni"  "i" ;
    youSg_Pron = mkPron (P2 Sg)      "int"   "ok"  "ok" ;
    he_Pron    = mkPron (P3 Sg Masc) "hu"    "u"   "u" ;
    she_Pron   = mkPron (P3 Sg Fem)  "hi"    "ha"  "ha" ;
    we_Pron    = mkPron (P1 Pl)      "aħna"  "na"  "na" ;
    youPl_Pron = mkPron (P2 Pl)      "intom" "kom" "kom" ;
    they_Pron  = mkPron (P3 Pl Masc) "huma"  "hom" "hom" ;
    Love = {
      s = table{
        P1 Sg      => "nħobb" ;
        P2 Sg      => "tħobb" ;
        P3 Sg Masc => "jħobb" ;
        P3 Sg Fem  => "tħobb" ;
        P1 Pl      => "nħobbu" ;
        P2 Pl      => "tħobbu" ;
        P3 Pl _    => "jħobbu"
        }
      } ;
    Mother   = { s="omm" ; g=Fem } ;

}
