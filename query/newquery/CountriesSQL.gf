concrete CountriesSQL of Countries = open Prelude in {

lincat
  Statement = Str ;
  Query = Str ;
  Entity = Str ;
  Attribute = {tbl : Str ; attr : Str ; key : Str} ; --- the key of the table of the attribute
  [Attribute] = Str ;
  [Entity] = Str ;
  Condition = Str ; 
  Conditions = Str ; 
  Property = Str ;
  Value = Str ;
  
lin
  SQuery q = q ;
  
  QShow as es c = "SELECT" ++ as ++ "FROM" ++ es ++ c ;

  QShowEverything es c = "SELECT" ++ "*" ++ "FROM" ++ es ++ c ;

  QWhat a v = "SELECT" ++ a.attr ++ "FROM" ++ a.tbl ++ "WHERE" ++ a.key ++ "=" ++ v ;
  QWhichProp a p = "SELECT" ++ a.key ++ "FROM" ++ a.tbl ++ "WHERE" ++ a.attr ++ p ;
  QHowMany a v = "SELECT" ++ "count(*)" ++ "FROM" ++ a.tbl ++ "WHERE" ++ a.attr ++ "=" ++ v ;
  QHowManyProp a p = "SELECT" ++ "count(*)" ++ "FROM" ++ a.tbl ++ "WHERE" ++ a.attr ++ p ;

  CsConditions c = "WHERE" ++ c ;
  CsNone = "" ;

  CAnd c d = c ++ "AND" ++ d ;
  CProperty v p = v ++ p ;

  PEqual v = "=" ++ v ;
  PNotEqual v = "<>" ++ v ;
  POver v = ">" ++ v ;
  PUnder v = "<" ++ v ;
  PAtLeast v = ">=" ++ v ;
  PAtMost v = "<=" ++ v ;
  
  VAttribute a = a.attr ;
  VQualifiedAttribute a = qualify a.tbl a.attr ;

  VString s = quoted s.s ;
  VInt s = s.s ;

  BaseAttribute a = a.attr ;
  ConsAttribute a as = a.attr ++ "," ++ as ;

  BaseEntity a = a ;
  ConsEntity a as = a ++ "," ++ a ;

-- these could be derived from a schema
  ECountry = "Countries" ;
  ACountryName = mkAttribute "Countries" "name" "name" ;
  ACountryCapital = mkAttribute "Countries" "capital" "name" ;
  ACountryPopulation = mkAttribute "Countries" "population" "name" ;
  ACountryArea = mkAttribute "Countries" "area" "name" ;
  ACountryCurrency = mkAttribute "Countries" "currency" "name" ;

  ECurrency = "Currencies" ;
  ACurrencyCode = mkAttribute "Currencies" "code" "code" ;
  ACurrencyName = mkAttribute "Currencies" "name" "code" ;

oper
  mkAttribute : Str -> Str -> Str -> Attribute
    = \t,a,k -> lin Attribute {attr = a ; tbl = t ; key = k} ;
  qualify : Str -> Str -> Str 
    =  \e,a -> e ++ "." ++ a ;
  quoted : Str -> Str
    = \s -> "'" ++ BIND ++ s ++ BIND ++ "'" ;
}