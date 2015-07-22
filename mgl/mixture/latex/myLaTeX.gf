{-
  myLaTeX.gf
  wp6.2

  Created by Jordi  Saludes on 03/02/11.
-}

resource myLaTeX = 
open
	MathLaTeX,
	Prelude,
	myFormal in
{
	-- Copied from Latex.gf
oper
    noLaTeXlin = constant "[no LaTeX linearization]" ;

oper	
	command : Str -> Str = \c -> "\\" + c ;
	uFun1 : Str -> Str -> Str = \f,x -> "\\" + f ++ x ; -- fun1 can be used sometimes without braces
    sFun1 : Str -> Str -> Str = \f,x -> "\\" + f + "{" ++ x ++ "}" ;  
    sFun2 : Str -> Str -> Str -> Str = 
      \f,x,y -> "\\" + f + "{" ++ x ++ "}{" ++ y ++ "}" ;
    begin : Str -> Str = \e -> "\\begin{" + e + "}" ;   
    end : Str -> Str = \e -> "\\end{" + e + "}" ;
    inEnv : Str -> Str -> Str = \e,s -> begin e ++ s ++ end e ;
	
	-- end of Latex.gf
oper
	use : Value -> Str = usePrec highest ;

	fun1 : Str -> TermPrec -> TermPrec = 
 		\f,x -> mkPrec highest (sFun1 f (usePrec 1 x)) ;

	ufun1 : Str -> TermPrec -> TermPrec = 
		\f,x -> mkPrec highest (uFun1 f (usePrec 4 x)) ;

	funOpt1 : Str -> Str -> TermPrec -> TermPrec =
		\f,opt,x -> mkPrec highest ("\\" + f + "[" ++ opt ++ "]{" ++ x.s ++ "}") ;

	fun2 : Str -> TermPrec -> TermPrec -> TermPrec =
		\f,x,y -> let
						xp = usePrec highest x;
						yp = usePrec highest y
				  in mkPrec highest (sFun2 f xp yp) ;
			
	subOrSupS : Str -> Str  -> Str = 
		\s,t -> s + "{" ++ t ++ "}" ;
		
	subOrSup : Str -> TermPrec -> Str =
		\s,x ->  s + "{" ++ x.s ++ "}" ;
		-- \s,x ->  s + "{" ++ (usePrec highest x) ++ "}" ;
		
	subOrSupTP : Str -> TermPrec -> Str -> TermPrec =
		\s,x,n -> mkPrec x.p (x.s ++ subOrSupS s n) ;
		
	subS = subOrSupS "_" ;
	supS = subOrSupS "^" ;
	sub = subOrSup "_" ;
	sup = subOrSup "^" ;
	subTP = subOrSupTP "_" ;
	supTP = subOrSupTP "^" ;

	
	--subIdx n = subOrSupIdx "_" n.s ;
	--supIdx n = subOrSupIdx "^" n.s ;
			
	bigOp : Str -> (_,_,_:TermPrec) -> TermPrec = 
		\op,x,sb,sp -> 
			mkPrec highest ((command op) ++ (sub sb) ++ (sup sp) ++ (usePrec highest x)) ;

        bigOpRange : Str -> (_,_,_,_:TermPrec) -> TermPrec = 
	   \op,x,sb,sp,z -> 
         	mkPrec highest ((command op) ++ sub (rel "=" x sb) ++ (sup sp) ++ (usePrec 1 z)) ;  
	
	bigOpOver : Str -> (_,_,_:TermPrec) -> TermPrec = 
	    \op,x,set,z -> 
		mkPrec highest ((command op) ++ (sub (mkPrec highest (x.s ++ "\\in" ++ set.s))) ++ (usePrec 1 z)) ;  --revise??
				
	bigOpSb :  Str -> (_,_:TermPrec) -> TermPrec = 
		\op,x,sb -> 
			mkPrec highest ((command op) ++ (sub sb) ++ (usePrec 0 x)) ; --changed usePrec highest y 
					
	delimited : Str -> Str -> TermPrec -> TermPrec = 
		\od,cd,x -> mkPrec highest (od ++ (usePrec 0 x) ++ cd) ;
	
	bigDelimited : Str -> Str -> TermPrec -> TermPrec = 
		\od,cd,x -> mkPrec highest ("\\left" ++ od ++ (usePrec 0 x) ++ "\\right" ++ cd) ;
					
oper -- variants

	division : TermPrec -> TermPrec -> TermPrec =
		\x,y -> variants {fun2 "frac" x y ; infixn 2 "/" x y} ;
oper
	Value : Type = TermPrec ;
}
