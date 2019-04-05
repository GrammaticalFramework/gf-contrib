concrete Koch of Graftal = open Turtle in {
lincat N = {f : Str} ;
lincat S = {s : Str} ;

lin z   = {f = F} ;
lin s x = {f = x.f ++ L ++ x.f ++ R ++ x.f ++ R ++ x.f ++ L ++ x.f} ;
lin c x = {s = step "2" ++ angle "90" ++ x.f} ;

}
