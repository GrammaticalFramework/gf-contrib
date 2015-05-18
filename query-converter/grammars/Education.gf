abstract Education = Relational ** {

fun
  TCourse      : Table ;
  TTeacher     : Table ;
  TTeaches     : Exp -> Exp -> Table ;

  AName : Attribute ;
  ACode : Attribute ;

}