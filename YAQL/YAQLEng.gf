concrete YAQLEng of YAQL = NumeralEng ** YAQLFunctor - [
    PNegative, 
    idRP,
    slashQCl,
    slashRCl
   ] with
  (BuildQueryInterface = BuildQueryEng),
  (Syntax = SyntaxEng),
  (Verb = VerbEng),
  (Lexicon = LexiconEng) ** open (E = ExtraEng), ParadigmsEng in {

lin
  PNegative = {pol = E.UncNeg ; isPos = False} ;
oper
  idRP = E.that_RP ;
  slashQCl = E.StrandQuestSlash ;
  slashRCl = E.StrandRelSlash ;

}
