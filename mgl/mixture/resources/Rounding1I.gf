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

incomplete concrete Rounding1I of Rounding1 =
GroundI **
open 
  Math,
  Prelude,
  (L = Rounding1LaTeX)
in {
--1 rounding1
lin
	ceiling  = appMathObj (DefGenCN ceiling_CN) L.ceiling ;
	floor    = appMathObj (DefGenCN floor_CN) L.floor ;
	trunc x   = mkMathObj (DefGenCN truncation_CN x.v) ;
	round    = appMathObj (DefGenCN rounding_CN) L.round ;
}
