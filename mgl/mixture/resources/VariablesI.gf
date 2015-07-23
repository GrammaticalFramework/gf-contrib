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
 $Date:: 2008-10-10 1#$:  Date of last commit

-}

incomplete concrete VariablesI of Variables = GroundI ** open
    Math,
    Prelude,
    Symbolic,
    Lexicon,
    myFormal,
    (L = VariablesLaTeX)
 in
{
oper
  
    namedvar_fn :  MathVar -> MathFunc = \f -> 
        {t= FNamed; s2=NullVar} ** (useVar f); 

 
lin
	x = mkVar "x" ; 
	y = mkVar "y" ; 
	z = mkVar "z" ; 

	X = mkVar "X" ; 
	Y = mkVar "Y" ;
	Z = mkVar "Z" ;

	f = mkVar "f" ; 
	g = mkVar "g" ; 
	h = mkVar "h" ; 
	A = mkVar "A" ; 
	B = mkVar "B" ; 
	C = mkVar "C" ; 
	D = mkVar "D" ;
	M = mkVar "M" ;
	N = mkVar "N" ;
	u = mkVar "u" ;
	v = mkVar "v" ;
	i = mkVar "i" ;
	j = mkVar "j" ;
	n = mkVar "n" ;
	P = mkVar "P" ;
	Q = mkVar "Q" ;
	l = mkVar "l" ;

	p = {v = varProp "p" ; s = L.p ; isSymb = True};
	q = {v = varProp "q" ; s = L.q ; isSymb = True};
	r = {v = varProp "r" ; s = L.r ; isSymb = True};

	Var2Num  	= useVarPlus ;
	Var2Set 	= useVarPlus ;
	Var2Fun f 	= mkMathFunc (namedvar_fn f) (L.Var2Fun f) True ; 
        Var2Fun3 f 	= mkMathFunc (namedvar_fn f) (L.Var2Fun3 f) True ; 
	Var2Geo 	= useVarPlus ;
	Var2Tensor 	= useVarPlus ;
	-- Var2Index 	= varIdx ;
	


}
