instance BuildQueryChi of BuildQueryInterface = 
 
 open 
    SyntaxChi,
    (Verb = VerbChi),
    (Lexicon = LexiconChi),
    ParadigmsChi,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "告诉") np) ;
  about_Prep = possess_Prep ; ----

  nameEntity : Str -> NP = \name ->
    SyntaxChi.mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep  "比" ; ----
  at_Prep = in_Prep ; ----
}