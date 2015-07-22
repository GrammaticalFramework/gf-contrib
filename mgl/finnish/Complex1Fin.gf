concrete Complex1Fin of Complex1 =
GroundFin ** 
  Complex1I - [complex_cartesian]
with
(Lexicon = LexiconFin),
(Syntax = SyntaxFin),
(Math = MathFin) ** open ParadigmsFin, SyntaxFin, (E = ExtraFin) in {

lin
  complex_cartesian x y = 
    mkNP the_Det (mkCN (mkN "kompleksiluku") (mkRS (mkRCl (E.GenRP pluralNum (mkCN (mkA "karteesinen") (mkN "koordinaatti"))) 
         (mkVP (mkNP and_Conj x y))))) ;

}
