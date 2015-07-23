--# -path=.:../mathres:prelude

concrete GroundSage of Ground = open
	Prelude,
	--Coordination,
	myFormal,
	mySage,
	MathSage in
{
oper
--	Value : Type = TermPrec ;
	ListValue : Type = SS ;
	use1 : Value -> SS = \x -> ss (usePrec 1 x) ;
	baseValue : Value -> Value -> ListValue = \x,y -> infixSS "," (use1 x) (use1 y) ; 
	consValue : Value -> ListValue -> ListValue = \x,xs -> infixSS "," (use1 x) xs ;

	addComa : Str -> Str -> Str = \a,b -> a ++ "," ++ b ;

	andBool : Bool -> Bool -> Bool = 	
		\x,y -> case x of {
				True  => case y of {
						True  => True ;
						False => False
						};	
				False => case y of {
						True  => False ;
						False => False
						}
				};
		
	orBool : Bool -> Bool -> Bool = 	
		\x,y -> case x of {
				True  => case y of {
						True  => True ;
						False => True
						};	
				False => case y of {
						True  => True ;
						False => False
						}
				};


	forSet : Str -> Str = \s -> "for" ++ s ++ "in" ++ "SET" ; 

lincat
	-- Integer = MathInteger ;
	Index = SS ;
	NamedSet = SS ;
	ValNum, ValTensor, ValGeo = Value ;
	VarNum = SS;
	ValSet = Value ;

	ValFun = SageFun ;					

	[ValTensor], [ValNum], [ValGeo] = ListValue;

	[VarNum] = SS; 

	[ValSet] = ListValue;

	VarFun,  VarSet, VarTensor, VarIndex, VarGeo = SS ;

	Prop, SimpleProp, QProp = Value ;
	
	[Prop] = ListValue ;

	ValFun3 = SageFun3 ; --TODO!!!!
	
lin
	-- int2Num = useNum ;

	BaseValNum, BaseValFun = baseValue ;
	ConsValNum = consValue ;

	BaseValSet x y  = baseValue x y ;
	ConsValSet x xs = consValue x xs;

	BaseProp = baseValue ;
	ConsProp = consValue ; 

	one   = ss "1" ;
	two   = ss "2" ;
	three = ss "3" ;
	four  = ss "4" ;
	five  = ss "5" ;
	six   = ss "6" ;
	seven = ss "7" ;
	eight = ss "8" ;
	nine  = ss "9" ;
	ten   = ss "10" ;

	--- mkFormulaN s = useStr (MkSymb s) ; -- #freestring
	genElement = constant "an_element" ;
	-- genFunc = constant "a_function" ;
	mkProp x = x ;
	mkQProp x = x ;

lin
	BaseVarNum = id SS ;
	ConsVarNum = infixSS "," ; 

	At f x = mkPrec highest (f.s ++ parenth (usePrec 0 x)) ;

--lin 
--        mkFun2 f g = fun3_var_hasVar (constant ( "(" ++ f.s ++ "(X)" ++ "," ++ g.s ++ "(X)" ++ ")" )) "X"  ;
} 
