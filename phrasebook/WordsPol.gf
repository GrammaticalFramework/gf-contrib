--2 Implementations of Words, with Polish as example

concrete WordsPol of Words = SentencesPol ** 
    open 
      ResPol,
      SyntaxPol, 
      (L = LexiconPol), 
      (Q = QuestionPol),
      (N = NounPol),
      MorphoPol,
      Prelude in {
    
  flags  
    optimize =values ; coding =utf8 ; 
      
  lin

-- Kinds; many of them are in the resource lexicon, others can be built by $mkN$.

    Apple = mkCN L.apple_N ;
    Beer = mkCN L.beer_N ;
    Bread = mkCN L.bread_N ;
    Cheese = mkCN L.cheese_N ;
    Chicken = mkCN kurczak ;
    Coffee = mkCN kawa;
    Fish = mkCN L.fish_N ;
    Meat = mkCN L.meat_N ;
    Milk = mkCN L.milk_N ;
    Pizza = mkCN pizza;
    Salt = mkCN L.salt_N ;
    Tea = mkCN herbata ;
    Water = mkCN L.water_N ;
    Wine = mkCN L.wine_N ;

-- Properties; many of them are in the resource lexicon, others can be built by $mkA$.

    Bad = L.bad_A ;
    Boring = mkA (mkRegAdj "nudny" "nudniejszy" "nudno" "nudniej" );
    Cheap = mkA (mkRegAdj "tani" "tańszy" "tanio" "taniej" );
    Cold = L.cold_A ;
    Delicious = mkA (mkRegAdj "pyszny" "pyszniejszy" "pysznie" "pyszniej") ;
    Expensive = mkA (mkRegAdj "drogi" "droższy" "drogo" "drożej" );
    Fresh = mkA (mkRegAdj "świeży" "świeższy" "świeżo" "świeżej" );
    Good = L.good_A ;
    Suspect = mkA (mkCompAdj "podejrzany" "podejrzanie" );
    Warm = L.warm_A ;

-- Places require different prepositions to express location; in some languages 
-- also the directional preposition varies, but in English we use $to$, as
-- defined by $mkPlace$.

    Airport = mkPlaceNa lotnisko ;
    AmusementPark = mkPlaceDo ["wesołe miasteczko"] ["wesołego miasteczka"] ["wesołym miasteczku"] Neut;
    Bank = mkPlaceDo "bank" "banku" "banku" (Masc Inanimate);
    Bar = mkPlaceDo "bar" "baru" "barze" (Masc Inanimate);
    Cafeteria = mkPlaceDo "stołówka" "stołówki" "stołówce" Fem;
    Center = mkPlaceDo "centrum" "centrum" "centrum" Neut;
    Cinema = mkPlaceDo "kino" "kina" "kinie" Neut ;
    Church = mkPlaceDo "kościół" "kościoła" "kościele" (Masc Inanimate);
    Disco = mkPlaceNa "dyskoteka" "dyskotekę" "dyskotece" Fem ;
    Hospital = mkPlaceDo "szpital" "szpitala" "szpitalu" (Masc Inanimate);
    Hotel = mkPlaceDo "hotel" "hotelu" "hotelu" (Masc Inanimate) ;
    Museum = mkPlaceDo "muzeum" "muzeum" "muzeum" Neut ;
    Park = mkPlaceDo "park" "parku" "parku" (Masc Inanimate) ;
    Parking = mkPlaceNa "parking" "parking" "parkingu" (Masc Inanimate) ;
    Pharmacy = mkPlaceDo "apteka" "apteki" "aptece" Fem ;
    PostOffice = mkPlaceNa "poczta" "pocztę" "poczcie" Fem ;
    Pub = mkPlaceDo "pub" "pubu" "pubie" (Masc Inanimate) ;
    Restaurant = mkPlaceDo L.restaurant_N;
    School = mkPlaceDo L.school_N;
    Shop = mkPlaceDo "sklep" "sklepu" "sklepie" (Masc Inanimate) ;
    Station = mkPlaceNa "stacja" "stację" "stacji" Fem ;
    Supermarket = mkPlaceDo "supermarket" "supermarketu" "supermarkecie" (Masc Inanimate) ;
    Theatre = mkPlaceDo "teatr" "teatru" "teatrze" (Masc Inanimate) ;
    Toilet = mkPlaceDo "toaleta" "toalety" "toalecie" Fem ;
    University = mkPlaceNa L.university_N;
    Zoo = mkPlaceDo "zoo" "zoo" "zoo" Neut ;
   
    CitRestaurant cit = { name=(mkCN cit.prop (mkCN L.restaurant_N));
        at = { s="w"; c=LocPrep; lock_Prep = <> }; to = {s="do"; c=GenPrep; lock_Prep = <>}; isPl = False };


-- Currencies; $crown$ is ambiguous between Danish and Swedish crowns.

    DanishCrown = mkCN (mkCurrency "korona duńska" "korony duńskie" "koron duńskich" Fem);
    Dollar = mkCN dolar ;
    Euro = mkCN (mkCurrency "euro" "euro" "euro" Neut);
    Lei = mkCN (mkCurrency "leja" "leje" "lei" Fem);
    Leva = mkCN (mkCurrency "lew" "lewy" "lewów" (Masc Animate));
    NorwegianCrown = mkCN (mkCurrency "korona norweska" "korony norweskie" "koron norweskich" Fem);
    Pound = mkCN (mkCurrency "funt" "funty" "funtów" (Masc Animate));
    Rouble = mkCN (mkCurrency "rubel" "ruble" "rubli" (Masc Animate));
    SwedishCrown = mkCN (mkCurrency "korona szwedzka" "korony szwedzkie" "koron szwedzkich" Fem);
    Zloty = mkCN (mkCurrency "złoty" "złote" "złotych" (Masc Animate));

-- Nationalities
--  język, po języku, obywatelstwo, kraj, obywatelem, obywatelami, obywatelką
    Belgian = {prop=mkA (mkCompAdj "belgijski"); citizenMSg="Belgiem"; citizenMPl="Belgami"; citizenF="Belgijką"};
    Belgium = mkNP belgia ;
    Bulgarian = mkNat "bułgarski" ["po bułgarsku"] "bułgarski" bulgaria "Bułgarem" "Bułgarami" "Bułgarką";
    Catalan = mkNat "kataloński" ["po katalońsku"] "kataloński" katalonia "Katalończykiem" "Katalończykami" "Katalonką";
    Danish = mkNat "duński" ["po duńsku"] "duński" katalonia "Duńczykiem" "Duńczykami" "Dunką";
    Dutch =  mkNat "holenderski" ["po holendersku"] "holenderski" holandia "Holendrem" "Holendrami" "Holenderką";
    English = mkNat "angielski" ["po angielsku"] "angielski" anglia "Anglikiem" "Anglikami" "Angielką";
    Finnish = mkNat "fiński" ["po fińsku"] "finladzki" finlandia "Finem" "Finami" "Finką";
    Flemish = mkA (mkCompAdj "flamandzki" ["po flamandzku"]);
    French = mkNat "francuski" ["po francusku"] "francuski" francja "Framcuzem" "Francuzami" "Francuzką";
    German = mkNat "niemiecki" ["po niemiecku"] "niemiecki" niemcy "Niemcem" "Niemcami" "Niemką";
    Italian = mkNat "włoski" ["po włosku"] "włoski" wlochy "Włochem" "Włochami" "Włoszką";
    Norwegian = mkNat "norweski" ["po norwesku"] "norweski" norwegia "Norwegiem" "Norwegami" "Norweszką";
    Polish = mkNat "polski" ["po polsku"] "polski" polska "Polakiem" "Polakami" "Polką";
    Romanian = mkNat "rumuński" ["po rumuńsku"] "rumuński" rumunia "Rumunem" "Rumunami" "Rumunką";
    Russian = mkNat "rosyjski" ["po rosyjsku"] "rosyjski" rosja "Rosjaninem" "Rosjanami"  "Rosjanką";
    Spanish = mkNat "hiszpański" ["po hiszpańsku"] "hiszpański" hiszpania "Hiszpanem" "Hiszpanami"  "Hiszpanką";
    Swedish = mkNat "szwedzki" ["po szwedzku"] "szwedzki" szwecja "Szwedem" "Szwedami" "Szwedką";

-- Means of transportation 

   Bike = {cn = mkCN L.bike_N ; verb="jedzie" };
   Bus = mkTransport "autobus" "autobusem" (Masc Inanimate) "jedzie";
   Car = {cn = mkCN L.car_N ; verb="jedzie" };
   Ferry = mkTransport "prom" "promem" (Masc Inanimate) "płynie";
   Plane = {cn = mkCN L.airplane_N ; verb="leci" };
   Subway = mkTransport "metro" "metrem" Neut "jedzie";
   Taxi = mkTransport "taksówka" "taksówką" Fem "jedzie";
   Train = mkTransport "pociąg" "pociągiem" (Masc Inanimate) "jedzie";
   Tram = mkTransport "tramwaj" "tramwajem" (Masc Inanimate) "jedzie";

   ByFoot = ss "pieszo" ** {lock_Adv = <>};

-- Actions: the predication patterns are very often language-dependent.

    AHasAge p num = mkCl p.name have_V2 (mkNP (mkDet num) (mkCN L.year_N)) ;
    AHasChildren p num = mkCl p.name have_V2 (mkNP num L.child_N) ; 
    AHasRoom p num = mkCl p.name have_V2 
      (mkNP (mkNP a_Det (mkN (mkNTable0950 "pokój") (Masc Inanimate))) (SyntaxPol.mkAdv for_Prep (mkNP num (L.person_N)))) ;
    AHasTable p num = mkCl p.name have_V2 
      (mkNP (mkNP a_Det (L.table_N)) (SyntaxPol.mkAdv for_Prep (mkNP num (L.person_N)))) ;



    AHasName p name = mkCl p.name (mkVP (mkComplicatedVerb (mkMonoVerb "być" conj1 Imperfective) name.nom));
    AHungry p = mkCl p.name (mkA (mkRegAdj "głodny" "głodniejszy" "głodno" "głodniej" )) ;
    AIll p = mkCl p.name (mkA (mkCompAdj "chory")) ;
    AKnow p = mkCl p.name (mkVP (mkMonoVerb "wiedzieć" conj103 Imperfective)) ;
    ALike p item = mkCl p.name (L.like_V2) item ;
    ALive p co = mkCl p.name (mkVP (mkComplicatedVerb (mkMonoVerb "mieszkam" conj98 Imperfective) ("w" ++ co.dep!LocPrep)));
    ALove p q = mkCl p.name (L.love_V2) q.name ;
    AMarried p = mkCl p.name (case p.name.gn of {
        MascPersSg|MascAniSg|MascInaniSg|MascPersPl=> mkCompAdj "żonaty";
        _=>mkCompAdj "zamężny"}) ;
    AReady p = mkCl p.name (L.ready_A) ;
    AScared p = mkCl p.name (mkReflVerb (mkMonoVerb "bać" conjbac Imperfective)) ; 
    ASpeak p lang = mkCl p.name  (mkVP (mkComplicatedVerb (mkMonoVerb "mówić" conj72 Imperfective) lang.advpos)) ;
    AThirsty p = mkCl p.name (mkVP (mkComplicatedVerb (mkMonoVerb "chcieć" conj45 Imperfective) ["pić"]));
    ATired p = mkCl p.name (mkA (mkCompAdj "zmęczony")) ;
    AUnderstand p = mkCl p.name (mkVP (mkV "rozumieć" conj101 "zrozumieć" conj101)) ;
    AWant p obj = mkCl p.name (dirV2 (mkMonoVerb "chcieć" conj45 Imperfective)) obj ; 
    AWantGo p place = mkCl p.name want_VV (mkVP (mkComplicatedVerb (mkV1 "iść" conj41a "pójść" conj42) place.to.s)) ;

-- miscellaneous

    QWhatName p = mkQS (mkQCl how_IAdv (mkCl p.name 
        (mkVP (mkComplicatedVerb (mkMonoVerb "mieć" conj100 Imperfective) ["na imię"]))));
    QWhatAge p = mkQS (mkQCl howmany_IAdv (mkCl p.name 
        (mkVP (mkComplicatedVerb (mkMonoVerb "mieć" conj100 Imperfective) ["lat"]))));
    HowMuchCost item = { s="ile" ++ 
        (mkMonoVerb "kosztować" conj53 Imperfective).si!(VFinM (extract_num!item.gn) P3) ++ item.nom; 
        lock_QS=<> } ; 
    ItCost item price = mkCl item (dirV2 (mkMonoVerb "kosztować" conj53 Imperfective) ) price ;

    PropOpen p = mkCl p.name open_A ;
    PropClosed p = mkCl p.name closed_A ;
    PropOpenDate p d = mkCl p.name (mkAP d open_A) ; 
    PropClosedDate p d = mkCl p.name (mkAP d closed_A) ; 
    PropOpenDay p d = mkCl p.name (mkAP (ss d.hab) open_A) ; 
    PropClosedDay p d = mkCl p.name (mkAP (ss d.hab) closed_A) ; 

-- Building phrases from strings is complicated: the solution is to use
-- mkText : Text -> Text -> Text ;

    PSeeYouDate d = mkText (lin Text (ss ("do zobaczenia"))) (mkPhrase (mkUtt d)) ;
    PSeeYouPlace p = mkText (lin Text (ss ("do zobaczenia"))) (mkPhrase (mkUtt p.at)) ;
    PSeeYouPlaceDate p d = 
      mkText (lin Text (ss ("do zobaczenia"))) 
        (mkText (mkPhrase (mkUtt d)) (mkPhrase (mkUtt p.at))) ;
-- 
-- Relations are expressed as "my wife" or "my son's wife", as defined by $xOf$
-- below. Languages without productive genitives must use an equivalent of
-- "the wife of my son" for non-pronouns.
-- 
    Wife p     = xOf p N.NumSg L.wife_N ;
    Husband p  = xOf p N.NumSg L.husband_N ;
    Son p      = xOf p N.NumSg (mkPer "syn" "syna" "syna" (Masc Personal)) ;
    Daughter p = xOf p N.NumSg (mkPer "córka" "córki" "córkę" Fem );
    Children p = xOf p N.NumPl L.child_N ;

-- week days

    Monday = { name="poniedziałek"; hab=["w poniedziałki"]; adv=["w poniedziałek"] } ; 
    Tuesday = { name="wtorek"; hab=["we wtorki"]; adv=["we wtorek"] } ; 
    Wednesday = { name="środa"; hab=["we środy"]; adv=["we środę"] } ; 
    Thursday = { name="czwartek"; hab=["w czwartki"]; adv=["w czwartek"] } ; 
    Friday = { name="piątek"; hab=["w piątki"]; adv=["w piątek"] } ; 
    Saturday = { name="sobota"; hab=["w soboty"]; adv=["w sobotę"] } ; 
    Sunday = { name="niedziela"; hab=["w niedziele"]; adv=["w niedzielę"] } ; 
 
    Tomorrow = (ss "jutro") ** {lock_Adv = <>} ;

-- modifiers of places

    TheBest = mkSuperl L.good_A ;
    TheClosest = mkSuperl L.near_A ; 
    TheCheapest = mkSuperl (mkA (mkRegAdj "tani" "tańszy" "tanio" "taniej") );
    TheMostExpensive = mkSuperl (mkA (mkRegAdj "drogi" "droższy" "drogo" "drożej" ) );
    TheMostPopular = mkSuperl (mkA (mkRegAdj "popularny" "popularniejszy" "popularnie" "popularniej" ) ) ;
    TheWorst = mkSuperl L.bad_A ;

    SuperlPlace sup p = placeNP sup p ;


-- transports
    HowFar place = mkQS (Q.QuestIComp (Q.CompIAdv far_IAdv) place.name) ;
    
    --jak daleko jest z cenrum do hotelu
    HowFarFrom x y = { s=["jak daleko jest z"] ++ x.name.dep!GenPrep ++ y.to.s; lock_QS=<> };

    --jak daleko jest pieszo z centrum do hotelu
    HowFarFromBy x y t = 
      { s=["jak daleko jest"] ++ t.s ++ "z" ++ x.name.dep!GenPrep ++ y.to.s; lock_QS=<> };

    HowFarBy y t = 
            { s=["jak daleko jest"] ++ t.s ++ y.to.s; lock_QS=<> };
 
    WhichTranspPlace trans place = 
      { s= ktory ! AF (cast_gennum!<trans.cn.g,Sg>) Nom ++ trans.cn.s!Sg!Nom ++ trans.verb ++ place.to.s; lock_QS=<> };

    IsTranspPlace trans place = 
      { s= ["czy jest stąd"] ++ trans.cn.s!Sg!Nom ++ place.to.s; lock_QS=<> };


-- auxiliaries

  oper kurczak = mkN (mkNTable0173 "kurczak") (Masc Animate) ;
  oper kawa = mkN (mkNTable0021 "kawa") (Fem) ;
  oper pizza = mkN (mkNTable0175 "pizza") (Fem) ;
  oper herbata = mkN (mkNTable0026 "herbata") (Fem) ;
  oper lotnisko = mkN (mkNTable0265 "lotnisko") (Neut) ;
  oper lilja = mkN (mkNTable0060 "lilia") (Fem) ;
  oper niemcy = mkN (mkNTable0387 "Niemcy") (Plur) ;
  oper wlochy = mkN (mkNTable0482 "Włochy") (Plur) ;
  oper belgia = mkN (mkNTable0005 "Belgia") (Fem) ;
  oper bulgaria = mkN (mkNTable0005 "Bułgaria") (Fem) ;
  oper katalonia = mkN (mkNTable0005 "Katalonia") (Fem) ;
  oper dania = mkN (mkNTable0055 "Dania") (Fem) ;
  oper anglia = mkN (mkNTable0005 "Anglia") (Fem) ;
  oper holandia = mkN (mkNTable0005 "Holandia") (Fem) ;
  oper finlandia = mkN (mkNTable0005 "Finlandia") (Fem) ;
  oper francja = mkN (mkNTable0005 "Francja") (Fem) ;
  oper norwegia = mkN (mkNTable0005 "Norwegia") (Fem) ;
  oper polska = mkN (mkNTable0041 "Polska") (Fem) ;
  oper rumunia = mkN (mkNTable0032 "Rumunia") (Fem) ;
  oper rosja = mkN (mkNTable0005 "Rosja") (Fem) ;
  oper hiszpania = mkN (mkNTable0032 "Hiszpania") (Fem) ;
  oper szwecja = mkN (mkNTable0005 "Szwecja") (Fem) ;
  oper pokoj = mkN (mkNTable0526 "pokój") (Masc Inanimate) ;
  oper dolar = mkN (mkNTable0064 "dolar") (Masc Animate) ;

  oper
  
  mkA : Adj -> A = \adj -> adj ** { lock_A = <> };

  mkPlaceDo = overload {
    mkPlaceDo : N -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \n -> {
      name = mkCN n; at = { s="w"; c=LocPrep; lock_Prep = <> }; to = {s="do"; c=GenPrep; lock_Prep = <>}; isPl = False };
    mkPlaceDo : Str -> Str -> Str -> Gender -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \nom,gen,loc,g -> {
      name = mkCN {
        s = table {SF Sg Nom => nom; SF Sg Gen => gen; SF Sg Loc => loc; _ => ["not implemented"]};
        g = g;
        lock_N=<>
      };
      at = { s="w"; c=LocPrep; lock_Prep = <> }; to = {s="do"; c=GenPrep; lock_Prep = <>}; isPl = False };
  };
  
  mkPlaceNa = overload {
    mkPlaceNa : N -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \n -> {
      name = mkCN n; at = { s="na"; c=LocPrep; lock_Prep = <> }; to = {s="na"; c=AccPrep; lock_Prep = <>}; isPl = False };
    mkPlaceNa : Str -> Str -> Str -> Gender -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \nom,acc,loc,g -> {
      name = mkCN {
        s = table {SF Sg Nom => nom; SF Sg Acc => acc; SF Sg Loc => loc; _ => ["not implemented"]};
        g = g;
        lock_N=<>
      };
    at = { s="na"; c=LocPrep; lock_Prep = <> }; to = {s="na"; c=AccPrep; lock_Prep = <>}; isPl = False };
  };
  
  mkTransport : Str -> Str -> Gender -> Str -> {cn:CN; verb:Str} = \nom,instr,g,verb -> {
    cn = {
    s = \\n,c => case <n,c> of {<Sg,Nom> => nom; <Sg,Instr> => instr; _ => ["not implemented"]};
    g = g;
    lock_CN=<>
    };
    verb=verb
  };

  mkCitizen = overload {
    mkCitizen : Str -> N = \s -> {
      s = table {SF Sg Instr => s; _ => ["not implemented"]};
      g = Fem;
      lock_N=<>
    };
    mkCitizen : Str -> Str -> N = \inst, instpl -> {
      s = table {SF Sg Instr => inst; SF Pl Instr => instpl; _ => ["not implemented"]};
      g = Masc Personal;
      lock_N=<>
    };
  };
  
  mkPer : Str -> Str -> Str -> Gender -> N = \nom,gen,acc,g -> {
    s = table {SF Sg Nom => nom; SF Sg Gen => gen; SF Sg Acc => acc; _ => ["not implemented"]};
    g = g;
    lock_N=<>
  };

  
  mkCurrency : Str -> Str -> Str -> Gender -> N = \nom,nompl,genpl,g -> {
    s = table {SF Sg Nom => nom; SF Pl (Nom|Acc) => nompl; SF Pl Gen => genpl; _ => ["not implemented"]};
    g = g;
    lock_N=<>
  };
  
  mkNat : Str -> Str -> Str -> N -> Str -> Str -> Str -> 
    { lang: A; prop: A; country: NP; citizenMSg:Str; citizenMPl: Str; citizenF:Str } = 
    \lang,ladv,prop,country,citiMsg, citiMpl, citiF -> {
    lang = mkA (mkCompAdj lang ladv); prop = mkA (mkCompAdj prop); 
    country=mkNP country; citizenMSg=citiMsg; citizenMPl=citiMpl; citizenF=citiF };
 
  open_A : A = (mkA (mkCompAdj "otwarty"));
  closed_A : A = (mkA (mkCompAdj "zamknięty"));
    
  xOf : NPPerson -> Num -> N -> NPPerson = \p,num,n ->
      { name = case p.isPron of {
          True  => mkNP (mkDet p.poss num) n; 
          False => mkNP (mkNP (mkDet a_Quant num) n) ({s=p.name.dep!GenNoPrep; lock_Adv=<>})
        };
        isPron = False;
        poss = p.poss }; --it is not used, because it is not a pron
    
    mkSuperl : A -> Det = \a -> SyntaxPol.mkDet the_Art (SyntaxPol.mkOrd a) ;

   far_IAdv : IAdv = (ss ["jak daleko"]) ** {lock_IAdv = <>};
   howmany_IAdv : IAdv = (ss ["ile"]) ** {lock_IAdv = <>};

}
