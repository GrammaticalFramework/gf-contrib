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

incomplete concrete Limit1I of Limit1 =
GroundI 
**
open 
  Lexicon, 
  Math,
  ParamTends,
  (L = Limit1LaTeX)
in 
{
--param
--    Tends	= TNone | TAbove | TBelow | TBothSides ;

oper
    STends : Type = {s: Str; t:Tends} ; -- Str to be removed after compiler improving. 

    limitTendNP : (Tends => CnCn) -> MathObj -> STends -> MathVar -> MathObj -> MathObj = \tcncn,x0,st,x,fx ->
        let
            hacked_x = ss (var2str x ++ st.s) ;  -- Hack: The parser must find a non-empty string (st.s = [])
            limit = limitCN x0 hacked_x fx ;
            t = st.t ;
        in DefSgNP ((tcncn!t) limit) ;


oper

	mkTend : Tends -> STends = \t -> {s=[]; t=t};

--1 limit1
lincat
	TendsTo = STends ;
lin 
	limit f t v a = mkMathObj (limitTendNP limitAdv f.v t v a.v) (L.limit f.s t.t v a.s) f a ;   
								 --ValNum -> TendsTo -> VarNum -> ValNum -> ValNum;
	null = mkTend TNone ;  
	above = mkTend TAbove ;
	below = mkTend TBelow ;
	both_sides = mkTend TBothSides ;

}
