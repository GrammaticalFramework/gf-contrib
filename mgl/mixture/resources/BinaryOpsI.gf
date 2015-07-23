incomplete concrete BinaryOpsI of BinaryOps = GroundI **
open
  Math,
  (L = BinaryOpsLaTeX)
in {
flags
	lexer = textlit ;
	unlexer = text ;
lin

--From Arith1
	bin_plus  x y = mkMathObj (mkNP plus_Conj x.v y.v) (L.bin_plus x.s y.s) x y ;                                  --mkNP x (mkAdv plus_Prep y)  ; 	 
        bin_times x y = mkMathObj (mkNP times_Conj x.v y.v) (L.bin_times x.s y.s) x y ;                                 --mkNP x (mkAdv times_Prep y) ; 
	bin_minus x y = mkMathObj (mkNP minus_Conj x.v y.v) (L.bin_minus x.s y.s) x y ;                                 --mkNP x (mkAdv minus_Prep y) ;  
        bin_over  x y = mkMathObj (mkNP x.v (mkAdv over_Prep  y.v)) (L.bin_over x.s y.s) x y ; 
	
--From Logic1
	bin_and x y  = posS (mkS and_Conj x y) ;
    	bin_or  x y  = posS (mkS or_Conj  x y) ;
    	bin_xor x y  = posS (mkS either7or_DConj x y) ;

--From Set1
	bin_intersect x y    	  = mkNP intersection_Conj x y ;          -- mkNP x (mkAdv intersection_Prep y) ;    -- DefGenCN intersection_CN (mkNP and_Conj x y);
	bin_union x y  	          = mkNP union_Conj x y ;              -- mkNP x (mkAdv union_Prep y) ; 	  -- DefGenCN union_CN (mkNP and_Conj x y);
	bin_cartesian_product x y = mkNP times_Conj x y ;              -- mkNP x (mkAdv times_Prep y) ; 	  -- DefGenCN cartesian_product_CN (mkNP and_Conj x y);
}
