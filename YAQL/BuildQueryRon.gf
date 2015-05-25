instance BuildQueryRon of BuildQueryInterface = 
 
 open 
    SyntaxRon,
    (Verb = VerbRon),
    (Lexicon = LexiconRon),
    ParadigmsRon,
    BeschRon,
    Prelude 
 in {

flags coding = utf8 ;

oper
  showUtt : NP -> Utt = \np -> mkUtt (mkImp (dirV2 (v_besch24 "arăta")) np) ; 
  about_Prep = mkPrep "despre" Acc True ;

  nameEntity : Str -> NP = \name ->
    SyntaxRon.mkNP (mkPN name) ;

  personNameEntity : Str -> Str -> NP = \first,family ->
    nameEntity (first ++ family) | nameEntity family ;   -- Karl Marx | Marx

  than_Prep = mkPrep "decât" Acc True ; 
  at_Prep = in_Prep ; 

}
