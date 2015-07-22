concrete Fns1Sage of Fns1 = GroundSage **
open
	myFormal,
	mySage, 
 	Transc1Sage,
	Prelude in 
{	
oper 
	symbolic_inverse0: Str -> Str -> SageFun =
				\s1,s2 -> fun_var_hasVar (delimited_command_withcomma "symbolic_inverse" (mkPrec 0 (s1)) (mkPrec 0 s2)) s2 ;

lin
	domain f		= case f.hasVar of {
					True  => delimited "domain_sage ("  ")"          (mkPrec 0 f.s);
					False => delimited "domain_sage ("   ".name())"  (mkPrec 0 f.s) 
					};
					-- the sage command f.domain() is only defined for piecewise-defined functions

	left_compose f g 	=
        let compose = "block_compose"
        in case f.hasVar of {
                True  => fun_var_hasNoVar (delimited_command_withcomma compose f g) f.var;
                False => fun_X_hasNoVar (delimited_command_withcomma compose f g)
            };
	right_compose f g 	= case f.hasVar of {
					True  => fun_var_hasNoVar (delimited_command_withcomma "compose" g f) f.var;
					False => fun_X_hasNoVar (delimited_command_withcomma "compose" g f)
					};

	range f			= case f.hasVar of {
					True  => delimited "range_sage ("  ")"          (mkPrec 0 f.s);
					False => delimited "range_sage ("   ".name())"  (mkPrec 0 f.s) 
					};

	inverse f 		= symbolic_inverse0 (f_case f).s f.var ;

	left_inverse  		= variants {} ; 	-- not defined
 	right_inverse 		= variants {} ; 	-- not defined

	identity		= fun_X_hasNoVar (constant "Id");    	      

	lambda x g 		= fun_var_hasVar (mapping x.s g) x.s ;                 		   -- map( g ,[ x ])[0]   (in sage x can be list of variables)
			
 						-- maybe variant: fun_var_hasVar (mkPrec highest ("f = lambda" ++ x.s ++ ":" ++ g.s ++ "; f(" ++ x.s ++ ")" )) x.s; 
												   -- f=lambda x: g(x); f(x)
	
}
