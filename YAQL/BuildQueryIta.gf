instance BuildQueryIta of BuildQueryInterface = 
 
 open 
    SyntaxIta,
    (Verb = VerbIta),
    (Lexicon = LexiconIta),
    ParadigmsIta,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "mostrare") np) ;
  about_Prep = su_Prep ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = di_Prep ;
  at_Prep = da_Prep ;

}
