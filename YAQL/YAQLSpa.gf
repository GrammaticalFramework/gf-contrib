concrete YAQLSpa of YAQL = NumeralSpa ** YAQLFunctor - [
    TPast,
    allAboutNP, TAll,
    PPred, QWh, PRel1, PRel2 ---
    ] with
  (BuildQueryInterface = BuildQuerySpa),
  (Syntax = SyntaxSpa),
  (Verb = VerbSpa),
  (Lexicon = LexiconSpa) ** open (E = ExtraSpa), ParadigmsSpa in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed

  lin
    TAll kind = mkNP all_Predet (mkNP thePl_Det kind) ;

  oper
    allAboutNP = mkNP all_Predet (mkNP theSg_Det (mkN "información" feminine)) ;

}


