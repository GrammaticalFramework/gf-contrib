--# -path=.:alltenses

-- DRAFT

concrete YAQLRus of YAQL = NumeralRus ** YAQLFunctor - [
    TPast,
    NAtLeast, NAtMost  ---- not in RGL
    ] with
  (BuildQueryInterface = BuildQueryRus),
  (Syntax = SyntaxRus),
  (Verb = VerbRus),
  (Lexicon = LexiconRus) ** open (E = ExtraRus), ParadigmsRus in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed
    
--oper
  --useAsVP : VPSlash -> NP -> VP = \vps,np -> lin VP (vps ** {compl = \\_ => []}) ; --- hack

}


