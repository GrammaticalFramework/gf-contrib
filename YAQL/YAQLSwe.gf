concrete YAQLSwe of YAQL = NumeralSwe ** YAQLFunctor - [
    slashQCl,
    slashRCl
   ] with
  (BuildQueryInterface = BuildQuerySwe),
  (Syntax = SyntaxSwe),
  (Verb = VerbSwe),
  (Lexicon = LexiconSwe) ** open (E = ExtraSwe), ParadigmsSwe in {

oper
  slashQCl = E.StrandQuestSlash ;
  slashRCl = E.StrandRelSlash ;

}
