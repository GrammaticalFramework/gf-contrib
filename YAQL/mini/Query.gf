abstract Query = {
flags startcat = Query ;
cat
  Query ;
  Kind ;
  Property ;
  Term ;
fun
  QWhich   : Kind -> Property -> Query ;    -- which numbers are prime
  QWhether : Term -> Property -> Query ;    -- is any number prime
  TAll : Kind -> Term ;                     -- all numbers
  TAny : Kind -> Term ;                     -- any number
  PAnd : Property -> Property -> Property ; -- even and prime
  POr  : Property -> Property -> Property ; -- even or odd
  PNot : Property -> Property ;             -- not prime
  KProperty : Property -> Kind -> Kind ;    -- even number
}
