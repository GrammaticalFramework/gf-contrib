resource MiniResPor = open Prelude in {

  param
    Gender    = Masc | Fem ;
    Number    = Sg | Pl ;
    Case      = Nom | Acc ;
    Person    = Per1 | Per2 | Per3 ;

    Agreement = Agr Gender Number Person ;

    VForm     = Inf | PresSg3 ;

  oper
    NP = {
      s : Case => {clit,obj : Str ; isClit : Bool} ;
      a : Agr
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
      mkN : Str -> Noun                  = smartNoun ;
      mkN : Str -> Gender -> Noun        = smartGenNoun ;
      mkN : Str -> Str -> Gender -> Noun = mkNoun ;
      } ;

    ProperName : Type = {s : Str} ;

    mkPN : Str -> ProperName = \s -> {s = s} ;

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

    mkA = overload {
      mkA : Str -> Adjective                     = regAdjective ;
      mkA : (_,_,_,_ : Str) -> Bool -> Adjective = mkAdjective ;
      } ;

    preA : Adjective -> Adjective
      = \a -> {s = a.s ; isPre = True} ;

    Verb : Type = {s : VForm => Str} ;

    mkVerb : (inf,pres : Str) -> Verb = \inf,pres -> {
      s = table {
        Inf     => inf ;
        PresSg3 => pres
        }
      } ;

    smartVerb : Str -> Verb = \inf -> case inf of {
      part + "ir" => mkVerb inf (part + "e") ;
      come + "r"  => mkVerb inf come ;
      _ => mkVerb inf inf
      } ;

    mkV = overload {
      mkV : Str -> Verb = smartVerb ;
      mkV : (inf,pres : Str) -> Verb = mkVerb ;
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

    be_GVerb : GVerb = {
      s = table {
        PresSg1 => "am" ;
        PresPl  => "are" ;
        VF vf   => (mkVerb "be" "is").s ! vf
        } ;
      isAux = True
      } ;

    GVerb : Type = {
      s : GVForm => Str ;
      isAux : Bool
      } ;

  param
    GVForm = VF VForm | PresSg1 | PresPl ;

  oper
    verb2gverb : Verb -> GVerb = \v ->
      {s =
         table {
           PresSg1 => v.s ! Inf ;
           PresPl  => v.s ! Inf ;
           VF vf   => v.s ! vf
         } ;
       isAux = False
      } ;

}