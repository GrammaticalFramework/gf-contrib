resource mySage = open
	Prelude,
	myFormal in
{
oper  
	uFun1 : Str -> Str -> Str = \f,x -> f ++ x ;  
	
--	use : Value -> Str = usePrec highest ;

	ufun1 : Str -> TermPrec -> TermPrec = 
		\f,x -> mkPrec highest (uFun1 f x.s); --(usePrec highest x)) ;

	ufun3 : Str -> TermPrec -> TermPrec = 
		\f,x -> mkPrec highest (uFun1 x.s f); 

oper	
        delimited : Str -> Str -> TermPrec -> TermPrec = 
		\od,cd,x -> mkPrec highest (od ++ (usePrec 0 x) ++ cd) ; 

	delimited_brackets: TermPrec -> TermPrec = 
		\x -> mkPrec highest ("(" ++ (usePrec 0 x) ++ ")") ;  	

	delimited_command : Str -> TermPrec -> TermPrec = 
		\com,x -> mkPrec highest (com ++ "(" ++ (usePrec 0 x) ++ ")" ) ; 

	delimited2: Str -> Str -> Str -> (_,_ : TermPrec) -> TermPrec = 
		\od,md,cd,x,y -> mkPrec highest (od ++ (usePrec 0 x) ++ md ++ (usePrec 0 y)  ++ cd) ; 

        delimited2_index: Str -> Str -> Str -> TermPrec -> Str -> TermPrec = 
		\od,md,cd,x,n -> mkPrec highest (od ++ (usePrec 0 x) ++ md ++ n  ++ cd) ; 

	delimited_withcomma : Str -> Str -> TermPrec -> TermPrec -> TermPrec =
		\od,cd,x,y -> delimited od cd (constant ((usePrec 0 x) ++ "," ++ (usePrec 0 y))) ;

	delimited_command_withcomma : Str -> TermPrec -> TermPrec -> TermPrec =
		\com,x,y -> delimited_command com (constant ((usePrec 0 x) ++ "," ++ (usePrec 0 y))) ;

	function_command: TermPrec -> TermPrec -> TermPrec =
		\expr,com -> mkPrec highest ((usePrec 0 expr) ++ "." ++ (usePrec 0 com)) ;

	division : TermPrec -> TermPrec -> TermPrec =
		\x,y -> infixn 2 "/" x y ;
		-- \x,y -> delimited2 "float(" ")/" " " x y ; -- an approximation

        command_postfix : Str -> TermPrec -> TermPrec 
		= \com, f -> mkPrec highest ((usePrec 0 f) ++ "." ++ com ++ "()") ;

oper
	RR : TermPrec -> TermPrec = 		
		\x -> delimited_command "RR" x;

--RR(x) converts x into a real number, so that the functions below can apply to symbolic constants (e,pi,...), integers,...
--trunc, ... only work for real numbers: for example 2.trunc(), e.trunc() do not work
--and such that nth-root can be applied to RR(integers)

	mapping :  Str -> TermPrec -> TermPrec = 
		\x,f ->  delimited2 "map(" ",[" "]) [0]" f (mkPrec 1 x) ; 


oper 
	isTrue  : TermPrec -> TermPrec 
			= \x	-> ufun3 "== True" x ; 

	isFalse : TermPrec -> TermPrec 
			= \x	-> ufun3 "== False" x ; 

oper
	Value   : Type = TermPrec ;

	SageFun : Type =  Value ** {var : Str ; hasVar : Bool} ;

	fun_var_hasVar 	  : Value -> Str -> SageFun     = \f,s -> f ** {var = s ; hasVar = True};
	fun_var_hasNoVar  : Value -> Str -> SageFun   	= \f,s -> f ** {var = s ; hasVar = False};

	fun_X_hasVar 	  : Value -> SageFun 	    	= \f   -> f ** {var = "X" ; hasVar = True};
	fun_X_hasNoVar    : Value -> SageFun 	     	= \f   -> f ** {var = "X" ; hasVar = False};


--	f_case : SageFun -> TermPrec =
--		\f -> case f.hasVar of {
--				True  => f ;
--				False => mkPrec 0 (f.s ++ "(" ++ f.var ++")" )
--				};

	f_function : TermPrec -> Str -> TermPrec =
		\symbexpr, var -> function_command symbexpr (delimited_command "function" (mkPrec 0 var)) ;

	f_case : SageFun -> TermPrec =
		\f -> case f.hasVar of {
				True  => f_function f f.var;
				False => f_function (mkPrec 0 (f.s ++ "(" ++ f.var ++")")) f.var 
				};

        SageFun3 : Type =  Value ** {var : Str ; hasVar : Bool} ;

	fun3_var_hasVar    : Value -> Str -> SageFun3     = \f,s -> f ** {var = s ; hasVar = True};
	fun3_var_hasNoVar  : Value -> Str -> SageFun3     = \f,s -> f ** {var = s ; hasVar = False};

	fun3_XYZ_hasVar    : Value -> SageFun 	    	= \f   -> f ** {var = "[X,Y,Z]" ; hasVar = True};
	fun3_XYZ_hasNoVar  : Value -> SageFun 	     	= \f   -> f ** {var = "[X,Y,Z]" ; hasVar = False};
        
}


