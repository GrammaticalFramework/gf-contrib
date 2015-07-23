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
 $Author:: saludes    $:  Author of last commit
 $Date:: 2008-10-05 0#$:  Date of last commit

-}

incomplete concrete Integer1I of Integer1 =
GroundI **
open 
  Math,
  Prelude,
  (L = Integer1LaTeX)
in {
--1 integer1
lin	
	factorial x 	= mkMathObj (DefGenCN factorial_CN x.v) (L.factorial x.s) x ;
	factorof x y 	= mkMathCl (Prop2NPModCNPos factor_CN x.v y.v) ; 							-- (L.factorof x.s y.s) False ;
	quotient dd dv	= mkMathObj (DefGenCN integer_division_CN (both_and dd.v dv.v)) ; 					-- (L.quotient dd.s dv.s) dd dv ;
	remainder dd dv = mkMathObj (DefGenCN remainder_CN (passiveBy divide_V2 dd.v dv.v)) (L.remainder dd.s dv.s) dd dv ;
}
