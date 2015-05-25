concrete YAQLDan of YAQL = NumeralDan ** YAQLFunctor - [
    slashQCl,
    slashRCl,
    NAtLeast, NAtMost ---- not in RGL
   ] with
  (BuildQueryInterface = BuildQueryDan),
  (Syntax = SyntaxDan),
  (Verb = VerbDan),
  (Lexicon = LexiconDan) ** open (E = ExtraDan), ParadigmsDan in {

oper
  slashQCl = E.StrandQuestSlash ;
  slashRCl = E.StrandRelSlash ;

}
