abstract MathQuery = Query ** {
fun
  KNumber : Kind ;
  TInteger : Int -> Term ;
  PEven, POdd, PPrime : Property ;
  PDivisible : Term -> Property ;
  PSmaller, PGreater : Term -> Property ;  
}
