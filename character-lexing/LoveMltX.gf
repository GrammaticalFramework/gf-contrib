concrete LoveMltX of Love = ResMlt ** open Prelude in {

  flags
    coding=utf8;

  oper
    WB : Str = "|" ; -- word boundary
    lil : Str = w "lil" ;

  lin
    Pred s v o =
      case o.isPron of {
        True  => ss (s.s ! Nom ++ WB ++ v.s ! s.a ++ o.s ! Dat) ;
        False => ss (s.s ! Nom ++ WB ++ v.s ! s.a ++ WB ++ lil ++ WB ++ o.s ! Dat)
      } ;
    Person pron n = {
      s = \\c => n.s ++ pron.s ! Gen ;
      a = P3 Sg n.g ;
      isPron = False ;
      } ;
    UsePron pron = pron ;

    i_Pron     = mkPron (P1 Sg)      (w "jien")  (w "ni")  (w "i") ;
    youSg_Pron = mkPron (P2 Sg)      (w "int")   (w "ok")  (w "ok") ;
    he_Pron    = mkPron (P3 Sg Masc) (w "hu")    (w "u")   (w "u") ;
    she_Pron   = mkPron (P3 Sg Fem)  (w "hi")    (w "ha")  (w "ha") ;
    we_Pron    = mkPron (P1 Pl)      (w "aħna")  (w "na")  (w "na") ;
    youPl_Pron = mkPron (P2 Pl)      (w "intom") (w "kom") (w "kom") ;
    they_Pron  = mkPron (P3 Pl Masc) (w "huma")  (w "hom") (w "hom") ;
    Love = {
      s = table{
        P1 Sg      => w "nħobb" ;
        P2 Sg      => w "tħobb" ;
        P3 Sg Masc => w "jħobb" ;
        P3 Sg Fem  => w "tħobb" ;
        P1 Pl      => w "nħobbu" ;
        P2 Pl      => w "tħobbu" ;
        P3 Pl _    => w "jħobbu"
        }
      } ;
    Mother = { s= w "omm" ; g=Fem } ;

}
