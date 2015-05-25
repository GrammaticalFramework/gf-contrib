concrete YAQLFin of YAQL = NumeralFin ** YAQLFunctor - [
    TPast,
    QThere, -- use "mitä filosofeja on", not "mitkä filosofit ovat olemassa"
    allAboutNP, -- use "kaikki tiedot"
            PPred, QWh, PRel1, PRel2 --- just too slow to compile
    ] with
  (BuildQueryInterface = BuildQueryFin),
  (Syntax = SyntaxFin),
  (Verb = VerbFin),
  (Lexicon = LexiconFin) ** open (E = ExtraFin), ParadigmsFin in {

flags coding = utf8 ;

--- efficiency in compilation to be fixed

  lin
    QThere qp = mkQS (mkQCl qp (caseV partitive vOlla)) ;

  oper
    allAboutNP = mkNP all_Predet (mkNP thePl_Det (mkN "tieto")) ;

}
