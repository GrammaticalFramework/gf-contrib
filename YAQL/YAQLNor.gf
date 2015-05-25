concrete YAQLNor of YAQL = NumeralNor ** YAQLFunctor - [
    slashQCl,
    slashRCl,
    NAtLeast, NAtMost ---- not in RGL
   ] with
  (BuildQueryInterface = BuildQueryNor),
  (Syntax = SyntaxNor),
  (Verb = VerbNor),
  (Lexicon = LexiconNor) ** open (E = ExtraNor), ParadigmsNor in {

oper
  slashQCl = E.StrandQuestSlash ;
  slashRCl = E.StrandRelSlash ;

}
