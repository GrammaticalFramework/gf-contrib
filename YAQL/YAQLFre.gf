concrete YAQLFre of YAQL = NumeralFre ** YAQLFunctor - [
    TPast,
    allAboutNP, TAll,
        PPred, QWh, PRel1, PRel2 --- just too slow to compile
    ] with
  (BuildQueryInterface = BuildQueryFre),
  (Syntax = SyntaxFre),
  (Verb = VerbFre),
  (Lexicon = LexiconFre) ** open (E = ExtraFre), ParadigmsFre in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed

  lin
    TAll kind = mkNP all_Predet (mkNP thePl_Det kind) ;
  oper
    allAboutNP = mkNP all_Predet (mkNP theSg_Det (mkN "information")) ;

}


