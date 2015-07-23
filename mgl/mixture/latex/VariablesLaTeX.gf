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

--# -path=.:../mathres:prelude
concrete VariablesLaTeX of Variables = GroundLaTeX **
open
	Prelude,
	Formal in
{
oper
	mkVar : Str -> SS = ss ;
	useVar : SS -> TermPrec = \v -> constant v.s ;
	varIdx : SS -> SS = id SS ;

lin
	x = mkVar "x" ; -- #fixedvars
	y = mkVar "y" ; -- #fixedvars
	z = mkVar "z" ; -- #fixedvars

	f = mkVar "f" ; --- hashed_fn "f" ; -- #fixedvars
	g = mkVar "g" ; --- hashed_fn "g" ; -- #fixedvars
	h = mkVar "h" ; --- hashed_fn "h" ; -- #fixedvars
	A = mkVar "A" ; -- #fixedvars
	B = mkVar "B" ; -- #fixedvars
	C = mkVar "C" ; -- #fixedvars
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

	p = constant "p" ;
	q = constant "q" ;
	r = constant "r" ;

	Var2Num  = useVar ;
	Var2Set = useVar ;
	Var2Fun = useVar ;
	Var2Fun3 = varIdx ; 
	Var2Geo = useVar ;
	Var2Tensor = useVar ;
	Var2Index = varIdx ;
	


}
