concrete HottLexiconLogic of HottLexicon = FrameworkLogic **
  open 
    Prelude
  in {

------ lexicon

lin
  type_Sort = "Type" ;
  type_universe_Sort = "Universe" ;
  contractible_Pred = "Contractible" ;
  univalent_Pred = "Univalent" ;
  centre_of_contraction_Fun = "CenterContraction" ;
 
  mapSort AB = appH "Map" AB ;
  equivalenceSort AB = fun1 "Equivalence" AB ;

  equivalence_Pred = "Equivalence" ;
  fiber_Fun = "fiber" ;
  fiberWrt_Fun a = "fiber" ++ parenth a.s ;
  identity_map_Fun = "id" ;

  id_induction_Label = "IdInd" ;
  sigma_elimination_Label = "SigmaEl" ;

---- should be in FrameworkEng

  the_lemma_Label = "Lemma" ;
  DefinitionTitle = "-- Definition" ;
  TheoremTitle = "-- Theorem" ; 
  LemmaTitle = "-- Lemma" ;
  ProofTitle = "-- Proof" ;
  CorollaryTitle = "-- Corollary" ;

  
}