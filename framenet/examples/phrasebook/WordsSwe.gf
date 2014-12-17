--# -coding=latin1
-- (c) 2010 Aarne Ranta under LGPL

concrete WordsSwe of Words = SentencesSwe **
  open
    PatternsSwe,          -- FrameNet API
    TargetsSwe,           -- FrameNet API
    (T = TargetsSweCnc),  -- FrameNet API
    SyntaxSwe,
    ParadigmsSwe,
    (L = LexiconSwe),
    IrregSwe,
    ExtraSwe,
    Prelude,
    Maybe                 -- from RGL; used with FrameNet API
  in {

  lin

-- kinds of food

    Apple = mkCN L.apple_N ;
    Beer = mkCN L.beer_N ;
    Bread = mkCN L.bread_N ;
    Cheese = mkCN (mkN "ost") ;
    Chicken = mkCN (mkN "kyckling") ;
    Coffee = mkCN (mkN "kaffe" neutrum) ;
    Fish = mkCN L.fish_N ;
    Meat = mkCN (mkN "k�tt" "k�tt") ;
    Milk = mkCN L.milk_N ;
    Pizza = mkCN (mkN "pizza") ;
    Salt = mkCN L.salt_N ;
    Tea = mkCN (mkN "te" neutrum) ;
    Water = mkCN L.water_N ;
    Wine = mkCN L.wine_N ;

-- properties

    Bad = L.bad_A ;
    Cheap = mkA "billig" ;
    Boring = mkA "tr�kig" ;
    Cold = L.cold_A ;
    Delicious = mkA "l�cker" ;
    Expensive = mkA "dyr" ;
    Fresh = mkA "f�rsk" ;
    Good = L.good_A ;
    Suspect = mkA "suspekt" "suspekt" ;
    Warm = L.warm_A ;

-- places

    Airport = mkPlace (mkN "flygplats" "flygplatser") "p�" ;
    AmusementPark = mkPlace (mkN "n�jespark" "n�jesparker") "i" ;
    Bank = mkPlace (mkN "bank" "banker") "i" ;
    Bar = mkPlace (mkN "bar" "barer") "i" ;
    Cafeteria = mkPlace (mkN "caf�" "caf�") "p�" ;
    Center = mkPlace (mkN "innerstad" "innerst�der") "p�" ; ----
    Church = mkPlace (mkN "kyrka") "i" ;
    Cinema = mkPlace (mkN "bio" "bion" "biografer" "biograferna") "p�" ; ---- ?
    Disco = mkPlace (mkN "diskotek" "diskotek") "p�" ;
    Hospital = mkPlace (mkN "sjukhus" "sjukhus") "p�" ;
    Hotel = mkPlace (mkN "hotell" "hotell") "p�" ;
    Museum = mkPlace (mkN "museum" "museet" "museer" "museerna") "p�" ;
    Park = mkPlace (mkN "park" "parker") "i" ;
    Parking = mkPlace (mkN "parkering") "p�" ;
    Pharmacy = mkPlace (mkN "apotek" "apotek") "i" ;
    PostOffice = mkPlace (mkN "post" "poster") "p�" ;
    Pub = mkPlace (mkN "pub") "p�" ;
    Restaurant = mkPlace (mkN "restaurang" "restauranger") "p�" ;
    Shop = mkPlace (mkN "aff�r" "aff�rer") "i" ;
    School = mkPlace (mkN "skola") "p�" ;
    Station = mkPlace (mkN "station" "stationer") "p�" ;
    Supermarket = mkPlace (mkN "snabbk�p" "snabbk�p") "p�" ;
    Theatre = mkPlace (mkN "teater" "teatrar") "p�" ;
    Toilet = mkPlace2 (mkN "toalett" "toaletter") "p�" "p�" ;
    University = mkPlace (mkN "universitet" "universitet") "p�" ;
    Zoo = mkPlace (mkN "djurpark" "djurparker") "i" ;

    CitRestaurant cit =
      mkCNPlace (mkCN cit (mkN "restaurang" "restauranger")) on_Prep to_Prep ;

-- currencies

    DanishCrown = mkCN (mkA "dansk") (mkN "krona") | mkCN (mkN "krona") ;
    Dollar = mkCN (mkN "dollar" "dollar") ;
    Euro = mkCN (mkN "euro" "euro") ;
    Lei = mkCN (mkN "lei" "lei") ;
    Leva = mkCN (mkN "leva" "leva") ;
    NorwegianCrown = mkCN (mkA "norsk") (mkN "krona") | mkCN (mkN "krona") ;
    Pound = mkCN (mkN "pund" "pund") ; ---- ett pund ?
    Rouble = mkCN (mkN "rubel" "rubeln" "rubel" "rubeln") ; ---- ?
    SwedishCrown = mkCN (mkA "svensk") (mkN "krona") | mkCN (mkN "krona") ;
    Zloty = mkCN (mkN "zloty" "zloty") ;

-- nationalities

    Belgian = mkA "belgisk" ;
    Belgium = mkNP (mkPN "Belgien") ;
    Bulgarian = mkNat "bulgarisk" "Bulgarien" ;
    Catalan = mkNat "katalansk" "Katalonien" ;
    Danish = mkNat "dansk" "Danmark" ;
    Dutch = mkNat "nederl�ndsk" "Nederl�nderna" ;
    English = mkNat "engelsk" "England" ;
    Finnish = mkNat "finsk" "Finland" ;
    Flemish = mkNP (mkPN "flaml�ndska") ;
    French = mkNat "fransk" "Frankrike" ;
    German = mkNat "tysk" "Tyskland" ;
    Italian = mkNat "italiensk" "Italien" ;
    Norwegian = mkNat "norsk" "Norge" ;
    Polish = mkNat "polsk" "Polen" ;
    Romanian = mkNat "rum�nsk" "Rum�nien" ;
    Russian = mkNat "rysk" "Ryssland" ;
    Spanish = mkNat "spansk" "Spanien" ;
    Swedish = mkNat "svensk" "Sverige" ;

-- means of transportation

    Bike = mkTransport L.bike_N ;
    Bus = mkTransport (mkN "buss") ;
    Car = mkTransport L.car_N ;
    Ferry = mkTransport (mkN "f�rja") ;
    Plane = mkTransport L.airplane_N ;
    Subway = mkTransport (mkN "tunnelbana") ;
    Taxi = mkTransport (mkN "taxi" "taxin" "taxibilar" "taxibilarna") ; ----
    Train = mkTransport L.train_N ;
    Tram = mkTransport (mkN "sp�rvagn") ;

    ByFoot = ParadigmsSwe.mkAdv "till fots" ;

-- actions

    AHasAge p num = mkCl p.name (mkNP num L.year_N) ;
    AHasName p name = mkCl p.name (mkV2 (mkV "heter")) name ;

    --AHasChildren p num = mkCl p.name have_V2 (mkNP num L.child_N) ;
    -- FrameNet API:
    AHasChildren p num = let cl : Clause =
      Possession_V2 (Just NP p.name) (Just NP (mkNP num L.child_N)) have_V2_Possession
        in mkCl cl.np cl.vp ;

    --AHasRoom p num = mkCl p.name have_V2
    --  (mkNP (mkNP a_Det (mkN "rum" "rum"))
    --    (SyntaxSwe.mkAdv for_Prep (mkNP num (mkN "person" "personer")))) ;
    -- FrameNet API:
    AHasRoom p num = let cl : Clause =
      Possession_V2
        (Just NP p.name)
        (Just NP (mkNP (mkNP a_Det (mkN "rum" "rum")) (SyntaxSwe.mkAdv for_Prep (mkNP num (mkN "person" "personer")))))
        have_V2_Possession
      in mkCl cl.np cl.vp ;

    --AHasTable p num = mkCl p.name have_V2
    --  (mkNP (mkNP a_Det (mkN "bord" "bord"))
    --    (SyntaxSwe.mkAdv for_Prep (mkNP num (mkN "person" "personer")))) ;
    -- FrameNet API:
    AHasTable p num = let cl : Clause =
      Possession_V2
        (Just NP p.name)
        (Just NP (mkNP (mkNP a_Det (mkN "bord" "bord")) (SyntaxSwe.mkAdv for_Prep (mkNP num (mkN "person" "personer")))))
        have_V2_Possession
      in mkCl cl.np cl.vp ;

    AHungry p = mkCl p.name (mkA "hungrig") ;
    AIll p = mkCl p.name (mkA "sjuk") ;
    AKnow p = mkCl p.name (mkV "veta" "vet" "vet" "visste" "vetat" "visst") ;

    --ALike p item = mkCl p.name (mkV2 (mkV "tycker") (mkPrep "om")) item ;
    -- FrameNet API:
    ALike p item = let cl : Clause =
      Experiencer_focus_V2 (Just NP item) (Just NP p.name) (mkV2 (mkV "tycker") (mkPrep "om"))
        in mkCl cl.np cl.vp ;

    --ALive p co = mkCl p.name (mkVP (mkVP (mkV "bo")) (SyntaxSwe.mkAdv in_Prep co)) ;
    -- FrameNet API:
    ALive p co = let cl : Clause =
      Residence_V (Just Adv (SyntaxSwe.mkAdv in_Prep co)) (Just NP p.name) live_V_Residence
        in mkCl cl.np cl.vp ;

    --ALove p q = mkCl p.name (mkV2 (mkV "�lska")) q.name ;
    -- FrameNet API:
    ALove p q = let cl : Clause =
      Experiencer_focus_V2 (Just NP q.name) (Just NP p.name) love_V2_Experiencer_focus
        in mkCl cl.np cl.vp ;

    AMarried p = mkCl p.name (mkA "gift") ;
    AReady p = mkCl p.name (mkA "f�rdig") ;
    AScared p = mkCl p.name (mkA "r�dd") ;

    --ASpeak p lang = mkCl p.name  (mkV2 (mkV "tala")) lang ;
    -- FrameNet API:
    ASpeak p lang = let cl : Clause =
      Text_creation_V2 (Just NP p.name) (Just NP lang) (mkV2 speak_V_Statement)
        in mkCl cl.np cl.vp ;

    AThirsty p = mkCl p.name (mkA "t�rstig") ;
    ATired p = mkCl p.name (mkA "tr�tt") ;
    AUnderstand p = mkCl p.name (mkV "f�rst�" "f�rstod" "f�rst�tt") ;

    --AWant p obj = mkCl p.name want_VV (mkVP have_V2 obj) ;
    -- FrameNet API:
    AWant p obj = let cl : Clause =
      Desiring_VV
        (Just VP                -- Desiring.Event
          (Possession_V2
            (Nothing' NP)       -- Possession.Owner
            (Just NP obj)       -- Possession.Possession
            have_V2_Possession
          ).vp
        )
        (Just NP p.name)        -- Desiring.Experiencer
        want_VV_Desiring
      in mkCl cl.np cl.vp ;

    --AWantGo p place = mkCl p.name want_VV (mkVP (mkVP L.go_V) place.to) ;
    -- FrameNet API:
    AWantGo p place = let cl : Clause =
      Desiring_VV
        (Just VP                -- Desiring.Event
          (Motion_V_2
            (Just Adv place.to) -- Motion.Goal
            (Nothing' Adv)      -- Motion.Source
            (Nothing' NP)       -- Motion.Theme
            go_V_Motion
          ).vp
        )
        (Just NP p.name)        -- Desiring.Experiencer
        want_VV_Desiring
      in mkCl cl.np cl.vp ;

-- miscellaneous

    QWhatName p = mkQS (mkQCl whatSg_IP p.name (mkV2 (mkV "heter"))) ;
    QWhatAge p = mkQS (mkQCl (ICompAP (mkAP L.old_A)) p.name) ;
    HowMuchCost item = mkQS (mkQCl how8much_IAdv (mkCl item (mkV "kosta"))) ;
    ItCost item price = mkCl item (mkV2 (mkV "kosta")) price ;

    PropOpen p = mkCl p.name open_A ;
    PropClosed p = mkCl p.name closed_A ;
    PropOpenDate p d = mkCl p.name (mkVP (mkVP open_A) d) ;
    PropClosedDate p d = mkCl p.name (mkVP (mkVP closed_A) d) ;
    PropOpenDay p d = mkCl p.name (mkVP (mkVP open_A) d.habitual) ;
    PropClosedDay p d = mkCl p.name (mkVP (mkVP closed_A) d.habitual) ;

-- Building phrases from strings is complicated: the solution is to use
-- mkText : Text -> Text -> Text ;

    PSeeYouDate d = mkText (lin Text (ss ("vi ses"))) (mkPhrase (mkUtt d)) ;
    PSeeYouPlace p = mkText (lin Text (ss ("vi ses"))) (mkPhrase (mkUtt p.at)) ;
    PSeeYouPlaceDate p d =
      mkText (lin Text (ss ("vi ses")))
        (mkText (mkPhrase (mkUtt p.at)) (mkPhrase (mkUtt d))) ;

-- Relations are expressed as "my wife" or "my son's wife", as defined by $xOf$
-- below. Languages without productive genitives must use an equivalent of
-- "the wife of my son" for non-pronouns.

    Wife = xOf sing (mkN "fru" "fruar") ;
    Husband = xOf sing L.man_N ;
    Son = xOf sing (mkN "son" "s�ner") ;
    Daughter = xOf sing (mkN "dotter" "d�ttrar") ;
    Children = xOf plur L.child_N ;

-- week days

    Monday = mkDay "m�ndag" ;
    Tuesday = mkDay "tisdag" ;
    Wednesday = mkDay "onsdag" ;
    Thursday = mkDay "torsdag" ;
    Friday = mkDay "fredag" ;
    Saturday = mkDay "l�rdag" ;
    Sunday = mkDay "s�ndag" ;

    Tomorrow = ParadigmsSwe.mkAdv "imorgon" ;

-- transports

    HowFar place =
      mkQS (mkQCl far_IAdv (mkCl (mkVP place.to))) ;
    HowFarFrom x y =
      mkQS (mkQCl far_IAdv (mkCl (mkVP (mkVP y.to)
                    (SyntaxSwe.mkAdv from_Prep x.name)))) ;
    HowFarFromBy x y t =
      mkQS (mkQCl far_IAdv (mkCl (mkVP (mkVP (mkVP y.to)
                    (SyntaxSwe.mkAdv from_Prep x.name)) t))) ;
    HowFarBy place t =
      mkQS (mkQCl far_IAdv (mkCl (mkVP (mkVP place.to) t))) ;

    WhichTranspPlace trans place =
      mkQS (mkQCl (mkIP which_IDet trans.name) (mkVP (mkVP L.go_V) place.to)) ;

    IsTranspPlace trans place =
      mkQS (mkQCl (mkCl (mkCN trans.name place.to))) ;

-- modifiers of places

    TheBest = mkSuperl L.good_A ;
    TheClosest = mkSuperl L.near_A ;
    TheCheapest = mkSuperl (mkA "billig") ;
    TheMostExpensive = mkSuperl (mkA "dyr") ;
    TheMostPopular = mkSuperl (mkA "popul�r") ;
    TheWorst = mkSuperl L.bad_A ;

    SuperlPlace sup p = placeNP sup p ;

  oper
    mkNat : Str -> Str -> NPNationality = \nat,co ->
      mkNPNationality (mkNP (mkPN (nat + "a"))) (mkNP (mkPN co)) (mkA nat) ;

    mkDay : Str -> {name : NP ; point : Adv ; habitual : Adv} = \d ->
      let day = mkNP (mkPN d) in
      mkNPDay day (SyntaxSwe.mkAdv on_Prep day)
        (SyntaxSwe.mkAdv on_Prep (mkNP a_Quant plNum (mkCN (mkN d)))) ;

    mkPlace : N -> Str -> {name : CN ; at : Prep ; to : Prep ; isPl : Bool} = \p,i ->
      mkCNPlace (mkCN p) (mkPrep i) to_Prep ;
    mkPlace2 : N -> Str -> Str -> {name : CN ; at : Prep ; to : Prep ; isPl : Bool} =
      \p,i,t -> mkCNPlace (mkCN p) (mkPrep i) (mkPrep t) ;

    open_A = mkA "�ppen" "�ppet" ;
    closed_A = mkA "st�ngd" "st�ngt" ;

    xOf : GNumber -> N -> NPPerson -> NPPerson = \n,x,p ->
      relativePerson n (mkCN x) (\a,b,c -> mkNP (GenNP b) a c) p ;

    mkTransport : N -> {name : CN ; by : Adv} = \n -> {
      name = mkCN n ;
      by = SyntaxSwe.mkAdv with_Prep (mkNP n)
      } ;

    mkSuperl : A -> Det = \a -> mkDet the_Art (mkOrd a) ;

    far_IAdv = ExtraSwe.IAdvAdv L.far_Adv ;

--------------------------------------------------
-- New 30/11/2011 AR
--------------------------------------------------

  lin
    Thai = mkNPNationality (mkNP (mkPN "thai")) (mkNP (mkPN "Thailand")) (mkA "thail�ndsk") ;
    Baht = mkCN (mkN "baht" "baht") ;

    Rice = mkCN (mkN "ris" "ris") ;
    Pork = mkCN (mkN "fl�sk" "fl�sk") ;
    Beef = mkCN (mkN "n�tk�tt" "n�tk�tt") ;
    Egg = mkCN L.egg_N ;
    Noodles = mkCN (mkN "nudel" "nudlar") ;
    Shrimps = mkCN (mkN "r�ka") ;
    Chili = mkCN (mkN "chili" "chilier") ;
    Garlic = mkCN (mkN "vitl�k") ;
    Durian = mkCN (mkN "durian" "durianer") ;
    Mango = mkCN (mkN "mango" "mangoer") ;
    Pineapple = mkCN (mkN "ananas" "ananaser") ;
    Coke = mkCN (mkN "kola") ;
    IceCream = mkCN (mkN "glass") ;
    Salad = mkCN (mkN "sallad" "sallader") ;
    OrangeJuice = mkCN (mkN "apelsinjuice" "apelsinjuicer") ;
    Lemonade = mkCN (mkN "l�sk") ;
    Beach = mkPlace (mkN "badstrand" "badstr�nder") "p�" ;

    ItsRaining = mkCl (mkVP L.rain_V0) ;
    ItsCold = mkCl (mkVP L.cold_A) ;
    ItsWarm = mkCl (mkVP L.warm_A) ;
    ItsWindy = mkCl (mkVP (mkV "bl�ser")) ;
    SunShine = mkCl (mkNP the_Det L.sun_N) (skina_V) ;

    Smoke = mkVP (mkV "r�ker") ;

    ADoctor = mkProfession (mkN "l�kare" "l�kare") ;
    AProfessor = mkProfession (mkN "professor" "professorer") ;
    ALawyer = mkProfession (mkN "jurist" "jurister") ;
    AEngineer =  mkProfession (mkN "ingenj�r" "ingenj�rer") ;
    ATeacher = mkProfession (mkN "l�rare" "l�rare") ;
    ACook = mkProfession (mkN "kock") ;
    AStudent = mkProfession (mkN "student" "srudenter") ;
    ABusinessman = mkProfession (mkN "aff�rsman" "aff�rsmannen" "aff�rsm�n" "aff�rsm�nnen") ;

  oper
    mkProfession : N -> NPPerson -> Cl = \n,p -> mkCl p.name (mkVP (CompBareCN (mkCN n))) ;

}
