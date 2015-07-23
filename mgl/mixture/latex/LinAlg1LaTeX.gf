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

--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete LinAlg1LaTeX of LinAlg1 = GroundLaTeX ** open 
	myLaTeX,
	myFormal,
	Prelude in
{
oper
	selector1 : SS -> TermPrec -> TermPrec =
		\i,m -> mkPrec highest (m.s ++ parenth i.s) ;
	selector2 : SS -> SS -> TermPrec -> TermPrec =
		\i,j,m -> mkPrec highest (m.s ++ parenth (i.s ++ "," ++ j.s)) ;
--2 linalg1
lin
	outerproduct  = infixn 2 "\\otimes" ;
	vectorproduct = infixn 2 "\\times" ;
	scalarproduct = infixn 2 "\\cdot" ;
	determinant m = variants {
						bigDelimited "|" "|" m;
						ufun1 "det" m} ;
						
	transpose = postfix highest "^T"  ;
	vector_selector = selector1 ; 
	matrix_selector = selector2 ;
}
