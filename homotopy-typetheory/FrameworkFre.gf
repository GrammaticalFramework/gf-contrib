concrete FrameworkFre of Framework = FormulasLatex ** FrameworkFunctor 
   - [
  plainUnivPhrase
  , LetAssumption, LetExpAssumption
  ] 
 with
  (FrameworkInterface = FrameworkInstanceFre),
  (Syntax = SyntaxFre), 
  (Symbolic = SymbolicFre),
  (Grammar = GrammarFre) 
  ** open SyntaxFre, (P = ParadigmsFre), (C = CommonRomance) in {

lin
  plainUnivPhrase vars sort = mkAdv for_Prep (mkNP thePl_Det (sortVarCN sort vars.s)) ;  -- des -> les

  LetAssumption a b = 
    lin Utt (ss (case a.s.a.n of {C.Sg => "soit" ; _ => "soient"} ++ (mkUtt a.s).s ++ (mkUtt b.s).s)) ; ---- proper imperative...
  LetExpAssumption a b =
    lin Utt (ss ("soit" ++ dollars (defineH a b))) ;


}
