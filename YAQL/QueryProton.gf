abstract QueryProton = YAQL ** {

cat 
  Name ;

fun
  EName : Name -> Entity ;

  KOrganization : Kind ;
  KPlace : Kind ;
  KPerson : Kind ;

  KRegion : Term -> Kind ;
  KSubregion : Term -> Kind ;

  RWork : Relation ;
  REmployed : Relation ;
  RHaveTitle : Relation ;
  RLocated : Relation ;

  RName : Relation ;
  RNickName : Relation ;

  JobTitle1 : Entity ;  
  Location1 : Entity ;
  Organization1 : Entity ;
  Person1 : Entity ;

  Name1 : Name ;

}