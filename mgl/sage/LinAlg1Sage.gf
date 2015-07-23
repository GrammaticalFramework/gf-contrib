--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete LinAlg1Sage of LinAlg1 = GroundSage ** open 
	mySage in
{
lin
	outerproduct u v  = function_command u (delimited_command "outer_product" v)  ; 
	vectorproduct u v = function_command u (delimited_command "cross_product" v)  ; 
	scalarproduct u v = function_command u (delimited_command "dot_product" v)  ;

	determinant       = variants  { command_postfix "det" ;
                                 	command_postfix "determinant" ;  
				 	delimited_command "det" };	
	
	transpose   	  = variants  { command_postfix "transpose" ;         
				 	delimited_command "transpose" } ;    

	vector_selector i v   = ufun3 ("[" ++ i.s ++ "]") v ; 
	matrix_selector i j m =   variants{ ufun3 ("[" ++ i.s ++ "," ++ j.s ++ "]") m ;  	
					    ufun3 ("[" ++ i.s ++ "][" ++ j.s ++ "]" ) m } ;    	
                               
}
