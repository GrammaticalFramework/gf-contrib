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


incomplete concrete OperationsI of Operations = GroundI **
open
	Math,
	Cat,
	Lexicon
in {
lincat
    Exercise = MathExercise ;
    Operation = MathOper ;
    [Operation] = MathOperList ;
    CompV = CompAction ;
    QuestV = QuestAction ;
    SentV = BoolAction ;

lin
--2 verbs

	ComputeV = compute_V2 ;
	CalculateV = calculate_V2 ;
	SolveV = solve_V2 ;
	DefineV = define_V2 ;
	EvalV = evaluate_V2 ;
    FindV = find_V2 ;
	SimplifyV = simplify_V2 ;
	DetermineV' = determine_V2 ;
	DetermineV = determine_VQ ;
	DecideV = decide_VQ ;
	ProveV = prove_VS ;
	DisproveV = disprove_VS ;
	ShowV = show_VS ;

--3 Verbalization (empty)
--     Abstract verbalization to be def'd to actual verbalizations.
lin
	VerbalizeN _ = variants {} ;
	VerbalizeF _ = variants {} ;
	VerbalizeS _ = variants {} ;
	
--2 VerbalizeSoperations

	DoComputeN, DoComputeS, DoComputeT = ImperativeV2 ;

 -- Commented to avoid lambda_fns1 to get in the way --> then uncommented
	DoComputeF = ImperativeV2 ;

	DoQuestV = ImperativeVQ ;
	DoSentV = ImperativeVS ;
	DoSelectN = SelectN ;
	DoSelectSet = SelectNamed ;
	DoSelectFromN = SelectFromN ;
	WhatIsN, WhatIsS,  WhatIsT = whatis ;
	WhatIsF = whatis ;



--2 Combining operations

    mkExercise t = t ;
    Declare = declareOper ;
    BaseOperation = baseOperation ;
    ConsOperation = consOperation ;



--3 OpenMath Symbol verbalization
lin

--4 Arith1
	vb_add = ImperativeV3 add_V3 ;
	vb_subtract = ImperativeV3 subtract_V3 ;
	vb_multiply = ImperativeV3 multiply_V3 ;
	vb_divide = ImperativeV3 divide_V3 ;
	vb_negate = ImperativeV2 negate_V2 ;

--4 calculus1 CD
	vb_differentiate = ImperativeV2 differentiate_V2 ;
	vb_differentiate_resp f x = ImperativeV3 differentiate_V3 f (useVar x);
	vb_integrate = ImperativeV2 integrate_V2 ;
	vb_integrate_btwn f a b = ImperativeV2 integrate_V2 (onRange f a b) ;

--4 fns1 CD
	vb_invert = ImperativeV2 invert_V2 ;

}
