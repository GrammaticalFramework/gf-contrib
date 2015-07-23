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

abstract Arith1  = 
    Ground,
    Literals
    ** {

--1 arith1 
-- This CD defines symbols for common arithmetic functions.

fun
    abs :   ValNum   -> ValNum ;            -- the absolute value of z
    times : [ValNum] -> ValNum ;        -- the product of x, y and z
    unary_minus : ValNum -> ValNum ;    -- minus x
    plus :  [ValNum] -> ValNum ;         -- the sum of x, y and z
    gcd :   [ValNum] -> ValNum ;          -- the greatest common divisor of x, y and z
    lcm :   [ValNum] -> ValNum ;          -- the least common multiplier of x, y and z
    power : ValNum   -> ValNum -> ValNum ; -- x raised to y
    root :  ValNum   -> Index -> ValNum ;  -- the nth root of z
    minus,                              -- the difference of x and y
        divide : ValNum -> ValNum -> ValNum ;  

--3 High-order entries
-- The intended signature for these entries is
-- f : (number -> number) -> set -> number = \g s -> fold f (map g s) with f = plus, times
-- g is encoded as (VarNum,ValNum)

    sum,                               			  		-- the sum of z when x ranges over A
    	product : (x:VarNum) -> ValSet -> ValNum -> ValNum ; 

--4 Same on ranges

    sum_range,                          
    	product_range : (x:VarNum) -> (x0,x1,z:ValNum) -> ValNum ;    	-- the sum of z when x ranges from a to b
								  	-- sum_range f a b = sum f [a,b]
								  	-- product_range f a b = product f [a,b]

--2 Tranfers
fun

--3 Named roots and powers

    root2,                              -- the square root of z
    root3,                              -- the cube root of z
    power2,                             -- the square of z
    power3 : ValNum -> ValNum ;         -- the cube of z

--def
--    power x (int2num 2) = power2 x ;
		
}

