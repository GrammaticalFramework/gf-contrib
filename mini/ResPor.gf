resource ResPor = open Prelude in {

-- parameters

param
  Number = Sg | Pl ;
  Gender = Masc | Fem ;
  Case   = Nom | Acc | Dat ; -- NotImplemented: Dat has two forms:
                             -- "me" (clitic) e "a mim" (object)
  Agr    = Ag Gender Number Person ;
  Aux    = Estar | Haver | Ser | Ter ;
  Tense  = Pres | Perf ;
  Person = Per1 | Per2 GPerson | Per3 ; -- discourse person
  GPerson = -- grammatical person
      GPer2   -- tu/vós
    | GPer3 ; -- você/vocês

  VForm = VInf | VPres Number Person | VPart Gender Number ;

  ClitAgr = CAgrNo | CAgr Agr ;

  ----
  -- parts of speech

oper
  VP = {
    v : Verb ;
    clit : Str ;
    clitAgr : ClitAgr ;
    obj : Agr => Str
    } ;

  NP = {
    s : Case => {clit,obj : Str ; isClit : Bool} ;
    a : Agr
    } ;

-- the preposition word of an abstract case

  prepCase : Case -> Str = \c -> case c of {
    Dat => "a" ;
    _ => []
    } ;

-- for predication

  agrV : Verb -> Agr -> Str = \v,a -> case a of {
    Ag _ n p => v.s ! VPres n p
    } ;

  auxVerb : Aux -> Verb = \a -> case a of {
    Estar => mkVerb "estar" "estou" "estás" "está" "estamos" "estais" "estão" "estado" Ter ;
    Haver => mkVerb "haver" "hei" "hás" "há" "havemos" "haveis" "hão" "havido" Ter ;
    Ser =>  mkVerb "ser" "sou" "és" "é" "somos" "sois" "são" "sido" Ter ;
    Ter => mkVerb "ter" "tenho" "tens" "tem" "temos" "tendes" "têm" "tido" Haver
    } ;

  agrPart : Verb -> Agr -> ClitAgr -> Str = \v,a,c -> case v.aux of {
    Estar => agrSerOuEstar v a ;
    Haver => agrTerOuHaver v c ;
    Ter   => agrTerOuHaver v c ;
    Ser   => agrSerOuEstar v a
      } ;

  agrTerOuHaver : Verb -> ClitAgr -> Str = \v,c -> case c of {
    CAgr (Ag g n _) => v.s ! VPart g n ;
    _               => v.s ! VPart Masc Sg
    } ;

  agrSerOuEstar : Verb -> Agr -> Str = \v,a -> case a of {
    Ag g n _ => v.s ! VPart g n
      } ;

  neg : Bool -> Str = \b -> case b of {True => [] ; False => "não"} ;

    estar_V = auxVerb Estar ;
    haver_V = auxVerb Haver ;
    ter_V   = auxVerb Ter ;
    ser_V   = auxVerb Ser ;

-- for coordination

  conjAgr : Number -> Agr -> Agr -> Agr = \n,xa,ya ->
    let
      x = agrFeatures xa ; y = agrFeatures ya
    in Ag
      (conjGender x.g y.g)
      (conjNumber (conjNumber x.n y.n) n)
      (conjPerson x.p y.p) ;

  agrFeatures : Agr -> {g : Gender ; n : Number ; p : Person} = \a ->
    case a of {Ag g n p => {g = g ; n = n ; p = p}} ;

  conjGender : Gender -> Gender -> Gender = \g,h ->
    case g of {Masc => Masc ; _ => h} ;

  conjNumber : Number -> Number -> Number = \m,n ->
    case m of {Pl => Pl ; _ => n} ;

  conjPerson : Person -> Person -> Person = \p,q ->
    case <p,q> of {
      <Per1,_> | <_,Per1>              => Per1 ;
      <Per2 GPer2,_> | <_,Per2 GPer2>  => Per2 GPer2 ;
      <Per2 GPer3,_> | <_,Per2 GPer3,> => Per2 GPer3 ;
      _                                => Per3
      } ;


-- for morphology

  Noun : Type = {s : Number => Str ; g : Gender} ;
  Adj  : Type = {s : Gender => Number => Str ; isPre : Bool} ;
  Verb : Type = {s : VForm => Str ; aux : Aux} ;

  mkNoun : Str -> Str -> Gender -> Noun = \cão,cães,g -> {
    s = table {Sg => cão ; Pl => cães} ;
    g = g
    } ;

  regNounGen : Str -> Gender -> Noun = \vinho,g -> case vinho of {
    rapa + z@("z"|"r"|"s")           =>
      mkNoun vinho (rapa + z + "es") g ;
    can  + v@("a"|"e"|"o"|"u") + "l" =>
      mkNoun vinho (can + v + "is") g ;
    can  + "il"                      =>
      mkNoun vinho (can + "is") g ; -- what about fóssil?
    home  + "m"  => mkNoun vinho (home + "ns") g ;
    tóra + "x"                       =>
      mkNoun vinho vinho g ;
    _                                =>
      mkNoun vinho (vinho + "s") g
    } ;

  regNoun : Str -> Noun = \vinho -> case vinho of {
    cas   + "a"  => regNounGen vinho Fem ;
    vinh  + "o"  => regNounGen vinho Masc ;
    falc  + "ão" =>
      mkNoun vinho (falc + "ões") Masc ; -- other rules depend on
                                         -- stress, can this be built
                                         -- with gf?
    artes + "ã"  => mkNoun vinho (artes + "ãs") Fem ;

    líque + "n"  => mkNoun vinho (líque + "ns") Masc ;
    obu  + "s"   => mkNoun vinho (vinho + "es") Masc ;
    can  + "il"  =>
      mkNoun vinho (can + "is") Masc ; -- what about fóssil?
     _           => regNounGen vinho Masc
    } ;

  mkAdj : (_,_,_,_ : Str) -> Bool -> Adj = \bom,boa,bons,boas,p -> {
    s = table {
          Masc => table {Sg => bom ; Pl => bons} ;
          Fem  => table {Sg => boa ; Pl => boas}
        } ;
    isPre = p
    } ;

  regAdj : Str -> Adj = \preto -> case preto of {
    pret + "o" =>
      mkAdj preto (pret + "a") (preto + "s") (pret + "as") False ;
    pret + "e" =>
      mkAdj preto preto (preto + "s") (preto + "s") False ;
    _          => mkAdj preto preto preto preto False
    } ;

  mkVerb : (_,_,_,_,_,_,_,_ : Str) -> Aux -> Verb =
    \amar,amo,amas,ama,amamos,amais,amam,amado,aux -> {
    s = table {
          VInf                  => amar ;
          VPres Sg Per1         => amo ;
          VPres Sg (Per2 GPer2) => amas ;
          VPres Sg (Per2 GPer3) => ama ;
          VPres Sg Per3         => ama ;
          VPres Pl Per1         => amamos ;
          VPres Pl (Per2 GPer2) => amais ;
          VPres Pl (Per2 GPer3) => amam ;
          VPres Pl Per3         => amam ;
          VPart g n             => (regAdj amado).s ! g ! n
          } ;
    aux = aux
    } ;

  regVerb : Str -> Verb = \amar -> case amar of {
    am   + "ar" => mkVerb amar (am+"o") (am+"as") (am+"a")
                     (am+"amos") (am+"ais") (am+"am") (am+"ado") Haver ;
    tem  + "er" => mkVerb amar (tem+"o") (tem+"es") (tem+"e")
                     (tem+"emos") (tem+"eis") (tem+"em") (tem+"ido") Ser ;
    part + "ir" => mkVerb amar (part+"o") (part+"es") (part+"e")
                     (part+"imos") (part+"eis") (part+"em") (part+"ido") Estar
    } ;

-- for structural words
  -- [ ] is this ok por port?
  adjDet : Adj -> Number -> {s : Gender => Case => Str ; n : Number} =
  \adj,n -> {
    s = \\g,c => prepCase c ++ adj.s ! g ! n ;
    n = n
    } ;

  pronNP : (s,a,d : Str) -> Gender -> Number -> Person -> NP =
  \s,a,d,g,n,p -> { -- s for standard?
    s = table {
      Nom => {clit = [] ; obj = s  ; isClit = False} ;
      Acc => {clit = a  ; obj = [] ; isClit = True} ;
      Dat => {clit = d  ; obj = [] ; isClit = True}
      } ;
    a = Ag g n p
    } ;

-- phonological auxiliaries

  vowel : pattern Str = #("a" | "e" | "i" | "o" | "u") ;

} ;
