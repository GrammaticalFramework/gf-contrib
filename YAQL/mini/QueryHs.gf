concrete QueryHs of Query = {
lincat
  Query, Kind, Property, Term = Str ;
lin
  QWhich kind prop = "[x | x <-" ++ kind ++ "," ++ prop ++ "x" ++ "]" ;
  QWhether term prop = term ++ prop ;
  TAll kind = parenth ("\\p -> and [p x | x <-" ++ kind ++ ", p x]") ;
  TAny kind = parenth ("\\p -> or  [p x | x <-" ++ kind ++ ", p x]") ;
  PAnd p q = parenth ("\\x ->" ++ p ++ "x &&" ++ q ++ "x") ;
  POr p q = parenth ("\\x ->" ++ p ++ "x ||" ++ q ++ "x") ;
  PNot p = parenth ("\\x -> not" ++ parenth (p ++ "x")) ;
  KProperty prop kind = "[x | x <-" ++ kind ++ "," ++ prop ++ "x" ++ "]" ;
oper
  parenth : Str -> Str = \s -> "(" ++ s ++ ")" ;
}
