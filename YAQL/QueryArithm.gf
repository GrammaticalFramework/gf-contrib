abstract QueryArithm = 
  YAQL - [TPast,QPWho,QPWhos,QAdv,QAdvEntity,MAssert] 
  ** {

cat
  MathFunction ;  -- e -> e
  Entities ;      -- [e]
fun
  KNumber : Kind ;
  EInteger : Int -> Entity ;
  ENumeral : Numeral -> Entity ;
  PEven, POdd, PPrime : Property ;
  RDivisible : Relation ;
  RSmaller, RGreater : Relation ;
  ESum, EProduct : Entities -> Entity ;
  ESquare, ESquareRoot, EFactorial : MathFunction ; 

  FMathFunction : MathFunction -> Function ;         -- specialize to Term -> Term: the squares of all numbers
  EMathFunction : MathFunction -> Entity -> Entity ; -- specialize to Entity -> Entity: the square of 3

  EsTwo     : Entity -> Entity -> Entities ;             -- 2 and 3
  EsCons    : Entity -> Entities -> Entities ;           -- 2 and 3 and 4
  EsFromTo  : Kind -> Entity -> Entity -> Entities ;     -- the even numbers from 1 to 100
  EsAllKind : Kind   -> Entities ;                       -- all prime numbers

}
