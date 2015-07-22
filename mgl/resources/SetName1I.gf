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

incomplete concrete SetName1I of SetName1 =
GroundI **
open
    (L = SetName1LaTeX),
    Math,
    Prelude,
    Syntax,
    myFormal,
    Symbolic
in {
oper
    set_of : CN -> CN = \cn -> 
        mkCN set_of_N2 (mkNP thePl_Det cn) ;
        
    mkNamedSet : CN -> Str -> MathCNPlus = \cn,s ->
        {cn = set_of cn; s= s }  ;
lin
    set_N =  mkNamedSet natural_number_CN "NN" ;
    set_C =  mkNamedSet complex_number_CN "CC" ;
    set_P =  mkNamedSet prime_number_CN "PP" ;
    set_Z =  mkNamedSet integer_number_CN "ZZ" ;
    set_Q =  mkNamedSet rational_number_CN "QQ" ;
    set_R =  mkNamedSet real_number_CN "RR" ;
    
    mkSet ns = symb ns.s ;

}
