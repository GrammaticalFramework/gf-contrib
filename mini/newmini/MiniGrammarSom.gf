concrete MiniGrammarSom of MiniGrammar = open MiniResSom, Prelude in {


  lincat
    Utt = SS ;
    Adv = SS ;
    Pol = {s : Str ; p : Bool} ;
    S  = SS ;
    Cl = {s : Bool => Str} ;
    VP = Verb ** { compl : Agreement => {p1,p2 : Str} ; isPred : Bool } ;
    AP = Adjective ;
    CN = CNoun ;
    NP,
    Pron = MiniResSom.NP ;
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

    -- Subjektspronomenet brukar oftast utelämnas då predikatet består av ett adjektiv följt av verbet är.
    PredVP np vp = let compl = vp.compl ! np.a in {
      s = \\b =>
           if_then_Str np.isPron [] (np.s ! Nom)
        ++ compl.p1
        ++ case <b,vp.isPred,np.a> of { --sentence type marker + subj. pronoun
             <True,True,Sg3 _> => "waa" ;
             _                 => np.stm ! b }
        ++ compl.p2            -- object pronoun for pronouns, empty for nouns
	      ++ vp.s ! VPres np.a b -- the verb inflected
      } ;

    UseV v = v ** { compl = \\_ => <[],[]> ; isPred = False } ;

    ComplV2 v2 np = v2 ** {
      compl = \\a => case np.isPron of {
                True  => <[], v2.c2 ++ np.s ! Abs> ;
                False => <v2.c2 ++ np.s ! Abs, []> } ;
      isPred = False
      } ;
    UseAP ap = {
      compl = \\a => <[], ap.s ! AIndef (getNum a)> ;
      s = copula.s ; isPred = True
      } ;
    AdvVP vp adv = vp ** {
      compl = \\x => <(vp.compl ! x).p1, (vp.compl ! x).p2 ++ adv.s> } ;

    DetCN det cn = useN cn ** {
      s = \\c => cn.s ! det.d ! c ++ det.s ++ cn.mod ! det.d ! c ;
      a = getAgr det.d cn.g ;
      stm = stmarker (getAgr det.d cn.g)
      } ;
    -- UsePN pn = {
    --   s = \\_ => pn.s ;
    --   a = Agr Sg Per3
    --   } ;
    UsePron p =
      p ;
    MassNP cn = useN cn ** {
      s = table { Nom => cn.s ! Def Sg ! Nom   ++ cn.mod ! Def Sg ! Nom ;
                  Abs => cn.s ! Indef Sg ! Abs ++ cn.mod ! Indef Sg ! Abs }
      } ;

    UseN = useN ;

    a_Det = {s = "" ; sp = \\_ => "TODO:a_Det" ; d = Indef Sg} ;
    aPl_Det = a_Det ** { d = Indef Pl } ;
    the_Det = { s = [] ; -- To be glued onto the definite form of noun
               sp = table { Fem => "tan" ; Masc => "kan" } ; -- tani, kani for DetNP nominative
                d = Def Sg } ;
    thePl_Det = { s = "" ; sp = \\_ => "kuwan" ; d = Def Pl } ;

-- Bestämdhetskongruens
-- När ett substantiv binds som attribut till ett annat substantiv med hjälp av
-- den attributiva kortformen ah som är av kopulaverbet yahay är, då måste båda
-- substantiven vara antingen obestämda eller bestämda. Man kan alltså säga att
-- de kongruerar med avseende på bestämdhet
    AdjCN ap cn = cn ** {
      s = \\nf,cas => cn.s ! nf ! Abs ; -- When an adjective is added, it will carry subject marker.
      mod = \\nf,cas => cn.mod ! nf ! Abs ++ case nf of {
                         Def n   => ap.s ! ADef n cas ;
                         Indef n => ap.s ! AIndef n ;
                         x       => ap.s ! AIndef Sg }
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
-}
    i_Pron = {
      s = table {Nom => "aan" ; Abs => "i"} ;
      a = Sg1 ; isPron = True ; sp = "aniga" ;
      stm = table { True => "waan" ; False => "maan" }
      } ;
    youSg_Pron = {
      s = table {Nom => "aad" ; Abs => "ku"} ;
      a = Sg2 ; isPron = True ; sp = "adiga" ;
      stm = table { True => "waad" ; False => "maad" }
      } ;
    he_Pron = {
      s = table {Nom => "uu" ; Abs => []} ;
      a = Sg3 Masc ; isPron = True ; sp = "isaga" ;
      stm = table { True => "wuu" ; False => "muu" }
      } ;
    she_Pron = {
      s = table {Nom => "ay" ; Abs => []} ;
      a = Sg3 Fem ; isPron = True ; sp = "iyada" ;
      stm = table { True => "way" ; False => "may" }
      } ;
    we_Pron = {
      s = table {Nom => "aan" ; Abs => "na"} ;
      a = Pl1 Incl ; isPron = True ; sp = "innaga" ;
      stm = table { True => "waan" ; False => "maan" }
      } ;
    youPl_Pron = {
      s = table {Nom => "aad" ; Abs => "idin"} ;
      a =  Pl2 ; isPron = True ; sp = "idinka" ;
      stm = table { True => "waad" ; False => "maad" }
      } ;
    they_Pron = {
      s = table {Nom => "aay" ; Abs => []} ;
      a = Pl3 ; isPron = True ; sp = "iyaga" ;
      stm = table { True => "way" ; False => "may" }
      } ;

}
