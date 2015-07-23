--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete VecCalc1Sage of VecCalc1 = GroundSage **
open
	myFormal,
	mySage,
	Prelude in
{
lin
        divergence f    = variants{};
	grad f		= variants{};
	curl f		= variants{};
	Laplacian f 	= variants{};

{-
	divergence f 	= mkFun (delimited_command "div" (mkPrec 0 f.s))  ;  --TO DO: MANY VARIABLES
 									-- div(F) implemented in routines.sage.  F = vector([f1(x,y,z), f2(x,y,z), f3(x,z,y)])

	grad f 	      	= case f.hasVar of {
		                True  => fun3_XYZ_hasVar(delimited_command "complete3_gradient" f );
				False => fun3_XYZ_hasVar(delimited_command "complete3_gradient" (mkPrec 0 (f.s ++ "(" ++ f.var ++")")) ) 
                                };

	 
	curl f 		= fun3_XYZ_hasVar( delimited_command "curl" (mkPrec 0 f.s)); 			       	-- curl(F) implemented in routines.sage 
       								             --TO DO: MkFun with many componens??	
	Laplacian f  	= mkFun (delimited_command "div" (delimited_command "complete_vector3" (command_postfix "gradient" (function f))) ) ( var f);
														   	      -- div ( f. gradient ([x,y,z]))
-}									     --TO DO: MANY VARIABLES

}
