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

--# -path=.:../Ground:../lexicon

concrete Logic1LaTeX of Logic1 = GroundLaTeX **
open
	myFormal,
	myLaTeX in
{
lin
	not = ufun1 "neg" ;
	implies = infixn 0 "\\Rightarrow" ;
	equivalent = infixn 0 "\\LeftRightarrow" ;
	true = constant "\\top" ;
	false = constant "\\bot" ;
lin
    -- Use transfer instead
	and _ = noLaTeXlin ;  
	or _  = noLaTeXlin ;
	xor _ = noLaTeXlin ;

{-
--2 Binary operators (transfer)
lin
	bin_and  = infixn 1 "\\wedge" ;
	bin_or   = infixn 1 "\\vee" ;
	bin_xor  = infixn 1 "\\otimes" ;
-}
}
