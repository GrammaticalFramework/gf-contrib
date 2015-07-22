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

--# -path=.:../mathres:prelude

concrete GroundLaTeX of Ground = open
	Prelude,
	myFormal,
	myLaTeX in
{
oper
	-- Value : Type = TermPrec ;
	ListValue : Type = SS ;
	use1 : Value -> SS = \x -> ss (usePrec 1 x) ;
	baseValue : Value -> Value -> ListValue = \x,y -> infixSS "," (use1 x) (use1 y) ; 
	consValue : Value -> ListValue -> ListValue = \x,xs -> infixSS "," (use1 x) xs ;

lincat
	-- Integer = MathInteger ;
	Index = SS ;
	NamedSet = SS ;
	ValNum, ValSet, ValTensor, ValGeo, ValFun = Value ;
	[ValTensor], [ValNum], [ValGeo], [ValSet] = ListValue ;
	[VarNum] = SS ;
	
	VarNum, VarFun,  VarSet, VarTensor, VarIndex, VarGeo = SS ;

	-- Bool = SS ;
	Prop, SimpleProp, QProp = Value ;
	[Prop] = SS ;

	ValFun3 = SS ; --Value ; --MathFunc ?;
	
lin
	-- int2Num = useNum ;

	BaseValNum, BaseValFun = baseValue ;
	ConsValNum = consValue ;
	
	one = ss "1" ;
	two = ss "2" ;
	three = ss "3" ;
	four = ss "4" ;
	five = ss "5" ;
	six = ss "6" ;
	seven = ss "7" ;
	eight = ss "8" ;
	nine = ss "9" ;
	ten = ss "10" ;
	--- mkFormulaN s = useStr (MkSymb s) ; -- #freestring
	genElement = constant "an_element" ;
	genFunc = constant "a_function" ;
	mkProp x = x ;
	mkQProp x = x ;

lin
	BaseVarNum = id SS ;
	ConsVarNum = infixSS "," ; 
--    mkNum = useNum ;

	At f x = mkPrec highest (f.s ++ parenth (usePrec 0 x)) ;

} 
