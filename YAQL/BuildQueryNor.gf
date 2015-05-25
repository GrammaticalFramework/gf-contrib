instance BuildQueryNor of BuildQueryInterface = 
 
 open 
    SyntaxNor,
    (Verb = VerbNor),
    (Lexicon = LexiconNor),
    ParadigmsNor,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "vise") np) ;
  about_Prep = mkPrep "om" ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "enn" ;
  at_Prep = on_Prep ;
}
