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

concrete Set1LaTeX of Set1 = GroundLaTeX **
open
	myLaTeX,
	myFormal in
{
oper
	setOf : Str -> Value -> Value -> Value = \v,f,a -> constant ("\\{" ++ v ++ "\\in" ++ (use a) ++ "\\mid" ++ (use f)) ;
lin
	map v x a = setOf v.s x a ; 
	suchthat _ _ _ = noLaTeXlin ; -- undefined
	emptyset = constant "\\emptyset" ; 
	size = fun1 "#" ; 
	set xs = delimited "\\{" "\\}" (mkPrec 1 xs.s) ; 
	set_base x = delimited "\\{" "\\}" x ; 

	setdiff = infixn 1 "\\setminus" ; 
	subset = infixn 1 "\\subseteq" ; 
	set1_in = infixn 1 "\\in" ;
	notin = infixn 1 "\\notin" ;
	prsubset = infixn 1 "\\subset" ;
	notsubset = infixn 1 "\\not\\subseteq" ;
	notprsubset = infixn 1 "\\not\\subset" ;

--3 Use transfer instead
lin
	cartesian_product _ = noLaTeXlin ;
	intersect _ = noLaTeXlin ;
	union _ = noLaTeXlin ;

{-	
--3 Binary operators
lin
	bin_cartesian_product = infixr 2 "\\times" ;
	bin_intersect = infixr 2 "\\cap" ;
	bin_union = infixr 1 "\\cup" ;
-}
}

