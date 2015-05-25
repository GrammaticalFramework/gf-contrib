instance BuildQueryFre of BuildQueryInterface = 
 
 open 
    SyntaxFre,
    (Verb = VerbFre),
    (Lexicon = LexiconFre),
    ParadigmsFre,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "montrer") np) ;
  about_Prep = mkPrep "sur" ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "que" ;
  at_Prep = mkPrep "chez" ;

}
