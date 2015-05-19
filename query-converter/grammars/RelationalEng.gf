concrete RelationalEng of Relational = open
    SyntaxEng,
    SymbolicEng,
    (P = ParadigmsEng),
    (M = MakeStructuralEng),
    IrregEng,
    Prelude
  in {

lincat
  Rel = NP ;
  Table = CN ; 
  Attribute = CN ;
  Cond = S ;
  Exp = NP ;
--  Renaming ;
--  Aggregation ;
--  Function ;
--  [Attribute] {1} ;
  [Exp] = NP ;
--  [Aggregation] {1} ;
--  [Cond] {2} ;

lin
  RTable t = mkNP thePl_Det t ;
  RSelect c r = mkNP r (mkAdv where_Subj c) ;
  RProject es r = mkNP es (mkAdv from_Prep r) ;
{-
  RRename    : Renaming -> Rel -> Rel ;
  RGroup     : [Attribute] -> [Aggregation] -> Rel -> Rel ;
  RSort      : [Attribute] -> Rel -> Rel ;
  RDistinct  : Rel -> Rel ;
  RUnion     : Rel -> Rel -> Rel ;
  RJoin      : Rel -> Rel -> Rel ;
  RThetaJoin : Cond -> Rel -> Rel -> Rel ;
  RIntersect : Rel -> Rel -> Rel ;
  RCartesian : Rel -> Rel -> Rel ;
  RExcept    : Rel -> Rel -> Rel ;
-}
  CEq x y = mkS (mkCl x y) ;
{-
  CNEq       : Exp -> Exp -> Cond ;
  CLt        : Exp -> Exp -> Cond ;
  CGt        : Exp -> Exp -> Cond ;
  CLike      : Exp -> Exp -> Cond ;
  CNot       : Cond -> Cond ;
  CAnd       : [Cond] -> Cond ;
  COr        : [Cond] -> Cond ;
-}
  EAttr a = mkNP the_Det a ;
  ETableAttr t a = mkNP the_Det (mkCN a (mkAdv possess_Prep (mkNP the_Det t))) ;
  EString s = symb s ;
  EInt i = symb i ;
  EFloat d = symb d ;
{-
  EAggr      : Function -> Attribute -> Exp ;
  EAdd       : [Exp] -> Exp ;
  EMul       : [Exp] -> Exp ;
  EDiv       : Exp -> Exp -> Exp ;
  ESub       : Exp -> Exp -> Exp ;

  RRelation   : Table -> Renaming ;
  RAttributes : Table -> [Attribute] -> Renaming ;
  RReplace    : Attribute -> Attribute -> Renaming ;

  AgFun : Function -> Attribute -> Exp -> Aggregation ;

  FAvg   : Function ;
  FSum   : Function ;
  FMax   : Function ;
  FMin   : Function ;
  FCount : Function ;
-}

  BaseExp e = e ;
  ConsExp e es = mkNP and_Conj e es ;

oper
  where_Subj = M.mkSubj "where" ;
  
}