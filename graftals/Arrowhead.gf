concrete Arrowhead of Graftal = {
  lincat
    N = {a : Str; b : Str} ;
    S = {s : Str} ;
  lin
    z = {a = A; b = B} ;
    s x = {
      a = x.b ++ R ++ x.a ++ R ++ x.b ;
      b = x.a ++ L ++ x.b ++ L ++ x.a
      } ;
    c x = {s = "newpath 300 550 moveto" ++ x.a ++ "stroke showpage"} ;
  oper
    A : Str ="0 2 rlineto" ;
    B : Str ="0 2 rlineto" ;
    L : Str = "+60 rotate" ;
    R : Str = "-60 rotate" ;
} ;