resource ParadigmsGot = GrammarGot [N,A,V] **
  open ResGot, GrammarGot, Prelude in {
oper
  masculine : Gender = Masc ;
  feminine : Gender = Fem ;
  neuter : Gender = Neutr ;
  dative : Case = Dat ;

  mkN = overload {
    mkN : (dags, dagis, daga, dag, dagos, dage, dagam, dagans : Str) -> Gender -> N
      = \x1,x2,x3,x4,x5,x6,x7,x8,g -> lin N (mkNoun x1 x2 x3 x4 x5 x6 x7 x8 g) ;
    } ;

  mkV = overload {
    mkV : (x0,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,x16 : Str) -> V =
      \x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16 ->
        lin V (mkVerb x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16) ;
    mkV : (niman, nam, nemum, nimands : Str) -> V =
      \niman, nam, nemum, nimands -> lin V (strongVerb niman nam nemum nimands);
    } ;

  mkV2 = overload {
    mkV2 : V -> V2 =
      \v -> lin V2 (v ** {c = Acc}) ;
    mvV2 : V -> Case -> V2 =
      \v,c -> lin V2 (v ** {c = c})
    } ;

  mkA = overload {
    mkA : Str -> A = \s -> mkAa s ;
    mkA : (x1,_,_,_,_,_,_,_,_,_,_,_,_,
	     _,_,_,_,_,_,_,_,_,_,_,_,_,
	     _,_,_,_,_,_,_,_,_,_,_,_,_,
	     _,_,_,_,_,_,_,_,x48 : Str) -> A
      = \x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,
      x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,
      x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,
      x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48
      -> lin A (mkAdj x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12
		  x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24
		  x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36
		  x37 x38 x39 x40 x41 x42 x43 x44 x45 x46 x47 x48) ;
    } ;

  mkAa : Str -> A = \s ->
    let
      root : Str = case s of {
	_ + ("a" | "i") + "us" => init(init(s)) + "w" ;
	_ + "s" => init(s)
	}
    in lin A {
      s = \\a,g,n,c => root + adjSuffixes ! a ! g ! n ! c
    } ;

  mkAia : Str -> A = \s ->
    let
      root : Str = case s of {
	_ + "eis" => init(init(init(s))) ;
	_ => s
	} ;
      j_rule : Str -> Str = \s ->
	case s of {
	  x + "j" => x + "i" ;
	  x + "js" => x + "eis" ;
	  x + "jis" => x + "eis" ;
	  _ => s
	}
    in lin A {
      -- Special form in Strong Feminine Nominative Singular
      s = \\a, g, n, c => case <a,g,n,c> of {
	<Strong, Fem, Sing, Nom> => j_rule(root + "i") ;
	<_, _, _, _>  => j_rule(root + "j" + adjSuffixes ! a ! g ! n ! c)
	}
    } ;

}
