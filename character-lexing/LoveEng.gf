concrete LoveEng of Love = open Prelude in {

  lincat
    Comment = {s : Str};
    CN = {s : Str};
    NP, Pron = {s : Case => Str ; a : Agr};
    V2 = {s : Agr => Str};

  param
    Case = Nom | Dat | Gen ;
    Number = Sg | Pl ;
    Agr = P1 Number | P2 Number | P3 Number ;

  lin
    Pred s v o = ss (s.s ! Nom ++ v.s ! s.a ++ o.s ! Dat) ;
    Person pron n = {s = \\c => pron.s ! Gen ++ n.s ; a=P3 Sg} ;
    UsePron pron = pron ;

    i_Pron     = mkPron (P1 Sg) "I"    "me"   "my" ;
    youSg_Pron = mkPron (P2 Sg) "you"  "you"  "your" ;
    he_Pron    = mkPron (P3 Sg) "he"   "him"  "his" ;
    she_Pron   = mkPron (P3 Sg) "she"  "her"  "her" ;
    we_Pron    = mkPron (P1 Pl) "we"   "us"   "our" ;
    youPl_Pron = mkPron (P2 Pl) "you"  "you"  "your" ;
    they_Pron  = mkPron (P3 Pl) "they" "them" "their" ;
    Love = {
      s = table{
        P3 Sg => "loves" ;
        _ => "love"
        }
      } ;
    Mother = ss "mother" ;

  oper
    mkPron : Agr -> Str -> Str -> Str -> Pron = \a,he,him,his -> lin Pron {
      s = table {
        Nom => he ;
        Dat => him ;
        Gen => his
        } ;
      a = a ;
      } ;
}
