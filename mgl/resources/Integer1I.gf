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
  Math
in {
--1 integer1
lin	
	factorial = DefGenCN factorial_CN ;
	factorof = Prop2NPModCNPos factor_CN ;
	quotient dd dv = DefGenCN integer_division_CN (both_and dd dv) ;
	remainder dd dv = DefGenCN remainder_CN (passiveBy divide_V2 dd dv) ;
}