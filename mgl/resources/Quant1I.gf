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

incomplete concrete Quant1I of Quant1 =
VariablesI **
open 
  Math,
  Prelude,
  Sentence
in {
flags
	lexer = textlit ;
	unlexer = text ;
oper
    andVars : MathSomeVars -> MathObj =
        \vars -> 
            case vars.num of {
                One => useVar (vars.s3) ;
                Many => andNP vars
            } ** {s2 = []} ;

    existential : MathObj -> MathObj -> Proposition -> Proposition =
        \vars,set,prop -> 
            posS (mkS (mkCl (such_that (adverbNP (prepAdv in_Prep set) vars) prop))) ;

   forall_quantifier : MathObj -> S -> S =
       	\vars -> ExtAdvS (prepAdv for_Prep (mkNP all_Predet vars)) ;


--1 quant1
lin
	exist vars set prop = existential (andVars vars) set prop ;
	forall vars prop = forall_quantifier (andVars vars) prop ;
	forall_set vars set prop = forall_quantifier
        (adverbNP 
            (inObj set) (andVars vars))
        prop ;
}