incomplete concrete BinaryOpsNone of BinaryOps = GroundI **
open
Math
in {
flags
	lexer = textlit ;
	unlexer = text ;
lin

--For those natural languages where mkPrep and mkAdv work not as in english, and hence BinaryOpsI does not compile.

--From Arith1
	bin_plus  x y = variants{} ;
	bin_times x y = variants{} ;
	bin_minus x y = variants{} ;
	bin_over  x y = variants{} ;
	
--From Logic1
	bin_and x y  = variants{} ;
    bin_or  x y  = variants{} ;
    bin_xor x y  = variants{} ;

--From Set1
	bin_intersect x y    	  = variants{} ;
	bin_union x y  	          = variants{} ;
	bin_cartesian_product x y = variants{} ;
}
