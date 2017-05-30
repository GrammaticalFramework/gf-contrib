abstract Countries = {

flags startcat = Statement ;

cat
  Statement ;
  Query ;
  Entity ;
  Attribute ;
  [Attribute] {1} ;
  [Entity] {1} ;
  Condition ;
  Conditions ;
  Property ;
  Value ;
  
fun
  SQuery : Query -> Statement ;

  QShowEverything : [Entity] -> Conditions -> Query ;   -- SELECT * FROM entities WHERE condition
  
  QShow : [Attribute] -> [Entity] -> Conditions -> Query ;  -- SELECT attributes FROM entities WHERE condition

  QWhat : Attribute -> Value -> Query ;  -- SELECT a.name FROM a.table WHERE a.attr = v
  
  QWhichProp : Attribute -> Property -> Query ;  -- SELECT * FROM a.table WHERE a.attr p

  QHowMany : Attribute -> Value -> Query ;  -- SELECT count(*) FROM a.table WHERE a.attr = v
  
  QHowManyProp : Attribute -> Property -> Query ;  -- SELECT count(*) FROM a.table WHERE a.attr p

  CsNone : Conditions ;
  CsConditions : Condition -> Conditions ;
  
  CAnd  : Condition -> Condition -> Condition ;
  CProperty : Value -> Property -> Condition ;
  
  PEqual    : Value -> Property ; -- (is) 2000
  PNotEqual : Value -> Property ; -- not 2000
  POver     : Value -> Property ; -- over 2000
  PUnder    : Value -> Property ; -- under 2000
  PAtLeast  : Value -> Property ; -- at least 2000
  PAtMost   : Value -> Property ; -- at most 2000

  VAttribute : Attribute -> Value ;  -- attribute
  VQualifiedAttribute : Attribute -> Value ; -- Table.attribute

  VString : String -> Value ;
  VInt : Int -> Value ;
  
-- these could be derived from a schema
  ECountry : Entity ;
  ACountryName    : Attribute ;
  ACountryCapital : Attribute ;  
  ACountryPopulation : Attribute ;
  ACountryArea     : Attribute ;
  ACountryCurrency : Attribute ;

  ECurrency : Entity ;
  ACurrencyCode : Attribute ;
  ACurrencyName : Attribute ;

}