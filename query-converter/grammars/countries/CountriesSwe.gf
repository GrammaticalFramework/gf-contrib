concrete CountriesSwe of Countries = open SyntaxSwe, (P = ParadigmsSwe), SymbolicSwe, (E = ExtraSwe) in {

lincat
  Statement = Text ;
  Query = Utt ;
  Entity = CN ;
  Attribute = {tbl : CN ; attr : CN} ;
  [Attribute] = NP ;
  [Entity] = NP ;
  Condition = S ;
  Conditions = Adv ;
  Property = Adv ;
  Value = NP ;
  
lin
  SQuery q = lin Text q | mkText q ;
  
  QShow as es c =
    mkUtt (mkImp (mkVP (P.mkV2 "visa") (mkNP (mkNP as (mkAdv on_Prep (mkNP all_Predet es))) c))) ; 

  QShowEverything es c =
    mkUtt (mkImp (mkVP (P.mkV2 "visa") (mkNP everything_NP (mkAdv (P.mkPrep "om") (mkNP all_Predet (mkNP es c)))))) ; 

  QWhat a v = mkUtt (mkQS (mkQCl what_IP (mkNP (mkNP the_Det a.attr) (mkAdv possess_Prep v)))) ;
  QWhichProp a p = mkUtt (mkQS (mkQCl (mkIP whichPl_IDet a.tbl) have_V2 (mkNP (mkNP a_Det a.attr) p))) ;
  
  QHowMany a v = mkUtt (mkQS (mkQCl (mkIP how8many_IDet a.tbl) have_V2 (mkNP v (mkAdv (P.mkPrep "som") (mkNP a.attr))))) ; 
  QHowManyProp a p = mkUtt (mkQS (mkQCl (mkIP how8many_IDet a.tbl) have_V2 (mkNP (mkNP a_Det a.attr) p))) ;

  CsNone = P.mkAdv "" ;
  CsConditions c = mkAdv (lin Subj {s = "där"}) c ;
  
  CAnd c d =  mkS and_Conj c d ;
  CProperty v p = mkS (mkCl v p) ;  -- v is over 2000

  PEqual v = mkAdv (P.mkPrep "") v ;
  PNotEqual v = mkAdv (P.mkPrep "inte") v ;
  POver v = mkAdv (P.mkPrep "över") v ;
  PUnder v = mkAdv (P.mkPrep "under") v ;
  PAtLeast v = mkAdv (P.mkPrep "minst") v ;
  PAtMost v = mkAdv (P.mkPrep "högst") v ;

  VAttribute a = mkNP the_Det a.attr ;
  VQualifiedAttribute a = mkNP (E.GenNP (mkNP the_Det a.tbl)) a.attr ; ---- landets befolkning: genitive (compound in Eng)

  VString s = symb s ;
  VInt s = symb s ;

  BaseAttribute a = mkNP thePl_Det a.attr ;
  ConsAttribute a as = mkNP and_Conj (mkNP thePl_Det a.attr) as ;

  BaseEntity a = mkNP aPl_Det a ;
  ConsEntity a as = mkNP and_Conj (mkNP aPl_Det a) as ;

-- these could be derived from a schema
  ECountry = mkCN land_N ;
  ACountryName = mkAttribute land_N namn_N ;
  ACountryCapital = mkAttribute land_N huvudstad_N ;
  ACountryPopulation = mkAttribute land_N befolkning_N ;
  ACountryArea = mkAttribute land_N yta_N ;
  ACountryCurrency = mkAttribute land_N valuta_N ;

  ECurrency = mkCN valuta_N ;
  ACurrencyCode = mkAttribute valuta_N kod_N ;
  ACurrencyName = mkAttribute valuta_N namn_N ;

oper
  mkAttribute : N -> N -> Attribute
    =  \e,a -> lin Attribute {attr = mkCN a ; tbl = mkCN e} ;

  land_N = P.mkN "land" "landet" "länder" "länderna" ;
  namn_N = P.mkN "namn" "namn" ;
  huvudstad_N = P.mkN "huvudstad" "huvudstäder" ;
  befolkning_N = P.mkN "befolkning" ;
  yta_N = P.mkN "yta" ;
  valuta_N = P.mkN "valuta" ;
  kod_N = P.mkN "kod" "koder" ;
}