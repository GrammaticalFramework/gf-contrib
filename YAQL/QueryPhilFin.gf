--# -path=.:present

concrete QueryPhilFin of QueryPhil = YAQLFin ** 
   open SyntaxFin, ParadigmsFin, BuildQueryFin, Prelude in {

flags coding = utf8 ;

lin
  KPoliticalPhilosopher = mkCN (mkA "poliittinen") (mkN "filosofi") ;
  KPhilosopher = mkCN (mkN "filosofi") ;

  EMarx = personNameNounEntity "Karl" (mkN "Marx") ;
  EHegel = 
    personNameNounEntity ("Georg Wilhelm Friedrich") (mkN "Hegel" "Hegelin" "Hegelejä") ;
  EPlato = nameNounEntity (mkN "Platon" "Platonin" "Platoneja") ;

  PGerman = adjectiveProperty (mkA "saksalainen") ;

  RInfluence = transverbRelation (mkV2 (mkV "vaikuttaa") illative) ;
  RIsInfluenced = transverbRelation (mkV2 (mkV "vaikuttua") elative) ; ----
  REarlier = adjectiveRelation (mkA (mkN "aiempi" "aiemman" "aiempia")) (casePrep partitive) ;
  RIsRelated = transverbRelation (mkV2 (mkV "liittyä") illative) ;

}