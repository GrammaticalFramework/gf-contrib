--# -path=.:alltenses

concrete QueryPhilSwe of QueryPhil = YAQLSwe ** 
   open SyntaxSwe, ParadigmsSwe, BuildQuerySwe, Prelude in {

flags coding = utf8 ;

lin
  KPoliticalPhilosopher = mkCN (mkA "politisk") (mkN "filosof" "filosofer") ;
  KPhilosopher = mkCN (mkN "filosof" "filosofer") ;

  EMarx = personNameEntity "Karl" "Marx" ;
  EHegel = personNameEntity "Georg Wilhelm Friedrich" "Hegel" ;
  EPlato = nameEntity "Platon" ;

  PGerman = adjectiveProperty (mkA "tysk") ;

  RInfluence = transverbRelation (mkV2 "påverka") ;
  RIsInfluenced = passiveRelation (mkV2 "påverka") ;
  REarlier = comparativeRelation (mkA "tidig") ;
  RIsRelated = adjectiveRelation (mkA "relaterad") to_Prep ;

}