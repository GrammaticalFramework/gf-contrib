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


incomplete concrete Logic1I of Logic1 =
GroundI **
open 
  Math,
  Prelude,
  (L = Logic1LaTeX),
  ParamX
in {
oper
    PropNP : S -> NP =
        \prop -> DefSgNP (mkCN proposition_CN prop) ;

    negateS : Proposition -> MathCl = \prop -> NegativeCl (mkCl (mkVP (mkVP true_AP) (mkAdv that_Subj prop)) );
   
--1 logic1
lin
	and propl       = mkFullPropPlus (and_prop propl.v) ;                         --  appListProp and_prop L.and propl False;
	or propl	= mkFullPropPlus (or_prop propl.v) ;                          --  appListProp or_prop L.or propl False ;
	xor propl 	= mkFullPropPlus (xor_prop propl.v) ; 			      -- appListProp xor_prop L.xor propl False ;
	not p 		= mkFullPropPlus (negateS p.v) (L.not p.s) p ;
        implies p1 p2 	= mkFullPropPlus (subjunctS p1.v p2.v) (L.implies p1.s p2.s) p1 p2 ;
	equivalent p1 p2 = mkFullPropPlus (mkFullProp (relationPosA2 equivalent_to (PropNP p1.v) (PropNP p2.v))) (L.equivalent p1.s p2.s) p1 p2 ; 
        true 		= mkFullPropPlus true_S L.true True ;
	false 		= mkFullPropPlus false_S L.false True ;
}
