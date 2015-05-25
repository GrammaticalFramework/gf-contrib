--# -path=.:alltenses

concrete YAQLBul of YAQL = NumeralBul ** YAQLFunctor - [
    TPast,
    useAsVP
   -- , QThere 
    ] with
  (BuildQueryInterface = BuildQueryBul),
  (Syntax = SyntaxBul),
  (Verb = VerbBul),
  (Lexicon = LexiconBul) ** open (E = ExtraBul), ParadigmsBul in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed

--lin 
--  have_V = stateV (mkV186 "имам");
--  QThere qp = mkQS (mkQCl qp have_V);
oper
  useAsVP : VPSlash -> NP -> VP = \vps,np -> lin VP (vps ** {compl = \\_ => []}) ; --- hack

}


