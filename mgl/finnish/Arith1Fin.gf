concrete Arith1Fin of Arith1 =
GroundFin **
Arith1I - [
  root,
  unary_minus,
  sum_range, product_range, sum, product
  ] 
    with
	(Lexicon = LexiconFin),
	(Syntax = SyntaxFin),
	(Symbolic = SymbolicFin),
	(Math = MathFin) **
open MathFin, LexiconFin, ParadigmsFin, (E = ExtraFin) in {
  lin 
    root = DefGenCNidxRev root_CN ;
    unary_minus x = mkNP (E.GenNP x) (mkN "vastaluku") ;

    sum x set v = 
      mkNP (mkNP (E.GenNP v) (mkN "summa")) 
           (SyntaxFin.mkAdv (postPrep genitive "yli") set) ;

    product x set v = 
      mkNP (mkNP (E.GenNP v) (mkN "tulo")) 
           (SyntaxFin.mkAdv (postPrep genitive "yli") set) ;

    sum_range x x0 x1 v = 
      mkNP (mkNP (E.GenNP v) (mkN "summa")) 
           (SyntaxFin.mkAdv when_Subj (mkS (mkCl (mkNP x) (mkV3 (mkV "vaihdella") (casePrep elative) (casePrep illative)) x0 x1))) ;

    produce_range x x0 x1 v = 
      mkNP (mkNP (E.GenNP v) (mkN "tulo")) 
           (SyntaxFin.mkAdv when_Subj (mkS (mkCl (mkNP x) (mkV3 (mkV "vaihdella") (casePrep elative) (casePrep illative)) x0 x1))) ;


}
