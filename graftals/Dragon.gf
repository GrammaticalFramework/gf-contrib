concrete Dragon of Graftal = open Turtle in {
lincat N = {x : Str; y : Str} ;
lincat S = {s : Str} ;

lin z   = {x = ""; y = ""} ;
lin s x = {x = x.x ++ R ++ x.y ++ F ++ R; y = L ++ F ++ x.x ++ L ++ x.y} ;
lin c x = {s = angle "90" ++ step "5" ++ F ++ x.x} ;

}
