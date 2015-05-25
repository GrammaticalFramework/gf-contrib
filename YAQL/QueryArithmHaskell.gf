--# -path=.:present

concrete QueryArithmHaskell of QueryArithm = 
  YAQLHaskell 
  - [TPast,QPWho,QPWhos,QAdv,QAdvEntity,MAssert] 
   ** open ResHaskell, Prelude in {

lincat
  MathFunction = Str ;
  Entities = Str ;

oper
  numberDomain = range "0" "1000" ;

lin
  MQuery query = start numberDomain query ;
  MWhatIs ent = start numberDomain ent ;
  MShowTerm t = start numberDomain (set t) ;

  MRelation dom range rel = 
    start numberDomain (map (abstr x_var (parenth (x_var ++ "," ++ filter (apply rel x_var) range))) dom) ;
    -- map (\x -> (x,filter (rr x) domain)) domain
  MRelRev dom range rel = 
    start numberDomain (map (abstr x_var (parenth (x_var ++ "," ++ filter (flip rel x_var) range))) dom) ;
    -- map (\x -> (x,filter (flip rr x) domain)) domain

  KNumber = domain ;
  EInteger i = i.s ;
  ENumeral n = n ;
  PEven = "even" ;
  POdd = "odd" ;
  PPrime = abstr x_var 
              (infix "&&" 
                 (infix ">" x_var "1") 
                 (apply "all" (abstr y_var (infix "/=" (apply "mod" x_var y_var) "0"))
                              (range "2" (apply "div" x_var "2")))) ;
             -- ("\\x -> x > 1 && all (\\y -> mod x y /=0) [2 .. div x 2]")
  RDivisible = abstr x_var y_var 
                 (infix "&&" (infix ">" y_var "0") (equal (apply "mod" x_var y_var) "0")) ;
  RSmaller = "(<)" ;
  RGreater = "(>)" ;

  ESum = apply "sum" ;
  EProduct = apply "product" ;
  ESquare = abstr x_var (infix "^" x_var "2") ;
  ESquareRoot = "sqrt" ;
  EFactorial = abstr x_var (apply "product" (range "1" x_var)) ;

  FMathFunction f = abstr y_var (abstr p_var (apply y_var (abstr x_var (apply p_var (apply f x_var))))) ;
  EMathFunction f e = apply f e ;

  EsTwo x y = "[" ++ x ++ "," ++ y ++ "]" ;
  EsCons x xs = infix ":" x xs ;
  EsFromTo k x y = filter (flip "elem" k) (range x y) ;
  EsAllKind k = k ;

}
