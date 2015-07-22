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
  Math
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

	abs 		= DefGenCN absolute_value_CN ; 							-- the absolute value of pi
	plus terms 	= DefGenCN sum_CN (andNP terms) ; 						-- the sum of 2 , pi and 3
	power 		= raiseOp ;  									-- pi raised to 5
	power2		= DefGenCN square_CN ; 								-- the square of pi
	power3 		= DefGenCN cube_CN ; 								-- the cube of pi
	gcd numbers 	= DefGenCN greatest_common_divisor_CN (andNP numbers) ; 			-- the greatest common divisor of 30 , 6 and 8
	lcm numbers 	= DefGenCN least_common_multiple_CN (andNP numbers) ;  				-- the least common multiple of 30 , 6 and 8
	times factors 	= DefGenCN product_CN (andNP factors) ; 					-- the product of 2 , 3 and 5
	unary_minus	= DefGenCN negative_CN ;  							-- the negative of pi
	minus n1 n2	= DefGenCN difference_CN (both_and n1 n2) ; 					-- the difference of 5 and 4
	divide n1 n2 	= DefGenCN quotient_CN (both_and n1 n2) ; 					-- the quotient of pi and 2
	root 		= DefGenCNidx root_CN ; 							-- the fifth root of i
	root2 		= DefGenCN squareroot_CN ;							-- the square root of 2
	root3 		= DefGenCN cuberoot_CN ;							-- the cube root of 2
	sum v set z             = rangeOp summation_CN z (rangeOver v set) ;
        product v set z         = rangeOp product_CN z (rangeOver v set) ;       
	sum_range v x0 x1 z     = rangeOp summation_CN z (rangeBtwn v x0 x1) ; 				-- the sum of z when v ranges from x0 to x1
	product_range v x0 x1 z = rangeOp product_CN z (rangeBtwn v x0 x1) ;   				-- the product of z when v ranges from x0 to x1
}
