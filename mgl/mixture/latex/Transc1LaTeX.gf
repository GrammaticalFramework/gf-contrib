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

concrete Transc1LaTeX of Transc1 = GroundLaTeX **
open
	myLaTeX,
	myFormal in
{
oper
	arg : Str -> Str = \s -> "\\arg" + s ;
	mathop : Str -> Str = \s -> "\\mathop{\\rm " + s + "}" ; 
lin
	arcsinh = constant (arg "\\sinh") ;
	arccos  = constant "\\arccos" ;
	arccoth = constant (arg "\\coth") ;
	cosh    = constant "\\cosh" ;
	sec     = constant "\\sec" ;
	arccsch = constant (mathop "argcsch") ;
	tan     = constant "\\tan" ;
	arcsec  = constant "\\arcsec" ;
	ln      = constant "\\ln" ;
	csch    = constant (mathop "csch") ;
	csc     = constant "\\csc" ;
	arctan  = constant "\\arctan" ;
	arccsc  = constant (mathop "arccsc") ;
	sin     = constant "\\sin" ;
	arcsin  = constant "\\arcsin" ;
	arctanh = constant (arg "\\tanh") ;
	sinh    = constant "\\sinh" ;
	arcsech = constant (mathop "argsech") ;
	coth    = constant "\\coth" ;
	cos     = constant "\\cos" ;
	cot     = constant "\\cot" ;
	tanh    = constant "\\tanh" ;
	sech    = constant (mathop "sech") ;
	arccot  = constant (mathop "arccot") ;
	exp		= constant "\\exp" ;
	arccosh = constant (arg "\\cosh") ;
	log b    = constant ("\\log" ++ sub b) ; 
}

