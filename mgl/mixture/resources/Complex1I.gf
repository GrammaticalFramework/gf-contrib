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

incomplete concrete Complex1I of Complex1 =
GroundI **
open 
  Math,
  Prelude,
  (L = Complex1LaTeX) 
in {
oper
    aposCN : CN -> NP -> NP =
        \coordinate,obj -> massPl (mkCN coordinate obj) ;

--1 complex1
lin
	argument 		= appMathObj (DefGenCN argument_CN) L.argument ;

	complex_cartesian x y 	= mkMathObj (DefNPwith complex_number_CN (aposCN cartesian_coordinate_CN  (both_and x.v y.v))) ; --(L.complex_cartesian x.s y.s) x y ;

	complex_polar x y 	= mkMathObj (DefNPwith complex_number_CN (aposCN polar_coordinate_CN (both_and x.v y.v))) (L.complex_polar x.s y.s) x y ;

	conjugate 		= appMathObj (DefGenCN complex_conjugate_CN) L.conjugate ;

	real 			= appMathObj (DefGenCN real_part_CN) L.real ;

	imaginary 		= appMathObj (DefGenCN imaginary_part_CN) L.imaginary ;
}
