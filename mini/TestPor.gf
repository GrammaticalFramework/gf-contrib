{--
  what makes some verbs in Portuguese have the wrong participle?

  /é amado/ is ok, and so are /é amada/ /são amados/, but /há chegado/
  is awkward. and there is no gender agreement on /elas hão chegado/,
  why?

--}

concrete TestPor of Test = GrammarPor ** open ParadigmsPor in {

lin
  man_N     = mkN "homem" ;
  woman_N   = mkN "mulher" feminine ;
  house_N   = mkN "casa" ;
  tree_N    = mkN "árvore" feminine ;
  big_A     = preA (mkA "grande") ;
  small_A   = preA (mkA "pequeno") ;
  green_A   = mkA "verde" ;
  walk_V    = terV (mkV "caminhar") ;
  arrive_V  = mkV "chegar";
  love_V2   = mkV2 (mkV "amar") ;
  please_V2 = mkV2 (mkV "agradar") dative ;

} ;
