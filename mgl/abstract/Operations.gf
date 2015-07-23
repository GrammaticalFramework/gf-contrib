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
 $Author::            $:  Author of last commit
 $Date::              $:  Date of last commit

-}

--# -path=../OpenMath:../Ground
--1 Simple exercises

abstract Operations = Ground ** {
flags
	startcat = Exercise ;

--2 Categories
cat
    Exercise ;                  -- Posing an exercise
    Operation;                  -- Asking a student to do an elementay operation
    [Operation] {1} ;           -- Sequence of operations
	CompV ;                     -- Compute-like verbs
    QuestV ;                    -- Question verbs e.g. decide, determine
    SentV ;                     -- Sentence verbs e.g. prove, show


--2 Basic operations
fun
    mkExercise : [Operation] -> Exercise ;
	ComputeV, CalculateV, SolveV, DefineV, EvalV, FindV, SimplifyV, DetermineV' : CompV ;
	-- DetermineV' is "determine" as "calculate"
	DoComputeN : CompV -> ValNum -> Operation ;
 
    DoComputeF : CompV -> ValFun -> Operation ;
	DoComputeS : CompV -> ValSet -> Operation ;
	DoComputeT : CompV -> ValTensor -> Operation ;
	
	DetermineV, DecideV : QuestV ;
	-- DetermineV is "determine" as "decide"
	DoQuestV : QuestV -> QProp -> Operation ;

	ProveV, DisproveV, ShowV : SentV ;
	DoSentV : SentV -> Prop -> Operation ;


	WhatIsN : ValNum -> Operation ;
	WhatIsF : ValFun -> Operation ;
	WhatIsS : ValSet -> Operation ;
	WhatIsT : ValTensor -> Operation ;

	DoSelectN : ValNum -> Prop -> Operation ;
	DoSelectFromN : ValNum -> ValSet -> Prop -> Operation ;
	DoSelectSet : VarNum -> NamedSet -> Prop -> Operation ;
	

--2 Combining operations
fun
--	LetOper : ValNum -> ValNum -> Operation ;
	Declare : Prop -> [Operation] -> Operation ;


--2 Transfer: Verbalization
fun
	VerbalizeN : ValNum -> Operation ;
	VerbalizeF : ValFun -> Operation ;
	VerbalizeS : ValSet -> Operation ;

--3 Arith
fun
	vb_negate : ValNum -> Operation ;
	
	vb_add,
	vb_subtract,
	vb_multiply,
	vb_divide : ValNum -> ValNum -> Operation ;

--3 Calculus
fun
	vb_differentiate,
	vb_integrate : ValFun -> Operation ;
	vb_differentiate_resp : ValFun -> VarNum -> Operation ;
	vb_integrate_btwn : ValFun -> (a,b:ValNum) -> Operation ;
	
--3 Fns1
fun
	vb_invert : ValFun -> Operation ;
}
