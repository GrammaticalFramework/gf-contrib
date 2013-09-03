abstract Query = {

flags
  startcat = Move ;

-- general query language, which can be specialized with any lexicon

cat
  Move ;     -- top-level utterance,    e.g. "give me all Bulgarian persons that work at Google"
  Query ;
  Answer ;
  Set ;      -- the set requested,      e.g. "all persons"
  Relation ; -- something of something, e.g. "subregion of Bulgaria"
  Kind ;     -- type of things,         e.g. "person"
  Property ; -- property of things,     e.g. "employed at Google"
  Individual ; -- one entity,           e.g. "Google"
  Activity ;   -- action property,      e.g. "work at Google"
  Name ;       -- person, company...    e.g. "Eric Schmidt"
  Loc ;
  Org ;
  Pers ;
  [Individual] {2} ; -- list of entities, e.g. "Larry Page, Sergey Brin"

fun
  MQuery  : Query -> Move ;
  MAnswer : Answer -> Move ;

  QSet    : Set  -> Query ;  -- (give me | what are | which are | ) (S | the names of S | S's names)
  QWhere  : Set  -> Query ;  -- where are S
  QInfo   : Set  -> Query ;  -- (give me | ) (information about | all about) S
  QCalled : Individual -> Query ; -- how is X (also | otherwise) (called | named | known) ;

  AKind  : Set  -> Kind     -> Answer ; -- S is a K
  AProp  : Set  -> Property -> Answer ; -- S is P
  AAct   : Set  -> Activity -> Answer ; -- S As

  SAll   : Kind -> Set ;  -- all Ks | the Ks
  SOne   : Kind -> Set ;  -- one K
  SIndef : Kind -> Set ;  -- a K
  SPlural : Kind -> Set ;  -- Ks
  SOther : Kind -> Set ;  -- other Ks
  SInd   : Individual  -> Set ;  -- X
  SInds  : [Individual] -> Set ; -- X and Y

  KRelSet  : Relation -> Set -> Kind ; -- R of S | S's R
  KRelKind : Kind -> Relation -> Set -> Kind ; -- K that is R of S
  KRelPair : Kind -> Relation -> Kind ; -- S's with their R's
  KProp    : Property -> Kind -> Kind ; -- P K | K that is P
  KAct     : Activity -> Kind -> Kind ; -- K that Ps
  KRel     : Relation -> Kind ; -- R ---??

  IName    : Name -> Individual ;

  NLoc : Loc -> Name ;
  NOrg : Org -> Name ;
  NPers : Pers -> Name ;

  ACalled  : [Individual] -> Activity ;

-- the test lexicon

cat
  JobTitle ;
fun
  Located : Loc -> Property ;
  Employed : Org -> Property ;

  Work : Org -> Activity ;
  HaveTitle : JobTitle -> Activity ;
  HaveTitleOrg : JobTitle -> Org -> Activity ;

  Organization : Kind ;
  Place : Kind ;
  Person : Kind ;

  Location : Relation ;
  Region : Relation ;
  Subregion : Relation ;

  RName     : Relation ;
  RNickname : Relation ;

-- JobTitles
   JobTitle1 : JobTitle ;
   JobTitle2 : JobTitle ;
   JobTitle3 : JobTitle ;
   JobTitle4 : JobTitle ;

-- Locations
   Location1 : Loc ;
   Location2 : Loc ;
   Location3 : Loc ;
   Location4 : Loc ;

-- Organizations
   Organization1 : Org ;
   Organization2 : Org ;
   Organization3 : Org ;
   Organization4 : Org ;

-- Persons
   Person1 : Pers ;
   Person2 : Pers ;
   Person3 : Pers ;
   Person4 : Pers ;
}
