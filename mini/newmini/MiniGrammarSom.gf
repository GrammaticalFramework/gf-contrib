concrete MiniGrammarSom of MiniGrammar = open MiniResSom, Prelude in {


  lincat
    Utt = SS ;
    Adv = SS ;
    Pol = {s : Str ; p : Bool} ;
    S  = SS ;
    Cl = {s : Bool => Str} ;
    VP = Verb ** { compl : Agreement => Str} ;
    AP = Adjective ;
    CN = CNoun ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; sp : Gender => Str ; d : NForm } ;
    -- Conj = {s : Str} ;
    -- Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    -- PN = ProperName ;

  lin
    UttS s = s ;
    UttNP np = { s = np.s ! Abs } ;
    UsePresCl pol cl = {
      s = cl.s ! pol.p
      } ;
    PredVP np vp = {
      s = \\b =>
           np.s ! Nom
        ++ if_then_Str b "waa" "ma"  --satstypmarkörer
	++ vp.s ! VPres np.a
        ++ vp.compl ! np.a ;
      } ;

    UseV v = v ** { compl = \\_ => [] } ;

    ComplV2 v2 np = v2 ** {
      compl = \\a => v2.c2 ++ np.s ! Abs
      } ;
    UseAP ap = {
      s = \\x => case x of { VPres a => ap.s ! AIndef (getNum a) ++ copula.s ! x ;
                             VPast a => ap.s ! AIndef (getNum a) ++ copula.s ! x ;
                             _       => ap.s ! AIndef Sg ++ copula.s ! x } ; ----
      compl = \\_ => []
      } ;
    AdvVP vp adv =
      vp ** { compl = \\x => vp.compl ! x ++ adv.s } ;
    DetCN det cn = {
      s = \\c => cn.s ! det.d ! c ++ det.s ++ cn.mod ! det.d ! c ;
      a = getAgr det.d cn.g
      } ;
    -- UsePN pn = {
    --   s = \\_ => pn.s ;
    --   a = Agr Sg Per3
    --   } ;
    -- UsePron p =
    --   p ;
    MassNP cn = {
      s = table { Nom => cn.s ! Def Sg ! Nom   ++ cn.mod ! Def Sg ! Nom ;
                  Abs => cn.s ! Indef Sg ! Abs ++ cn.mod ! Indef Sg ! Abs } ;
      a = Sg3 cn.g
      } ;

    UseN n = n ** { mod = \\_,_ => [] } ;

    a_Det = {s = "" ; sp = \\_ => "TODO:a_Det" ; d = Indef Sg} ;
    aPl_Det = a_Det ** { d = Indef Pl } ;
    the_Det = { s = [] ; -- To be glued onto the definite form of noun
               sp = table { Fem => "tan" ; Masc => "kan" } ; -- tani, kani for DetNP
                d = Def Sg } ;
    thePl_Det = { s = "" ; sp = \\_ => "kuwan" ; d = Def Pl } ;

-- Bestämdhetskongruens
-- När ett substantiv binds som attribut till ett annat substantiv med hjälp av
-- den attributiva kortformen ah som är av kopulaverbet yahay är, då måste båda
-- substantiven vara antingen obestämda eller bestämda. Man kan alltså säga att
-- de kongruerar med avseende på bestämdhet, t.ex.
    AdjCN ap cn = cn ** {
      s = \\nf,cas => cn.s ! nf ! Abs ; -- When an adjective is added, it will carry subject marker.
      mod = \\nf,cas => case nf of {
                         Def n   => ap.s ! ADef n  ;
                         Indef n => ap.s ! AIndef n ;
                         x       => ap.s ! AIndef Sg } ----
      } ;

    PositA a = a ;

{-    PrepNP prep np = {s = prep.s ++ np.s ! Abs} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ; -}

    PPos  = {s = [] ; p = True} ;
    PNeg  = {s = [] ; p = False} ;
{-
    and_Conj = {s = "and"} ;
    or_Conj = {s = "or"} ;

    every_Det = {s = "every" ; n = Sg} ;

    in_Prep = {s = "in"} ;
    on_Prep = {s = "on"} ;
    with_Prep = {s = "with"} ;

    i_Pron = {
      s = table {Nom => "I" ; Abs => "me"} ;
      a = Agr Sg Per1
      } ;
    youSg_Pron = {
      s = \\_ => "you" ;
      a = Agr Sg Per2
      } ;
    he_Pron = {
      s = table {Nom => "he" ; Abs => "him"} ;
      a = Agr Sg Per3
      } ;
    she_Pron = {
      s = table {Nom => "she" ; Abs => "her"} ;
      a = Agr Sg Per3
      } ;
    we_Pron = {
      s = table {Nom => "we" ; Abs => "us"} ;
      a = Agr Pl Per1
      } ;
    youPl_Pron = {
      s = \\_ => "you" ;
      a = Agr Pl Per2
      } ;
    they_Pron = {
      s = table {Nom => "they" ; Abs => "them"} ;
      a = Agr Pl Per2
      } ;
-}
}
