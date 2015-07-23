concrete Calculus1Fin of Calculus1 =
GroundFin ** Calculus1I - [integral,defint_interval,defint]  
  with
   (Lexicon = LexiconFin),
   (Syntax = SyntaxFin),
   (Symbolic = SymbolicFin),
   (Math = MathFin) ** open SyntaxFin, (P = ParadigmsFin), (E = ExtraFin) in {

flags coding = utf8 ;

oper
  integral : MathObj -> MathObj = \i ->
    mkNP the_Det (mkCN integral_CN (mkAdv on_Prep (mkNP the_Det (mkCN (P.mkN "väli") i)))) ;

lin
  defint_interval f x0 x1 = 
    mkNP (mkNP (mkNP (E.GenNP f) (P.mkN "integraali")) (mkAdv from_Prep x0)) (mkAdv to_Prep x1)  ;
  defint set f =  
    mkNP (mkNP (E.GenNP f) (P.mkN "integraali")) (mkAdv (P.postPrep P.genitive "yli") set)  ;

}