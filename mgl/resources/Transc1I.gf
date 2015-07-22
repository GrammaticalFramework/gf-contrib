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
  Math
in {

--1 transc1
lin
	arccos = named_fn arccosine_CN ;
	arccosh = named_fn (f_inverse (hyperbolic cosine_CN));
	arccot = named_fn arccotangent_CN ;
    	arccoth = named_fn (f_inverse (hyperbolic cotangent_CN)) ;
	arccsc = named_fn arccosecant_CN ; 
	arccsch = named_fn (f_inverse (hyperbolic cosecant_CN)) ;
	arcsec = named_fn arcsecant_CN ; 
	arcsech = named_fn (f_inverse (hyperbolic secant_CN));
	arcsin = named_fn arcsine_CN ;
	arcsinh = named_fn (f_inverse (hyperbolic sine_CN)) ;
	arctan = named_fn arctangent_CN ;
	arctanh = named_fn (f_inverse (hyperbolic tangent_CN)) ;
	csc = named_fn cosecant_CN ; 
	csch = named_fn (hyperbolic cosecant_CN) ;
	cos = named_fn cosine_CN ;
	cosh = named_fn (hyperbolic cosine_CN) ;
	cot = named_fn cotangent_CN ;
	coth = named_fn (hyperbolic cotangent_CN) ;
	exp =  named_fn exponential_CN ; 
	log m = NPfn (DefGenCN logarithm_CN m) ;
	ln =  named_fn natural_logarithm_CN ;
	sec = named_fn secant_CN ;
	sech = named_fn (hyperbolic secant_CN) ;
	sin = named_fn sine_CN ;
	sinh = named_fn (hyperbolic sine_CN) ;
	tan = named_fn tangent_CN ;
	tanh = named_fn (hyperbolic tangent_CN) ;
}
