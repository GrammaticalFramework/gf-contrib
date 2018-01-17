resource MiniResPor = open Prelude in {

  param
    Gender = Masc | Fem ;
    Number = Sg | Pl ;
    Case   = Nom | Acc ;
    Person = Per1 | Per2 | Per3 ;

    Agreement = Agr Gender Number Person ;
    ClitAgr = CAgrNo | CAgr Agreement ;

    Aux       = Estar | Haver | Ser | Ter | Ficar ;
    VForm     = VInf | VPres Number Person ;

  oper
    NP = {
      s : Case => {clit,obj : Str ; isClit : Bool} ;
      a : Agreement
      } ;

    Noun : Type = {s : Number => Str ; g : Gender} ;

    mkNoun : Str -> Str -> Gender -> Noun = \sg,pl,g -> {
      s = table {Sg => sg ; Pl => pl} ;
      g = g
      } ;

    regNoun : Str -> Gender -> Noun = \sg,g -> mkNoun sg (sg + "s") g;

    -- smart paradigms
    smartGenNoun : Str -> Gender -> Noun = \vinho,g -> case vinho of {
      rapa + z@("z"|"r"|"s")           =>
        mkNoun vinho (vinho + "es") g ; -- rapaz/Masc, flor/Fem
      can  + v@("a"|"e"|"o"|"u") + "l" =>
        mkNoun vinho (can + v + "is") g ; -- canal/Masc, vogal/Fem
      home  + "m"  => mkNoun vinho (home + "ns") g ; -- homem/Masc,
                                                     -- nuvem/nuvens
      tóra + "x"                       =>
        mkNoun vinho vinho g ; -- tórax/Masc, xerox/Fem
      _                                =>
        regNoun vinho g
      } ;

    smartNoun : Str -> Noun = \vinho -> case vinho of {
      cas   + "a"  => regNoun vinho Fem ;
      vinh  + "o"  => regNoun vinho Masc ;
      falc  + "ão" =>
        mkNoun vinho (falc + "ões") Masc ; -- other rules depend on
                                           -- stress, can this be
                                           -- built with gf?
      artes + "ã"  => regNoun vinho Fem ;
      líque + "n"  => regNoun vinho Masc ;
      obu  + "s"   => mkNoun vinho (vinho + "es") Masc ;
      can  + "il"  =>
        mkNoun vinho (can + "is") Masc ; -- what about fóssil?
      _           => smartGenNoun vinho Masc
      } ;

    mkN = overload {
      mkN : Str -> Noun                     = smartNoun ;
      mkN : Str -> Gender -> Noun           = smartGenNoun ;
      mkN : Str -> Str    -> Gender -> Noun = mkNoun ;
      } ;

    ProperName : Type = {s : Str ; g : Gender} ;

    mkPN : Str -> Gender -> ProperName = \s,g -> {s = s ; g = g} ;
    -- Pron
    Pron : Type = {s : Case => Str ; a : Agreement} ;

    iMasc_Pron : Pron = {
      s = table {Nom => "Eu" ; Acc => "me"} ;
      a = Agr Masc Sg Per1
      } ;

    youMascSg_Pron : Pron = {
      s = table {Nom => "você" ; Acc => "lhe"} ;
      a = Agr Masc Sg Per2
      } ;

    weMasc_Pron : Pron = {
      s = table {Nom => "nós" ; Acc => "nos"} ;
      a = Agr Masc Pl Per1
      };

    youMascPl_Pron : Pron = {
      s = table {Nom => "vocês" ; Acc => "lhes"} ;
      a = Agr Masc Pl Per2
      } ;

    genderPron : Gender -> Pron -> Pron ;
    genderPron g pr = case pr.a of {
      (Agr _ n pe) => {s = pr.s ; a = Agr g n pe}
      } ;

    Adjective : Type = {s : Gender => Number => Str ; isPre : Bool} ;

    mkAdjective : (_,_,_,_ : Str) -> Bool -> Adjective = \bom,boa,bons,boas,p -> {
      s = table {
        Masc => table {Sg => bom ; Pl => bons} ;
        Fem  => table {Sg => boa ; Pl => boas}
        } ;
      isPre = p
      } ;

    regAdjective : Str -> Adjective = \preto -> case preto of {
      pret + "o" =>
        mkAdjective preto (pret + "a") (preto + "s") (pret + "as") False ;
      pret + "e" =>
        mkAdjective preto preto (preto + "s") (preto + "s") False ;
      _          => mkAdjective preto preto preto preto False
      } ;

    preAdjective : Str -> Bool -> Adjective = \preto,b ->
      let pretoA = regAdjective preto in
      case b of {
        True => preA pretoA ;
        _    => pretoA
      } ;

    mkA = overload {
      mkA : Str             -> Adjective         = regAdjective ;
      mkA : Str             -> Bool -> Adjective = preAdjective ;
      mkA : (_,_,_,_ : Str) -> Bool -> Adjective = mkAdjective ;
      } ;

    preA : Adjective -> Adjective
      = \a -> {s = a.s ; isPre = True} ;

    -- Verb
    VP = {
      verb : Verb ;
      clit : Str ;
      clitAgr : ClitAgr ;
      compl : Agreement => Str ;
      } ;

    Verb : Type = {s : VForm => Str ; aux : Aux} ;

    agrV : Verb -> Agreement -> Str = \v,a -> case a of {
      Agr _ n p => v.s ! VPres n p
      } ;

    agrPart : Verb -> Agreement -> ClitAgr -> Str = \v,a,c ->
      case v.aux of {
        Haver => agrClit v c ;
        Ter   => agrClit v c ;
        _     => agrSubj v a
      } ;

    agrClit : Verb -> ClitAgr -> Str = \v,c -> case c of {
      CAgr (Agr g n _) => v.s ! VPart g n ;
      _               => v.s ! VPart Masc Sg
      };

    agrSubj : Verb -> Agreement -> Str = \v,a -> case a of {
      Agr g n _ => v.s ! VPart g n
      } ;

    estar_V = auxVerb Estar ;
    ficar_V = auxVerb Ficar ;
    ter_V   = auxVerb Ter ;
    ser_V   = auxVerb Ser ;

    auxVerb : Aux -> Verb = \a -> case a of {
      Estar =>
        mkV "estar" "estou" "está" "estamos" "estão" "estado" Ter ;
      Haver =>
        mkV "haver" "hei" "há" "havemos" "hão" "havido" Ter ;
      Ser =>
        mkV "ser" "sou" "é" "somos" "são" "sido" Ter ;
      Ter =>
        mkV "ter" "tenho" "tem" "temos" "têm" "tido" Haver ;
      Ficar =>
        mkV "ficar" Ter
      } ;

    mkVerb : (_,_,_,_,_,_ : Str) -> Aux -> Verb =
      \amar,amo,ama,amamos,amam,amado,aux -> {
      s = table {
        VInf     => amar ;
        VPres Sg Per1 => amo ;
        VPres Sg _ => ama ;
        VPres Pl Per1 => amamos ;
        VPres Pl _ => amam ;
        VPart g n => (mkA amado).s ! g ! n
        } ;
      aux = aux
      } ;

    smartVerb : Str -> Verb = \inf -> case inf of {
      part + v@("e"|"i") + "r" => mkVerb inf (part+"o") (part+"e") (part+v+"mos") (part+"em") (part+"ido") Haver;
      am + "ar"  => mkVerb inf (am+"o") (am+"a") (am+"amos") (am+"am") (am+"ado") Ser ;
      _ => mkVerb inf inf inf inf inf inf Haver
      } ;

    smartAuxVerb : Str -> Aux -> Verb = \inf,aux ->
      auxVerbIs aux (smartVerb inf) ;

    auxVerbIs : Aux -> Verb -> Verb = \aux,v ->
      v ** {aux = aux} ;

    mkV = overload {
      mkV : Str -> Verb = smartVerb ;
      mkV : Str -> Aux -> Verb  = smartAuxVerb ;
      mkV : (_,_,_,_,_,_ : Str) -> Aux -> Verb = mkVerb ;
      } ;

    Verb2 : Type = Verb ** {c : Str} ;

    mkV2 = overload {
      mkV2 : Str         -> Verb2 = \s   -> mkV s ** {c = []} ;
      mkV2 : Str  -> Str -> Verb2 = \s,p -> mkV s ** {c = p} ;
      mkV2 : Verb        -> Verb2 = \v   -> v ** {c = []} ;
      mkV2 : Verb -> Str -> Verb2 = \v,p -> v ** {c = p} ;
      } ;

    Adverb : Type = {s : Str} ;

    mkAdv : Str -> Adverb = \s -> {s = s} ;

    -- [ ] is this ok por port?
    adjDet : Adjective -> Number -> {s : Gender => Case => Str ; n : Number} =
      \adj,n -> {
        s = \\g,c => adj.s ! g ! n ;
        n = n
      } ;

}