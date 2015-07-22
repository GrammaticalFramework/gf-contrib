concrete Relation1Fin of Relation1 =
GroundFin ** 
  Relation1I - [eq_num] with
(Lexicon = LexiconFin),
(Syntax = SyntaxFin),
(Math = MathFin) ** open SyntaxFin in {

lin 
  eq_num x y = <mkCl x y : Cl> ** {p = positivePol.p} ; -- x on y

}