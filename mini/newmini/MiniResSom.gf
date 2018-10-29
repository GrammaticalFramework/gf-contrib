resource MiniResSom = open Prelude, Predef in {


--------------------------------------------------------------------------------
-- Nominal morphology

param
  Number = Sg | Pl ;
  Case = Nom | Abs ;
  Gender = Masc | Fem ;
  Person = Per1 | Per2 | Per3 ;
  Vowel = A | E | I | O | U ; -- For vowel assimilation

  Inclusion = Excl | Incl ;
  Agreement = Sg1 | Sg2 | Sg3 Gender | Pl1 Inclusion | Pl2 | Pl3 ;



--TODO: more cases (or contracted prepositions)?, determinative (not in mini resource), …
-- Determinativt kii / tii
-- Substantivens determinativa form bildas genom att den bestämda grundformens –a eller subjektsformens –u ersätts med ändelsen –ii som anger att föremålet utgör en gemensam bekant bakgrundsinformation.
-- Den determinativa formen kan även ersätta slutvokalen i de possessiva ändelserna.
  -- Den determinativa ändelsen –kii/–tii används när man vill framhålla att ett bestämt föremål inte bara är allmänt bestämt utan dessutom förväntas vara känt sedan tidigare för den som man talar med.
  -- Det somaliska determinativa morfemet kii/tii har möjligen en något bredare användning, eftersom det markerat att talaren anser att lyssnare borde känna till det som substantivet refererar till.
  -- mundul·kii·sii   -- kii is the morpheme, what is sii?

  NForm = Indef Number
        | Def Number Vowel -- stems for definite and determinative suffixes
        | Numerative       -- When modified by a number (only distinct for some feminine nouns)
        | IndefNom ;       -- special form, only fem. nouns ending in consonant

oper
  getAgr : NForm -> Gender -> Agreement = \n,g ->
    case n of { Indef Pl|Def Pl _ => Pl3 ;
                _                 => Sg3 g } ;
  getNum : Agreement -> Number = \a ->
    case a of { Sg1|Sg2|Sg3 _ => Sg ; _ => Pl } ;

  --TODO: can probably make this leaner and have just stems in NForm, if case is regular?
  -- -u for nouns and pronouns, -i for demonstratives -- how about adding the ending in DetCN/MassNP, UsePron and DetCN with &+, and no case in the tables? Wait to see which other forms are needed.
  Noun : Type = {s : NForm => Str ; g : Gender} ;

  CNoun : Type = Noun ** { mod : Number => Case => Str } ;

  --TODO: figure out some nice minimum number of stems
  mkNoun : (x1,_,_,x4 : Str) -> Gender -> Noun = \wiil,wiilka,wiilal,wiilasha,gender ->
    let bisadi = case gender of
                   { Fem  => case wiil of { _ + #c => wiil+"i" ; _ => wiil} ;
                     Masc => wiil } ;
        bisadood =  case gender of
                       { Fem  => case wiilal of { _ + "o" => wiilal+"od" ; _ => wiil} ;
                         Masc => wiil } ;
        defStems : Str -> Vowel => Str = \s -> case s of {
          ilk + "aha" =>
               table { A => ilk+"ah" ;
                       E => ilk+"eh" ;
                       I => ilk+"ih" ;
                       O => ilk+"oh" ;
                       U => ilk+"uh"
                       } ;
          _ => table { _ => init s }
          } ;

    in { s = table {
           Indef Sg => wiil ;
           Indef Pl => wiilal ;
           IndefNom => bisadi ;
           Numerative => bisadood ;
           Def Sg vow => defStems wiilka ! vow ;
           Def Pl vow => defStems wiilasha ! vow } ;
         g = gender } ;

  -- obsolete
  -- addCase : Str -> Str -> Case=>Str = \ilkaha,iis ->
  --   let dupl : Str -> {p1 : Str ; p2 : Str} = \x -> <x,x> ;
  --       stems : {p1 : Str ; p2 : Str} = case <ilkaha,iis> of {
  --                       <ilk + "aha", "i" + is> => dupl (ilk + "ih" + iis) ;
  --                       <ilk + "aha", ""      > => <ilk + "uh", init ilkaha> ;
  --                       <magac + "a", ood     > => dupl (magac + ood) ;
  --                       _                       => dupl (ilkaha+"-"+iis) } ;
  --    in table { Nom => stems.p1 + "u" ; Abs => stems.p2 + "a" } ;

-------------------------
-- Regular noun paradigms
  nHooyo, nAabbe, nMas, nUl, nGuri, nXayawaan : Str -> Noun ;

  --1) Feminine nouns that end in -o
  nHooyo hooyo =
    mkNoun hooyo (init hooyo + "ada") (hooyo + "oyin") (hooyo + "oyinka") Fem ;

  --2) Masculine nouns that end in -e
  nAabbe aabbe = let aabb = init aabbe in
    mkNoun aabbe (aabb + "aha") (aabb + "ayaal") (aabb + "ayaasha") Masc ;

  -- 3) Masculine, plural with duplication
  nMas mas = let s = last mas ;
                 ka = allomorph mKa mas ;
                 sha = case ka of {"sha" => ka ; _ => s + ka } in
    mkNoun mas (mas + "ka") (mas + "a" + s) (mas + "a" + sha) Masc ;

  -- 4a) Feminine, plural with ó
  nUl ul = let o  = case last ul of { "i" => "yo" ; _ => "o" } ;
               u  = case last ul of { "l" => init ul ; _ => ul } ;
               sha = allomorph mTa ul in
    mkNoun ul (u + sha) (ul + o) (ul + "aha") Fem ;

  -- 4b) Masculine, plural with ó, 2 syllables
  nGuri guri = let o = allomorph mO guri ;
                   ga = allomorph mKa guri ;
                   gury = case last guri of { -- TODO does this generalise? Or just exception?
                                 "i" => init guri + "y" ;
                                 _   => guri } in
    mkNoun guri (guri + ga) (gury + o) (gury + "aha") Masc ;

  -- 4c) Masculine, plural with -ó, 3 syllables or longer
  nXayawaan x = let ka = allomorph mKa x ;
                    o = allomorph mO x ;
                    xo = x + o in
    mkNoun x (x + ka) xo (init xo + "ada") Masc ;


  allomorph : Morpheme -> Str -> Str = \x,stem ->
    case x of {
      mO => case last stem of {
                  d@("b"|"d"|"r"|"l"|"m"|"n") => d + "o" ;
                  "c"|"g"|"i"                 => "yo" ; --TODO other sounds?
                  _                           => "o" } ;

      -- Based on the table on page 21--TODO find generalisations in patterns
      mTa => case last stem of {
                   "d"|"c"|"h"|"x"|"q"|"'"|"i"|"y"|"w" => "da" ;
                   "l" => "sha" ;
                   _   => "ta" } ;

      mKa => case stem of {
                   _ + ("g"|"aa"|"i"|"y"|"w") => "ga" ;
                   _ + ("c"|"h"|"x"|"q"|"'")  => "a" ;
                   _ + ("e"|"o")              => "ha" ;
                   _ + "l"                    => "sha" ;
                   _                          => "ka" }
    } ;

  voiced : Str -> Str = \s -> case s of {
    "k" => "g" ;
    "t" => "d" ;
    "p" => "b" ;
     _  => s } ;

  -- don't remember what this was supposed to be
  -- caseForm : (NForm => Str) -> NForm -> Str -> Str = \s,nf,u -> case nf of {
  --   Numerative|Indef _ => s ! nf ;
  --   _                  => glue (s ! nf) u } ;

param
  Morpheme = mO | mKa | mTa ;

oper

   --TODO: make patterns actually adjusted to Somali, these are just copied from elsewhere
   v : pattern Str = #("a" | "e" | "i" | "o" | "u") ;
   vv : pattern Str = #("aa" | "ee" | "ii" | "oo" | "uu") ;
   c : pattern Str = #("m" | "n" | "p" | "b" | "t" | "d" | "k" | "g" | "f" | "v" | "s" | "h" | "l" | "j" | "r" | "z" | "c" | "q" | "y" | "w") ;
   lmnr : pattern Str = #("l" | "m" | "n" | "r") ;
   kpt : pattern Str = #("k" | "p" | "t") ;
   gbd : pattern Str = #("g" | "b" | "d") ;


  -- Smart paradigm
  --Substantiv som slutar på –o/–ad är så gott som alltid feminina, t.ex. qaáddo sked, bisád katt.
  --Substantiv som slutar på –e är så gott som alltid maskulina, t.ex. dúbbe hammare, fúre nyckel.
  -- För övriga ord säger ordets form dessvärre väldigt lite om ordets genus. Däremot kan betoningens plats i ordet väldigt ofta avslöja ordets genus. Man kan alltså i flesta fall höra vilket genus ett substantiv har.


  mkN = overload {
    mkN : Str -> Noun = mkN1 ;
    mkN : Str -> Gender -> Noun = mkNg ;
    mkN : (_,_ : Str) -> Gender -> Noun = mkN2 ;
    mkN : Noun -> Gender -> Noun = \n,g ->
      n ** { g = g } ;

  } ;

  mkN1 : Str -> Noun = \n -> case n of {
      _ + ("ad"|"adh") => nUl n ;
      _ + "o"          => nHooyo n ;
      _ + "e"          => nAabbe n ;
      _ + "ri"         => nGuri n ;
      (#c + #v + #v + #c) -- One syllable words
       | (#v + #v + #c)
       | (#c + #v + #c)
       | (#v + #c)     => nMas n ;
      _                => nXayawaan n } ;

  mkNg : Str -> Gender -> Noun = \n,g -> case n of {
      _ + ("r"|"n"|"l")
          => case g of {
                  Fem  => nUl n ;
                  Masc => mkN1 n } ;
      _   => mkN1 n
   } ; -- TODO: add more exceptional cases

  mkN2 : (_,_ : Str) -> Gender -> Noun = \buug,buugga,g ->
   mkNoun buug buugga (buug+"aag") (buug+"aagta") g ;
  ---------------------------------------------
  -- NP

  BaseNP : Type = {
    a : Agreement ;
    isPron : Bool ;
--    stm : Bool => Str ; -- Mostly makes a difference where in the concrete syntax tree the sentence type marker comes from
    sp : Str } ;

  NP : Type = BaseNP ** { s : Case => Str } ;

  useN : Noun -> CNoun ** BaseNP = \n -> n **
    { mod = \\_,_ => [] ; a = Sg3 n.g ; stm = stmarker (Sg3 n.g) ;
      isPron = False ; sp = []} ;

--------------------------------------------------------------------------------
-- Determiners

  Det : Type = {
    s : Case => Str ;
   sp : Gender => Str ;
    d : NForm
    } ;

  mkDet : (x1,_,x3 : Str) -> NForm -> Det = \an,kani,tani,nf ->
    let ani : Str = case an of { _ + #c => an+"i" ;
                                 _      => case nf of { Def _ _ => "u" ;
                                                        _       => [] }
                               } ;
        bind : Str -> Str = \x -> case x of { "" => [] ;  _ => BIND ++ x } ;
    in { s = table { Nom => bind ani ; Abs => bind an } ;
        sp = table { Fem => tani ; Masc => kani } ;
         d = nf
       } ;

--------------------------------------------------------------------------------
-- Pronouns, prepositions

-- Prepositionen u dras obligatoriskt samman med föregående pronomen
-- så att /a/ + /u/ > /oo/.

-- De somaliska possessiva pronomenen, precis som de svenska, har två olika genusformer i singular och en enda form i plural.
--  ägaren då det ägda föremålet är
--  m.sg. f.sg.plural
--  kayga tayda kuwayga
--  kaaga taada kuwaaga
--  kiisa tiisa kuwiisa
--  keeda teeda kuweeda
--
--  kaayaga taayada kuwayaga (1 pl. exkl.)
--  keenna teenna kuweenna (1 pl. inkl.)
--  kiinna tiinna kuwiinna
--  kooda tooda kuwooda


-- Negationen má `inte' skrivs samman med en föregående preposition.
--------------------------------------------------------------------------------
-- Adjectives

param
  AForm = AF Number Case ; ---- TODO: past tense

oper

-- Sequences of adjectives follow the rules for restrictive relatives clauses, i.e. are linked by oo 'and' on an indefinite head NP and by ee 'and' on a definite NP (8.1).

 -- Komparativ
 -- För att uttrycka motsvarigheten till svenskans komparativ placerar man på somaliska helt enkelt prepositionen ká 'från, av, än' framför adjektivet i fråga. Adjektivet får ingen ändelse.
 -- Shan waa ay ká yar tahay siddéed. Fem är mindre än åtta.
 -- Superlativ
 -- Motsvarigheten till svenskans superlativ bildas med prepositionsklustret ugú som till sin betydelse närmast motsvarar svenskans allra, t.ex.
 -- ugu horrayntii (det att komma) allra först

  Adjective : Type = { s : AForm => Str } ;

  mkA : Str -> Adjective = \yar ->
    let yaryar = duplicate yar
    in { s = table {
           AF Sg Abs => yar ;
           AF Pl Abs => yaryar ;
           AF Sg Nom => yar + "i" ;
           AF Pl Nom => yaryar + "i" }
       } ;

  duplicate : Str -> Str = \yar -> case yar of {
    "dheer" => "dhaadheer" ;
    "weyn"  => "waaweyn" ; -- TODO eventually handle irregular adjectives elsewhere
    y@#c + a@#v + r@#c + _ => y + a + r + yar ;
    g@#c + aa@#vv      + _ => g + aa + yar ; --TODO: proper patterns
    _                      => yar + ":plural" } ;

--------------------------------------------------------------------------------
-- Verb

param
   VForm =
     VInf
   | VPres Agreement Bool
   | VNegPast
   | VPast Agreement
   | VFut -- agreement comes from auxiliary
   | VRel -- "som är/har/…" TODO is this used in other verbs?
   | VImp Number ; -- TODO negation

-- TODO:
-- tre aspekter (enkel, progressiv, habituell),
-- fem modus (indikativ, imperativ, konjunktiv, kontiditonalis, optativ)

oper


  Verb : Type = { s : VForm => Str } ;

  Verb2 : Type = Verb ** { c2 : Str } ;

  mkVerb : (x1,x2 : Str) -> Verb = \ark,qaat ->
    let stems : {p1 : Str ; p2 : Str} = case ark of {
          a + r@#c + k@#c => <ark + "i", a + r + a + voiced k> ;
          yar + "ee"      => <ark + "n", yar + "ey"> ;
          _               => <ark + "n", ark> } ;
        arki = stems.p1 ;
        arag = stems.p2 ;
        arkin = case last arki of { "n" => arki ; _ => arki + "n" } ;
        t : Str = case arag of {
               _ + ("i"|"y") => "s" ;
               _             => "t" } ;
        ay : Str = case ark of {
               _ + ("i"|"e") => "ey" ;
               _             => "ay" } ;
        n : Str = case arag of {
               _ + #v => "nn" ;
               _      => "n" } ;
   in { s = table {
          VPres (Sg1|Sg3 Masc) pol
                        => qaat + if_then_Str pol "aa" "o" ;
          VPres (Sg2|Sg3 Fem) pol
                        => arag + t + if_then_Str pol "aa" "o" ;
          VPres (Pl1 _) pol
                        => arag + n + if_then_Str pol "aa" "o"  ;
          VPres Pl2 pol => arag + t + "aan" ;
          VPres Pl3 pol => qaat + "aan" ;

          VPast (Sg1|Sg3 Masc)
                        => qaat + ay ;
          VPast (Sg2|Sg3 Fem)
                        => arag + t + ay ;
          VPast (Pl1 _) => arag + n + ay ;
          VPast Pl2     => arag + t + "een" ; -- kari+seen, (sug|joogsa|qaada)+teen
          VPast Pl3     => qaat + "een" ;

          VImp Sg          => arag ;
          VImp Pl          => qaat + "a" ; -- TODO: allomorphs, page 86 in Saeed
          VInf             => arki ;
          VNegPast         => arkin ;
          _  => "TODO" }
      } ;

-------------------------
-- Regular verb paradigms

  cSug, cKari, cYaree, cJoogso, cQaado : Str -> Verb ;

  cSug sug = mkVerb sug sug ; -- TODO: stem/dictionary form of verbs with consonant clusters?

  cKari, cYaree = \kari -> mkVerb kari (kari+"y") ;

  cJoogso joogso =
    let joogsa = init joogso + "a" ;
     in mkVerb joogsa (joogsa + "d") ;

  cQaado qaado =
    let qaa = drop 2 qaado
     in mkVerb (qaa + "da") (qaa + "t") ;

  -- Smart paradigms
  mkV : Str -> Verb = \s -> case s of {
    _ + #c + #c + "o" => cJoogso s ;
    _           + "o" => cQaado s ; ----
    _           + "i" => cKari s ;
    _          + "ee" => cYaree s ;
    _                 => cSug s
    } ;


    mkV2 : Str -> Verb2 = \s -> mkV s ** { c2 = [] } ;
------------------
-- Irregular verbs

  copula : Verb = {
    s = table {
          VPres Sg1 pol    => if_then_Str pol "ahay" "ihi" ;
          VPres Sg2 pol    => if_then_Str pol "tahay" "ihid" ;
          VPres (Sg3 Masc) pol => if_then_Str pol "yahay" "aha" ;
          VPres (Sg3 Fem)  pol => if_then_Str pol "tahay" "aha" ;
          VPres (Pl1 _) pol => if_then_Str pol "nahay" "ihin" ;
          VPres Pl2 pol     => if_then_Str pol "tihiin" "ihidin" ;
          VPres Pl3 pol     => if_then_Str pol "yihiin" "aha" ;

          VPast (Sg1|Sg3 Masc)
                          => "ahaa" ;
          VPast (Sg2|Sg3 Fem)
                          => "ahayd" ;
          VPast (Pl1 _)   => "ahayn" ;
          VPast Pl2       => "ahaydeen" ;
          VPast Pl3       => "ahaayeen" ;
          VNegPast        => "ahi" ;
          VRel => "ah" ;
          _    => "TODO:copula" }
     } ;
   -- I somaliskan används inte något kopulaverb motsvarande svenskans är mellan
   -- två substantivfraser som utgör subjekt respektive predikatsfyllnad.
   -- Observera också att kopulaverbet vara alltid hamnar efter det adjektiv
 -- som utgör predikatsfyllnaden.
  -- TODO: add negation forms
  have_V : Verb = {
    s = table {
          VPres Sg1 _      => "leeyahay" ;
          VPres Sg2 _      => "leedahay" ;
          VPres (Sg3 Fem) _ => "leedahay" ;
          VPres (Sg3 Masc)_ => "leeyahay" ;
          VPres (Pl1 _) _  => "leenahay" ;
          VPres Pl2     _  => "leedihiin" ;
          VPres Pl3     _  => "leeyihiin" ;
          VPast x          => "l" + copula.s ! VPast x ;
          VRel => "leh" ;
          _    => "TODO:have_V" } ;
    } ;
-- Till VERBFRASEN ansluter sig
-- · satstypsmarkörer (waa, ma...),
-- · subjekts-pronomenet la man,
-- · objektspronomenen,
-- · prepositionerna och
-- · riktnings-adverben soó (mot en plats/person), sií (bort frånen plats/person), wadá tillsammans (mot en gemensam punkt), kalá iväg, isär (bort från en gemensam punkt).
-- Riktningsadverben har ibland en mycket konkret betydelse, men många gånger är betydelsen mera abstrakt.

-- Till satsmarkörerna, dvs. både fokusmarkörerna och satstypsmarkörerna ansluter sig
-- subjektspronomenen aan, aad, uu, ay, aynu, men inte la (man).

{- I 1 och 2 person används i princip alltid det korta subjektspronomet i påståendesatser.
I 3 person utelämnas däremot oftast det korta subjektspronomenet uu han eller ay hon, de efter satsmarkören waa om predikatet består av adjektiv + yahay / tahay / yihiin är.
Även i satser med andra verb i predikatet utelämnas det korta subjekts- pronomenet i 3 person någon gång ibland.
-}


------------------
-- satstypsmarkörer

  stmarker : Agreement => Bool => Str = \\a,b =>
    let stm = if_then_Str b "w" "m"
     in stm + subjpron ! a ;

  stmarkerNoContr : Agreement => Bool => Str = \\a,b =>
    let stm = if_then_Str b "waa" "ma"
     in stm ++ subjpron ! a ;

  subjpron : Agreement => Str = table {
    Sg1|Pl1 _ => "aan" ;
    Sg2|Pl2   => "aad" ;
    Sg3 Masc  => "uu" ;
    _         => "ay" } ;




}
