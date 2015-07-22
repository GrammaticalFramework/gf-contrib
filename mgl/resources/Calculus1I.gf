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

incomplete concrete Calculus1I of Calculus1 = GroundI **
open 
  Math
in {

flags
	lexer = textlit ;
	unlexer = text ; 
	
oper
    	integral : MathObj -> MathObj = DefGenCN integral_CN ;

    	ordfl : CN -> MathIdx -> MathFunc -> MathFunc =
        	\cn,i,f -> flwrtNP (mkOrd i) cn f ;

   	 setVarsNP : MathObj -> MathObj =
        	\set ->	variants {set ; DefSgNP (apposCN set_CN set)} ;

--1 calculus1
lin 
	diff = flwrt derivative_CN ;
	int =  flwrt primitive_CN ;	
	defint set func =  integral (onSet func (setVarsNP set)) ;
	defint_interval f x0 x1 = integral (fromTo f x0 x1) ;
	nthdiff = ordfl iterated_derivative_CN ;
	partialdiff = ordfl partial_derivative_CN ;
}
