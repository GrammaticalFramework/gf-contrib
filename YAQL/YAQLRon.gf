--# -path=.:alltenses

concrete YAQLRon of YAQL = NumeralRon ** YAQLFunctor - [
    TPast,
    allAboutNP, TAll,
    PPred, QWh, PRel1, PRel2, KProperty ---
    ] with
  (BuildQueryInterface = BuildQueryRon),
  (Syntax = SyntaxRon),
  (Verb = VerbRon),
  (Lexicon = LexiconRon) ** open (E = ExtraRon), ParadigmsRon in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed

  lin
    TAll kind = mkNP all_Predet (mkNP thePl_Det kind) ;

  oper
    allAboutNP = mkNP theSg_Det (mkN "tot") ;

}


