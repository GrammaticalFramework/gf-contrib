--# -path=.:present

concrete QueryPhilFre of QueryPhil = YAQLFre ** 
   open SyntaxFre, ParadigmsFre, BuildQueryFre, Prelude in {

flags coding = utf8 ;

lin
  KPoliticalPhilosopher = mkCN (mkA "politique") (mkN "philosophe" masculine) ;
  KPhilosopher = mkCN (mkN "philosophe" masculine) ;

  EMarx = personNameEntity "Karl" "Marx" ;
  EHegel = personNameEntity "Georg Wilhelm Friedrich" "Hegel" ;
  EPlato = nameEntity "Platon" ;

  PGerman = adjectiveProperty (mkA "allemand") ;

  RInfluence = transverbRelation (mkV2 (mkV "influer")) ;
  RIsInfluenced = passiveRelation (mkV2 (mkV "influer")) ;
  REarlier = adjectiveRelation (mkA "antérieur") dative ;
  RIsRelated = adjectiveRelation (mkA "relié") dative ;

}