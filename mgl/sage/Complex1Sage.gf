concrete Complex1Sage of Complex1 = GroundSage **
open
	mySage,
	myFormal in
{ 

--2 complex1
lin
	conjugate 	= delimited_command "conjugate" ;
	real 		= variants{ 	delimited_command "real_part" ; 
					delimited_command "real" 
				  };
	imaginary 	= variants{ 	delimited_command "imag_part" ; 
					delimited_command "imag" ; 
					delimited_command "imaginary" 
				   } ;
	argument 	= delimited_command "arg";

	complex_cartesian = variants { 	delimited_command_withcomma "complex" ;  	 	-- complex(x,y)
					delimited2 "("  "+"  "*1j)";				-- x + y * 1j
					delimited_command_withcomma "CDF" };	            	-- CDF (x,y)

	complex_polar x y = mkPrec highest ((usePrec 0 x)++ "* cos(" ++ (usePrec 0 y) ++ ") +" 
					++ (usePrec 0 x) ++ "* sin(" ++ (usePrec 0 y) ++ ") * 1j" );		
												-- x*cos(y) + x*sin(y)*1j	                                      
												-- y in radians
}
