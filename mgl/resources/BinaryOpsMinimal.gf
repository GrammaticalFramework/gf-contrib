incomplete concrete BinaryOpsMinimal of BinaryOps = GroundI **
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
	bin_over  x y =  mkNP x (mkAdv over_Prep  y) ;
	
--From Logic1
	bin_and x y  = posS (mkS and_Conj x y) ;
    bin_or  x y  = posS (mkS or_Conj  x y) ;
    bin_xor x y  = posS (mkS either7or_DConj x y) ;

--From Set1
	bin_intersect x y    	  = variants{} ;
	bin_union x y  	          = variants{} ;
	bin_cartesian_product x y = variants{} ;
}
