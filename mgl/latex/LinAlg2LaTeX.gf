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


concrete LinAlg2LaTeX of LinAlg2 =  GroundLaTeX **
open
	myFormal,
	myLaTeX,
	Prelude in
{
lincat
	MatrixRow = SS ; 
	[MatrixRow] = SS;
oper
	mkVector = delimited "(" ")" ;
	mkMatrix : SS -> TermPrec = \rs -> fun1 "matrix" (constant rs.s) ;
	mkRow : ValueList -> SS = \xs -> ss ((usePrec highest (xs!Ampersand))) ; 
lin
	BaseMatrixRow r s = ss (r.s ++ "\\cr" ++ s.s) ;
	ConsMatrixRow r ts = ss (r.s ++ "\\cr" ++ ts.s) ;
	vector xs = delimited "(" ")" (xs!Comma) ; -- [ValNum] -> ValTensor ;
	vector_base = delimited "(" ")" ; 
	matrixrow = mkRow ; -- [ValNum] -> MatrixRow ;
	matrixrow_base x  = ss x.s ; -- ValNum -> MatrixRow ; -- matrix row with just a component
	matrix rs = bigDelimited "(" ")" (mkMatrix rs) ; 
	matrix_base r = delimited "(" ")" (mkMatrix r) ; -- matrix with just a row
}
