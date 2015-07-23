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
  Math in
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
	Configuration	= MathObj ;
	[Configuration] = MathList ;
	Constraint	= Prop ;
	[Constraint]	= PropList ;

lin
	BaseConfiguration	= baseM2 ;
	ConsConfiguration	= consM ;
	BaseConstraint	=  base_propL ;
	ConsConstraint	= cons_propL ;
	point	= qualSuchthat point_CN ;
	line	= qualSuchthat line_CN ; 
        incident x y = PositiveCl (is_incident (both_and x y)) ;
        are_on_line xs = PositiveCl (is_collinear (andNP xs)) ;
	configuration cs = given_by configuration_CN (andNP cs) ;
	assertion cg p = holdSNP p cg ;
	
	mkConfiguration geo = geo ;
 }
