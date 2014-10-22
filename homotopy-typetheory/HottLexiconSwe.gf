concrete HottLexiconSwe of HottLexicon = FrameworkSwe **
  open 
    SyntaxSwe, SymbolicSwe, Prelude,
    (P = ParadigmsSwe), 
    (I = IrregSwe), (E = ExtraSwe), (M = MorphoSwe), (G = GrammarSwe)
 in {

------ lexicon

lin
  type_Sort = mkSort "typ" ;
  type_universe_Sort = mkSort "typuniversum" ;
  contractible_Pred = mkComp (mkAP (P.mkA "kontraktibel")) ;
  univalent_Pred = mkComp (mkAP (P.mkA "univalent")) ;
  centre_of_contraction_Fun = mkFun (mkCN (P.mkN "kontraktionscentrum")) ;
 
  mapSort AB = mkSort "avbildning" ** {postname = AB ; isSymbolic = True} ; 
  equivalenceSort AB = mkSort "ekvivalens" ** {postname = AB ; isSymbolic = True} ; 

  equivalence_Pred = mkComp (mkNP a_Det (P.mkN "ekvivalens")) ;
  fiber_Fun = mkFun (mkCN (P.mkN "fiber")) ;
  fiberWrt_Fun a = mkFun (mkCN (mkCN (P.mkN "fiber")) (mkAdv (P.mkPrep "med avseende på") a.s)) ;
  identity_map_Fun = mkFun (mkCN (P.mkN "identitetsavbildning")) ;

  id_induction_Label = mkLabel ("Id-induktion") ;
  sigma_elimination_Label = mkLabel ("$ \\Sigma $ -elimination") ;

---- should be in FrameworkSwe
  
  the_lemma_Label = mkLabel "lemmat" ;
  DefinitionTitle = "\\textbf{Definition}" ;
  TheoremTitle = "\\textbf{Sats}" ; 
  LemmaTitle = "\\textbf{Lemma}" ;
  ProofTitle = "\\textbf{Bevis}" ;
  CorollaryTitle = "\\textbf{Följesats}" ;

}