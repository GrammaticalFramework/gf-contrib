instance BuildQueryEng of BuildQueryInterface = 
 
 open 
    SyntaxEng,
    (Verb = VerbEng),
    (Lexicon = LexiconEng),
    ParadigmsEng,
    Prelude 
 in {

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "show") np) ;
  about_Prep = mkPrep "about" ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "than" ;
  at_Prep = mkPrep "at" ;
}