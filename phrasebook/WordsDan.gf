-- (c) 2009 Aarne Ranta under LGPL
--# -coding=latin1

concrete WordsDan of Words = SentencesDan ** 
    open SyntaxDan, ParadigmsDan, IrregDan, (L = LexiconDan), ExtraDan, StructuralDan, Prelude in {

  lin

-- kinds of food

    Apple = mkCN L.apple_N ;
    Beer = mkCN L.beer_N ;
    Bread = mkCN L.bread_N ;
    Cheese = mkCN (mkN "ost" "osten" "oste" "ostene") ;
    Chicken = mkCN (mkN "kylling" "kyllingen" "kyllinger" "kyllingerne") ;
    Coffee = mkCN (mkN "kaffe" "kaffen" "kaffe" "kaffe") ; -- den kaffe 
    Fish = mkCN L.fish_N ;
    Meat = mkCN (mkN "k�d" "k�det" "k�d" "k�det") ;
    Milk = mkCN L.milk_N ;
    Pizza = mkCN (mkN "pizza" "pizzaen" "pizzaer" "pizzaerne") ; -- den pizza
    Salt = mkCN L.salt_N ;
    Tea = mkCN (mkN "te" "teen" "teer" "teerne") ; -- den te 
    Water = mkCN L.water_N ;
    Wine = mkCN L.wine_N ;

-- properties

    Bad = L.bad_A ;
    Cheap = mkA "billig" ;
    Boring = mkA "kedelig" ;
    Cold = L.cold_A ;
    Delicious = mkA "l�kker" ;
    Expensive = mkA "dyr" ; -- or dyrt
    Fresh = mkA "frisk" ;
    Good = L.good_A ;
    Suspect = mkA "mist�nkelig" ;
    Warm = L.warm_A ;

-- places


    Airport = mkPlace (mkN "lufthavnen" "lufthavnen" "lufthavne" "lufthavnene") "i" ;
    AmusementPark = mkPlace (mkN "forlystelsespark" "forlystelsesparken" "forlystelsesparker" "forlystelsesparker") "i" ;
    Bank = mkPlace (mkN "bank" "banken" "banke" "bankene") "i" ;
    Bar = mkPlace (mkN "bar" "baren" "barer" "barerne") "i" ;
    Cafeteria = mkPlace (mkN "cafeteria" "cafeteriet" "cafeterier" "cafeterierne") "i" ;
    Center = mkPlace (mkN "centrum" "centrum" "centrummer" "centrummerne")  "i" ; -- all centrum ?
    Cinema = mkPlace (mkN "biograf" "biografen" "biografer" "biograferne") "i" ;
    Church = mkPlace (mkN "kirke" "kirken" "kirker" "kirkerne") "i" ; 
    Disco = mkPlace (mkN "diskotek" "diskoteket" "diskoteker" "diskotekerne") "p�" ;
    Hospital = mkPlace (mkN "hospital" "hospitalet" "hospitaler" "hospitalerne") "p�" ;

    Hotel = mkPlace (mkN "hotel" "hotellet" "hoteller" "hotellerne") "p�" ;
    Museum = mkPlace (mkN "museum" "museet" "museer" "museerne") "p�" ;
    Park = mkPlace (mkN "park" "parken" "parker" "parkerne") "i" ;
    Parking = mkPlace (mkN "parkeringsplads" "parkeringspladsen" "parkeringspladser" "parkeringspladserne") "p�" ;
    Pharmacy = mkPlace (mkN "apotek" "apoteket" "apoteker" "apotekerne") "p�" ;
    PostOffice = mkPlace (mkN "posthus" "posthuset" "posthuse" "posthusene") "p�" ;
    Pub = mkPlace (mkN "pub" "pubben" "pubber" "pubber") "p�" ;
    Restaurant = mkPlace (mkN "restaurant" "restauranten" "restauranter" "restauranterne") "p�" ;
    School = mkPlace (mkN "skole" "skolen" "skoler" "skolerne") "i" ;
    Shop = mkPlace (mkN "butik" "butikken" "butikker" "butikkerne") "i" ;
    Station = mkPlace (mkN "station" "stationen" "stationer" "stationerne") "p�" ;
    Supermarket = mkPlace (mkN "supermarked" "supermarkedet" "supermarkeder" "supermarkederne") "i" ;
    Theatre = mkPlace (mkN "teater" "teatret" "teatre" "teatrene") "i" ;
    Toilet = mkPlace (mkN "toilet" "toilettet" "toiletter" "toiletterne") "p�" ;
    University = mkPlace (mkN "universitet" "universitetet" "universiteter" "universiteterne") "p�" ;
    Zoo = mkCNPlace (mkCN (mkA "zoologisk") (mkN "have")) in_Prep to_Prep ;

    CitRestaurant cit = mkCNPlace (mkCN cit (mkN "restaurant")) (mkPrep "p�") to_Prep ;

-- currencies

    DanishCrown = mkCN (mkA "dansk") (mkN "krone" "kronen" "kroner" "kronerne") | mkCN (mkN "krone" "kronen" "kroner" "kronerne") ;
    Dollar = mkCN (mkN "dollar" "dollaren" "dollar" "dollar") ; -- den dollar 
    Euro = mkCN (mkN "euro" "euroen" "euro" "euroerne") ; -- den euro 
    Lei = mkCN (mkN "leu" "leu" "lei" "lei") ; -- det leis ?
    Leva = mkCN (mkN "lev" "lev" "leva" "leva") ; -- det leva ?
    NorwegianCrown = mkCN (mkA "norsk") (mkN "krone" "kronen" "kroner" "kronerne") | mkCN (mkN "krone" "kronen" "kroner" "kronerne") ;
    Pound = mkCN (mkN "pund" "pundet" "pund" "pundene") ; -- det pund 
    Rouble = mkCN (mkN "rubel" "rublen" "rubler" "rublerne") ; -- den rubel 
    SwedishCrown = mkCN (mkA "svensk") (mkN "krone" "kronen" "kroner" "kronerne") | mkCN (mkN "krone" "kronen" "kroner" "kronerne") ;
    Zloty = mkCN (mkN "zloty" "zloty" "zloty" "zloty") ; -- det zloty ?

-- nationalities


    Belgian = mkA "belgisk" ;
    Belgium = mkNP (mkPN "Belgien") ;
    Bulgarian = mkNat "bulgarsk" "Bulgarien" ;
    Catalan = mkNPNationality (mkNP (mkPN "catalansk")) (mkNP (mkPN "Catalonien")) (mkA "catalonsk") ;
    Danish = mkNat "dansk" "Danmark" ;
    Dutch =  mkNat "hollandsk" "Holland" ;
    English = mkNat "engelsk" "England" ;
    Finnish = mkNat "finsk" "Finland" ;
    Flemish = mkNP (mkPN "flamsk") ;
    French = mkNat "fransk" "Frankrig" ; 
    German = mkNat "tysk" "Tyskland" ;
    Italian = mkNat "italiensk" "Italien" ;
    Norwegian = mkNat "norsk" "Norge" ;
    Polish = mkNat "polsk" "Polen" ;
    Romanian = mkNat "rum�nsk" "Rum�nien" ;
    Russian = mkNat "russisk" "Russland" ;
    Spanish = mkNat "spansk" "Spanien" ;
    Swedish = mkNat "svensk" "Sverige" ;



-- Means of transportation 

   Bike = mkTransport L.bike_N ;
   Bus = mkTransport (mkN "bus" "bussen" "busser" "busserne") ;
   Car = mkTransport L.car_N ;
   Ferry = mkTransport (mkN "f�rge" "f�rgen" "f�rger" "f�rgerne") ;
   Plane = mkTransport L.airplane_N ;
   Subway = mkTransport (mkN "undergrundsbane" "undergrundsbanen" "undergrundsbaner" "undergrundsbanerne") ;
   Taxi = mkTransport (mkN "taxa") ;
   Train = mkTransport (mkN "tog" "toget" "tog" "togene") ;
   Tram = mkTransport (mkN "sporvogn" "sporvognen" "sporvogne" "sporvognene") ;

   ByFoot = ParadigmsDan.mkAdv "til fods" ;




-- actions

    AHasAge p num = mkCl p.name (mkNP num L.year_N) ;
    AHasName p name = mkCl p.name (mkV2 (mkV "hedde")) name ;
    AHasChildren p num = mkCl p.name have_V2 (mkNP num L.child_N) ;
    AHasRoom p num = mkCl p.name have_V2 
      (mkNP (mkNP a_Det (mkN "v�relse" "v�relset" "v�relser" "v�relserne")) 
        (SyntaxDan.mkAdv to_Prep (mkNP num (mkN "person" "personen" "personer" "personerne")))) ;
    AHasTable p num = mkCl p.name have_V2 
      (mkNP (mkNP a_Det (mkN "bord")) 
        (SyntaxDan.mkAdv to_Prep (mkNP num (mkN "person" "personen" "personer" "personerne")))) ;
    AHungry p = mkCl p.name (mkA "sulten" "sultet" "sultne") ;
    AIll p = mkCl p.name (mkA "syg") ;
    AKnow p = mkCl p.name vide_V ; 
    ALike p item = mkCl p.name (mkV2 holde_V (mkPrep "af")) item ;
    ALive p co = mkCl p.name (mkVP (mkVP (mkV "bo")) (SyntaxDan.mkAdv in_Prep co)) ;
    ALove p q = mkCl p.name (dirV2 (regV "elske")) q.name ;
    AMarried p = mkCl p.name (mkA "gift") ;
    AReady p = mkCl p.name (mkA "f�rdig") ; 
    AScared p = mkCl p.name (mkA "bange") ;
    ASpeak p lang = mkCl p.name  (mkV2 (mkV "tale")) lang ;
    AThirsty p = mkCl p.name (mkA "t�rstig") ;
    ATired p = mkCl p.name (mkA "tr�t") ;
    AUnderstand p = mkCl p.name (irregV "forst�" "forstod" "forst�et") ;
    AWant p obj = mkCl p.name want_VV (mkVP have_V2 obj) ;
--    AWantGo p place = mkCl p.name want_VV (mkVP (mkVP L.go_V) place.to) ;
    AWantGo p place = mkCl p.name want_VV (mkVP (mkVP tage_V) place.to) ;

-- miscellaneous

    QWhatName p = mkQS (mkQCl whatSg_IP p.name (mkV2 hede_V)) ;
    QWhatAge p = mkQS (mkQCl (ICompAP (mkAP L.old_A)) p.name) ;
    HowMuchCost item = mkQS (mkQCl how8much_IAdv (mkCl item (mkV "koste"))) ; 
    ItCost item price = mkCl item (mkV2 (mkV "koste")) price ;

    PropOpen p = mkCl p.name (mkVP (mkVP have_V) open_Adv) ;
    PropClosed p = mkCl p.name (mkVP (mkVP have_V) closed_Adv) ;
    PropOpenDate p d = mkCl p.name (mkVP (mkVP (mkVP have_V) open_Adv) d) ; 
    PropClosedDate p d = mkCl p.name (mkVP (mkVP (mkVP have_V) closed_Adv) d) ; 
    PropOpenDay p d = mkCl p.name (mkVP (mkVP (mkVP have_V) open_Adv) d.habitual) ; 
    PropClosedDay p d = mkCl p.name (mkVP (mkVP (mkVP have_V) closed_Adv) d.habitual) ; 

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

    Wife = xOf sing (mkN "kone" "konen" "koner" "konerne") ;
    Husband = xOf sing L.man_N ;
    Son = xOf sing (mkN "s�n" "s�nnen" "s�nner" "s�nnerne") ;
    Daughter = xOf sing (mkN "datter" "datteren" "d�tre" "d�trene") ;
    Children = xOf plur L.child_N ;

-- week days

    Monday = mkDay "mandag" ;
    Tuesday = mkDay "tirsdag" ;
    Wednesday = mkDay "onsdag" ;
    Thursday = mkDay "torsdag" ;
    Friday = mkDay "fredag" ;
    Saturday = mkDay "l�rdag" ;
    Sunday = mkDay "s�ndag" ;

    Tomorrow = ParadigmsDan.mkAdv "i morgen" ;


-- modifiers of places

    TheBest = mkSuperl L.good_A ;
    TheClosest = mkSuperl L.near_A ; 
    TheCheapest = mkSuperl (mkA "billig") ;
    TheMostExpensive = mkSuperl (mkA "dyr") ;
    TheMostPopular = mkSuperl (mkA "popul�r") ;
    TheWorst = mkSuperl L.bad_A ;

    SuperlPlace sup p = placeNP sup p ;




-- transports

    HowFar place = 
      mkQS (mkQCl long_IAdv (mkCl (mkVP (SyntaxDan.mkAdv to_Prep place.name)))) ;
    HowFarFrom place x = 
      mkQS (mkQCl long_IAdv (mkCl place.name (SyntaxDan.mkAdv from_Prep x.name))) ;
    HowFarFromBy x y t = 
      mkQS (mkQCl long_IAdv (mkCl y.name (SyntaxDan.mkAdv from_Prep (mkNP x.name t)))) ;
    HowFarBy y t = 
      mkQS (mkQCl long_IAdv (mkCl y.name t)) ;
 -- not sure !
    WhichTranspPlace trans place = 
      mkQS (mkQCl (mkIP which_IDet trans.name) (mkVP (mkVP L.go_V) place.to)) ;

    IsTranspPlace trans place =
      mkQS (mkQCl (mkCl (mkCN trans.name place.to))) ;


  oper
    mkNat : Str -> Str -> NPNationality = \nat,co -> 
      mkNPNationality (mkNP (mkPN nat)) (mkNP (mkPN co)) (mkA nat) ;
-- don't add the "a"
   mkDay : Str -> {name : NP ; point : Adv ; habitual : Adv} = \d ->
      let day = mkNP (mkPN d) in 
      mkNPDay day (SyntaxDan.mkAdv on_Prep day) 
        (SyntaxDan.mkAdv on_Prep (mkNP a_Quant plNum (mkCN (mkN d)))) ;

    mkPlace : N -> Str -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \p,i -> 
    mkCNPlace (mkCN p) (mkPrep i) to_Prep ;

    open_Adv = ParadigmsDan.mkAdv "�bent" ;
    closed_Adv = ParadigmsDan.mkAdv "lukket" ;

    xOf : GNumber -> N -> NPPerson -> NPPerson = \n,x,p -> 
      relativePerson n (mkCN x) (\a,b,c -> mkNP (GenNP b) a c) p ;

    mkSuperl : A -> Det = \a -> mkDet the_Art (mkOrd a) ;

    mkTransport : N -> {name : CN ; by : Adv} = \n -> {
      name = mkCN n ; 
      by = SyntaxDan.mkAdv by8means_Prep (mkNP n)
      } ;

    far_IAdv = ExtraDan.IAdvAdv L.far_Adv ;
    long_IAdv : IAdv = ss "hvor langt" ** {lock_IAdv = <>};
    how8much_IAdv : IAdv = ss "hvad" ** {lock_IAdv = <>};
}
