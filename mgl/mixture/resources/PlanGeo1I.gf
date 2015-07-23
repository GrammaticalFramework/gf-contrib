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

incomplete concrete PlanGeo1I of PlanGeo1 =
VariablesI **
open 
  Math,
  (L = PlanGeo1LaTeX),
  Prelude 
in
{
oper
    useQualVar : CN -> MathVar -> MathObj 
        = \cn,x ->
        	let
        	    cx : Card = symb (mkSymb x.s)
        	in symb cn cx ;

    qualSuchthat : CN -> MathVar -> PropList -> MathObj = \cn,v,cs ->
    	such_that (useQualVar cn v) (and_prop cs) ;

holdSNP : Proposition -> MathObj -> MathCl = \p,obj ->
        let
            the_fact = DefSgNP (fact_CN p) ;
        in PositiveCl (mkCl the_fact (mkVP hold_for_V2 obj)) ;

--1 plangeo1
lincat
	Configuration	= MathObjPlus ;
	[Configuration] = MathListPlus ;
	Constraint	= Prop ;
	[Constraint]	= PropListPlus ;

lin
	BaseConfiguration	= baseM2Plus ;
	ConsConfiguration	= consMPlus ;
	BaseConstraint		= base_propLPlus ;
	ConsConstraint		= cons_propLPlus ;
	point v cs 		= mkMathObj (qualSuchthat point_CN v cs.v) ; 			--(L.point v cs.s) cs ;  --VarGeo -> [Constraint] ->  ValGeo ;
	line v cs 		= mkMathObj (qualSuchthat line_CN v cs.v) ; 			--(L.line v cs.s) cs ; 
        incident x y 		= mkMathCl (PositiveCl (is_incident (both_and x.v y.v))) ;      --(L.incident x.s y.s) False ;
        are_on_line xs 		= mkMathCl (PositiveCl (is_collinear (andNP xs.v))) ;		-- appListMathCl is_collinear L.are_on_line xs False ;
	configuration cs 	= mkMathObj (given_by configuration_CN (andNP cs.v)) ;          --(L.configuration cs.s) cs ;
	assertion cg p 		= mkMathCl (holdSNP p.v cg.v) ;					--(L.assertion cg.s p.s) False ;
	
	mkConfiguration geo 	= mkMathObj geo.v ;                                             --(L.mkConfiguration geo.s) geo ;
}
