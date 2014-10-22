abstract HottLexicon = Framework ** {

flags startcat = Paragraph ;

-- lexicon
fun
  type_Sort           : Sort ;
  contractible_Pred   : Pred ;
  univalent_Pred : Pred ;
  centre_of_contraction_Fun : Fun ;
  identity_map_Fun : Fun ;
  equivalence_Pred    : Pred ;
  fiber_Fun           : Fun ;
  fiberWrt_Fun        : Ind -> Fun ;
  type_universe_Sort  : Sort ;

  id_induction_Label  : Label ;
  sigma_elimination_Label : Label ;

  mapSort             : Exp -> Sort ;
  equivalenceSort     : Exp -> Sort ;

}