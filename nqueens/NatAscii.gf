concrete NatAscii of Nat = {

lincat Nat = Str ;

lin zero   = "" ;
    succ n = "-" ++ n ;

lincat NE = {} ;

lin plus x y = x ++ y ;

}
