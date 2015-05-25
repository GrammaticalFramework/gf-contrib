instance BuildQueryCat of BuildQueryInterface = 
 
 open 
    SyntaxCat,
    (Verb = VerbCat),
    (Lexicon = LexiconCat),
    ParadigmsCat,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "mostrar") np) ;
  about_Prep = on_Prep ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = genitive ;
  at_Prep = dative ;

}
