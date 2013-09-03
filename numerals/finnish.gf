concrete finnish of Numerals = {
-- include numerals.Abs.gf ;

param Place = indep | attr  ;
param Nm = sg  | pl  ;
oper sata : Nm => Str =
  table {sg => "sata" ; pl => "sataa"} ;
oper tuhat : Nm => Str =
  table {sg => "tuhat" ; pl => "tuhatta"} ;
lincat Numeral = {s : Str} ;
lincat Digit = {s : Str} ;
lincat Sub10 = {inh : Nm ; s : Place => Str} ;
lincat Sub100 = {inh : Nm ; s : Place => Str} ;
lincat Sub1000 = {inh : Nm ; s : Place => Str} ;
lincat Sub1000000 = {s : Str} ;
lin num x0 =
  {s = x0.s} ;
lin n2  =
  {s = "kaksi"} ;
lin n3  =
  {s = "kolme"} ;
lin n4  =
  {s = "nelj�"} ;
lin n5  =
  {s = "viisi"} ;
lin n6  =
  {s = "kuusi"} ;
lin n7  =
  {s = "seitsem�n"} ;
lin n8  =
  {s = "kahdeksan"} ;
lin n9  =
  {s = "yhdeks�n"} ;
lin pot01  =
  {inh = sg ; s = table {attr => [] ; indep => "yksi"}} ;
lin pot0 d =
  {inh = pl ; s = table {p => d.s}} ;
lin pot110  =
  {inh = pl ; s = table {p => "kymmenen"}} ;
lin pot111  =
  {inh = pl ; s = table {p => "yksi"++"toista"}} ;
lin pot1to19 d =
  {inh = pl ; s = table {p => d.s ++ "toista"}} ;
lin pot0as1 n =
  {inh = n.inh ; s = table {p => n.s ! p}} ;
lin pot1 d =
  {inh = pl ; s = table {p => d.s ++ "kymment�"}} ;
lin pot1plus d e =
  {inh = pl ; s = table {p => d.s ++ "kymment�" ++ e.s ! indep}} ;
lin pot1as2 n =
  {inh = n.inh ; s = table {p => n.s ! p}} ;
lin pot2 d =
  {inh = pl ; s = table {p => (d.s ! attr) ++ sata ! (d.inh)}} ;
lin pot2plus d e =
  {inh = pl ; s = table {p => (d.s ! attr) ++ (sata ! (d.inh)) ++ e.s ! indep}} ;
lin pot2as3 n =
  {s = n.s ! indep} ;
lin pot3 n =
  {s = (n.s ! attr) ++ tuhat ! (n.inh)} ;
lin pot3plus n m =
  {s = (n.s ! attr) ++ (tuhat ! (n.inh)) ++ m.s ! indep} ;

}
