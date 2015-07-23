incomplete concrete BinaryOpsI of BinaryOps = GroundI **
open
Math
in {
flags
	lexer = textlit ;
	unlexer = text ;
lin

--From Arith1
	bin_plus  x y = mkNP plus_Conj x y ;                                         --mkNP x (mkAdv plus_Prep y)  ; 	        				
	bin_times x y = mkNP times_Conj x y ;                                        --mkNP x (mkAdv times_Prep y) ; 
	bin_minus x y = mkNP minus_Conj x y ;                                        --mkNP x (mkAdv minus_Prep y) ; 						
	bin_over  x y = mkNP x (mkAdv over_Prep  y) ;
	
--From Logic1
	bin_and x y  = posS (mkS and_Conj x y) ;
    bin_or  x y  = posS (mkS or_Conj  x y) ;
    bin_xor x y  = posS (mkS either7or_DConj x y) ;

--From Set1
	bin_intersect x y    	  = mkNP intersection_Conj x y ;       -- mkNP x (mkAdv intersection_Prep y) ;    -- DefGenCN intersection_CN (mkNP and_Conj x y);
	bin_union x y  	          = mkNP union_Conj x y ;              -- mkNP x (mkAdv union_Prep y) ; 	  -- DefGenCN union_CN (mkNP and_Conj x y);
	bin_cartesian_product x y = mkNP times_Conj x y ;              -- mkNP x (mkAdv times_Prep y) ; 	  -- DefGenCN cartesian_product_CN (mkNP and_Conj x y);
}
