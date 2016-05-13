abstract Modelling = {

flags startcat = Model ;

cat
  Model ;
  [Element] {1} ;
  Element ;
  Entity ;
  Relationship ;
  Attrib ;
  [Attrib] {1} ;
  Arrow ;  -- exactly one | at least one
  Support ;
  [Support] {1} ;
  SupportRelationship ;
  Related ;
  [Related] {2} ;

fun
  MEntities     : [Element] -> Model ;

  EEntity       : Entity -> [Attrib] -> Element ;
  EWeakEntity   : Entity -> [Support] -> [Attrib] -> Element ;
  ERelationship : Relationship -> [Related] -> [Attrib] -> Element ;
  ESubEntity    : Entity -> Entity -> [Attrib] -> Element ;

  SEntity       : Entity -> SupportRelationship -> Support ;

  REntity       : Entity -> Arrow -> Related ;

  AMany : Arrow ;
  AAtLeastOne : Arrow ;
  AExactlyOne : Arrow ;

  SOf : SupportRelationship ;
  SIn : SupportRelationship ;

---- example

  ECountry  : Entity ;
  ECurrency : Entity ;
  EKingdom  : Entity ;
  ACapital  : Attrib ;
  AMonarch  : Attrib ;
  ACode     : Attrib ;
  RUse      : Relationship ;


}