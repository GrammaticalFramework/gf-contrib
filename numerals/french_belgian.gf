concrete french_belgian of Numerals = {
-- include numerals.Abs.gf ;

param DForm = unit  | teen | ten ;
param Nm = sg  | pl  ;
param Place 
	= indep   -- stands by itself; as "cents" in "deux cents"
	| attr  ; -- as in "deux cent trois"

lincat Numeral    = {s : Str} ;
lincat Digit      = {inh1 : Nm;        -- Nm = pl => quarante   et un 
		                       -- Nm = sg => quatre-vingt-un
		                       -- (governs whether "et" is required between tens and units)
		     s : DForm => Str} ;
lincat Sub10      = {inh : Nm ; s : {p2 : Place} => Str} ;
lincat Sub100     = {s : Place => Str} ;
lincat Sub1000    = {s : Place => Str} ;
lincat Sub1000000 = {s : Str} ;

lin num x0 =
  {s = x0.s} ;
lin n2  =
  {inh1 = sg ; s = table {unit => "deux" ; teen => "douze" ; ten => "vingt" }} ;
lin n3  =
  {inh1 = sg ; s = table {unit => "trois" ; teen => "treize" ; ten => "trente" }} ;
lin n4  =
  {inh1 = sg ; s = table {unit => "quatre" ; teen => "quatorze" ; ten => "quarante" }} ;
lin n5  =
  {inh1 = sg ; s = table {unit => "cinq" ; teen => "quinze" ; ten => "cinquante" }} ;
lin n6  =
  {inh1 = sg ; s = table {unit => "six" ; teen => "seize" ; ten => "soixante" }} ;
lin n7  =
  {inh1 = sg ; s = table {unit => "sept" ; teen => "dix" ++ "-" ++ "sept" ; ten => "septante" }} ;
lin n8  =
  {inh1 = pl ; s = table {unit => "huit" ; teen => "dix" ++ "-" ++ "huit" ; ten => "quatre-vingt" }} ;
lin n9  =
  {inh1 = sg ; s = table {unit => "neuf" ; teen => "dix" ++ "-" ++ "neuf" ; ten => "nonante" }} ;
lin pot01  =
  {inh = sg ; 
   s = table {{p2 = indep} => "un" ; 
              {p2 = attr} => [] }};

lin pot0 d =
  {inh = pl ; 
   s = table {{p2 = indep} => d.s ! unit ; 
              {p2 = attr} => d.s ! unit }} ;

oper pluralMark = table {sg => ""; pl => "s"};

lin pot110  =
  {s = table {indep => "dix" ; attr => "dix"}} ;
lin pot111  =
  {s = table {indep => "onze" ; attr => "onze"}} ;
lin pot1to19 d =
  {s = table {indep => d.s ! teen ; attr => d.s ! teen}} ;
lin pot0as1 n =
  {s = table {indep => n.s ! {p1 = unit ; p2 = indep} ; attr => n.s ! {p1 = unit ; p2 = attr}}} ;
lin pot1 d =
  {s = table {indep => (d.s ! ten) ++ (pluralMark ! d.inh1); attr => d.s ! ten}} ;
lin pot1plus d e =
  {s = table {indep => 
		(d.s ! ten) ++ (table {{p1 = sg ; p2 = sg} => "et" ; 
				       {p1 = sg ; p2 = pl} => "-" ; 
				       {p1 = pl ; p2 = sg} => "-" ; 
				       {p1 = pl ; p2 = pl} => "-"} ! {p1 = d.inh1 ; p2 = e.inh}) ++
		e.s ! {p2 = indep} ; 
	      attr => 
		(d.s ! ten) ++ (table {{p1 = sg ; p2 = sg} => "et" ;
				       {p1 = sg ; p2 = pl} => "-" ; 
				       {p1 = pl ; p2 = sg} => "-" ; 
				       {p1 = pl ; p2 = pl} => "-"} ! {p1 = d.inh1 ; p2 = e.inh}) ++ 
		e.s ! {p2 = indep}}} ;
lin pot1as2 n =
  {s = table {indep => n.s ! indep ; attr => n.s ! attr}} ;

lin pot2 d =
  {s = table {indep => 
		(d.s ! {p1 = unit ; p2 = attr}) ++ 
		table {sg => "cent" ; pl => "cents"} ! (d.inh) ; 
	      attr => 
		(d.s ! {p1 = unit ; p2 = attr}) ++ 
		"cent"}} ;
lin pot2plus d e =
  {s = table {indep => (d.s ! {p1 = unit ; p2 = attr}) ++ "cent" ++ e.s ! indep ; 
	      attr  => (d.s ! {p1 = unit ; p2 = attr}) ++ "cent" ++ e.s ! indep}} ;
lin pot2as3 n =
  {s = n.s ! indep} ;

lin pot3 n =
  {s = (n.s ! attr) ++ "mille"} ;
lin pot3plus n m =
  {s = (n.s ! attr) ++ "mille" ++ m.s ! indep} ;

}
