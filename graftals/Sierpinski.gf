concrete Sierpinski of Graftal = open Turtle in {
lincat N = {a : Str; b : Str} ;
lincat S = {s : Str} ;

lin z   = {a = F; b = F} ;
lin s x = {a = x.b ++ R ++ x.a ++ R ++ x.b; b =x.a ++ L ++ x.b ++ L ++ x.a} ;
lin c x = {s = step "2" ++ angle "60" ++ x.a} ;

}
