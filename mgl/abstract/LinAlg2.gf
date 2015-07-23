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


abstract LinAlg2 = Ground ** {
--1 linalg2
-- Matrices and vectors in a row oriented fashion (using matrixrow's)

cat
	MatrixRow ;
	[MatrixRow] {2} ;

fun
	vector : [ValNum] -> ValTensor ;            -- the vector with components x, y and z
	vector_base : ValNum -> ValTensor ;         -- vector with unique component x
	matrixrow : [ValNum] -> MatrixRow ;         -- a row with components x, y and z
	matrixrow_base : ValNum -> MatrixRow ;      -- a row with unique component x
	matrix : [MatrixRow] -> ValTensor ;         -- the mtrix ith rows ...
	matrix_base : MatrixRow -> ValTensor ;      -- matrix with unique row ...
}