instance FrameworkInstanceEng of FrameworkInterface = open
    SyntaxEng, 
    SymbolicEng,
    (Grammar = GrammarEng),
    Prelude,
    (P = ParadigmsEng), 
    (I = IrregEng), 
    (E = ExtraEng), 
    (M = MorphoEng)
 in {

oper
-- instance
  hence_Adv : Adv = P.mkAdv "hence" ;
  thus_Adv : Adv = P.mkAdv "thus" ;
  let_V2V : V2V = P.mkV2V I.let_V P.noPrep P.noPrep ;
  each_Det : Det = lin Det (M.mkDeterminer P.singular "each") ;
  as_Subj : Subj = lin Subj (ss "as") | lin Subj (ss "because") ;
  get_VS : VS = P.mkVS I.get_V ;
  by_Prep : Prep = P.mkPrep "by" ;
  may_VV : VV = E.may_VV ;
  apply_V2V : V2V = P.mkV2V (P.mkV "apply") P.noPrep to_Prep ;
  suchThatS : S -> S -> S = \a,b -> Grammar.SSubjS a (lin Subj (ss "such that")) b ;
  suchThatCN : CN -> S -> CN = \a,b -> mkCN a (lin Adv (ss ("such that" ++ (mkUtt b).s))) ;
  calledCN : CN -> NP -> CN = \cn,np -> mkCN cn (commaAdv (mkAdv (P.mkPrep "called") np)) ;
  so_that_Subj : Subj = lin Subj (ss "so that") ;
  write_V2 = P.mkV2 I.write_V ;

  then_Adv : Adv = P.mkAdv "then" ;

  commaConj = P.mkConj "," ;

  inLabelAdv : {s : Str ; isSymbolic : Bool} -> Adv = \label -> 
    let L = (symbNP (useLabel False label))
    in
      mkAdv in_Prep L
    | mkAdv (P.mkPrep "constructed in the proof of") L --- hackhackhack
    ;

  mkSort : Str -> SortExp = \s -> {
    cn = mkCN (P.mkN s) ;
    postname = [] ; 
    isSymbolic = False
    } ;

  mathCN : Str -> CN = \s -> let ds = dollars s in mkCN (P.mkN ds ds ds ds) ; 

  allNP : CN -> NP = \cn ->
    mkNP all_Predet (mkNP aPl_Det cn) ;

  postAdvS : S -> Adv -> S = \s,a ->
      lin S (ss (s.s ++ "," ++ a.s))
    | postNoCommaAdvS s a
    ;

  postNoCommaAdvS : S -> Adv -> S = \s,a ->
    lin S (ss (s.s ++ a.s))
    ;
  
  emptyCN : CN = mkCN (P.mkN [] []) ;

  indefNP : Bool -> Det -> CN -> NP = \isSymbolic,det,cn -> 
    case isSymbolic of {True => mkNP cn ; False => mkNP det cn} ;

  plainNP : CN -> NP = \cn -> mkNP cn ;

  existCl : NP -> Cl = \np -> mkCl np ;
}