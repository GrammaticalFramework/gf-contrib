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

concrete Quant1LaTeX of Quant1 = GroundLaTeX **
open
	myLaTeX,
	myFormal,
	Prelude in 
{
oper
	logBind : Str -> Str -> Value -> Value =
		\b,s -> infixr 0 ":" (constant (b ++ s)) ; 
	forallBind = logBind "\\forall" ;
	existBind = logBind "\\exists" ;
	isIn : SS -> SS -> Str = \x,a -> (x.s ++ "\\in" ++ a.s) ;
lin
	forall vs  =  forallBind vs.s ;
	forall_set vs a = forallBind (isIn vs a) ;
	exist vs a = existBind (isIn vs a) ; 
}

