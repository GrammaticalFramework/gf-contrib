concrete Calculus1Sage of Calculus1 = GroundSage **
open
	mySage,
	myFormal,
	MinMax1Sage,
	Prelude in
{
oper
        delimited3_command: Str -> SageFun -> (_,_: TermPrec) -> TermPrec =  
		\com,f,x1,x2 -> 
			mkPrec highest ( com ++ "(" ++ (f_case f).s ++ "," ++ f.var ++ "," ++ (usePrec 0 x1) ++ "," ++ (usePrec 0 x2) ++ ")" ) ;

        gfintegral: SageFun -> TermPrec =
		\f -> delimited_command_withcomma "integral" (f_case f) (mkPrec 0 f.var) ;

--2 calculus1
lin

-- Some of these functions work only for symbolic expressions, or only for symbolic expressions with variable t
  
	diff f 		= fun_var_hasVar (delimited_command "diff" (f_case f)) f.var ; 
		
	int f  		= fun_var_hasVar (gfintegral f) f.var;     
	
        defint set f 	= function_command set (delimited_command "evalboundary" (gfintegral f)) ; --(f_function (gfintegral f) f.var) );

	defint_interval = delimited3_command "integral" ;     	       							         -- integral(sin (t),t,x,y)
				 
	nthdiff n f 	= fun_var_hasVar (delimited2_index "diff(" ("," ++ f.var ++ ",")  ")" (f_case f) n.s ) f.var ;  	 -- diff( f(t) , t , 2 )
				
	partialdiff n f = fun_var_hasVar (mkPrec highest ( "diff(" ++ (f_case f).s ++ ", variable_search(" ++ n.s ++ ",'" ++ f.var ++ "'))" )) f.var ;
													 -- diff(f(x,y,z),variable_search(2,'x,y,z'))
													 -- variable_search( 2 , ( 'x,y' , sin(x) ) [0]) 
													 -- see mkFun_multidimensional at GroundSage
													 --TO DO: variable_search for ([x,y,z],f(...))
}
	
