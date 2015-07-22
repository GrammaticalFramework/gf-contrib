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
 $Date:: 2008-10-10 1#$:  Date of last commit

-}

 abstract Variables = Ground ** {
--1 Variables

fun
	x, y, z , X, Y, Z : VarNum ;
	A, B, C, D : VarSet ; 
	M, N, u, v : VarTensor ;
	f, g, h : VarFun ; 
	i, j, n : VarIndex ;
	P, Q, l : VarGeo ;
        p, q, r : Prop ; 
  
--2 Values from variables
fun	
	Var2Num : VarNum -> ValNum ;
	Var2Set : VarSet -> ValSet ; 
	Var2Fun : VarFun -> ValFun ; 
        Var2Fun3 : VarFun -> ValFun3 ;
	Var2Geo : VarGeo -> ValGeo ;
	Var2Tensor : VarTensor -> ValTensor ; 
	Var2Index : VarIndex -> Index ;

}
