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

incomplete concrete Relation1I of Relation1 =
GroundI **
open 
  (L = Relation1LaTeX), (P = ParamX),
  Math,
  Prelude
in
{
flags
	lexer = textlit ;
	unlexer = text ; 

oper
    relationAComp : (NP -> AP) -> (x,y:MathObj) -> MathCl =
        \fap,np1,np2 -> PositiveCl (mkCl np1 (fap np2)) ;

    relationbiComp : (_,_:MathObj -> AP) -> (_,_:MathObj) -> MathCl =
        \fap1,fap2,np1,np2 -> predbiComp fap1 fap2 np1 np2 ;

    relationAdA : AdA -> (NP -> AP) -> (x,y:MathObj) -> MathCl =
        \ada,fap,np1,np2 -> PositiveCl (mkCl np1 (mkAP ada (fap np2))) ;

--1 relation1
lin
        eq_num x y  = mkMathCl (relationPosA2 equal_to x.v y.v) ;							--(L.eq_num x.s y.s)  False; 
	neq_num x y = mkMathCl (relationNegA2 equal_to x.v y.v) ;							--(L.neq_num x.s y.s) False; 
--

	gt_num x y  = mkMathCl (relationAComp greater_than x.v y.v) ; 							--(L.gt_num x.s y.s) False ;
	lt_num x y  = mkMathCl (relationAComp less_than x.v y.v) ; 							--(L.lt_num x.s y.s) False ;
	geq_num x y = mkMathCl (relationbiComp greater_than equal_to x.v y.v) ; 					--(L.geq_num x.s y.s) False ;
	leq_num x y = mkMathCl (relationbiComp less_than equal_to x.v y.v) ;						--(L.leq_num x.s y.s) False ; 
	approx x y  = mkMathCl (relationAdA approximately_AdA equal_to x.v y.v) ;					--(L.approx x.s y.s) False ;

}
