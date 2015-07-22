--# -path=.:../Ground:../lexicon

concrete Rounding1Sage of Rounding1 = GroundSage **
open
	mySage,
	myFormal in
{
lin
	ceiling x = variants{ 	delimited_command "ceil" x ;
                                command_postfix "ceil" (RR x) ; 
       				command_postfix "ceiling" (RR x) 
				};     

	floor x	= variants{ 	delimited_command "floor" x;
                            	command_postfix "floor" (RR x) } ;     

	trunc x	= 		command_postfix "trunc" (RR x) ;    
               
	round x	= variants{ 	delimited_command "round" x;  		  
			   	command_postfix "round" (RR x) };                 
}

