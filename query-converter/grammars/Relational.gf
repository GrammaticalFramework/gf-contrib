abstract Relational = {

flags startcat = Rel ;

cat
  Rel ;
  Table ;      -- Ident in RelAlgebra.bnf
  Attribute ;  -- Ident in RelAlgebra.bnf
  Cond ;
  Exp ;
  Renaming ;
  Aggregation ;
  Function ;
  [Attribute] {1} ;
  [Exp] {1} ;
  [Aggregation] {1} ;
  [Cond] {2} ;

fun
  RTable     : Table -> Rel ;
  RSelect    : Cond -> Rel -> Rel ;
  RProject   : [Exp] -> Rel -> Rel ;
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

  CEq        : Exp -> Exp -> Cond ;
  CNEq       : Exp -> Exp -> Cond ;
  CLt        : Exp -> Exp -> Cond ;
  CGt        : Exp -> Exp -> Cond ;
  CLike      : Exp -> Exp -> Cond ;
  CNot       : Cond -> Cond ;
  CAnd       : [Cond] -> Cond ;
  COr        : [Cond] -> Cond ;

  EAttr      : Attribute -> Exp ;
  ETableAttr : Table -> Attribute -> Exp ;
  EString    : String -> Exp ;
  EInt       : Int -> Exp ;
  EFloat     : Float -> Exp ;
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

}