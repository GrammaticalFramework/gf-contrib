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

concrete Integer1LaTeX of Integer1 = GroundLaTeX **
open 
	myFormal,
        myLaTeX in
{

--2 integer1
lin	
	factorial 	= postfix 3 "!" ;
	factorof _ _ 	= noLaTeXlin ; -- not defined 
	quotient _ _ 	= noLaTeXlin ;
	remainder x y 	= variants {
						infixn 0 "\\bmod" x y ;
						infixn 0 "\\pmod" x y } ;
}
