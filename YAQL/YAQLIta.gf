concrete YAQLIta of YAQL = NumeralIta ** YAQLFunctor - [
    TPast,
    allAboutNP, TAll,
    PPred, QWh, PRel1, PRel2 ---
    ] with
  (BuildQueryInterface = BuildQueryIta),
  (Syntax = SyntaxIta),
  (Verb = VerbIta),
  (Lexicon = LexiconIta) ** open (E = ExtraIta), ParadigmsIta in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed

  lin
    TAll kind = mkNP all_Predet (mkNP thePl_Det kind) ;

  oper
    allAboutNP = mkNP all_Predet (mkNP theSg_Det (mkN "informazione" feminine)) ;

}


