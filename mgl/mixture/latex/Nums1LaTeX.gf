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

concrete Nums1LaTeX of Nums1 = GroundLaTeX **
open 
	myFormal,
	myLaTeX,
	Prelude in
{
oper
	radix : Str -> SS -> Value = \b,s -> constant (s.s ++ (subS b )) ;  --constant (s.s ++ (subS ("(" ++ b ))) ; 
lin
	nums1_e = constant "e" ;
	nums1_i = constant "i" ;
	nums1_gamma = constant "\\gamma" ;
	nums1_pi = constant "\\pi" ;
	nums1_NaN = noLaTeXlin ; -- not defined
	nums1_infinity = constant "\\infty" ;
	nums1_minus_infinity = prefix 4 "-" (constant "\\infty") ; 
	nums1_rational = division ;
	based_integer b s = radix b.s s ; --  Index -> String -> ValNum ;
	based_integer2  = radix "2" ;
	based_integer8  = radix "8" ;
	based_integer10 = radix "10" ;
	based_integer16 = radix "16" ;
}

