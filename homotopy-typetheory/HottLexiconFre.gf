concrete HottLexiconFre of HottLexicon = FrameworkFre **
  open 
    FrameworkInstanceFre,
    SyntaxFre, SymbolicFre, Prelude,
    (P = ParadigmsFre), 
    (I = IrregFre), (E = ExtraFre), (M = MorphoFre), (G = GrammarFre)
 in {

------ lexicon

lin
  type_Sort = mkSort (P.mkN "type" P.masculine) ;
  type_universe_Sort = mkSort (P.mkN "univers") ;
  contractible_Pred = mkComp (mkAP (P.mkA "contractible")) ;
  univalent_Pred = mkComp (mkAP (P.mkA "univalent")) ;
  centre_of_contraction_Fun = mkFun (mkCN (P.mkN "centre" P.masculine) (mkAdv possess_Prep (mkNP (P.mkN "contraction")))) ;
 
  mapSort AB = mkSort (P.mkN "application") ** {postname = AB ; isSymbolic = True} ; 
  equivalenceSort AB = mkSort (P.mkN "équivalence") ** {postname = AB ; isSymbolic = True} ; 

  equivalence_Pred = mkComp (mkNP a_Det (P.mkN "équivalence")) ;
  fiber_Fun = mkFun (mkCN (P.mkN "fibre")) ;
  fiberWrt_Fun a = mkFun (mkCN (mkCN (P.mkN "fibre")) (mkAdv (P.mkPrep "par rapport de") a.s)) ;
  identity_map_Fun = mkFun (mkCN (P.mkN "identité")) ;

  id_induction_Label = mkLabel ("Id-induction") ;
  sigma_elimination_Label = mkLabel ("$ \\Sigma $ -élimination") ;

---- should be in FrameworkFre

  the_lemma_Label = mkLabel "le lemme" ;
  DefinitionTitle = "\\textbf{Définition}" ;
  TheoremTitle = "\\textbf{Théorème}" ; 
  LemmaTitle = "\\textbf{Lemme}" ;
  ProofTitle = "\\textbf{Démonstration}" ;
  CorollaryTitle = "\\textbf{Corollaire}" ;

  
}