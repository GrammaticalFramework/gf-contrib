instance FrameworkInstanceFre of FrameworkInterface = open
    SyntaxFre, 
    SymbolicFre,
    (Grammar = GrammarFre),
    Prelude,
    (P = ParadigmsFre), 
    (I = IrregFre), 
    (E = ExtraFre), 
    (M = MakeStructuralFre)
 in {

oper
-- instance
  hence_Adv : Adv = P.mkAdv "donc" ;
  thus_Adv : Adv = P.mkAdv "alors" ;
  let_V2V : V2V = P.mkV2V (P.mkV "laisser")  ; ----
  each_Det : Det = E.tout_Det | every_Det ; ----
  as_Subj : Subj = M.mkSubj "comme" | M.mkSubj "puisque" ;
  get_VS : VS = P.mkVS (P.mkV I.obtenir_V2) ;
  by_Prep : Prep = P.mkPrep "par" ;
  may_VV : VV = can_VV ;
  apply_V2V : V2V = P.mkV2V (P.mkV "appliquer") P.accusative (P.mkPrep "pour") ;
  suchThatS : S -> S -> S = \a,b -> Grammar.SSubjS a (M.mkSubjSubj "tel que") b ; ---- gender
  suchThatCN : CN -> S -> CN = \a,b -> mkCN a (lin Adv (ss ("tel que" ++ (mkUtt b).s))) ; ----
  calledCN : CN -> NP -> CN = \cn,np -> mkCN cn (commaAdv (mkAdv (P.mkPrep "nommé") np)) ; ----
  so_that_Subj : Subj = M.mkSubjSubj "de façon que" ;
  write_V2 = I.écrire_V2 ;

  then_Adv : Adv = P.mkAdv "alors" ;

  commaConj = M.mkConj [] "," P.plural ;

  inLabelAdv : {s : Str ; isSymbolic : Bool} -> Adv = \label -> 
    let L = (symbNP (useLabel False label))
    in
      mkAdv in_Prep L
    | mkAdv (P.mkPrep "construit dans la démonstration de") L --- hackhackhack
    ;

  mkSort : N -> SortExp = \s -> {
    cn = mkCN s ;
    postname = [] ; 
    isSymbolic = False
    } ;

  mathCN : Str -> CN = \s -> let ds = dollars s in mkCN (P.mkN ds ds P.masculine) ; 

  allNP : CN -> NP = \cn ->
    mkNP all_Predet (mkNP thePl_Det cn) ;

  postAdvS : S -> Adv -> S = \s,a ->
      lin S {s = \\m => s.s ! m ++ "," ++ a.s}
    | postNoCommaAdvS s a
    ;

  postNoCommaAdvS : S -> Adv -> S = \s,a ->
      lin S {s = \\m => s.s ! m ++ a.s}
    ;

  emptyCN : CN = mkCN (P.mkN [] [] P.masculine) ;

  indefNP : Bool -> Det -> CN -> NP = \isSymbolic,det,cn -> 
    case isSymbolic of {True => mkNP a_Det cn ; False => mkNP det cn} ;

  plainNP : CN -> NP = \cn -> mkNP (M.mkDet []) cn ;
  
  existCl : NP -> Cl = E.ExistsNP ;
  
}