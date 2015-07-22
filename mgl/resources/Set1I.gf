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
  Math
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
	map vars type set = such_that (setOfForm type) (posPrep vars set) ;
	suchthat set x prop = such_that (adverbSet set x) prop ;  
      	cartesian_product terms = DefGenCN cartesian_product_CN (andNP terms) ; 
	emptyset = DefSgNP empty_set_CN ;
	size = DefGenCN size_CN ;
	set terms = DefNPwithElem set_CN (andNP terms) ;
	set_base = DefNPwithbaseElem set_CN ;
	intersect terms = DefGenCN intersection_CN (andNP terms) ;
	union terms = DefGenCN union_CN (andNP terms) ;
	setdiff a b = DefGenCN difference_CN (both_and a b) ;
	subset = Prop2NPModCNPos subset_CN ;
	notsubset = Prop2NPModCNNeg subset_CN ;
	set1_in = Prop2NPModCNPos element_CN ;
	notin = Prop2NPModCNNeg element_CN ; 
	prsubset = Prop2NPModCNPos proper_subset_CN ;
	notprsubset = Prop2NPModCNNeg proper_subset_CN ;
}
