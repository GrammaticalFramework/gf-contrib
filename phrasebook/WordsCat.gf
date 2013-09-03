-- (c) 2010 Aarne Ranta and Olga Caprotti under LGPL

concrete WordsCat of Words = SentencesCat ** open
  SyntaxCat,
  BeschCat,
  (E = ExtraCat),
  (L = LexiconCat),
  (P = ParadigmsCat), 
  (S = SyntaxCat),
  ParadigmsCat,
  Prelude in {

lin

-- kinds

    Apple = mkCN L.apple_N ;
    Beer = mkCN L.beer_N ;
    Bread = mkCN L.bread_N ;
    Cheese = mkCN (mkN "formatge") ;
    Chicken = mkCN (mkN "pollastre") ;
    Coffee = mkCN (mkN "caf�") ;
    Fish = mkCN L.fish_N ;
    Meat = mkCN (mkN "carn" feminine) ;
    Milk = mkCN L.milk_N ;
    Pizza = mkCN (mkN "pizza") ;
    Salt = mkCN L.salt_N ;
    Tea = mkCN (mkN "te") ;
    Water = mkCN L.water_N ;
    Wine = mkCN L.wine_N ;

-- properties

    Bad = L.bad_A ;
    Boring = mkA "avorrit" ;
    Cheap = cheap_A ; 
    Cold = L.cold_A ;
    Delicious = mkA "delici�s" ;
    Expensive = expensive_A ; 
    Fresh = mkA "fresc" ;
    Good = L.good_A ;
    Suspect = mkA "sospit�s"  ;
    Warm = mkA "calent" ;

-- places

lin
    Airport = mkPlace (mkN "aeroport") ;
    AmusementPark = mkPlace (mkN "parc d' atraccions") ;
    Bank = mkPlace (mkN "banc") ;
    Bar = mkPlace (mkN "bar") ;
    Cafeteria = mkPlace (mkN "cafeteria") ;
    Center = mkPlace (mkN "centre") ;
    Cinema = mkPlace (mkN "cinema" masculine) ;
    Church = mkPlace (mkN "esgl�sia")  ;
    Disco = mkPlace (mkN "discoteca") ;
    Hospital = mkPlace (mkN "hospital")  ;
    Hotel = mkPlace (mkN "hotel")  ;
    Museum = mkPlace (mkN "museu")  ;
    Park = mkPlace (mkN "parc") ;
    Parking = mkPlace (mkN "aparcament" masculine) ;
    Pharmacy = mkPlace (mkN "farm�cia") ;
    PostOffice = mkPlace (mkN "oficina de correus" feminine) ;
    Pub = mkPlace (mkN "pub" masculine) ;
    Restaurant = mkPlace (mkN "restaurant") ;
    School = mkPlace (mkN "escola") ;
    Shop = mkPlace (mkN "tenda") ;
    Station = mkPlace (mkN "estaci�" feminine)  ;
    Supermarket = mkPlace (mkN "supermercat" masculine) ;
    Theatre = mkPlace (mkN "teatre")  ;
    Toilet = mkPlace (mkN "lavabo")  ;
    University = mkPlace (mkN "universitat" feminine) ;
    Zoo = mkPlace (mkN "zoo" masculine) ;

    CitRestaurant cit = mkCNPlace (mkCN cit (mkN "restaurant")) dative dative ;

-- currencies
oper corona : A -> CN = \adj -> 
	  let corona_N = (mkN "corona")
	  in mkCN adj corona_N | mkCN corona_N ;
lin
    DanishCrown = corona (mkA "dan�s" "danesa" "danesos" "daneses" "a la danesa") ; 
    Dollar = mkCN (mkN "d�lar") ;
  	Euro = mkCN (mkN "euro" masculine) ;
    Lei = mkCN (mkN "leu" "lei" masculine) ;
	Leva = mkCN (mkN "lev" "lev" masculine) ; 
	NorwegianCrown = corona (mkA "noruec" "noruega" "noruecs" "noruegues" "a la noruega") ;
	Pound = mkCN (mkN "lliura") ;
	Rouble = mkCN (mkN "ruble") ;
    SwedishCrown = corona (mkA "suec" "sueca" "suecs" "sueques" "a la sueca") ;
	Zloty = mkCN (mkN "zloty" "zloty" masculine) ;

-- nationalities

    Belgian = mkA "belga" "belga" "belgues" "belgues" "a la Belga" ;
    Belgium = mkNP (mkPN "B�lgica") ;
    Bulgarian = mkNat3 "b�lgar" "b�lgara" "b�lgars" "b�lgueres" "Bulg�ria" ;
    Catalan = mkNat5 "catal" "Catalunya" ;
    Danish = mkNat4 "dan" "Dinamarca" ; 
    Dutch = mkNat4 "holand" "Holanda" ; 
    English = mkNat4 "angl" "Anglaterra" ;
    Finnish = mkNat4 "fin" "Finl�ndia" ;
    Flemish = mkNP (mkPN "flamenc") ;
    French = mkNat4 "franc" "Fran�a" ;
    German = mkNat3 "alemany" "alemanya" "alemanys" "alemanyes" "Alemania" ;
    Italian = mkNat5 "itali" "It�lia" ;
    Norwegian = mkNat3 "noruec" "noruega" "noruecs" "noruegues" "Noruega" ;
    Polish = mkNat4 "polon" "Pol�nia" ; 
    Romanian = mkNat4 "roman" "Romania" ;
    Russian = mkNat3 "rus" "russa" "russos" "russes" "R�ssia" ;
    Spanish = mkNat3 "espanyol" "espanyola" "espanyols" "espanyoles" "Espanya" ;
    Swedish = mkNat3 "suec" "sueca" "suecs" "sueques" "Su�cia" ;


-- means of transportation 

    Bike = mkTransport (mkN "bici" feminine) ; 
    Bus = mkTransport (mkN "autob�s" "autobusos" masculine) ; 
    Car = mkTransport L.car_N ;
    Ferry = mkTransport (mkN "ferri" masculine) ;
    Plane = mkTransport L.airplane_N ;
    Subway = mkTransport (mkN "metro") ;
    Taxi = mkTransport (mkN "taxi" masculine) ;
    Train = mkTransport (mkN "tren" masculine) ;
    Tram = mkTransport (mkN "tramvia" masculine) ;

    ByFoot = P.mkAdv "a peu" ;

-- actions

    AHasAge p num = mkCl p.name have_V2 (mkNP num L.year_N) ;
    AHasChildren p num = mkCl p.name have_V2 (mkNP num (mkN "fill" masculine)) ;
    AHasName p name =
       let dir = mkV (dir_41 "dir")
       in mkCl p.name (mkV2 (reflV dir)) name ;
    AHasRoom p num = mkCl p.name have_V2 
      (mkNP (mkNP a_Det (mkN "habitaci�" feminine)) (SyntaxCat.mkAdv for_Prep (mkNP num (mkN "persona")))) ;
    AHasTable p num = mkCl p.name have_V2 
      (mkNP (mkNP a_Det (mkN "taula")) (SyntaxCat.mkAdv for_Prep (mkNP num (mkN "persona")))) ;
    AHungry p = mkCl p.name (E.ComplCN have_V2 (mkCN (mkN "gana" feminine))) ;
    AIll p = mkCl p.name  stateCopula (mkAP (mkA "malalt")) ;
    AKnow p =
      let saber = mkV (saber_99 "saber")
      in mkCl p.name saber ;
    ALike p item = mkCl item (mkV2 (mkV "agradar") dative) p.name ;
    ALive p co =
      let viure = mkV (viure_119 "viure")
      in mkCl p.name (mkVP (mkVP viure) (SyntaxCat.mkAdv in_Prep co)) ;
    ALove p q = mkCl p.name (mkV2 (mkV "estimar")) q.name ;
    AMarried p = mkCl p.name stateCopula (mkAP (mkA "casat")) ;
    AReady p = mkCl p.name stateCopula (mkAP (mkA "preparat")) ;
    AScared p = mkCl p.name (E.ComplCN have_V2 (mkCN (mkN "por" feminine))) ;
    ASpeak p lang = mkCl p.name  (mkV2 (mkV "parlar")) lang ;
    AThirsty p = mkCl p.name (E.ComplCN have_V2 (mkCN (mkN "set" feminine))) ;
    ATired p = mkCl p.name stateCopula (mkAP (mkA "cansat")) ;
    AUnderstand p = mkCl p.name (mkV "entendre") ;
    AWant p obj = 
      let voler = mkV (voler_120 "voler")
      in mkCl p.name (mkV2 voler) obj ;
    AWantGo p place = mkCl p.name want_VV (mkVP (mkVP L.go_V) place.to) ;


-- miscellaneous

    QWhatAge p = mkQS (mkQCl (mkIP how8many_IDet L.year_N) p.name have_V2) ; 
    QWhatName p =
       let dir = mkV (dir_41 "dir")
       in  mkQS (mkQCl how_IAdv (mkCl p.name (reflV dir))) ;
    HowMuchCost item = 
      let valer = mkV (valer_114 "valer")
      in  mkQS (mkQCl how8much_IAdv (mkCl item valer)) ; 
    ItCost item price = 
      let valer = mkV (valer_114 "valer")
      in mkCl item (mkV2 valer) price ;
    PropOpen p = mkCl p.name stateCopula (mkAP open_A) ;
    PropClosed p = mkCl p.name stateCopula (mkAP closed_A) ;
    PropOpenDate p d = mkCl p.name (mkVP (mkVP stateCopula (mkAP open_A)) d) ; 
    PropClosedDate p d = mkCl p.name (mkVP (mkVP stateCopula (mkAP closed_A)) d) ;
    PropOpenDay p d = mkCl p.name (mkVP (mkVP open_A) d.habitual) ; 
    PropClosedDay p d = mkCl p.name (mkVP (mkVP closed_A) d.habitual) ; 
	PSeeYouPlaceDate p d = 
      mkText (lin Text (ss ("a reveure"))) 
      (mkText (mkPhrase (mkUtt d)) (mkPhrase (mkUtt p.at))) ;
    PSeeYouPlace p = mkText (lin Text (ss ("fins aviat"))) (mkPhrase (mkUtt p.at)) ;
--  PSeeYou d = mkText (lin Text (ss ("fins aviat"))) (mkPhrase (mkUtt d)) ;
    PSeeYouDate d = mkText (lin Text (ss ("a reveure"))) (mkPhrase (mkUtt d)) ;

-- family relations

    Wife = xOf sing (mkN "dona") ;
    Husband = xOf sing (mkN "marit") ;
    Son = xOf sing (mkN "fill") ;
    Daughter = xOf sing (mkN "filla") ;
    Children = xOf plur (mkN "fill") ;

-- week days

    Monday = mkDay "dilluns" ;
    Tuesday = mkDay "dimarts" ;
    Wednesday = mkDay "dimecres" ;
    Thursday = mkDay "dijous" ;
    Friday = mkDay "divendres" ;
    Saturday = mkDay "dissabte" ;
    Sunday = mkDay "diumenge" ;

    Tomorrow = P.mkAdv "dem�" ;


-- transports

   --a quina dist�ncia est� PLACE
   HowFar place = mkQS (mkQCl what_distance_IAdv (mkCl place.name placeCopula) );
    
   HowFarFrom x y = mkQS (mkQCl what_distance_IAdv 
      (mkCl y.name (mkVP (mkVP placeCopula)
                         (S.mkAdv from_Prep x.name))));
                         
   HowFarFromBy x y t = mkQS (mkQCl what_distance_IAdv 
      (mkCl y.name (mkVP
                      (mkVP (mkVP placeCopula)
                            (S.mkAdv from_Prep x.name))
                       t)));
                       
   HowFarBy y t = mkQS (mkQCl what_distance_IAdv 
      (mkCl y.name (mkVP (mkVP placeCopula) t)));
      
   WhichTranspPlace trans place = 
      mkQS (mkQCl (mkIP which_IDet trans.name) (mkVP (mkVP L.go_V) place.to)) ;
   IsTranspPlace trans place =
      mkQS (mkQCl (mkCl (mkCN trans.name (SyntaxCat.mkAdv to_Prep place.name)))) ;

-- modifiers of places
    TheBest = mkSuperl L.good_A True ;
    TheClosest = mkSuperl L.near_A False; 
    TheCheapest = mkSuperl cheap_A False ;
    TheMostExpensive = mkSuperl expensive_A False ;
    TheMostPopular = mkSuperl (mkA "popular" "popular" "populars" "populars" "popularment") False ;
    TheWorst = mkSuperl L.bad_A True ;
    SuperlPlace sup p = placeNPSuperl sup p ;

-- auxiliaries

  oper

  mkSuperl : A -> Bool -> OrdSuperlative = \a,bool ->
    let ord : Ord = S.mkOrd a in {
      ord = ord ;
      isPre = bool ;
    } ;

    desde_Prep = mkPrep "des de" ;
    fins_Prep = mkPrep "fins a" ;

    what_distance_IAdv = ss "a quina dist�ncia"**{lock_IAdv=<>};
	
    placeCopula = mkV (estar_54 "estar") ; 

    mkNat : Str -> Str -> NPNationality = \nat,co -> 
      mkNPNationality (mkNP (mkPN nat)) (mkNP (mkPN co)) (mkA nat) ;

    mkNat2 : A -> Str -> Str -> NPNationality = \adj,nat,co -> 
      mkNPNationality (mkNP (mkPN nat)) (mkNP (mkPN co)) adj ;

    mkNat3 : (_,_,_,_:Str) -> Str -> NPNationality = \ms,fs,mp,fp,co -> 
      mkNPNationality (mkNP (mkPN ms)) (mkNP (mkPN co)) (mkA ms fs mp fp ("a la" ++ fs)) ;

    mkNat4 : Str -> Str -> NPNationality = \angl,co ->
      mkNat3 (angl+"�s") (angl+"esa") (angl+"esos") (angl+"eses") co ;

    mkNat5 : Str -> Str -> NPNationality = \catal,co ->
      mkNat3 (catal+"�") (catal+"ana") (catal+"ans") (catal+"anes") co ;

    mkDay : Str -> {name : NP ; point : Adv ; habitual : Adv} = \d ->
      let day = mkNP (mkPN d)
      in 
        case last d of {
          "s" => mkNPDay day (P.mkAdv ("el" ++ d)) (P.mkAdv ("els" ++ d)) ;
           _  => mkNPDay day (P.mkAdv ("el" ++ d)) (P.mkAdv ("els" ++ d + "s")) 
         } ;

    mkPlace : N -> {name : CN ; at : Prep ; to : Prep; isPl : Bool} = \p ->
      mkCNPlace (mkCN p) dative dative ;

    mkTransport : N -> {name : CN ; by : Adv} = \n -> {
          name = mkCN n ; 
          by = S.mkAdv with_Prep (mkNP n)
          } ;

    xOf : GNumber -> N -> NPPerson -> NPPerson = \n,x,p -> mkRelative n (mkCN x) p ; 

    stateCopula = mkVA (mkV (estar_54 "estar")) ;
    open_A = mkA "obert" ;

    closed_A = mkA "tancat" ;

    cheap_A = mkA "barat" "barata" ; 

    expensive_A = mkA "car" ;
}


