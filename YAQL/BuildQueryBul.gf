instance BuildQueryBul of BuildQueryInterface = 
 
 open 
    SyntaxBul,
    (Verb = VerbBul),
    (Lexicon = LexiconBul),
    (R = ResBul), ---- AR 
    ParadigmsBul,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp ( dirV2 (actionV (mkV186 "показвам") (mkV176 "покажа"))) np) ; 
  about_Prep =  mkPrep "за" R.Acc  ; 

  nameEntity : Str -> NP = \name ->
    mkNP (mkPN name R.Masc) ; ---- AR

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "от" R.Acc ;
  at_Prep = in_Prep ;

}
