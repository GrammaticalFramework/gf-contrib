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
  Math
in {
oper
    PropNP : S -> NP =
        \prop -> DefSgNP (mkCN proposition_CN prop) ;

    negateS : Proposition -> Proposition =
        \prop -> negCl (mkCl (mkVP (mkVP true_AP) (mkAdv that_Subj prop))) ;   

--1 logic1
lin
	and = and_prop ;
	or = or_prop ;
	xor = xor_prop ;
	not = negateS ;
	implies = subjunctS ;
	equivalent p1 p2 = mkFullProp (relationPosA2 equivalent_to (PropNP p1) (PropNP p2)) ; 
	true = true_S  ;
	false = false_S ;
}
