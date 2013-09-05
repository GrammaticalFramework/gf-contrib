concrete estonian of Numerals = {

-- Note: this grammar does not glue -teist, -kümmend, ja -sada, which is
-- orthographically incorrect.
--
-- Note: 'üks' in attributive position is optional
--
-- @author Kaarel Kaljurand
-- @version 2013-09-03

flags coding=utf8;

param Place = indep | attr ;
lincat Numeral = {s : Str} ;
lincat Digit = {s : Str} ;
lincat Sub10 = {s : Place => Str} ;
lincat Sub100 = {s : Place => Str} ;
lincat Sub1000 = {s : Place => Str} ;
lincat Sub1000000 = {s : Str} ;

oper ss : Str -> {s : Str} = \s -> {s = s} ;
oper optStr : Str -> Str = \s -> variants {s ; []} ;

lin num x0 = {s = x0.s} ;

lin n2 = ss "kaks" ;
lin n3 = ss "kolm" ;
lin n4 = ss "neli" ;
lin n5 = ss "viis" ;
lin n6 = ss "kuus" ;
lin n7 = ss "seitse" ;
lin n8 = ss "kaheksa" ;
lin n9 = ss "üheksa" ;

-- 'üks' can be dropped in the attributive position, i.e. these are all OK
-- and denote the sama numeral (1100):
-- 'üks tuhat sada', 'tuhat üks sada', 'üks tuhat üks sada'
lin pot01 = {s = table {attr => optStr "üks" ; indep => "üks"}} ;

-- 2..9
lin pot0 d = {s = table {_ => d.s}} ;

-- Sub100 (10)
lin pot110 = {s = table {_ => "kümme"}} ;

-- Sub100 (11)
lin pot111 = {s = table {_ => "üks" ++ "teist"}} ;

-- Digit -> Sub100 (d -> d + teist, where d = {2..9})
lin pot1to19 d = {s = table {_ => d.s ++ "teist"}} ;

-- Sub10 -> Sub100 (1..9)
lin pot0as1 n = {s = table {p => n.s ! p}} ;

-- Digit -> Sub100 (2-9)
lin pot1 d = {s = table {_ => d.s ++ "kümmend"}} ;

-- Digit -> Sub10 -> Sub100
lin pot1plus d e = {s = table {_ => d.s ++ "kümmend" ++ e.s ! indep}} ;

-- Sub100 -> Sub1000
lin pot1as2 n = {s = table {p => n.s ! p}} ;

-- Sub10 -> Sub1000 (1..9)
lin pot2 d = {s = table {_ => (d.s ! attr) ++ "sada" }} ;

-- Sub10 -> Sub100 -> Sub1000
lin pot2plus d e = {s = table {_ => (d.s ! attr) ++ "sada" ++ e.s ! indep}} ;

lin pot2as3 n = {s = n.s ! indep} ;
lin pot3 n = {s = (n.s ! attr) ++ "tuhat"} ;
lin pot3plus n m = {s = (n.s ! attr) ++ "tuhat" ++ m.s ! indep} ;

}
