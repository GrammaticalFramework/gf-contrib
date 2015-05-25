concrete YAQLCat of YAQL = NumeralCat ** YAQLFunctor - [
    TPast,
    allAboutNP, TAll,
    PPred, QWh, PRel1, PRel2 ---
    ] with
  (BuildQueryInterface = BuildQueryCat),
  (Syntax = SyntaxCat),
  (Verb = VerbCat),
  (Lexicon = LexiconCat) ** open (E = ExtraCat), ParadigmsCat in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed

  lin
    TAll kind = mkNP all_Predet (mkNP thePl_Det kind) ;

  oper
    allAboutNP = mkNP all_Predet (mkNP theSg_Det (mkN "informació" feminine)) ;

}


