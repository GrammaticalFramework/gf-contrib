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

instance MathSpa of Math = MathI - [DefNPwithElem, fromTo, onRange, ImperativeTo]
with
    (Cat = CatSpa),
    (Syntax = SyntaxSpa), 
    (Symbolic = SymbolicSpa), 
    (Lexicon = LexiconSpa) **
open 
    (P = ParadigmsSpa)
in {
oper
        then_Adv = P.mkAdv "entonces" ;
        elem_Prep = my_possess_Prep ;

        DefNPwithElem : CN -> MathObj -> MathObj = \cn,o ->  
        	DefSgNP (mkCN (mkAP compounded_A2 (mkNP the_Art plNum (mkCN element_CN o))) cn);   --el cn compuesto por los elementos o
	
	fromTo : MathFunc -> MathObj -> MathObj -> NP 
		= \func,x0,x1 ->
		        let
		            from = mkAdv from2_Prep x0 ;
		            to = mkAdv till_Prep x1 ;
		            f = mathFunc2NP func ;
		        in mkNP (mkNP f from) to ;  

	onRange : NP -> NP -> NP -> NP 
		= \np,from,to -> 
	        	adverbNP (mkAdv till_Prep to)
	                	 (adverbNP (mkAdv from2_Prep from) np) ;


	DefEntreCN : CN -> MathObj -> MathObj 
		= \noun,obj -> 
			mkNP the_Art (modCN noun (mkAdv between_Prep obj)) ; 

	ImperativeTo  : V2 -> MathObj -> MathIdx -> N -> MathOper 
		= \verb,obj,num,n ->                        -- aproxímalo con cuatro dígitos
	        	let instrument : Adv = mkAdv with_Prep (mkNP num n) ;
	        	    vp : VP = mkVP verb obj
	        	in mkTxtVP (mkVP vp instrument) ;
}
