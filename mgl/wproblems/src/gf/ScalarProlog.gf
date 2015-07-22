concrete ScalarProlog of Scalar =
open
	Formal,
	--Precedence,
	Prelude,
	Coordination
in {

lincat
	Scalar = TermPrec ;
	Variable = TermPrec ;
	Number = TermPrec ;
	[Number] = SS ;
	Equation = TermPrec ;
	[Equation] = ListX1 ;
oper
	use1 : TermPrec -> SS = \x -> ss (usePrec 1 x) ;
	fun1 : Str -> TermPrec -> TermPrec =
		\f,x -> mkPrec highest (f + "(" ++ (usePrec 1 x) ++ ")") ;
	fun2 : Str -> (x,y:TermPrec) -> TermPrec =
		\f,x,y -> mkPrec highest (f + "(" ++ (usePrec 1 x) ++ "," ++ (usePrec 1 y) ++ ")") ;
	baseValue : TermPrec -> TermPrec -> SS = \x,y -> infixSS "," (use1 x) (use1 y) ; 
	consValue : TermPrec -> SS -> SS = \x,xs -> infixSS "," (use1 x) xs ;
	pvar : Str -> TermPrec = \ s -> fun1 "'$VAR'" (constant s); 

	ListX1 : Type = {s: Str; t: TermPrec} ;
	ListXY : Type = ListX ** {t: TermPrec} ;
	nil : TermPrec = mkPrec highest "[]" ;
	cons : TermPrec -> TermPrec -> TermPrec = fun2 "'.'" ;
	consXY : TermPrec -> ListXY -> ListXY = \x,xs ->
				(consStr "," xs x.s) ** { t = cons x xs.t } ;

	oneX1 : TermPrec -> ListX1 = \x -> {s = x.s; t = cons x nil } ;
	consX1 : TermPrec -> ListX1 -> ListX1 =
		\x,xs -> {s = x.s ++ "," ++ xs.s; t = cons x xs.t } ;

	twoXY : TermPrec -> TermPrec -> ListXY = \x,y ->
				(twoStr x.s y.s) ** { t= cons x (cons y nil) } ;

lin
	isEq = fun2 "eq" ;
	isLe = fun2 "le" ;
	areEq ns = ss ("neqs" ++ "(" ++ ns.s ++ ")") ;
lin
	nplus   = infixl 2 "+" ;
	ntimes  = infixl 3 "*" ;
	nminus  = infixl 2 "-" ;
	{- nsum ns = let
			bracket = "[" ++ ns.s1 ++ "," ++ ns.s2 ++ "]"
		in fun1 "sum" (constant bracket) ;
	-}
lin
	a = pvar "0" ; 
	b = pvar "1" ; 
	c = pvar "2" ; 
	d = pvar "3" ;
	e = pvar "4" ; 
	j = pvar "5" ;
	k = pvar "6" ;
	l = pvar "7" ;

	var2num v = constant v.s ;

	BaseNumber = baseValue ;
	ConsNumber = consValue ;
	BaseEquation = oneX1 ;
	ConsEquation = consX1 ;


	n1    = constant "1" ;
	n2    = constant "2" ;
	n3    = constant "3" ;
	n4    = constant "4" ;
	n5    = constant "5" ;
	n6    = constant "6" ;
	n7    = constant "7" ;
	n8    = constant "8" ;
	n9    = constant "9" ;
	n100  = constant "100" ;
	n300  = constant "300" ;
	n260  = constant "260" ;
	fromInt n = constant n.s ;
}