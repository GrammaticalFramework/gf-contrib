instance BuildQueryRus of BuildQueryInterface = 
 
 open 
    SyntaxRus,
    (Verb = VerbRus),
    (Lexicon = LexiconRus),
    ParadigmsRus,
    Prelude 
 in {

flags coding = utf8 ;

oper
--  about_Prep = mkPrep "для" ;

  showUtt : NP -> Utt = \np -> mkUtt (mkImp (dirV2 (regV perfective first "покаж" "у" "показал" "покажи" "показать" )) np) ; ---- AR
  about_Prep = mkPrep "для" genitive ; ---- case? AR


  nameEntity : Str -> NP = \name ->
    nameEntityGenAnim name masculine animate ; ----

  nameEntityGenAnim : Str -> Gender -> Animacy -> NP = \name,g,a ->
    mkNP (mkPN name g singular a) ;

  personNameEntityGen : Str -> Str -> Gender -> NP = \first,family,g ->
    nameEntityGenAnim (first ++ family) g animate | nameEntityGenAnim family g animate ;   -- Karl Marx | Marx

  personNameEntity : Str -> Str -> NP = \first,family ->
    personNameEntityGen first family masculine ; ----

  than_Prep = mkPrep "от" genitive ; ---- case? ARx
  at_Prep = in_Prep ;
}
