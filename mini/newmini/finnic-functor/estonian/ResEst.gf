--# -path=.:../finnic
instance ResEst of ResFinnic = DiffEst ** open CommonFinnic, Prelude in {
--TODO: actual paradigms here!

oper 	

  mkN : Str -> Noun = \s -> { 
    s = \\_ => s ; 
    h = Back 
  } ;

  mkA : Str -> Adj = \s -> {
    s = \\_,_ => s ;
    h = Back ; -- Only Finnish
    i = Regular
  } ;

  mkV : Str -> Verb = \s -> {
    s = \\_ => s ; 
    h = Back 
  } ;

  mkV2 : Str -> Verb ** { c2 : Compl } = \s -> mkV s ** {
    c2 = { 
       s1,s2 = [] ;
	   ps = \\_ => [] ;
       c = NPAcc 
     } 
  } ;
}