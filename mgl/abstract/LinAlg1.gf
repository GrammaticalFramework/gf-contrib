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

abstract LinAlg1  = Ground ** {
--1 linalg1
-- Operations on Matrices

fun

--2 Selectors
	vector_selector : Index -> ValTensor -> ValNum ; -- the nth component of v
	matrix_selector : (i,j:Index) -> ValTensor -> ValNum ;

--2 Operations
    
    outerproduct,                                   -- the outer product of u and v
    vectorproduct : (u,v:ValTensor) -> ValTensor ;
	scalarproduct : (u,v:ValTensor) -> ValNum ;     -- the scalar product of u and v

	determinant : ValTensor -> ValNum ;             -- the determinant of M
	transpose : ValTensor -> ValTensor ;            -- the transpose of M

}

