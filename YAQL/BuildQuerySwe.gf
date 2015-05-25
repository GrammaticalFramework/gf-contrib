instance BuildQuerySwe of BuildQueryInterface = 
 
 open 
    SyntaxSwe,
    (Verb = VerbSwe),
    (Lexicon = LexiconSwe),
    ParadigmsSwe,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "visa") np) ;
  about_Prep = mkPrep "om" ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "än" ;
  at_Prep = on_Prep ;
}
