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


concrete Arith1LaTeX of Arith1 =
GroundLaTeX **
open 
  myFormal,
  myLaTeX in
{
flags
	lexer = textlit ;
	unlexer = text ;
oper
	mkPowerC : Str -> TermPrec -> TermPrec = \n,x -> infixr 3 "^" x (constant n) ;

--2 arith1
lin
	abs = delimited "|" "|" ;
lin
	power = infixr 3 "^" ;  
	power2 = mkPowerC "2" ;
	power3 = mkPowerC "3" ; 
	unary_minus = ufun1 "-" ; 
	minus = infixl 1 "-" ; 
	divide = division ;
	root x n = funOpt1 "sqrt" n.s x ;  -- not 'root' strangely enough!
 	root2 = fun1 "sqrt" ;
	root3 = funOpt1 "sqrt" "3" ;
	gcd xs  = ufun1 "gcd" (mkPrec 1 xs.s) ;
	lcm xs   = ufun1 "lcm" (mkPrec 1 xs.s) ;

        sum x set z = bigOpOver "sum" (mkPrec highest x.s) set z ;                                        -- the sum of z when x ranges over set
        product x set z = bigOpOver "product" (mkPrec highest x.s) set z ;                                  
         	
	sum_range x lo hi z = bigOpRange "sum" (mkPrec highest x.s) lo hi z ;  	                   -- sum_range x lo hi z = the sum of z when x ranges from lo to hi  
        product_range x lo hi z = bigOpRange "prod" (mkPrec highest x.s) lo hi z ;  
                                                                                  
--3 Use transfer instead
lin	
	plus _  = noLaTeXlin ; --variants{} ;
	times _ = noLaTeXlin ;

}
