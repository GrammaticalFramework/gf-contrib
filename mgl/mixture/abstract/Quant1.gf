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


abstract Quant1  = Variables ** {
--1 quant1
-- Basic universal and existential quantifiers.

fun
	forall 	   : [VarNum] -> Prop -> Prop ;                  -- for all x, y and z, x^2 + y^2 < z. 
	forall_set : [VarNum] -> ValSet -> Prop -> Prop ;   	 -- for all x, y and z in A, p.
	exist	   : [VarNum] -> ValSet -> Prop -> Prop ;        -- exist x, y in A such that x^2+y^2=25 .
}

