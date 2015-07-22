
concrete Integer1Sage of Integer1 = GroundSage **
open 
	myFormal,
	mySage in
{

--2 integer1
lin	
	factorial 	= delimited_command "factorial" ;
	factorof x y	= isTrue ( delimited2 "(" "in [p for p,e in factor(" ")])" x y) ; 			 --( y in [p for p,e in factor( x )]) == True
	quotient  	= variants {		infixl 2 "/" ;  						 -- integer division
						infixl 2 "//"} ;
	remainder x y 	= variants {
						infixn 3 "%" x y ;
						delimited_command_withcomma "mod" x y} ;
}
