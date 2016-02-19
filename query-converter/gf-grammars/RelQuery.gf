abstract RelQuery = {

-- a GF version of RelAlgebra

flags startcat = Query ;

-- first, a compositional part

cat
  Query ;      -- additional startcat to select text vs. cn
  Rel ;
  [Rel] {2} ;  -- for list cartesian
  Cond ;
  [Cond] {2} ; -- for list AND and OR
  Property ; -- < Cond
  Exp ;
  [Exp] {2} ;
  Projection ;
  [Projection] {1} ;
  Renaming ;
  Aggregation ;
  Function ;
  -- Distinct ;  -- inlined in Aggr
  SortExp ;
  [SortExp] {1} ;
  TableIdent ;      -- < Ident
  AttributeIdent ;  -- < Ident
  Individual ;      -- < String

fun
  QBest : Rel -> Query ;  -- relation as text or noun, depending on complexity (uncertain of course)
  QText : Rel -> Query ;  -- relation as text, typically long
  QNoun : Rel -> Query ;  -- relation as noun, typically short

  RTable : TableIdent -> Rel ;
  RSelect : Cond -> Rel -> Rel ;
  RProject : [Projection] -> Rel -> Rel ;
  ----
  RCartesian : [Rel] -> Rel ;  -- < R x S
  ----

  CProperty : Exp -> Property -> Cond ; -- < Cond

  CEq  : Exp -> Property ;
  CNEq : Exp -> Property ;
  CLt  : Exp -> Property ;
  CGt  : Exp -> Property ;
  CLeq : Exp -> Property ;
  CGeq : Exp -> Property ;
  ----
  CNot  : Cond -> Cond ;
  CAnds : [Cond] -> Cond ;
  COrs  : [Cond] -> Cond ;

  EIdent      : AttributeIdent -> Exp ;
  EQIdent     : TableIdent -> AttributeIdent -> Exp ;
  EIndividual : Individual -> Exp ;
  EString     : String -> Exp ;
  EInt        : Int -> Exp ;
  EFloat      : Float -> Exp ;
  EAggrAll    : Function -> AttributeIdent -> Exp ; -- < EAggr
  EAggrDist   : Function -> AttributeIdent -> Exp ; -- < EAggr DISTINCT
  ----
  EAdds       : [Exp] -> Exp ;  -- > EAdd x y

  PAttr   : AttributeIdent -> Projection ;  -- < PExp
  PExp    : Exp -> Projection ;
  PRename : Exp -> AttributeIdent -> Projection ;
  ----

  -----

  FAvg   : Function ;
  FSum   : Function ;
  FMax   : Function ;
  FMin   : Function ;
  FCount : Function ;

  SEAsc  : SortExp ;
  SEDesc : SortExp ;

  AIStar : AttributeIdent ; -- * in aggregation
  
}