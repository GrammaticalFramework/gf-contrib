concrete Integer2Sage of Integer2 = GroundSage **
open 
	mySage in
{
--2 integer2
lin
	divides x y = variants{ 	isTrue (function_command x (delimited_command "divides" y)) ;           -- y . divides ( x ) == True
					isTrue ( delimited2 "(" "in divisors(" "))" x y )   }; 			-- ( y in divisors( x )) == True
} 

