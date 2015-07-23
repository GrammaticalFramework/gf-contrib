concrete Integer2Fin of Integer2 =
GroundFin ** Integer2I - [divides] with
(Lexicon = LexiconFin),
(Syntax = SyntaxFin),
(Math = MathFin) ** open SyntaxFin, ParadigmsFin in {

lin 
  divides x y = <mkCl y (mkA2 (mkA "jaollinen") (casePrep adessive)) x : Cl> ** {p = positivePol.p} ;

}