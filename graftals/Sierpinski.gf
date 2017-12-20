concrete Sierpinski of Graftal = {
  lincat
    N = {f : Str; g: Str} ;
    S = {s : Str} ;
  lin
    z = {f = F ;
         g = G ;
      } ;
    s x = {
      f = x.f ++ R ++ x.g ++ L ++ x.f ++ L ++ x.g ++ R ++ x.f ;
      g = x.g ++ x.g ;
      } ;
    c x = {s = "newpath 300 550 moveto" ++ x.f ++ R ++ x.g ++ R ++ x.g ++ "0.01 setlinewidth stroke showpage"} ;
  oper
    F : Str = "2 0 rlineto" ;
    G : Str = "2 0 rlineto" ;
    L : Str = "+120 rotate" ;
    R : Str = "-120 rotate" ;
} ;
