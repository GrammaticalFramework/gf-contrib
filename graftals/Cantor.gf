concrete Cantor of Graftal = open Turtle in {
lincat N = {f : Str; g : Str} ;
lincat S = {s : Str} ;

lin z   = {f = F; g = J} ;
lin s x = {f = x.f ++ x.g ++ x.f; g = x.g ++ x.g ++ x.g} ;
lin c x = {s = step "1" ++ x.f} ;

}
