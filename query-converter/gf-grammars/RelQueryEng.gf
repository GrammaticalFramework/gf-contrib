concrete RelQueryEng of RelQuery =

open
  SyntaxEng,
  SymbolicEng,
  (P = ParadigmsEng),
  (I = IrregEng),
  (G = GrammarEng),  --- for ConjCN not yet in Syntax API
  Prelude
in {

-- a GF version of RelAlgebra

lincat
  Query =    Utt ;
  Rel =      {text : Text ; cn  : CN   ; isSimple : Bool} ;
  [Rel] =    {text : Text ; cns : G.ListCN ; isSimple : Bool} ;
  Cond =     {text : Text ; s : S ; ns : S ; isSimple : Bool} ;
  [Cond] =   {text : Text ; s : S ; ns : S ; isSimple : Bool} ;
  Property = {adv : Adv} ;  -- make these to records for easy change
  Exp =      {np : NP} ;
  [Exp] =    {np : NP} ;
  Projection =   {np : NP ; cn : CN ; prep : Prep ; isCN : Bool} ;
  [Projection] = {np : NP ; cn : CN ; prep : Prep ; isCN : Bool} ;
----  Renaming ;
----  Aggregation ; 
  Function = {cn : CN ; prep : Prep} ;
----  SortExp ;
----  [SortExp] {1} ;
  TableIdent = {cn : CN} ;
  AttributeIdent = {cn : CN ; prep : Prep} ;
  Individual = {np : NP} ;

lin
  QBest rel = case rel.isSimple of {
    True  => mkUtt (mkNP thePl_Det rel.cn) ;
    False => lin Utt rel.text
    } ;
  QText rel = lin Utt rel.text ;
  QNoun rel = mkUtt (mkNP thePl_Det rel.cn) ;

  RTable ti = {
    text = mkText (mkUtt (mkNP aPl_Det ti.cn)) ;
    cn = ti.cn ;
    isSimple = True
    } ;
  RSelect cond rel = {
    text = mkText rel.text
             (mkText (mkUtt (mkImp take_V2
               (mkNP thePl_Det (mkCN row_N (mkAdv where_Subj cond.s)))))) ;
    cn = mkCN rel.cn (mkAdv where_Subj cond.s) ;
    isSimple = andB cond.isSimple rel.isSimple
    } ;
    
  
  RProject ps rel = {
    text = mkText rel.text
             (mkText (mkUtt (mkImp show_V2 ps.np))) ;
    cn = mkCN ps.cn (mkAdv ps.prep (mkNP aPl_Det rel.cn)) ;
    isSimple = andB ps.isCN rel.isSimple
    } ;

  ----
  RCartesian rels = {
    text = mkText (mkUtt (mkImp consider_V2 (mkNP all_Predet (mkNP (G.ConjCN and_Conj rels.cns))))) ;
    cn = G.ConjCN and_Conj rels.cns ;
    isSimple = rels.isSimple
    } ;
  
  ----

  BaseRel rel1 rel2 = {
    text = mkText rel1.text rel2.text ;
    cns  = G.BaseCN rel1.cn rel2.cn ;
    isSimple = andB rel1.isSimple rel2.isSimple
    } ;
    
  ConsRel rel rels = {
    text = mkText rel.text rels.text ;
    cns  = G.ConsCN rel.cn rels.cns ;
    isSimple = andB rel.isSimple rels.isSimple
    } ;

  CProperty exp prop = mkCond (mkCl exp.np prop.adv) ;

  CEq  e = mkProperty noPrep e.np ;
  CNEq e = mkProperty not_Prep e.np ;
  CLt e  = mkProperty under_Prep e.np ;
{- ----
  CGt  : Exp -> Property ;
  CLeq : Exp -> Property ;
  CGeq : Exp -> Property ;
  ----
  CNot  : Cond -> Cond ;
  CAnds : [Cond] -> Cond ;
  COrs  : [Cond] -> Cond ;
-}

  EIdent ai = {np = mkNP the_Det ai.cn} ;
  EQIdent ti ai = {np = mkNP the_Det (mkCN ti.cn (mkNP ai.cn))} ; --- apposition
  EIndividual i = i ;
  EString s = {np = symb (mkSymb s.s)} ;
  EInt i = {np = symb (mkSymb i.s)} ;
{- ----  
  EFloat      : Float -> Exp ;
  EAggrAll    : Function -> AttributeIdent -> Exp ; -- <EAggr
  EAggrDist   : Function -> AttributeIdent -> Exp ; -- <EAggr DISTINCT
  ----
  EAdds       : [Exp] -> Exp ;  -- > EAdd x y
-}

  PAttr ai = {np = mkNP the_Det ai.cn ; cn = ai.cn ; prep = ai.prep ; isCN = True} ;
{- ----
  PExp    : Exp -> Projection ;
  PRename : Exp -> AttributeIdent -> Projection ;
  ----
-}  
  BaseProjection proj = proj ;
    
  ConsProjection proj projs = {
    np = mkNP and_Conj proj.np projs.np ;
    cn = G.ConjCN and_Conj (G.BaseCN proj.cn projs.cn) ;  ---- and and and
    prep = projs.prep ;                --- the last attr gives the prep 
    isCN = andB proj.isCN projs.isCN
    } ;
{-
  -----

  FAvg   : Function ;
  FSum   : Function ;
  FMax   : Function ;
  FMin   : Function ;
  FCount : Function ;

  SEAsc  : SortExp ;
  SEDesc : SortExp ;

  AIStar : AttributeIdent ; -- * in aggregation
-}

oper
  mkCond = overload {
    mkCond : Cl -> Cond
      = \cl -> lin Cond {text = mkText (mkS cl) ; s = mkS cl ; ns = mkS negativePol cl ; isSimple = True} ;
    } ;
    
  mkProperty = overload {
    mkProperty : Prep -> NP -> Property
      = \prep,np -> lin Property {adv = mkAdv prep np} ;
    } ;

  mkTableIdent = overload {
    mkTableIdent : Str -> TableIdent
      = \s -> lin TableIdent {cn = mkCN (P.mkN s)} ;
      } ;

  mkAttributeIdent = overload {
    mkAttributeIdent : Str -> AttributeIdent
      = \s -> lin AttributeIdent {cn = mkCN (P.mkN s) ; prep = possess_Prep} ;
      } ;
      
  mkIndividual = overload {
    mkIndividual : Str -> Individual
      = \s -> lin Individual {np = mkNP (P.mkPN s)} ;
      } ;

  noPrep : Prep = P.mkPrep "" ; ---
  not_Prep : Prep = P.mkPrep "not" ; ---

  where_Subj : Subj = lin Subj (ss "where") ;

  take_V2 = P.mkV2 I.take_V ;
  show_V2 = P.mkV2 I.show_V ;
  consider_V2 = P.mkV2 "consider" ;
  row_N = P.mkN "row" ;
  
}