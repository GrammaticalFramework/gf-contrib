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

incomplete concrete Set1I of Set1 =
GroundI **
open
  Math,
  Prelude,
  (L = Set1LaTeX)
in {
flags
	lexer = textlit ;
	unlexer = text ; 
oper
    posPrep : MathVar -> MathObj -> S = \vars,set ->
        PosPredNPS (useVar vars) (CompAdvVP set in_Prep) ;
    
    adverbSet : MathObj -> MathVar -> MathObj = \set,vars ->
        adverbNP (prepAdv in_Prep set) (useVar vars) ;

    setOfForm : MathObj -> MathObj = \type -> 
        DefGenCN set_CN (
            InDefPlNP (modCN value_CN (
                possessAdv (DefSgNP (apposCN form_CN type))))) ;

    DefNPwithbaseElem : CN -> MathObj -> MathObj =
       		 \cn,o -> DefSgNP (mkCN cn (prepAdv with_Prep (mkNP (mkCN single_element_CN o)))) ; 
 
--1 Set1
lin
	map vars type set 	= mkMathObj (such_that (setOfForm type.v) (posPrep vars set.v)) (L.map vars type.s set.s) type set ;

	suchthat set x prop 	= mkMathObj (such_that (adverbSet set.v x) prop.v) ; --inherently verbal --(L.suchthat set.s x prop.s) set prop ;  

      	cartesian_product terms = mkMathObj (DefGenCN cartesian_product_CN (andNP terms.v)) ;  

	emptyset 		= mkMathObj (DefSgNP empty_set_CN) L.emptyset True ;

	size x 			= mkMathObj (DefGenCN size_CN x.v) (L.size x.s) x ;

	set terms 		= appListMathObj (DefNPwithElem set_CN) L.set terms ;

	set_base x 		= mkMathObj (DefNPwithbaseElem set_CN x.v) (L.set_base x.s) x ;

	intersect terms 	= mkMathObj (DefGenCN intersection_CN (andNP terms.v)) ; 						

	union terms 		= mkMathObj (DefGenCN union_CN (andNP terms.v)) ;

	setdiff a b 		= mkMathObj (DefGenCN difference_CN (both_and a.v b.v)) (L.setdiff a.s b.s) a b ;

	subset a b 		= mkMathCl (Prop2NPModCNPos subset_CN a.v b.v) (L.subset a.s b.s) a b ;

	notsubset a b 		= mkMathCl (Prop2NPModCNNeg subset_CN a.v b.v) (L.notsubset a.s b.s) a b ;

	set1_in x set 		= mkMathCl (Prop2NPModCNPos element_CN x.v set.v) (L.set1_in x.s set.s) x set ;

	notin x set 		= mkMathCl (Prop2NPModCNNeg element_CN x.v set.v) (L.notin x.s set.s) x set ; 

	prsubset a b 		= mkMathCl (Prop2NPModCNPos proper_subset_CN a.v b.v) (L.prsubset a.s b.s) a b ;

	notprsubset a b 	= mkMathCl (Prop2NPModCNNeg proper_subset_CN a.v b.v) (L.notprsubset a.s b.s) a b ;
}
