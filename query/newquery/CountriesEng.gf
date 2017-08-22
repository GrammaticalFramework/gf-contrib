concrete CountriesEng of Countries = open SyntaxEng, (P = ParadigmsEng), SymbolicEng in {

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
    mkUtt (mkImp (mkVP (P.mkV2 "show") (mkNP (mkNP as (mkAdv possess_Prep (mkNP all_Predet es))) c))) ; 

  QShowEverything es c =
    mkUtt (mkImp (mkVP (P.mkV2 "show") (mkNP everything_NP (mkAdv (P.mkPrep "about") (mkNP all_Predet (mkNP es c)))))) ; 

  QWhat a v = mkUtt (mkQS (mkQCl what_IP (mkNP (mkNP the_Det a.attr) (mkAdv possess_Prep v)))) ;
  QWhichProp a p = mkUtt (mkQS (mkQCl (mkIP whichPl_IDet a.tbl) have_V2 (mkNP (mkNP a_Det a.attr) p))) ;
  
  QHowMany a v = mkUtt (mkQS (mkQCl (mkIP how8many_IDet a.tbl) have_V2 (mkNP v (mkAdv (P.mkPrep "as") (mkNP a.attr))))) ; 
  QHowManyProp a p = mkUtt (mkQS (mkQCl (mkIP how8many_IDet a.tbl) have_V2 (mkNP (mkNP a_Det a.attr) p))) ;
  
  CsNone = P.mkAdv "" ;
  CsConditions c = mkAdv where_Subj c ;
  
  CAnd c d =  mkS and_Conj c d ;
  CProperty v p = mkS (mkCl v p) ;  -- v is over 2000

  PEqual v = mkAdv (P.mkPrep "") v ;
  PNotEqual v = mkAdv (P.mkPrep "not") v ;
  POver v = mkAdv (P.mkPrep "over") v ;
  PUnder v = mkAdv (P.mkPrep "under") v ;
  PAtLeast v = mkAdv (P.mkPrep "at least") v ;
  PAtMost v = mkAdv (P.mkPrep "at most") v ;
  
  VAttribute a = mkNP the_Det a.attr ;
  VQualifiedAttribute a = mkNP the_Det (mkCN a.tbl (mkNP a.attr)) ; ---- compound CN: country name; here apposition

  VString s = symb s ;
  VInt s = symb s ;

  BaseAttribute a = mkNP thePl_Det a.attr ;
  ConsAttribute a as = mkNP and_Conj (mkNP thePl_Det a.attr) as ;

  BaseEntity a = mkNP aPl_Det a ;
  ConsEntity a as = mkNP and_Conj (mkNP aPl_Det a) as ;

-- these could be derived from a schema
  ECountry = mkCN (P.mkN "country") ;
  ACountryName = mkAttribute "country" "name" ;
  ACountryCapital = mkAttribute "country" "capital" ;
  ACountryPopulation = mkAttribute "country" "population" ;
  ACountryArea = mkAttribute "country" "area" ;
  ACountryCurrency = mkAttribute "country" "currency" ;

  ECurrency = mkCN (P.mkN "currency") ;
  ACurrencyCode = mkAttribute "currency" "code" ;
  ACurrencyName = mkAttribute "currency" "name" ;

oper
  mkAttribute : Str -> Str -> Attribute
    =  \e,a -> lin Attribute {attr = mkCN (P.mkN a) ; tbl = mkCN (P.mkN e)} ;

  where_Subj = lin Subj {s = "such that"} | lin Subj {s = "where"} ;
  
}