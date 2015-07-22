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

incomplete concrete Transc1I of Transc1 =
GroundI **
open 
  Math,
  Prelude,
  (L = Transc1LaTeX)
in {

--1 transc1
lin
	arccos 	= mkMathFunc (named_fn arccosine_CN) L.arccos True ;
	arccosh = mkMathFunc (named_fn (f_inverse (hyperbolic cosine_CN))) L.arccosh True ;
	arccot 	= mkMathFunc (named_fn arccotangent_CN) L.arccot True ;
    	arccoth = mkMathFunc (named_fn (f_inverse (hyperbolic cotangent_CN))) L.arccoth True ;
	arccsc 	= mkMathFunc (named_fn arccosecant_CN) L.arccsc True ; 
	arccsch = mkMathFunc (named_fn (f_inverse (hyperbolic cosecant_CN))) L.arccsch True ;
	arcsec 	= mkMathFunc (named_fn arcsecant_CN) L.arcsec True ; 
	arcsech = mkMathFunc (named_fn (f_inverse (hyperbolic secant_CN))) L.arcsech True;
	arcsin 	= mkMathFunc (named_fn arcsine_CN) L.arcsin True ;
	arcsinh = mkMathFunc (named_fn (f_inverse (hyperbolic sine_CN))) L.arcsinh True ;
	arctan 	= mkMathFunc (named_fn arctangent_CN) L.arctan True ;
	arctanh = mkMathFunc (named_fn (f_inverse (hyperbolic tangent_CN))) L.arctanh True ;
	csc 	= mkMathFunc (named_fn cosecant_CN) L.arccsc True ; 
	csch 	= mkMathFunc (named_fn (hyperbolic cosecant_CN)) L.arccsch True ;
	cos 	= mkMathFunc (named_fn cosine_CN) L.cos True ;
	cosh 	= mkMathFunc (named_fn (hyperbolic cosine_CN)) L.cosh True ;
	cot 	= mkMathFunc (named_fn cotangent_CN) L.cot True ;
	coth 	= mkMathFunc (named_fn (hyperbolic cotangent_CN)) L.coth True ;
	exp 	= mkMathFunc (named_fn exponential_CN) L.exp True ; 
	log m 	= mkMathFunc (NPfn (DefGenCN logarithm_CN m.v)) (L.log m.s) True ;
	ln 	= mkMathFunc (named_fn natural_logarithm_CN) L.ln True ;
	sec 	= mkMathFunc (named_fn secant_CN) L.sec True ;
	sech 	= mkMathFunc (named_fn (hyperbolic secant_CN)) L.sech True ;
	sin 	= mkMathFunc (named_fn sine_CN) L.sin True ;
	sinh 	= mkMathFunc (named_fn (hyperbolic sine_CN)) L.sinh True ;
	tan 	= mkMathFunc (named_fn tangent_CN) L.tan True ;
	tanh 	= mkMathFunc (named_fn (hyperbolic tangent_CN)) L.tanh True ;
}
