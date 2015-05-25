--# -path=.:alltenses

concrete QueryProtonEng of QueryProton = YAQLEng ** 
   open SyntaxEng, ParadigmsEng, IrregEng, BuildQueryEng, Prelude in {

lincat 
  Name = NP ;

lin
  EName name = name ;

  KOrganization = mkCN (mkN "organization") ;
  KPlace = mkCN (mkN "place") ;
  KPerson = mkCN (mkN "person") ;

  KRegion term = mkCN (mkN2 (mkN "region")) term ;
  KSubregion term = mkCN (mkN2 (mkN "subregion")) term ;

  RWork = transverbRelation (mkV2 (mkV "work") at_Prep) ;
  REmployed = passiveRelation (mkV2 "employ") ;
  RHaveTitle = transverbRelation (mkV2 (partV have_V "title")) ; ---
  RLocated = adjectiveRelation (mkA "located") at_Prep ;

  RName = transverbRelation (mkV2 (partV have_V "name")) ; ---
  RNickName = transverbRelation (mkV2 (partV have_V "nickname")) ; ---

  JobTitle1 = mkNP (mkPN "'JobTitle1") ;
  Location1 = mkNP (mkPN "'Location1") ;
  Organization1 = mkNP (mkPN "'Organization1") ;
  Person1 = mkNP (mkPN "'Person1") ;
  Name1 = mkNP (mkPN "'Name1") ;

}