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
  Math,
  (L = Calculus1LaTeX),
  Prelude
in {

flags
	lexer = textlit ;
	unlexer = text ; 
	
oper
    	integral : MathObj -> MathObj = DefGenCN integral_CN ;

    	ordfl : CN -> MathIdx -> MathFunc -> MathFunc =
        	\cn,i,f -> flwrtNP (mkOrd i.v) cn f ;

   	setVarsNP : MathObj -> MathObj =
        	\set ->	variants {set ; DefSgNP (apposCN set_CN set)} ;

--1 calculus1
lin 
	diff f = mkMathFunc (flwrt derivative_CN f.v) (L.diff f.s) f;

	int f  = mkMathFunc (flwrt primitive_CN f.v) (L.int f.s) f;	

	defint set func 	= mkMathObj (integral (onSet func.v (setVarsNP set.v))) (L.defint set.s func.s) set func ;

	defint_interval f x0 x1 = mkMathObj (integral (fromTo f.v x0.v x1.v)) (L.defint_interval f.s x0.s x1.s) f x0 x1 ;

	nthdiff n f 	= mkMathFunc (ordfl iterated_derivative_CN n f.v) (L.nthdiff n.s f.s) f ;

	partialdiff n f = mkMathFunc (ordfl partial_derivative_CN n f.v) (L.partialdiff n.s f.s) f ;
}
