concrete NumeralSPARQL of Numeral = open ResSPARQL, Prelude in {

lincat 
  Numeral,
  Digit, 
  Sub10, 
  Sub100,
  Sub1000, 
  Sub1000000 
    = Str ;

lin
  num n = n ;

  n2 = "2" ;
  n3 = "3" ;
  n4 = "4" ;
  n5 = "5" ;
  n6 = "6" ;
  n7 = "7" ;
  n8 = "8" ;
  n9 = "9" ;

  pot01 = "1" ;                               -- 1
  pot0 d = d ;                                -- coercion of 2..9
  pot110 = "10" ;                             -- 10
  pot111 = "11" ;                             -- 11
  pot1to19 d = plus "10" d ;                  -- 10 + d
  pot0as1 n = n ;                             -- coercion of 1..9
  pot1 d = times "10" d  ;                    -- d * 10
  pot1plus d n = plus (times d "10") n ;      -- d * 10 + n
  pot1as2 n = n ;                             -- coercion of 1..99
  pot2 m = times m "100" ;                    -- m * 100
  pot2plus m n = plus (times m "100") n ;     -- m * 100 + n
  pot2as3 n = n ;                             -- coercion of 1..999
  pot3 m = times m "100" ;                    -- m * 1000
  pot3plus m n = plus (times m "1000") n ;    -- m * 1000 + n

-- Numerals as sequences of digits have a separate, simpler grammar

lincat 
  Dig,
  Digits 
   = Str ;

lin
  IDig d = d ; 
---  IIDig d ds = plus (times (apply "length" (apply "show" ds)) d) ds ;  -- d * 10^log_10 ds + ds

  D_0 = "0" ;
  D_1 = "1" ;
  D_2 = "2" ;
  D_3 = "3" ;
  D_4 = "4" ;
  D_5 = "5" ;
  D_6 = "6" ;
  D_7 = "7" ;
  D_8 = "8" ;
  D_9 = "9" ;

oper
  plus  : Str -> Str -> Str = infix "+" ;
  times : Str -> Str -> Str = infix "*" ;

}
