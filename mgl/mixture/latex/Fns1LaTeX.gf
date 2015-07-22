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
 $Date:: 2008-10-07 1#$:  Date of last commit

-}

concrete Fns1LaTeX of Fns1 = GroundLaTeX **
open
	myFormal,
	myLaTeX in
{	
lin
	domain _ = noLaTeXlin ; -- not defined
	left_compose f g = infixn 0 "\\circ" f g ; 
	right_compose f g = infixn 0 "\\circ" g f ;
	range _ = noLaTeXlin ; -- not defined
	inverse f = mkPrec highest (f.s ++ sup (constant "-1")) ;   --not sure: it was constant ((usePrec 0 f) ++ sup (constant "-1")) , but that did not linearize
	left_inverse _ = noLaTeXlin ; -- not defined
	right_inverse _ = noLaTeXlin ; -- not defined
	identity = constant "id" ;
	lambda x e = constant ( x.s ++ "\\mapsto" ++ e.s) ; 
}
