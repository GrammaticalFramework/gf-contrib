concrete Integer1Fin of Integer1 =
GroundFin ** Integer1I - [factorof,remainder]
with
(Lexicon = LexiconFin),
(Math = MathFin) 
** open SyntaxFin, ParadigmsFin, (E = ExtraFin), LexiconFin in {

flags coding = utf8 ;

lin
  factorof a b = PositiveCl (mkCl a (mkVP (mkNP (E.GenNP b) factor_CN))) ;
  remainder x y = mkNP the_Det (mkCN (mkN "jako" (mkN "jäännös")) 
     (SyntaxFin.mkAdv when_Subj (mkS (mkCl x (mkVP (passiveVP (mkV2 "jakaa")) (SyntaxFin.mkAdv on_Prep y)))))) ;

}

