instance BuildQueryFin of BuildQueryInterface = 
 
 open 
    SyntaxFin,
    (Verb = VerbFin),
    (Lexicon = LexiconFin),
    ParadigmsFin,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (mkV2 "näyttää") np) ;
  about_Prep = casePrep elative ;
  than_Prep = postPrep nominative "kuin" ;
  at_Prep = on_Prep ;

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

---- additions

  nameNounEntity : N -> NP = \name ->
    mkNP (mkPN name) ;

  personNameNounEntity : Str -> N -> NP = \first,family ->
    --- mkNP the_Det (mkCN (invarA first) family) | 
    nameNounEntity family ;   -- Karl Marx | Marx


}

