resource ResSPARQL = open Prelude in {

oper 
  start : (_,_ : Str) -> Str = \dom,query ->
    "PREFIX" ++ dom ++ query ;

  domain = "domain" ;

  apply = overload {
    apply : Str -> (x     : Str) -> Str = \f,x -> f ++ parenth (x) ;
    apply : Str -> (x,y   : Str) -> Str = \f,x,y -> f ++ parenth (x ++ "," ++ y) ;
    apply : Str -> (x,y,z : Str) -> Str = \f,x,y,z -> f ++ parenth (x ++ "," ++ y ++ "," ++ z) ;
    apply : {s : Str ; hasSubject : Bool} -> Str -> Str = \pred,term -> case pred.hasSubject of {
      True  => pred.s ++ term ;
      False => term ++ pred.s 
      } ;
    } ;

  triple : (x,f,y : Str) -> Str = \x,f,y -> x ++ f ++ y ;

  mkVar : Str -> Str = \s -> "?" + s ;

  x_var = mkVar "x" ; 
  y_var = mkVar "y" ;
  p_var = mkVar "p" ;

  abstr = overload {
    abstr :                Str -> Str = \b     ->           "WHERE" ++ curly b ;
    abstr : (x   : Str) -> Str -> Str = \x,b   -> x      ++ "WHERE" ++ curly b ;
    abstr : (x,y : Str) -> Str -> Str = \x,y,b -> x ++ y ++ "WHERE" ++ curly b ;
    } ;

  infix : Str -> Str -> Str -> Str = \f,x,y -> parenth (x ++ f ++ y) ;
  equal : Str -> Str -> Str = infix "=" ;
  range : Str -> Str -> Str -> Str = \x,a,b -> "FILTER" ++ parenth (infix "&&" (infix "<=" a x) (infix "<=" x b)) ;

  parenth : Str -> Str = \s -> "(" ++ s ++ ")" ;
  curly   : Str -> Str = \s -> "{" ++ s ++ "}" ;

}