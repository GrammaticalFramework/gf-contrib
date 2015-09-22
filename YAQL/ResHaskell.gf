resource ResHaskell = open Prelude in {

oper 
  start : (_,_ : Str) -> Str = \dom,query ->
    "let domain = " ++ dom ++ "in" ++ query ;

  domain = "domain" ;

  apply = overload {
    apply : Str -> (x     : Str) -> Str = \f,x -> parenth (f ++ x) ;
    apply : Str -> (x,y   : Str) -> Str = \f,x,y -> parenth (f ++ x ++ y) ;
    apply : Str -> (x,y,z : Str) -> Str = \f,x,y,z -> parenth (f ++ x ++ y ++ z) ;
    } ;

  x_var = "x" ; 
  y_var = "y" ;
  p_var = "p" ;
  q_var = "q" ;

  abstr = overload {
    abstr : (x   : Str) -> Str -> Str = \x,b -> parenth ("\\" ++ x ++ "->" ++ b) ;
    abstr : (x,y : Str) -> Str -> Str = \x,y,b -> parenth ("\\" ++ x ++ y ++ "->" ++ b) ;
    } ;

  infix : Str -> Str -> Str -> Str = \f,x,y -> parenth (x ++ f ++ y) ;
  equal : Str -> Str -> Str = infix "==" ;
  range : Str -> Str -> Str = \x,y -> "[" ++ x ++ ".." ++ y ++ "]" ;

  parenth : Str -> Str = \s -> "(" ++ s ++ ")" ;
  bracket : Str -> Str = \s -> "[" ++ s ++ "]" ;
  quote   : Str -> Str = \s -> "\"" + s + "\"" ;
  quotes  : Str -> Str = \s -> "\"" ++ s ++ "\"" ; -- for run time strings

  flip   : Str -> Str -> Str = \f,x -> apply "flip" f x ;
  filter : Str -> Str -> Str = \f,x -> apply "filter" f x ;
  map    : Str -> Str -> Str = \f,x -> apply "map" f x ;
  nub    : Str        -> Str = \xs  -> apply "Data.List.nub" xs ;
  take1  : Str        -> Str = \xs  -> apply "take" "1" xs ;


  mkTerm : Str -> Str -> Str = \q,s -> parenth (q ++ "," ++ s) ;
  quant  : Str -> Str = apply "fst" ;
  set    : Str -> Str = apply "snd" ;

  wunwords : Str -> Str = apply (parenth "unwords . words") ;

}