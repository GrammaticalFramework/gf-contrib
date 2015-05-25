instance BuildQueryDan of BuildQueryInterface = 
 
 open 
    SyntaxDan,
    (Verb = VerbDan),
    (Lexicon = LexiconDan),
    ParadigmsDan,
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

  than_Prep = mkPrep "end" ;
  at_Prep = on_Prep ;
}
