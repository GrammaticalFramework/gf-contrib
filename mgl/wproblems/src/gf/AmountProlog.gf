--# -path=.:present:../english:../abstract:../resources
concrete AmountProlog of Amount =
	ClassProlog,
	ScalarProlog ** 
open 
	Formal,
	Prelude,
	Coordination
in {
lincat
	Amount    = TermPrec ;
	[Amount]  = ListXY ;

oper
	unit = fun1 "unit" ;
	timesOp : (_,_:TermPrec) -> TermPrec = \x,y -> variants {
			infixl 3 "*" x y ;
			fun2 "*" x y } ;
	{-
	use1 : TermPrec -> SS = \x -> ss (usePrec 1 x) ;
	fun1 : Str -> TermPrec -> TermPrec =
		\f,x -> mkPrec highest (f ++ "(" ++ (usePrec 1 x) ++ ")") ;
	fun2 : Str -> (x,y:TermPrec) -> TermPrec =
		\f,x,y -> mkPrec highest (f ++ "(" ++ (usePrec 1 x) ++ "," ++ (usePrec 1 y) ++ ")") ;
	

	baseValue : TermPrec -> TermPrec -> SS = \x,y -> infixSS "," (use1 x) (use1 y) ; 
	consValue : TermPrec -> SS -> SS = \x,xs -> infixSS "," (use1 x) xs ;
	-}
	mkBracketList : ListXY -> Str =
		\xs -> "[" ++ xs.s1 ++ "," ++ xs.s2 ++ "]" ;
lin
	gen c k = timesOp k (unit c) ;
	some = fun1 "some" ;
	-- unknown = fun1 "unknown" ;
	avar v c = timesOp (constant v.s) (unit c) ;
	aplus ams = variants {
					constant (mkBracketList ams) ;
					ams.t } ;

	atimes k a = timesOp k a ;


	BaseAmount = twoXY ; 
	ConsAmount = consXY ; -- consStr "," xs x.s ; -- consValue ;
	
	BaseClass = baseValue ;
	ConsClass = consValue ;

lin
	twice  = timesOp (constant "2") ;
	thrice = timesOp (constant "3") ;
}