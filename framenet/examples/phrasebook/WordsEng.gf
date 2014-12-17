--2 Implementations of Words, with English as example

concrete WordsEng of Words = SentencesEng **
  open
    PatternsEng,          -- FrameNet API
    TargetsEng,           -- FrameNet API
    (T = TargetsEngCnc),  -- FrameNet API
    SyntaxEng,
    ParadigmsEng,
    (L = LexiconEng),
    (P = ParadigmsEng),
    IrregEng,
    ExtraEng,
    Prelude,
    Maybe                 -- from RGL; used with FrameNet API
  in {

  lin

-- Kinds; many of them are in the resource lexicon, others can be built by $mkN$.

    Apple = mkCN L.apple_N ;
    Beer = mkCN L.beer_N ;
    Bread = mkCN L.bread_N ;
    Cheese = mkCN (mkN "cheese") ;
    Chicken = mkCN (mkN "chicken") ;
    Coffee = mkCN (mkN "coffee") ;
    Fish = mkCN L.fish_N ;
    Meat = mkCN (mkN "meat") ;
    Milk = mkCN L.milk_N ;
    Pizza = mkCN (mkN "pizza") ;
    Salt = mkCN L.salt_N ;
    Tea = mkCN (mkN "tea") ;
    Water = mkCN L.water_N ;
    Wine = mkCN L.wine_N ;

-- Properties; many of them are in the resource lexicon, others can be built by $mkA$.

    Bad = L.bad_A ;
    Boring = mkA "boring" ;
    Cheap = mkA "cheap" ;
    Cold = L.cold_A ;
    Delicious = mkA "delicious" ;
    Expensive = mkA "expensive" ;
    Fresh = mkA "fresh" ;
    Good = L.good_A ;
    Suspect = mkA "suspect" ;
    Warm = L.warm_A ;

-- Places require different prepositions to express location; in some languages
-- also the directional preposition varies, but in English we use $to$, as
-- defined by $mkPlace$.

    Airport = mkPlace "airport" "at" ;
    AmusementPark = mkCompoundPlace "amusement" "park" "at" ;
    Bank = mkPlace "bank" "at" ;
    Bar = mkPlace "bar" "in" ;
    Cafeteria = mkPlace "canteen" "in" ;
    Center = mkPlace "center" "in" ;
    Cinema = mkPlace "cinema" "at" ;
    Church = mkPlace "church" "in" ;
    Disco = mkPlace "disco" "at" ;
    Hospital = mkPlace "hospital" "in" ;
    Hotel = mkPlace "hotel" "in" ;
    Museum = mkPlace "museum" "at" ;
    Park = mkPlace "park" "in" ;
    Parking = mkCompoundPlace "car" "park" "in" ;
    Pharmacy = mkPlace "pharmacy" "at" ;
    PostOffice = mkCompoundPlace "post" "office" "at" ;
    Pub = mkPlace "pub" "at" ;
    Restaurant = mkPlace "restaurant" "in" ;
    School = mkPlace "school" "at" ;
    Shop = mkPlace "shop" "at" ;
    Station = mkPlace "station" "at" ;
    Supermarket = mkPlace "supermarket" "at" ;
    Theatre = mkPlace "theatre" "at" ;
    Toilet = mkPlace "toilet" "in" ;
    University = mkPlace "university" "at" ;
    Zoo = mkPlace "zoo" "at" ;

    CitRestaurant cit = mkCNPlace (mkCN cit (mkN "restaurant")) in_Prep to_Prep ;


-- Currencies; $crown$ is ambiguous between Danish and Swedish crowns.

    DanishCrown = mkCN (mkA "Danish") (mkN "crown") | mkCN (mkN "crown") ;
    Dollar = mkCN (mkN "dollar") ;
    Euro = mkCN (mkN "euro" "euros") ; -- to prevent euroes
    Lei = mkCN (mkN "leu" "lei") ;
    Leva = mkCN (mkN "lev") ;
    NorwegianCrown = mkCN (mkA "Norwegian") (mkN "crown") | mkCN (mkN "crown") ;
    Pound = mkCN (mkN "pound") ;
    Rouble = mkCN (mkN "rouble") ;
    SwedishCrown = mkCN (mkA "Swedish") (mkN "crown") | mkCN (mkN "crown") ;
    Zloty = mkCN (mkN "zloty" "zloty") ;

-- Nationalities

    Belgian = mkA "Belgian" ;
    Belgium = mkNP (mkPN "Belgium") ;
    Bulgarian = mkNat "Bulgarian" "Bulgaria" ;
    Catalan = mkNPNationality (mkNP (mkPN "Catalan")) (mkNP (mkPN "Catalonia")) (mkA "Catalonian") ;
    Danish = mkNat "Danish" "Denmark" ;
    Dutch =  mkNPNationality (mkNP (mkPN "Dutch")) (mkNP the_Quant (mkN "Netherlands")) (mkA "Dutch") ;
    English = mkNat "English" "England" ;
    Finnish = mkNat "Finnish" "Finland" ;
    Flemish = mkNP (mkPN "Flemish") ;
    French = mkNat "French" "France" ;
    German = mkNat "German" "Germany" ;
    Italian = mkNat "Italian" "Italy" ;
    Norwegian = mkNat "Norwegian" "Norway" ;
    Polish = mkNat "Polish" "Poland" ;
    Romanian = mkNat "Romanian" "Romania" ;
    Russian = mkNat "Russian" "Russia" ;
    Spanish = mkNat "Spanish" "Spain" ;
    Swedish = mkNat "Swedish" "Sweden" ;

-- Means of transportation

   Bike = mkTransport L.bike_N ;
   Bus = mkTransport (mkN "bus") ;
   Car = mkTransport L.car_N ;
   Ferry = mkTransport (mkN "ferry") ;
   Plane = mkTransport L.airplane_N ;
   Subway = mkTransport (mkN "subway") ;
   Taxi = mkTransport (mkN "taxi") ;
   Train = mkTransport (mkN "train") ;
   Tram = mkTransport (mkN "tram") ;

   ByFoot = P.mkAdv "by foot" ;

-- Actions: the predication patterns are very often language-dependent.

    AHasAge p num = mkCl p.name (mkNP (mkNP num L.year_N) (ParadigmsEng.mkAdv "old"));

    --AHasChildren p num = mkCl p.name have_V2 (mkNP num L.child_N) ;
    -- FrameNet API:
    AHasChildren p num = let cl : Clause =
      Possession_V2 (Just NP p.name) (Just NP (mkNP num L.child_N)) have_V2_Possession
        in mkCl cl.np cl.vp ;

    --AHasRoom p num = mkCl p.name have_V2
    --  (mkNP (mkNP a_Det (mkN "room")) (SyntaxEng.mkAdv for_Prep (mkNP num (mkN "person")))) ;
    -- FrameNet API:
    AHasRoom p num = let cl : Clause =
      Possession_V2
        (Just NP p.name)
        (Just NP (mkNP (mkNP a_Det (mkN "room")) (SyntaxEng.mkAdv for_Prep (mkNP num (mkN "person")))))
        have_V2_Possession
      in mkCl cl.np cl.vp ;

    --AHasTable p num = mkCl p.name have_V2
    --  (mkNP (mkNP a_Det (mkN "table")) (SyntaxEng.mkAdv for_Prep (mkNP num (mkN "person")))) ;
    -- FrameNet API:
    AHasTable p num = let cl : Clause =
      Possession_V2
        (Just NP p.name)
        (Just NP (mkNP (mkNP a_Det (mkN "table")) (SyntaxEng.mkAdv for_Prep (mkNP num (mkN "person")))))
        have_V2_Possession
      in mkCl cl.np cl.vp ;

    AHasName p name = mkCl (nameOf p) name ;
    AHungry p = mkCl p.name (mkA "hungry") ;
    AIll p = mkCl p.name (mkA "ill") ;
    AKnow p = mkCl p.name IrregEng.know_V ;

    --ALike p item = mkCl p.name (mkV2 (mkV "like")) item ;
    -- FrameNet API:
    ALike p item = let cl : Clause =
      Experiencer_focus_V2 (Just NP item) (Just NP p.name) T.like_V2_Experiencer_focus
        in mkCl cl.np cl.vp ;

    --ALive p co = mkCl p.name (mkVP (mkVP (mkV "live")) (SyntaxEng.mkAdv in_Prep co)) ;
    -- FrameNet API:
    ALive p co = let cl : Clause =
      Residence_V (Just Adv (SyntaxEng.mkAdv in_Prep co)) (Just NP p.name) live_V_Residence
        in mkCl cl.np cl.vp ;

    --ALove p q = mkCl p.name (mkV2 (mkV "love")) q.name ;
    -- FrameNet API:
    ALove p q = let cl : Clause =
      Experiencer_focus_V2 (Just NP q.name) (Just NP p.name) love_V2_Experiencer_focus
        in mkCl cl.np cl.vp ;

    AMarried p = mkCl p.name (mkA "married") ;
    AReady p = mkCl p.name (mkA "ready") ;
    AScared p = mkCl p.name (mkA "scared") ;

    --ASpeak p lang = mkCl p.name (mkV2 IrregEng.speak_V) lang ;
    -- FrameNet API:
    ASpeak p lang = let cl : Clause =
      Text_creation_V2 (Just NP p.name) (Just NP lang) (mkV2 speak_V_Statement)
        in mkCl cl.np cl.vp ;

    AThirsty p = mkCl p.name (mkA "thirsty") ;
    ATired p = mkCl p.name (mkA "tired") ;
    AUnderstand p = mkCl p.name IrregEng.understand_V ;

    --AWant p obj = mkCl p.name (mkV2 (mkV "want")) obj ;
    -- FrameNet API:
    AWant p obj = let cl : Clause =
      Desiring_V2 (Just NP p.name) (Just NP obj) T.want_V2_Desiring
        in mkCl cl.np cl.vp ;

    --AWantGo p place = mkCl p.name want_VV (mkVP (mkVP IrregEng.go_V) place.to) ;
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

    QWhatName p = mkQS (mkQCl (mkIComp whatSg_IP) (nameOf p)) ;
--    QWhatName p = mkQS (mkQCl whatSg_IP (mkVP (nameOf p))) ;
    QWhatAge p = mkQS (mkQCl (ICompAP (mkAP L.old_A)) p.name) ;
    HowMuchCost item = mkQS (mkQCl how8much_IAdv (mkCl item IrregEng.cost_V)) ;
    ItCost item price = mkCl item (mkV2 IrregEng.cost_V) price ;

    PropOpen p = mkCl p.name open_Adv ;
    PropClosed p = mkCl p.name closed_Adv ;
    PropOpenDate p d = mkCl p.name (mkVP (mkVP open_Adv) d) ;
    PropClosedDate p d = mkCl p.name (mkVP (mkVP closed_Adv) d) ;
    PropOpenDay p d = mkCl p.name (mkVP (mkVP open_Adv) d.habitual) ;
    PropClosedDay p d = mkCl p.name (mkVP (mkVP closed_Adv) d.habitual) ;

-- Building phrases from strings is complicated: the solution is to use
-- mkText : Text -> Text -> Text ;

    PSeeYouDate d = mkText (lin Text (ss ("see you"))) (mkPhrase (mkUtt d)) ;
    PSeeYouPlace p = mkText (lin Text (ss ("see you"))) (mkPhrase (mkUtt p.at)) ;
    PSeeYouPlaceDate p d =
      mkText (lin Text (ss ("see you")))
        (mkText (mkPhrase (mkUtt p.at)) (mkPhrase (mkUtt d))) ;

-- Relations are expressed as "my wife" or "my son's wife", as defined by $xOf$
-- below. Languages without productive genitives must use an equivalent of
-- "the wife of my son" for non-pronouns.

    Wife = xOf sing (mkN "wife") ;
    Husband = xOf sing (mkN "husband") ;
    Son = xOf sing (mkN "son") ;
    Daughter = xOf sing (mkN "daughter") ;
    Children = xOf plur L.child_N ;

-- week days

    Monday = mkDay "Monday" ;
    Tuesday = mkDay "Tuesday" ;
    Wednesday = mkDay "Wednesday" ;
    Thursday = mkDay "Thursday" ;
    Friday = mkDay "Friday" ;
    Saturday = mkDay "Saturday" ;
    Sunday = mkDay "Sunday" ;

    Tomorrow = P.mkAdv "tomorrow" ;

-- modifiers of places

    TheBest = mkSuperl L.good_A ;
    TheClosest = mkSuperl L.near_A ;
    TheCheapest = mkSuperl (mkA "cheap") ;
    TheMostExpensive = mkSuperl (mkA "expensive") ;
    TheMostPopular = mkSuperl (mkA "popular") ;
    TheWorst = mkSuperl L.bad_A ;

    SuperlPlace sup p = placeNP sup p ;


-- transports

    HowFar place = mkQS (mkQCl far_IAdv place.name) ;
    HowFarFrom x y =
      mkQS (mkQCl far_IAdv (mkCl y.name (SyntaxEng.mkAdv from_Prep x.name))) ;
    HowFarFromBy x y t =
      mkQS (mkQCl far_IAdv (mkCl y.name (SyntaxEng.mkAdv from_Prep (mkNP x.name t)))) ;
    HowFarBy y t = mkQS (mkQCl far_IAdv (mkCl y.name t)) ;

    WhichTranspPlace trans place =
      mkQS (mkQCl (mkIP which_IDet trans.name) (mkVP (mkVP L.go_V) place.to)) ;

    IsTranspPlace trans place =
      mkQS (mkQCl (mkCl (mkCN trans.name place.to))) ;



-- auxiliaries

  oper

    mkNat : Str -> Str -> NPNationality = \nat,co ->
      mkNPNationality (mkNP (mkPN nat)) (mkNP (mkPN co)) (mkA nat) ;

    mkDay : Str -> {name : NP ; point : Adv ; habitual : Adv} = \d ->
      let day = mkNP (mkPN d) in
      mkNPDay day (SyntaxEng.mkAdv on_Prep day)
        (SyntaxEng.mkAdv on_Prep (mkNP a_Quant plNum (mkCN (mkN d)))) ;

    mkCompoundPlace : Str -> Str -> Str -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \comp, p, i ->
     mkCNPlace (mkCN (P.mkN comp (mkN p))) (P.mkPrep i) to_Prep ;

    mkPlace : Str -> Str -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \p,i ->
      mkCNPlace (mkCN (mkN p)) (P.mkPrep i) to_Prep ;

    open_Adv = P.mkAdv "open" ;
    closed_Adv = P.mkAdv "closed" ;

    xOf : GNumber -> N -> NPPerson -> NPPerson = \n,x,p ->
      relativePerson n (mkCN x) (\a,b,c -> mkNP (GenNP b) a c) p ;

    nameOf : NPPerson -> NP = \p -> (xOf sing (mkN "name") p).name ;


    mkTransport : N -> {name : CN ; by : Adv} = \n -> {
      name = mkCN n ;
      by = SyntaxEng.mkAdv by8means_Prep (mkNP n)
      } ;

    mkSuperl : A -> Det = \a -> SyntaxEng.mkDet the_Art (SyntaxEng.mkOrd a) ;

   far_IAdv = ExtraEng.IAdvAdv (ss "far") ;

--------------------------------------------------
-- New 30/11/2011 AR
--------------------------------------------------

  lin
    Thai = mkNat "Thai" "Thailand" ;
    Baht = mkCN (mkN "baht" "baht") ;

    Rice = mkCN (mkN "rice") ;
    Pork = mkCN (mkN "pork") ;
    Beef = mkCN (mkN "beef") ;
    Egg = mkCN L.egg_N ;
    Noodles = mkCN (mkN "noodle") ;
    Shrimps = mkCN (mkN "shrimp") ;
    Chili = mkCN (mkN "chili") ;
    Garlic = mkCN (mkN "garlic") ;
    Durian = mkCN (mkN "durian") ;
    Mango = mkCN (mkN "mango") ;
    Pineapple = mkCN (mkN "pineapple") ;
    Coke = mkCN (mkN "coke") ;
    IceCream = mkCN (mkN "ice cream") ;
    Salad = mkCN (mkN "salad") ;
    OrangeJuice = mkCN (mkN "orange juice") ;
    Lemonade = mkCN (mkN "lemonade") ;

    Beach = mkPlace "beach" "on" ;

    ItsRaining = mkCl (progressiveVP (mkVP L.rain_V0)) ;
    ItsCold = mkCl (mkVP L.cold_A) ;
    ItsWarm = mkCl (mkVP L.warm_A) ;
    ItsWindy = mkCl (mkVP (P.mkA "windy")) ;
    SunShine = mkCl (mkNP the_Det L.sun_N) (progressiveVP (mkVP shine_V)) ;

    Smoke = mkVP (P.mkV "smoke") ;

    ADoctor = mkProfession (mkN "doctor") ;
    AProfessor = mkProfession (mkN "professor") ;
    ALawyer = mkProfession (mkN "lawyer") ;
    AEngineer =  mkProfession (mkN "engineer") ;
    ATeacher = mkProfession (mkN "teacher") ;
    ACook = mkProfession (mkN "cook") ;
    AStudent = mkProfession (mkN "student") ;
    ABusinessman = mkProfession (mkN "businessman" "businessmen") ;

  oper
    mkProfession : N -> NPPerson -> Cl = \n,p -> mkCl p.name n ;
}
