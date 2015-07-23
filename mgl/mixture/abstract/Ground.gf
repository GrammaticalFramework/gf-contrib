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
 $Author:: saludes    $:  Author of last commit
 $Date:: 2009-07-12 0#$:  Date of last commit

-}

--# -path=.:../mathres:prelude:resource-1.0/abstract
abstract Ground = PredefAbs ** {
--1 Basic entities and categories

--2 Values
cat
	Index ;         -- A natural number used as index.
	NamedSet;       -- A set with a proper name.
	ValNum;         -- A numeric value
    	ValFun;         -- A function value
    	ValSet;         -- A set value
    	ValTensor;      -- A vector, matrix o tensor value 
	ValFun3 ;       -- A function of 2 o 3 variables.
	ValGeo ;        -- A point line or arangement


--3 Lists of values
cat
  	[ValGeo]    {2} ;
	[ValNum]    {2} ;
	[ValSet]    {2} ;
	[ValTensor] {2} ;


--2 Variables
cat
	VarNum ;       -- A variable standing for a number
    	VarSet ;       -- A variable standing for a set
    	VarFun ; 
	VarTensor ;
	VarGeo ;						
	VarIndex ;
	[VarNum] {1} ;  -- List of numeric variables (at least one)

--2 Propositions
cat
	Prop ;         -- A proposition
    	QProp ;        -- A propistion in question form 
	SimpleProp ;   -- Not a full proposition: Could be promoted to Prop or QProp
	[Prop] {2} ; 

--3 Making clauses, props and qprops
fun 
    	mkProp : SimpleProp -> Prop ;
    	mkQProp : SimpleProp -> QProp ;


--2 Numeric literals and formulae

fun
--	int2Num : Int -> ValNum ;
	one, two, three, four, five, six, seven, eight, nine, ten : Index ;

-- Just for testing
	genElement : ValNum ;
	genFunc : ValFun ;


	At : ValFun -> ValNum -> ValNum ;    -- f at x
    
 
--3 Construct ValFun3 out of components
--    	mkFun2 : (f,g:ValFun) ->  ValFun3 ;  -- the function with components f and g
--  	mkFun3 : (f,g,h:ValFun) -> ValFun3 ; -- the function with components f, g and h


}
