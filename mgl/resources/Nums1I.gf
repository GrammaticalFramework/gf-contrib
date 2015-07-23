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

--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

incomplete concrete Nums1I of Nums1 =
GroundI **
open 
  Math,
  PredefCnc
in {
oper
	useVarS : PredefCnc.String -> NP = symb ;
	number_CN : CN = mkCN number_N ;
        overObj : MathObj -> Adv = prepAdv over_Prep ;

--1 nums1
lin
	nums1_e = e_NP ;
	nums1_i = imaginary_NP ;
	nums1_pi = pi_NP ;
	nums1_infinity = infinity_NP ;
	nums1_gamma = gamma_NP ;
	nums1_minus_infinity =  infinity_minus_NP ;
	nums1_NaN = mkNP not_a_number_CN ;
	nums1_rational num den = DefSgNP (modCN (apposCN fraction_CN num) (overObj den)) ;
	{- -TODO: apposition of radix_CN and number-
    based_integer index numstr = DefSgNP (modCN (apposCN number_CN (useVar numstr)) (inObj (massPl (apposCN radix_CN index.s3)))) ;
    -}
	based_integer2 numstr = DefSgNP (apposCN binary_number_CN (useVarS numstr)) ;
	based_integer8 numstr = DefSgNP (apposCN octal_number_CN (useVarS numstr)) ;
	based_integer10 numstr = DefSgNP (apposCN decimal_number_CN (useVarS numstr)) ;
	based_integer16 numstr = DefSgNP (apposCN hexadecimal_number_CN (useVarS numstr)) ;
}
