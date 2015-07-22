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

--# -path=.:../Ground:../lexicon

abstract Set1  = Ground ** {
--1 set1
-- Functions and constructors for basic set theory

fun
	cartesian_product : [ValSet] -> ValSet ;            -- the cartesian product of A, B and C

-- intended meaning: map : (number -> number) -> set -> set
	map : VarNum -> ValNum -> ValSet -> ValSet ;        -- the set of values of the form f such that x is in A
	suchthat : ValSet -> VarNum -> Prop -> ValSet ;     -- the set of x in A such that p(x)
	
    emptyset : ValSet ;                                 -- the empty set
	
    size : ValSet -> ValNum ;                           -- the size (cardinal) of A

--2 Constructors

    set : [ValNum] -> ValSet ;                          -- the set with elements x, y and z
	set_base : ValNum -> ValSet ;                       -- the set with unique element x

--2 Operations

    intersect,                                          -- the intersection of A, B and C
    union : [ValSet] -> ValSet ;             
    setdiff : ValSet -> ValSet -> ValSet ;
    
--2 Propositions 


	set1_in,                                            -- x is an element of/belongs to A
    notin : ValNum -> ValSet -> SimpleProp ; 

	subset,                                              -- A is a subset of B
	prsubset,                                           -- A is a proper subet of B
    notsubset,
    notprsubset : ValSet -> ValSet -> SimpleProp ;

{-
--3 Transfer: Binary operators equivalents
fun
	bin_intersect,
	bin_union,
	bin_cartesian_product : ValSet -> ValSet -> ValSet ;
-}
}

