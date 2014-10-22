concrete HottLexiconEng of HottLexicon = FrameworkEng **
  open 
    FrameworkInstanceEng,
    SyntaxEng, SymbolicEng, Prelude,
    (P = ParadigmsEng), 
    (I = IrregEng), (E = ExtraEng), (M = MorphoEng), (G = GrammarEng)
 in {

------ lexicon

lin
  type_Sort = mkSort "type" ;
  type_universe_Sort = mkSort "type universe" ;
  contractible_Pred = mkComp (mkAP (P.mkA "contractible")) ;
  univalent_Pred = mkComp (mkAP (P.mkA "univalent")) ;
  centre_of_contraction_Fun = mkFun (mkCN (P.mkN "center") (mkAdv possess_Prep (mkNP (P.mkN "contraction")))) ;
 
  mapSort AB = mkSort "map" ** {postname = AB ; isSymbolic = True} ; 
  equivalenceSort AB = mkSort "equivalence" ** {postname = AB ; isSymbolic = True} ; 

  equivalence_Pred = mkComp (mkNP a_Det (P.mkN "equivalence")) ;
  fiber_Fun = mkFun (mkCN (P.mkN "fiber")) ;
  fiberWrt_Fun a = mkFun (mkCN (mkCN (P.mkN "fiber")) (mkAdv (P.mkPrep "with respect to") a.s)) ;
  identity_map_Fun = mkFun (mkCN (P.mkN "identity map")) ;

  id_induction_Label = mkLabel ("Id-induction") ;
  sigma_elimination_Label = mkLabel ("$ \\Sigma $ -elimination") ;

---- should be in FrameworkEng

  the_lemma_Label = mkLabel "the lemma" ;
  DefinitionTitle = "\\textbf{Definition}" ;
  TheoremTitle = "\\textbf{Theorem}" ; 
  LemmaTitle = "\\textbf{Lemma}" ;
  ProofTitle = "\\textbf{Proof}" ;
  CorollaryTitle = "\\textbf{Corollary}" ;

  
}