concrete Integer1Fin of Integer1 =
GroundFin ** Integer1I - [factorof]
with
(Lexicon = LexiconFin),
(Math = MathFin) 
** open SyntaxFin, ParadigmsFin, (E = ExtraFin), LexiconFin in {

lin
  factorof a b = mkMathCl (PositiveCl (mkCl a.v (mkVP (mkNP (E.GenNP b.v) factor_CN)))) ; --(L.factorof a.s b.s) False ;

}

