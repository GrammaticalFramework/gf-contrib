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

--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete VecCalc1LaTeX of VecCalc1 = GroundLaTeX **
open
	myFormal,
	Prelude,
	myLaTeX in
{

lin
	divergence f = mkPrec 1 ("\\nabla\\cdot" ++ f.s) ;
	grad f       = ss ("\\nabla" ++ (usePrec 1 f)) ; 
	curl f       = ss ("\\nabla\\times" ++ f.s) ;
	Laplacian f  = mkPrec 1  ("\\nabla^2" ++ (usePrec 1 f)) ;
}
