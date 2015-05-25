concrete MathQueryEng of MathQuery = QueryEng ** {
lin
  KNumber = table {Sg => "number" ; Pl => "numbers"} ;
  TInteger i = {s = i.s ; n = Sg} ;
  PEven = prefix "even" ;
  POdd = prefix "odd" ;
  PPrime = prefix "prime" ;
  PDivisible term = postfix ("divisible by" ++ term.s) ;
  PSmaller term = postfix ("smaller than" ++ term.s) ;
  PGreater term = postfix ("greater than" ++ term.s) ;
}
