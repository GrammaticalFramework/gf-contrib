--1 Implementation of MOLTO Phrasebook

--2 The functor for (mostly) common structures

incomplete concrete SentencesI of Sentences = Numeral ** 
  open
    Syntax,
    Lexicon,
    Symbolic,  -- for names as strings
    Prelude
  in {
  lincat
    Phrase = Text ;
    Word = Text ;
    Message = Text ;
    Greeting = Text ;
    Sentence = S ;
    Question = QS ;
    Proposition = Cl ;
    Item = NP ;
    Kind = CN ;
    MassKind = CN ;
    MassKind = CN ;
    PlurKind = CN ;
    DrinkKind = CN ;
    Quality = AP ;
    Property = A ;
    Object = NP ;
    PrimObject = NP ;
    Place = NPPlace ; -- {name : NP ; at : Syntax.Adv ; to : Syntax.Adv} ;
    PlaceKind = CNPlace ; -- {name : CN ; at : Prep ; to : Prep} ;
    Currency = CN ;
    Price = NP ;
    Action = Cl ;
    Person = NPPerson ; -- {name : NP ; isPron : Bool ; poss : Quant} ;
    Nationality = NPNationality ; -- {lang : NP ; country : NP ; prop : A} ; 
    Language = NP ;
    Citizenship = A ;
    Country = NP ;
    Day = NPDay ; -- {name : NP ; point : Syntax.Adv ; habitual : Syntax.Adv} ;
    Date = Syntax.Adv ;
    Name = NP ;
    Number = Card ;
    ByTransport = Syntax.Adv ;
    Transport = {name : CN ; by : Syntax.Adv} ;
    Superlative = Det ;
  lin
    MPhrase p = p ;
    MContinue p m = mkText p m ;

    PSentence s = mkText s | lin Text (mkUtt s) ;  -- optional '.'
    PQuestion s = mkText s | lin Text (mkUtt s) ;  -- optional '?'

    PGreetingMale, PGreetingFemale = \g -> mkText (lin Phr (ss g.s)) exclMarkPunct | g ;

    -- PWord w = w ;

    PNumber x = mkSentence (mkUtt x) ;
    PPrice x = mkSentence (mkUtt x) ;

    PObject x = mkPhrase (mkUtt x) ;
    PKind x = mkPhrase (mkUtt x) ;
    PMassKind x = mkPhrase (mkUtt x) ;
    PQuality x = mkPhrase (mkUtt x) ;
    PPlace x = mkPhrase (mkUtt x.name) ;
    PPlaceKind x = mkPhrase (mkUtt x.name) ;
    PCurrency x = mkPhrase (mkUtt x) ;
    PLanguage x = mkPhrase (mkUtt x) ;
    PCountry x = mkPhrase (mkUtt x) ;
    PCitizenship x = mkPhrase (mkUtt (mkAP x)) ;
    PDay d = mkPhrase (mkUtt d.name) ;
    PTransport t = mkPhrase (mkUtt t.name) ;
    PByTransport t = mkPhrase (mkUtt t) ;

    PYes = mkPhrase yes_Utt ;
    PNo = mkPhrase no_Utt ;
    PYesToNo = mkPhrase yes_Utt ;

    GObjectPlease o = lin Text (mkPhr noPConj (mkUtt o) please_Voc) | lin Text (mkUtt o) ;

    Is = mkCl ;
    IsMass m q = mkCl (mkNP m) q ;

    SProp = mkS ;
    SPropNot = mkS negativePol ;
    QProp p = mkQS (mkQCl p) ;

    WherePlace place = mkQS (mkQCl where_IAdv place.name) ;
    WherePerson person = mkQS (mkQCl where_IAdv person.name) ;

    PropAction a = a ;

    AmountCurrency num curr = mkNP num curr ;

    ObjItem i = i ;
    ObjNumber n k = mkNP n k ;
    ObjIndef k = mkNP a_Quant k ;
    ObjPlural k = mkNP aPl_Det k ;
    ObjPlur k = mkNP aPl_Det k ;
    ObjMass k = mkNP k ;
    ObjAndObj = mkNP and_Conj ;
    OneObj o = o ; 

    MassDrink d = d ;
    DrinkNumber n k = mkNP n k ;

    This kind = mkNP this_Quant kind ;
    That kind = mkNP that_Quant kind ;
    These kind = mkNP this_Quant plNum kind ;
    Those kind = mkNP that_Quant plNum kind ;
    The kind = mkNP the_Quant kind ;
    Thes kind = mkNP the_Quant plNum kind ;
    ThisMass kind = mkNP this_Quant kind ;
    ThatMass kind = mkNP that_Quant kind ;
    TheMass kind = mkNP the_Quant kind ;
    ThesePlur kind = mkNP this_Quant plNum kind ;
    ThosePlur kind = mkNP that_Quant plNum kind ;
    ThesPlur kind = mkNP the_Quant plNum kind ;

    SuchKind quality kind = mkCN quality kind ;
    SuchMassKind quality kind = mkCN quality kind ;
    Very property = mkAP very_AdA (mkAP property) ;
    Too property = mkAP too_AdA (mkAP property) ;
    PropQuality property = mkAP property ;

    ThePlace kind = let dd : Det = if_then_else Det kind.isPl thePl_Det theSg_Det 
                     in placeNP dd kind ;
    APlace kind = let dd : Det = if_then_else Det kind.isPl aPl_Det aSg_Det 
                     in placeNP dd kind ;

    IMale, IFemale = mkPerson i_Pron ;
    YouFamMale, YouFamFemale = mkPerson youSg_Pron ;
    YouPolMale, YouPolFemale = mkPerson youPol_Pron ;

    LangNat n = n.lang ;
    CitiNat n = n.prop ;
    CountryNat n = n.country ;
    PropCit c = c ;

    OnDay d = d.point ;
    Today = today_Adv ;

    PersonName n = 
      {name = n ; isPron = False ; poss = mkQuant he_Pron} ; -- poss not used
----    NameString s = symb s ; --%
    NameNN = symb "NN" ;

    NNumeral n = mkCard <lin Numeral n : Numeral>  ;

    SHave   p obj = mkS (mkCl p.name have_V2 obj) ;
    SHaveNo p k = mkS negativePol (mkCl p.name have_V2 (mkNP aPl_Det k)) ;
    SHaveNoMass p m = mkS negativePol (mkCl p.name have_V2 (mkNP m)) ;
    QDoHave p obj = mkQS (mkQCl (mkCl p.name have_V2 obj)) ;

    AHaveCurr p curr = mkCl p.name have_V2 (mkNP aPl_Det curr) ;
    ACitizen p n = mkCl p.name n ;
    ABePlace p place = mkCl p.name place.at ;
    ByTransp t = t.by ;

    AKnowSentence p s = mkCl p.name Lexicon.know_VS s ;
    AKnowQuestion p s = mkCl p.name Lexicon.know_VQ s ;
    AKnowPerson p q = mkCl p.name Lexicon.know_V2 q.name ;

oper 

-- These operations are used internally in Sentences.

  mkPhrase : Utt -> Text = \u -> lin Text u ; -- no punctuation
  mkGreeting : Str -> Text = \s -> lin Text (ss s) ; -- no punctuation
  mkSentence : Utt -> Text = \t -> lin Text (postfixSS "." t | t) ; -- optional .

  mkPerson : Pron -> {name : NP ; isPron : Bool ; poss : Quant} = \p -> 
    {name = mkNP p ; isPron = True ; poss = mkQuant p} ;

-- These are used in Words for each language.

  NPNationality : Type = {lang : NP ; country : NP ; prop : A} ;

  mkNPNationality : NP -> NP -> A -> NPNationality = \la,co,pro ->
        {lang = la ; 
         country = co ;
         prop = pro
        } ;

  NPDay : Type = {name : NP ; point : Syntax.Adv ; habitual : Syntax.Adv} ;

  mkNPDay : NP -> Syntax.Adv -> Syntax.Adv -> NPDay = \d,p,h ->
      {name = d ; 
       point = p ;
       habitual = h
      } ;

  NPPlace : Type = {name : NP ; at : Syntax.Adv ; to : Syntax.Adv} ;
  CNPlace : Type = {name : CN ; at : Prep ; to : Prep; isPl : Bool} ;

  mkCNPlace : CN -> Prep -> Prep -> CNPlace = \p,i,t -> {
    name = p ;
    at = i ;
    to = t ;
    isPl = False
    } ;

 mkCNPlacePl : CN -> Prep -> Prep -> CNPlace = \p,i,t -> {
    name = p ;
    at = i ;
    to = t ;
    isPl = True
    } ;

  placeNP : Det -> CNPlace -> NPPlace = \det,kind ->
    let name : NP = mkNP det kind.name in {
      name = name ;
      at = mkAdv kind.at name ;
      to = mkAdv kind.to name
    } ;

  NPPerson : Type = {name : NP ; isPron : Bool ; poss : Quant} ;

  relativePerson : GNumber -> CN -> (Num -> NP -> CN -> NP) -> NPPerson -> NPPerson = 
    \n,x,f,p -> 
      let num = if_then_else Num n plNum sgNum in {
      name = case p.isPron of {
        True => mkNP p.poss num x ;
        _    => f num p.name x
        } ;
      isPron = False ;
      poss = mkQuant he_Pron -- not used because not pron
      } ;

  GNumber : PType = Bool ;
  sing = False ; plur = True ;

-- for languages without GenNP, use "the wife of p"
  mkRelative : Bool -> CN -> NPPerson -> NPPerson = \n,x,p ->
    relativePerson n x 
      (\a,b,c -> mkNP (mkNP the_Quant a c) (Syntax.mkAdv possess_Prep b)) p ;

-- for languages with GenNP, use "p's wife"
--   relativePerson n x (\a,b,c -> mkNP (GenNP b) a c) p ;

  phrasePlease : Utt -> Text = \u -> --- lin Text (mkPhr noPConj u please_Voc) | 
                                     lin Text u ;

------------------------------------------------------------------------------------------
-- New things added 30/11/2011 by AR
------------------------------------------------------------------------------------------

  lincat
    VerbPhrase  = VP ;
    Modality = VV ;
  lin
    ADoVerbPhrase p vp = mkCl p.name vp ;
    AModVerbPhrase m p vp = mkCl p.name (mkVP m vp) ;
    ADoVerbPhrasePlace p vp x = mkCl p.name (mkVP vp x.at) ;
    AModVerbPhrasePlace m p vp x = mkCl p.name (mkVP m (mkVP vp x.at)) ;

    QWhereDoVerbPhrase p vp = mkQS (mkQCl where_IAdv (mkCl p.name vp)) ;
    QWhereModVerbPhrase m p vp = mkQS (mkQCl where_IAdv (mkCl p.name (mkVP m vp))) ;

    MWant = want_VV ;
    MCan = can_VV ;
    MKnow = can8know_VV ;
    MMust = must_VV ;

    VPlay = mkVP play_V ;
    VRun = mkVP run_V ;
    VSit = mkVP sit_V ;
    VSleep = mkVP sleep_V ;
    VSwim = mkVP swim_V ; 
    VWalk = mkVP walk_V ;
    VSit = mkVP sit_V ;
    VStop = mkVP stop_V ;
    VDrink = mkVP <lin V drink_V2 : V> ; 
    VEat = mkVP <lin V eat_V2 : V> ; 
    VRead = mkVP <lin V read_V2 : V> ; 
    VWait = mkVP <lin V wait_V2 : V> ; 
    VWrite = mkVP <lin V write_V2 : V> ; 

    V2Buy o = mkVP buy_V2 o ;
    V2Drink o = mkVP drink_V2 o ;
    V2Eat o = mkVP eat_V2 o ;
    V2Wait o = mkVP wait_V2 o.name ;

    PImperativeFamPos  v = phrasePlease (mkUtt (mkImp v)) ;
    PImperativeFamNeg  v = phrasePlease (mkUtt negativePol (mkImp v)) ;
    PImperativePolPos  v = phrasePlease (mkUtt politeImpForm (mkImp v)) ;
    PImperativePolNeg  v = phrasePlease (mkUtt politeImpForm negativePol (mkImp v)) ;
    PImperativePlurPos v = phrasePlease (mkUtt pluralImpForm (mkImp v)) ;
    PImperativePlurNeg v = phrasePlease (mkUtt pluralImpForm negativePol (mkImp v)) ;

-- other new things allowed by the resource

---    PBecause a b = SSubjS a because_Subj b ;

    He = mkPerson he_Pron ;
    She = mkPerson she_Pron ;
    WeMale, WeFemale = mkPerson we_Pron ;
    YouPlurFamMale, YouPlurFamFemale = mkPerson youPl_Pron ;
    YouPlurPolMale, YouPlurPolFemale = mkPerson youPl_Pron ;
    TheyMale, TheyFemale = mkPerson they_Pron ;

}
