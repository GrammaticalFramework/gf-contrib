{-
    Copyright 2006,2008 WebALT Inc.
    This file is part of the Mathematical Grammar Library, MGL.

    MGL is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    MGL is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with MGL.  If not, see <http://www.gnu.org/licenses/>.


 History:
 $Rev::               $:  Revision of last commit
 $Author:: caprotti   $:  Author of last commit
 $Date:: 2008-09-29 1#$:  Date of last commit

-}

incomplete concrete Arith1I of Arith1 = GroundI **
open
  Math,
  Prelude,
  (L = Arith1LaTeX)
in {
flags
	lexer = textlit ;
	unlexer = text ;

oper
    advPPartNP : (x,y:MathObj) -> V2 -> Prep -> MathObj =
        \o1,o2,v,pp ->  adverbNP (prepAdv pp o2) (mkNP o1 v) ;

    raiseOp : MathObj -> MathObj -> MathObj =
        \base,exponent -> advPPartNP base exponent raise_V2 to_Prep ;

    rangeOp : CN -> MathObj -> Adv -> MathObj =
    	\cn,obj,range -> adverbNP range (DefGenCN cn obj) ;

    rangeBtwn : MathVar -> (x0,x1:MathObj) -> Adv =
        \v,x0,x1 ->
            let
                x = useVar v ;
                cl : Cl = mkCl x range_V3 x0 x1 ;
				sen : S = mkS cl
            in mkAdv when_Subj sen;

    

lin

--1 arith1

	abs = appMathObj (DefGenCN absolute_value_CN) L.abs ;                      	-- the absolute value of pi

        plus terms =  mkMathObj (DefGenCN mean_CN (andNP terms.v)) ;	 		--inherently verbal	

	power x y = mkMathObj (raiseOp x.v y.v) (L.power x.s y.s) x y; 			-- pi raised to 5

	power2 = appMathObj (DefGenCN square_CN) L.power2 ;     			-- the square of pi

	power3 = appMathObj (DefGenCN cube_CN) L.power3 ; 				-- the cube of pi

	gcd terms = appListMathObj (DefGenCN greatest_common_divisor_CN) L.gcd terms ;                  -- the greatest common divisor of 30 , 6 and 8

	lcm terms = appListMathObj (DefGenCN least_common_multiple_CN) L.lcm terms ;  			-- the least common multiple of 30 , 6 and 8

	times terms = mkMathObj (DefGenCN product_CN (andNP terms.v)) ; 		-- inherenlty verbal: LaTex does not work (use transfer instead)

	unary_minus     = appMathObj (DefGenCN negative_CN) L.unary_minus ;             -- the negative of pi

	minus n1 n2	= mkMathObj (DefGenCN difference_CN (both_and n1.v n2.v)) (L.minus n1.s n2.s) n1 n2 ; -- the difference of 5 and 4

	divide n1 n2 	= mkMathObj (DefGenCN quotient_CN (both_and n1.v n2.v)) (L.divide n1.s n2.s) n1 n2 ; -- the quotient of pi and 2

	root x k	= mkMathObj (DefGenCNidx root_CN x.v k) (L.root x.s k.s) x ;            -- the fifth root of i

	root2 		= appMathObj (DefGenCN squareroot_CN) L.root2 ;                       -- the square root of 2

	root3 		= appMathObj (DefGenCN cuberoot_CN) L.root3 ;	                        -- the cube root of 2


	sum v set z             = mkMathObj (rangeOp summation_CN z.v (rangeOver v set.v)) (L.sum v set.s z.s) set z ;       
											      
        product v set z         = mkMathObj (rangeOp product_CN z.v (rangeOver v set.v)) (L.product v set.s z.s) set z; 
      
	sum_range v x0 x1 z     = mkMathObj (rangeOp summation_CN z.v (rangeBtwn v x0.v x1.v)) (L.sum_range v x0.s x1.s z.s) x0 x1 z ;
            														-- the sum of z when v ranges from x0 to x1
	product_range v x0 x1 z = mkMathObj (rangeOp product_CN z.v (rangeBtwn v x0.v x1.v)) (L.product_range v x0.s x1.s z.s) x0 x1 z;   
                                                                                                                    -- the product of z when v ranges from x0 to x1
 
}
