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
  Math
in
{
flags
	lexer = textlit ;
	unlexer = text ; 
oper
    relationAComp : (NP -> AP) -> (x,y:MathObj) -> MathCl =
        \fap,np1,np2 -> PositiveCl (mkCl np1 (fap np2)) ;

    relationbiComp : (_,_:MathObj -> AP) -> (_,_:MathObj) -> MathCl =   
        \fap1,fap2,np1,np2 -> predbiComp fap1 fap2 np1 np2 ;   --It was PositiveCl (predbiComp fap1 fap2 np1 np2) but predbiComp returns already a PositiveCl !

    relationAdA : AdA -> (NP -> AP) -> (x,y:MathObj) -> MathCl =
        \ada,fap,np1,np2 -> PositiveCl (mkCl np1 (mkAP ada (fap np2))) ;

--1 relation1
lin
	eq_num = relationPosA2 equal_to ;
	neq_num = relationNegA2 equal_to ;
	gt_num = relationAComp greater_than ;
	lt_num = relationAComp less_than ;
	geq_num = relationbiComp greater_than equal_to ;
	leq_num = relationbiComp less_than equal_to ;  
	approx = relationAdA approximately_AdA equal_to ;
}
