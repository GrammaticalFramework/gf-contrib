{-
  myFormal.gf
  wp6.2

  Created by Jordi  Saludes on 14/02/11.
  Copied from gf 3.2 distribution 

-}

resource myFormal = open Prelude in {

-- to replace the old library Precedence

oper
	TermPrec : Type = {s : Str ; p : Prec} ;

	mkPrec : Prec -> Str -> TermPrec = \p,s -> 
		{s = s ; p = p} ;

	top : TermPrec -> Str = usePrec 0 ;

	constant : Str -> TermPrec = mkPrec highest;

	infixl : Prec -> Str -> (_,_ : TermPrec) -> TermPrec = \p,f,x,y ->
	  mkPrec p (usePrec p x ++ f ++ usePrec (nextPrec p) y) ;
	infixr : Prec -> Str -> (_,_ : TermPrec) -> TermPrec = \p,f,x,y ->
	  mkPrec p (usePrec (nextPrec p) x ++ f ++ usePrec p y) ;
	infixn : Prec -> Str -> (_,_ : TermPrec) -> TermPrec = \p,f,x,y ->
	  mkPrec p (usePrec (nextPrec p) x ++ f ++ usePrec (nextPrec p) y) ;

	prefix : Prec -> Str -> TermPrec -> TermPrec = \p,f,x ->
	  mkPrec p (f ++ usePrec p x) ;
	postfix : Prec -> Str -> TermPrec -> TermPrec = \p,f,x ->
	  mkPrec p (usePrec p x ++ f) ;

-- auxiliaries, should not be needed so much

    usePrec : Prec -> TermPrec -> Str = \p,x ->
      case lessPrec x.p p of {
        True => parenth x.s ;
        False =>  x.s
      } ;

    parenth : Str -> Str = \s -> "(" ++ s ++ ")" ;
    parenthOpt : Str -> Str = \s -> variants {s ; "(" ++ s ++ ")"} ; -- not used here

--.
-- low-level things: don't use

    Prec : PType = Predef.Ints 5 ;

    highest = 5 ;

    lessPrec : Prec -> Prec -> Bool = \p,q ->
      case <<p,q> : Prec * Prec> of {
		<5,_>                  => False ;
        <3,4> | <2,3> | <2,4>  => True ;
        <1,1> | <1,0> | <0,0>  => False ;
        <_,5> | <1,_> | <0,_>  => True ;
        _ => False
        } ;

    nextPrec : Prec -> Prec = \p -> case <p : Prec> of {
      5 => 5 ; 
      n => Predef.plus n 1
      } ;

}
