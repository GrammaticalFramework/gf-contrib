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
    Math,
    Lexicon,
    Syntax,
    Prelude
    in 
{

lincat
	Index = MathIdx ;
	NamedSet = MathCNPlus ;
	ValTensor = MathObj ;
	ValNum = MathObj ; 
	ValSet = MathObj ;
	ValGeo = MathObj ;
	ValFun = MathFunc ;
	[ValTensor] = MathList ;
	[ValNum] = MathList ;
	-- [ValFun] = [MathFunc] ;
	[ValGeo] = MathList ;
	[ValSet] = MathList ;
	[VarNum] = MathSomeVars ;
	VarNum = MathVar ; 
	VarFun = MathVar ; 
	VarSet = MathVar ; 
	VarTensor = MathVar ; 
	VarIndex = MathVar ;
	VarGeo	= MathVar ;
	
	Prop = Proposition ;
	[Prop] = PropList ;
	SimpleProp = MathCl ;
        QProp = QS ;

    
	ValFun3 = MathFunc ;
	
lin
	one 	= n1_Numeral ; --number1 ;
	two 	= n2_Numeral ; --number2 ;
	three 	= n3_Numeral ; --number3 ;
	four 	= n4_Numeral ; --number4 ;
	five 	= n5_Numeral ; --number5 ;
	six 	= n6_Numeral ; --number6 ;
	seven 	= n7_Numeral ; --number7 ;
	eight   = n8_Numeral ;
	nine 	= n9_Numeral ;
	ten     = n10_Numeral ;

	genElement = a_element ;
	mkProp = mkFullProp ;
    	mkQProp = mkFullQProp ;


lin

	BaseProp = base_propL ;
	ConsProp = cons_propL ; 

lin
 	ConsValNum = consM ; 
	BaseValNum = baseM2 ;
	BaseValTensor = baseM2 ; 
	ConsValTensor = consM ; 
	BaseValSet = baseM2 ; 
	ConsValSet = consM ; 
	BaseValGeo = baseM2 ;
	ConsValGeo = consM ;
	BaseVarNum = singleSV ;
	ConsVarNum = consSV ;

	At = at_fn ;
{-
lin
        mkFun2 f g =
        	let fnp = mathFunc2NP f ;
            	gnp = mathFunc2NP g 
                in (DefCNwithCN function_CN element_linalg_CN (both_and fnp gnp)) ; 
        	--in NPfn (both_and fnp gnp) ; 
	-- stack overflow!	
-}
} 
