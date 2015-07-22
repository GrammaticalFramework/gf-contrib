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

--# -path=.:../lexicon:prelude:present:mathematical

instance MathEng of Math = MathI - [negPol, DefNPwithElem]
with
    (Cat = CatEng),
    (Syntax = SyntaxEng),
    (Symbolic = SymbolicEng), 
    (Lexicon = LexiconEng) ** 
open
	(X = ConstructX),
  	(P = ParadigmsEng),
        (E = ExtraEng)
in {
oper
    then_Adv = P.mkAdv "then" ;
    elem_Prep = my_possess_Prep ;
	fromAdv : Str -> CN -> CN = \s,cn ->
        mkCN cn (X.mkAdv ("from " ++ s)) ;

    negPol = E.UncNeg ;

    DefNPwithElem : CN -> MathObj -> MathObj = \cn,o ->  
        	DefSgNP (mkCN cn (prepAdv with_Prep 
                	(massPl (mkCN element_CN o)))) ;  
        -- "the ...with elements x, y and z"

}
