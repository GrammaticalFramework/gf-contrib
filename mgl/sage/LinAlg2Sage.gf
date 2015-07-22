concrete LinAlg2Sage of LinAlg2 =  GroundSage **
open
	myFormal,
	mySage,
	Prelude in
{
lincat
	MatrixRow = SS ; 
	[MatrixRow] = SS;
lin
	BaseMatrixRow r s = ss (r.s ++ "," ++ s.s) ;
	ConsMatrixRow r ts = ss (r.s ++ "," ++ ts.s) ;
	vector xs 	= variants{ delimited "vector([" "])" (mkPrec 1 xs.s) ;   -- [ValNum] -> ValTensor ;
                                    delimited "vector((" "))" (mkPrec 1 xs.s)} ;  
				    -- delimited "[" "]" (mkPrec 1 xs.s) } ;    !!not a vector

	vector_base	= 	    delimited "vector([" "])" ; 

	matrixrow xs 	= variants{ delimited "vector([" "])" (mkPrec 1 xs.s) ;   
				    delimited "vector((" "))" (mkPrec 1 xs.s) ;  
				    delimited "[" "]" (mkPrec 1 xs.s) } ;       --it does not have to be a vector

	matrixrow_base	= variants{ delimited "vector([" "])" ;  
				    delimited "[" "]" };                        --it does not have to be a vector 

	matrix rs 	= variants{ delimited "matrix((" "))" (mkPrec 1 rs.s) ; 
				    delimited "matrix([" "])" (mkPrec 1 rs.s) };
			            	
	matrix_base r   =  variants{ delimited "matrix((" "))" (mkPrec 1 r.s) ; 
				    delimited "matrix([" "])" (mkPrec 1 r.s) };       -- matrix with just a row
}
