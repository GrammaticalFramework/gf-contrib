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
 $Date:: 2008-10-07 1#$:  Date of last commit

-}

concrete Limit1LaTeX of Limit1 = GroundLaTeX **
open
	myLaTeX,
	myFormal,
        ParamTends,
	Prelude in
{
--param 
--	Tends = Above | Below | Both | None ;
oper

        --STends : Type = {s: Str; t:Tends} ;  --new

	decorate : TermPrec -> Tends -> TermPrec = 
		\a,t -> case t of {
					TAbove => supTP a "+" ;
					TBelow => supTP a "-" ;
					_ => a	} ;
	tend : SS -> TermPrec -> TermPrec = \v,a   ->  infixn 4 "\\to" (constant v.s) (constant a.s) ; --infixn 4 "\\to" (constant v.s) a; writes false clammers 

	--mkTend : Tends -> STends = \t -> {s=[]; t=t}; --new

lincat
	TendsTo = Tends ;
	--TendsTo = STends ; --new
lin
	limit f t v a = bigOpSb "lim" a (tend v (decorate f t)) ; -- ValNum -> TendsTo -> VarNum -> ValNum -> ValNum
	both_sides = TBothSides; --mkTend TBothSides ; --Both ;
	above	   = TAbove; --mkTend TAbove; -- Above ;
	below	   = TBelow; --mkTend TBelow; -- Below ;
	null	   = TNone; --mkTend TNone; -- None ;
}
