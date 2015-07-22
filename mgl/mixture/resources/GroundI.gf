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

incomplete concrete GroundI of Ground = open
    (L = GroundLaTeX),
    Math,
    Lexicon,
    Syntax,
    Prelude
    in 
{

lincat
	Index = MathIdx ;
	NamedSet = MathCNPlus ;
	ValTensor = MathObjPlus ;
	ValNum = MathObjPlus ; 
	ValSet = MathObjPlus ;
	ValGeo = MathObjPlus ;
	ValFun = MathFuncPlus ;
	ValFun3 = MathFuncPlus ;
	[ValTensor] = MathListPlus ;
	[ValNum] = MathListPlus ;
	-- [ValFun] = [MathFunc] ;
	[ValGeo] = MathListPlus ;
	[ValSet] = MathListPlus ;
	[VarNum] = MathSomeVars ;
	VarNum = MathVar ; 
	VarFun = MathVar ; 
	VarSet = MathVar ; 
	VarTensor = MathVar ; 
	VarIndex = MathVar ;
	VarGeo	= MathVar ;
	
	Prop = PropositionPlus ;
	[Prop] = PropListPlus ;
	SimpleProp = MathClPlus ;
        QProp = QS ;

   
lin
	one 	= mkIdx "1" n1_Numeral ; --number1 ;
	two 	= mkIdx "2" n2_Numeral ; --number2 ;
	three 	= mkIdx "3" n3_Numeral ; --number3 ;
	four 	= mkIdx "4" n4_Numeral ; --number4 ;
	five 	= mkIdx "5" n5_Numeral ; --number5 ;
	six 	= mkIdx "6" n6_Numeral ; --number6 ;
	seven 	= mkIdx "7" n7_Numeral ; --number7 ;
	eight   = mkIdx "8" n8_Numeral ;
	nine 	= mkIdx "9" n9_Numeral ;
	ten     = mkIdx "10" n10_Numeral ;

	genElement = mkMathObj a_element ;
	mkProp s = mkFullPropPlus s.v (L.mkProp s.s) False;
    	mkQProp s = mkFullQProp s.v;


lin

	BaseProp = base_propLPlus ;
	ConsProp = cons_propLPlus ; 

lin
 	ConsValNum = consMPlus ; 
	BaseValNum = baseM2Plus ;
	BaseValTensor = baseM2Plus ; 
	ConsValTensor = consMPlus ; 
	BaseValSet = baseM2Plus ; 
	ConsValSet = consMPlus ; 
	BaseValGeo = baseM2Plus ;
	ConsValGeo = consMPlus ;
	BaseVarNum = singleSV ;
	ConsVarNum = consSV ;

	At f x = mkMathObj (at_fn f.v x.v) (L.At f.s x.s) False ;

{-
lin
        mkFun2 f g =
        	let fnp = mathFunc2NP f ;
            	gnp = mathFunc2NP g 
        	in NPfn (both_and fnp gnp) ; -- (DefCNwithCN function_CN element_linalg_CN (both_and fnp gnp)) ; TO DO!!!!
	-- stack overflow!	
-}
} 
