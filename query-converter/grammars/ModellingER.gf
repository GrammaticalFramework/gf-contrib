concrete ModellingER of Modelling = open
  Prelude

in {

lincat
  Model = Str ;
  [Element] = Str ;
  Element = Str ;
  Entity = Str ;
  Relationship = Str ;
  Attrib = Str ;
  [Attrib] = Str ;
  Arrow = Str ;
  Support = Str ;
  [Support] = Str ;
  SupportRelationship = Str ;
  Related = Str ;
  [Related] = Str ;

lin
  MEntities es = es ;

  BaseElement e = e ;
  ConsElement e es = e ++ es ;

  BaseAttrib a = a ;
  ConsAttrib a as = a ++ as ;

  EEntity ent atts = "ENTITY" ++ ent ++ atts ;

  EWeakEntity ent supps atts = "WEAK" ++ "ENTITY" ++ ent ++ supps ++ ":" ++ atts ;
  ERelationship rel rels atts = "RELATIONSHIP" ++ rel ++ rels ++ ":" ++ atts ;
  ESubEntity subent superent atts = "ISA" ++ subent ++ superent ++ atts ;

  SEntity ent supprel = ent ++ supprel ;

  BaseSupport s = s ;
  ConsSupport s ss = s ++ ss ;

  REntity e a = a ++ e ;
  
  BaseRelated s o = s ++ o ;
  ConsRelated r rs = r ++ rs ;


  AMany = "--" ;
  AAtLeastOne = "->" ;
  AExactlyOne = "-)" ;

  SOf = "of" ;
  SIn = "in" ;


---- example

  ECountry  = "country" ;
  ECurrency = "currency" ;
  EKingdom  = "kingdom" ;
  ACapital  = "capital" ;
  AMonarch  = "monarch" ;
  ACode     = "code" ;
  RUse      = "use" ;


}