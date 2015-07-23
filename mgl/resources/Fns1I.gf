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

incomplete concrete Fns1I of Fns1 =
GroundI **
open 
  Math
in
{
oper

    fncomp : CN -> (f,g:MathFunc) -> MathFunc =
        \cn,f,g -> let 
                    lf : NP = fn_qualNP f ;
                    lg : NP = fn_qualNP g ;
                    mapf : NP -> NP = \n -> DefGenCN cn (both_and lf n) ; 
                    fg : NP = variants {mapf g; mapf lg}
                in case g.t of {
                    FVar => lambda_fn g.s2 fg ;
                    _ => NPfn fg } ;

 --1 fns1
lin
	domain = flwrt domain_CN ;
	range = flwrt range_CN ;
	inverse = flwrt inverse_function_CN  ;
	left_inverse = flwrt left_inverse_function_CN  ;
	right_inverse = flwrt right_inverse_function_CN  ;       
	left_compose = fncomp left_composition_CN ;
	right_compose = fncomp right_composition_CN ;
	identity = named_fn identity_CN ;
	lambda = lambda_fn ; ---mkFunc f (useStr f.v) ;
}
