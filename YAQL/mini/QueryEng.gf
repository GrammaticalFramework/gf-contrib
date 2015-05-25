concrete QueryEng of Query = {
lincat
  Query = Str ;
  Kind = Number => Str ;
  Property = {s : Str ; p : Fix} ;
  Term = {s : Str ; n : Number} ;
param
  Fix = Pre | Post ;
  Number = Sg | Pl ;
lin
  QWhich kind property = "which" ++ kind ! Pl ++ be ! Pl ++ property.s ;
  QWhether term property = be ! term.n ++ term.s ++ property.s ;
  TAll kind = {s = "all" ++ kind ! Pl ; n = Pl} ;
  TAny kind = {s = "any" ++ kind ! Sg ; n = Sg} ;
  PAnd p q = {s = p.s ++ "and" ++ q.s ; p = fix2 p.p q.p} ;
  POr p q = {s = p.s ++ "or" ++ q.s ; p = fix2 p.p q.p} ;
  PNot p = {s = "not" ++ p.s ; p = Post} ;
  KProperty property kind = \\n => case property.p of {
    Pre  => property.s ++ kind ! n ;
    Post => kind ! n ++ property.s 
    } ;
oper
  be : Number => Str = table {Sg => "is" ; Pl => "are"} ;
  prefix : Str -> {s : Str ; p : Fix}  = \s -> {s = s ; p = Pre} ;
  postfix : Str -> {s : Str ; p : Fix}  = \s -> {s = s ; p = Post} ;
  fix2 : Fix -> Fix -> Fix = \x,y -> case x of {Post => Post ; _ => y} ;
}
