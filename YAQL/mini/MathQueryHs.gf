concrete MathQueryHs of MathQuery = QueryHs ** {
lin
  KNumber = "[0 .. 1000]" ;
  TInteger i = parenth ("\\p -> p" ++ i.s) ;
  PEven = "even" ;
  POdd = "odd" ;
  PPrime = parenth ("\\x -> x > 1 && all (\\y -> mod x y /=0) [2..div x 2]") ;
  PDivisible e = parenth ("\\x ->" ++ e ++ parenth ("\\y -> mod x y == 0")) ;
  PSmaller e = parenth ("\\x ->" ++ e ++ parenth ("x<")) ;
  PGreater e = parenth ("\\x ->" ++ e ++ parenth ("x>")) ;
}
