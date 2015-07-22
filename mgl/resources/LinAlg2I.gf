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

incomplete concrete LinAlg2I of LinAlg2 =
GroundI **
open 
  Math
in {
oper
   
 
    IndefCNwithCN : CN -> CN -> MathObj -> MathObj =
        \point,coords,obj -> 
            InDefSgNP (pointWith point (mCoords coords obj)) ; 

    DefCNwithCN1 : CN -> CN -> MathObj -> MathObj =
        \point,coord,obj -> 
            DefSgNP (pointWith point (mkNP (mkCN single_A (mkCN coord obj)))) ; 

    IndefCNwithCN1 : CN -> CN -> MathObj -> MathObj =
        \point,coord,obj -> 
            InDefSgNP (pointWith point (mkNP (mkCN (mkCN single_A coord) obj))) ;

  
--1 linalg2
lincat
	MatrixRow = MathObj ;
	ListMatrixRow = MathList ;
	
lin	
	BaseMatrixRow = baseM2 ;
	ConsMatrixRow = consM ;	
	vector terms = DefCNwithCN vector_CN element_linalg_CN (andNP terms) ;
	vector_base = DefCNwithCN1 vector_CN element_linalg_CN ;
	matrixrow terms = IndefCNwithCN row_CN element_linalg_CN (andNP terms) ;  
	matrixrow_base = IndefCNwithCN1 row_CN element_linalg_CN ; 
	matrix terms = DefNPwith matrix_CN (andNP terms) ;
	matrix_base = DefNPwith matrix_CN ;

}
