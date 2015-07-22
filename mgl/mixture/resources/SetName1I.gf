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

incomplete concrete SetName1I of SetName1 =
GroundI **
open 
    Math,
    Prelude,
    (L = SetName1LaTeX)
in {

--1 setname1   
lin 
	set_N = mkMathCN natural_number_CN L.set_N True ;   -- namedset "N" ;
	set_P = mkMathCN prime_number_CN L.set_P True ;     -- namedset "P" ;
	set_Z = mkMathCN integer_number_CN L.set_Z True ;   -- namedset "Z" ;
	set_Q = mkMathCN rational_number_CN L.set_Q True ;  -- namedset "Q" ;
	set_R = mkMathCN real_number_CN L.set_R True ;      -- namedset "R" ;
	set_C = mkMathCN complex_number_CN L.set_C True ;   --namedset "C" ;
}
