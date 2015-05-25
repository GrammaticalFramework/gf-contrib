instance BuildQueryGer of BuildQueryInterface = 
 
 open 
    SyntaxGer,
    (Verb = VerbGer),
    (Lexicon = LexiconGer),
    ParadigmsGer,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "zeigen") np) ;
  about_Prep = mkPrep "über" accusative ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "als" nominative ;
  at_Prep = in_Prep ;
}
