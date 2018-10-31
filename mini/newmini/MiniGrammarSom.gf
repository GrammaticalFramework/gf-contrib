concrete MiniGrammarSom of MiniGrammar = open MiniResSom, Prelude in {


  lincat
    Utt = SS ;
    Pol = {s : Str ; p : Bool} ;
    S  = SS ;
    Cl = {s : Bool => Str} ;
    VP = MiniResSom.VP ;
    AP = Adjective ;
    CN = CNoun ;
    NP,
    PN,
    Pron = MiniResSom.NP ;
    Det = MiniResSom.Det ;
    Conj = {s : Str} ;
    Prep = MiniResSom.Prep ;
    Adv = MiniResSom.Adv ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;

  lin
    UttS s = s ;
    UttNP np = { s = np.s ! Abs } ;
    UsePresCl pol cl = {
      s = cl.s ! pol.p
      } ;

    PredVP np vp = let compl = vp.compl ! np.a in {
      s = \\b =>
           if_then_Str np.isPron [] (np.s ! Nom)
        ++ compl.p1
        ++ case <b,vp.isPred,np.a> of { --sentence type marker + subj. pronoun
              <True,True,Sg3 _> => "waa" ;
        --      _                 => stmarker ! np.a ! b } -- marker+pronoun contract
              _ => case <np.isPron,b> of {
                     <True,True>  => "waa" ++ np.s ! Nom ; -- to force some string from NP to show in the tree
                     <True,False> => "ma"  ++ np.s ! Nom ;
                     <False>      => stmarkerNoContr ! np.a ! b
           }}
        ++ vp.adv.s
        ++ compl.p2            -- object pronoun for pronouns, empty for nouns
	      ++ vp.s ! VPres np.a b -- the verb inflected
        ++ vp.adv.s2
      } ;

    UseV = useV ;

    ComplV2 v2 np = useV v2 ** {
      compl = \\a => case np.isPron of {
                True  => <[]        , complV2 np v2> ;
                False => <np.s ! Abs, complV2 np v2> } ;
      isPred = False ;
      c2 = v2.c2
      } ;

    UseAP ap = useV copula ** {
      compl = \\a => <[], ap.s ! AF (getNum a) Abs> ;
      isPred = True
      } ;

    AdvVP vp adv = vp ** { adv = adv } ;

    DetCN det cn = useN cn ** {
      s = \\c =>
           let nfc : {nf:NForm ; c:Case} =
             case <c,cn.hasMod,det.d> of {
                <Nom,True, Indef Sg> => {nf=Indef Sg ; c=Abs} ;
                <Nom,False,Indef Sg> => {nf=IndefNom ; c=Nom} ; -- special form for fem. nouns
                <Nom,True,Def x A>   => {nf=Def x A ; c=Abs} ;
                <Nom,False,Def x A>  => {nf=Def x U ; c=Nom} ;
                _                    => {nf=det.d ; c=c}
             } ;
            in cn.s ! nfc.nf
            ++ det.s ! nfc.c
            ++ cn.mod ! getNum (getAgr det.d Masc) ! c ;
      a = getAgr det.d cn.g ;
      stm = stmarker ! getAgr det.d cn.g
      } ;
    UsePN,
    UsePron = \p -> p ;

    MassNP cn = useN cn ** {
      s = table { Nom => cn.s ! IndefNom ++ cn.mod ! Sg ! Nom ;
                  Abs => cn.s ! Indef Sg ++ cn.mod ! Sg ! Abs }
      } ;

    UseN = useN ;

    a_Det = mkDet [] "uu" [] (Indef Sg) ;
    aPl_Det = mkDet [] "ay" [] (Indef Pl) ;
    the_Det = mkDet "a" "kani" "tani" (Def Sg A) ;
    thePl_Det = mkDet "a" "kuwan" "kuwan" (Def Pl A) ;

-- Bestämdhetskongruens
-- När ett substantiv binds som attribut till ett annat substantiv med hjälp av
-- den attributiva kortformen ah som är av kopulaverbet yahay är, då måste båda
-- substantiven vara antingen obestämda eller bestämda. Man kan alltså säga att
-- de kongruerar med avseende på bestämdhet
    AdjCN ap cn = cn ** {
      s = table { IndefNom => cn.s ! Indef Sg ; -- When an adjective is added, noun loses case marker.
                  x        => cn.s ! x } ;
      mod = \\n,c => cn.mod ! n ! Abs -- If there was something before, it is now in Abs
                  ++ ap.s ! AF n c ;
      hasMod = True
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ! np.a ; s2 = np.s ! Abs} ; ---- ?

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;

    PPos  = {s = [] ; p = True} ;
    PNeg  = {s = [] ; p = False} ;

--För att binda ihop substantiv används konjunktionen iyo och.
--För att binda ihop verb eller adjektiv används konjunktionen oo och.
    and_Conj = {s = "oo"} ;

    or_Conj = {s = "ama"} ; -- mise with interrogatives

--    every_Det = {s = "every" ; n = Sg} ;

    -- this seems incomprehensible but trust me it's legit.
    -- Preps are used in both verbs and to build advs
    -- but only for verbs they may combine with other preps
    in_Prep,
    on_Prep = prepTable ! ku ;
    with_Prep = prepTable ! la ;

    i_Pron = {
      s = table {Nom => "aan" ; Abs => "i"} ;
      a = Sg1 ; isPron = True ; sp = "aniga" ;
--      stm = table { True => "waan" ; False => "maan" }
      } ;
    youSg_Pron = {
      s = table {Nom => "aad" ; Abs => "ku"} ;
      a = Sg2 ; isPron = True ; sp = "adiga" ;
--      stm = table { True => "waad" ; False => "maad" }
      } ;
    he_Pron = {
      s = table {Nom => "uu" ; Abs => []} ;
      a = Sg3 Masc ; isPron = True ; sp = "isaga" ;
--      stm = table { True => "wuu" ; False => "muu" }
      } ;
    she_Pron = {
      s = table {Nom => "ay" ; Abs => []} ;
      a = Sg3 Fem ; isPron = True ; sp = "iyada" ;
--      stm = table { True => "way" ; False => "may" }
      } ;
    we_Pron = {
      s = table {Nom => "aan" ; Abs => "na"} ;
      a = Pl1 Incl ; isPron = True ; sp = "innaga" ;
--      stm = table { True => "waan" ; False => "maan" }
      } ;
    youPl_Pron = {
      s = table {Nom => "aad" ; Abs => "idin"} ;
      a =  Pl2 ; isPron = True ; sp = "idinka" ;
--      stm = table { True => "waad" ; False => "maad" }
      } ;
    they_Pron = {
      s = table {Nom => "ay" ; Abs => []} ;
      a = Pl3 ; isPron = True ; sp = "iyaga" ;
--      stm = table { True => "way" ; False => "may" }
      } ;

}
