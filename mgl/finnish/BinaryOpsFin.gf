concrete BinaryOpsFin of BinaryOps =
GroundFin **
BinaryOpsI - [bin_plus,bin_times,bin_minus,bin_over]
with
	(Lexicon = LexiconFin),
	(Syntax = SyntaxFin),
	(Symbolic = SymbolicFin),
	(Math = MathFin) ** open SyntaxFin, ParadigmsFin in {

-- replacing "x plus y" etc

flags coding = utf8 ;

lin
  bin_plus  x y = app (mkN2 (mkN "summa")) x y ;
  bin_minus x y = app (mkN2 (mkN "erotus")) x y ;
  bin_times x y = app (mkN2 (mkN "tulo")) x y ;
  bin_over  x y = app (mkN2 (mkN "osa" (mkN "määrä"))) x y ;

}

