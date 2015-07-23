concrete ClassProlog of Class =
open
	Formal
	in
{lincat
	Object = TermPrec ;
	Class  = TermPrec ;
	Prop   = TermPrec ;
oper
	mfun1 : Str -> TermPrec -> TermPrec =
		\f,x -> mkPrec highest (f + "(" ++ (usePrec 1 x) ++ ")") ;
	mfun2 : Str -> (x,y:TermPrec) -> TermPrec =
		\f,x,y -> mkPrec highest (f + "(" ++ (usePrec 1 x) ++ "," ++ (usePrec 1 y) ++ ")") ;
lin
	istop = mfun1 "istopclass" ;
	isa = mfun2 "isa" ;
	subclass = mfun2 "dsubclass" ; 
}