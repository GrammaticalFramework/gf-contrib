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

incomplete concrete LinAlg1I of LinAlg1 =
GroundI **
open 
  Math
in {
oper
    mkApp2 : CN -> (_,_:MathObj) -> MathObj =
        \cn,u,v -> DefGenCN cn (both_and u v) ;

    DefGenCNidx2 : (_,_,_:CN) -> MathObj -> (_,_:MathIdx) -> MathObj =
        \cn,cni,cnj,ob,i,j ->
            let
                ob_i	= DefGenCNidx cni ob i;
                ob_ij	= DefGenCNidx cnj ob_i j;
            in DefGenCN cn ob_ij ;

    selectOrdtwo : (_,_,_:N) -> (_,_,_:MathObj) -> MathObj =
        \noun,row,col,r,c,m -> 
            DefSgNP (possessCN (modCN (mkCN noun) 
                        (prepAdv on_Prep (both_and (mkNP (apposCN (mkCN row) r)) 
                            (mkNP (apposCN (mkCN col) c))))) m) ;


--1 linalg1
lin
	outerproduct  = mkApp2 outer_product_CN ;
	vectorproduct = mkApp2 vector_product_CN ;
	scalarproduct = mkApp2 scalar_product_CN ;
	determinant = DefGenCN determinant_CN ;
	transpose = DefGenCN transpose_CN ;
	vector_selector i vec = DefGenCNidx element_linalg_CN vec i;
	matrix_selector i j matrix = DefGenCNidx2 element_linalg_CN row_CN column_CN matrix i j ;
}
