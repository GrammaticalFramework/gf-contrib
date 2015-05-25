--# -path=.:alltenses

concrete QueryPhilEng of QueryPhil = YAQLEng ** 
   open SyntaxEng, ParadigmsEng, BuildQueryEng, Prelude in {

lin
  KPoliticalPhilosopher = mkCN (mkA "political") (mkN "philosopher") ;
  KPhilosopher = mkCN (mkN "philosopher") ;

  EMarx = personNameEntity "Karl" "Marx" ;
  EHegel = personNameEntity "Georg Wilhelm Friedrich" "Hegel" ;
  EPlato = nameEntity "Plato" ;

  PGerman = adjectiveProperty (mkA "German") ;

  RInfluence = transverbRelation (mkV2 "influence") ;
  RIsInfluenced = passiveRelation (mkV2 "influence") ;
  REarlier = comparativeRelation (mkA "early") ;
  RIsRelated = adjectiveRelation (mkA "related") to_Prep ;

}