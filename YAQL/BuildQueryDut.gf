instance BuildQueryDut of BuildQueryInterface = 
 
 open 
    SyntaxDut,
    (Verb = VerbDut),
    (Lexicon = LexiconDut),
    ParadigmsDut,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "tonen") np) ;
  about_Prep = mkPrep "over" ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "dan" ;
  at_Prep = in_Prep ;
}
