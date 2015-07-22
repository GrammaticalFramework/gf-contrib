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

abstract Nums1  = Ground ** {
--1 nums1
-- Symbols for creating numbers, including some defined constants (i.e. nullary constructors).


--2 Named numbers
fun 
    nums1_e,
    nums1_i,
    nums1_gamma,
    nums1_pi,
    nums1_NaN,
    nums1_infinity,
    nums1_minus_infinity : ValNum ;

--2 Other
fun 
	nums1_rational : ValNum -> ValNum -> ValNum ;           -- the fraction x over y
	based_integer : Index -> String -> ValNum ;             -- the number xxx in base n

--3 Equivalents for common radices
-- based_integer2 = based_integer two

	based_integer2,                                         -- the binary number 011100
    based_integer8,
    based_integer10,
    based_integer16 : String -> ValNum ;
}

