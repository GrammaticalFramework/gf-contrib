concrete Interval1Sage of Interval1 = GroundSage **
open
	mySage,
	myFormal  in
{
oper
	delimited_interval_twopoints : TermPrec -> TermPrec -> TermPrec =
		\x,y -> delimited "[" "]" (constant ((usePrec 0 x) ++ ".." ++ (usePrec 0 y))) ;

lin
	integer_interval x y =  variants {										--(a,b: ValNum) -> ValSet
                                   	 delimited_withcomma "RealSet([],interval("  "))" x y ;
                                  	 delimited "RealSet([],"  ")" (delimited_interval_twopoints x y)     
    	                           	 } ;											
	interval    x y = constant "IntervalError()" ;

	interval_oo x y = variants{ delimited_command_withcomma "RealSet.oo_interval" x y ;
			            delimited_withcomma "]" "[" x y } ;
	interval_cc x y = variants{ delimited_command_withcomma "RealSet.cc_interval" x y ;
			            delimited_withcomma "[" "]" x y } ;
	interval_oc x y = variants{ delimited_command_withcomma "RealSet.oc_interval" x y ;
			            delimited_withcomma "]" "]" x y } ;
	interval_co x y = variants{ delimited_command_withcomma "RealSet.co_interval" x y ;
			            delimited_withcomma "[" "[" x y } ;

}

