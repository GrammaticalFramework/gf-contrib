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
 $Date:: 2010-06-15 1#$:  Date of last commit

-}

interface Math = PredefCnc --, ParamX 
** 
open 
  Symbolic, 
  Syntax,
  Cat,
  Prelude
in {
flags 
	optimize=all_subs ;
--2 Types for mathematical objects
param
	NVars	= One | Many ;
--	Tends	= TNone | TAbove | TBelow | TBothSides ;

oper
	CompAction,
    	QuestAction,
	BoolAction,
	SimpleMathOper,
	MathOper,
	MathObj,
	MathList,
	MathSomeVars,
	MathCl,
	MathCN,
	MathVar,
	CnCn: Type;

--	STends : Type ;

--	limitTendNP : (Tends => CnCn) -> MathObj -> STends -> MathVar -> MathObj -> MathObj ;
  
  onSet : MathFunc -> NP -> MathObj ;

--2 Special indexes
oper
	MathIdx : Type;
	-- varIdx : MathVar -> MathIdx ;
	----AR changed type
--	number1,
--	number2,
--	number3,
--	number4,
--	number5,
--	number6,
--	number7 : MathIdx;


--2 Auxiliary
oper		

	massPl : CN -> NP ;
	prepAdv : Prep -> NP -> Adv ;
        whereCl : Cl -> Adv ;
	whereIs: (x,y:NP) -> Adv ;
	
    atAdv, 
	possessAdv : NP -> Adv ;

	fromTo : MathFunc -> MathObj -> MathObj -> NP ;
	respect : MathVar -> NP -> NP ;
	mathFunc2NP : MathFunc -> NP ;

        rangeOver : MathVar -> (set:MathObj) -> Adv ;

--2 Type for functions of 1 variable.
	-- * Named funtions (e.g. exp, sin, cos)
	-- * Functions defined by lambda constructions.
	-- * Functions that come from a functional operator.
	-- * Functions represented by a symbol (e.g. f(x)).

	-- We consider the special cases of functional operators (derivative, primitive) and take care
	-- of writing w.r.t. when needed.

oper	
	MathFunc : Type ;

param
	FuncForm = FNoVar | FNamed | FVar | FGral ;
	

--3 Make functions in each form
oper

	lambda_fn : MathVar -> MathObj -> MathFunc ;
	NPfn : NP -> MathFunc ;
	named_fn : CN -> MathFunc ;
	hashed_fn : MathVar -> MathFunc ;

--3 Generate functional forms for diff, int, ...
oper

	flwrt : CN -> MathFunc -> MathFunc ;
	flwrtNP : Ord -> CN -> MathFunc -> MathFunc ;
	fn_qualNP : MathFunc -> NP ;
				
--3 Apply function to value.

oper	
	at_fn : MathFunc -> MathObj -> MathObj;
	
--2 Lists and lists of Vars
oper
    consM  : MathObj -> MathList -> MathList ;
    baseM2 : MathObj -> MathObj -> MathList ;
	
--3 Lists of MathVars
oper
    singleSV : MathVar -> MathSomeVars ;
    consSV   : MathVar -> MathSomeVars -> MathSomeVars ;



--2 Numeric constants
oper
    useNum  : Int -> MathObj ;
    useReal : Float -> MathObj ;
	 

--2 Variables, Strings
oper
	useVar : MathVar -> MathObj ;
	useVarPlus : MathVar -> MathObjPlus ;

	mkVar : Str -> MathVar ; 
	NullVar : MathVar ;


--2 Common Nouns
oper
	apposCN :  CN -> MathObj -> CN ;


--2 NPs
--3 Genitives/Possessives NPs
oper
	DefSgNP : CN -> MathObj ;
	InDefSgNP : CN -> MathObj ;
	InDefPlNP : CN -> MathObj ;
	DefGenN2 : N2 -> MathObj -> MathObj ;
	DefGenCN : CN -> MathObj -> MathObj ; 
    DefGenPlCN : CN -> MathObj -> MathObj ; 
	DefGenCNOrd : CN -> Ord -> MathObj -> MathObj ; 
	DefGenCNidx : CN -> MathObj -> MathIdx -> MathObj ; 
	revOrdCN : CN -> MathIdx -> CN ;
	DefGenCNidxRev : CN -> MathObj -> MathIdx -> MathObj ; 
	DefGenN3 : N3 -> MathObj -> MathObj -> MathObj ;
	onRange : NP -> NP -> NP -> NP ;
	possessCN : CN -> NP -> CN ;
	modCN : CN -> Adv -> MathCN ;
    DefNPwithElem : CN -> MathObj -> MathObj ;
	DefNPwith : CN -> MathObj -> MathObj ;

    DefCNwithCN : CN -> CN -> MathObj -> MathObj ;

    pointWith : CN -> MathObj -> CN ;
    mCoords : CN -> MathObj -> NP ; 


--3 Adverbial NPs

    adverbNP : Adv -> NP -> NP ;        

--3 complex NPs
	
    PosPredNPS : MathObj -> VP -> Proposition ;
    CompAdvVP : MathObj -> Prep -> VP ;
    limitCN : MathObj -> MathVar -> MathObj -> CN ;
			
--3 Coordinated NPs

	andNP,
    orNP,
    xorNP : MathList -> MathObj ;

	both_and,
    both_or,
    both_xor : MathObj -> MathObj -> MathObj ;

--2 Phrases
oper
	mkTextS,
	mkTextQ      : SimpleMathOper -> MathOper;
	ImperativeV3 : V3 -> (_,_:MathObj) -> MathOper ;
	ImperativeVS : VS -> Proposition -> MathOper ;
	ImperativeVQ : VQ -> FullQProp -> MathOper ; 
   	ImperativeTo : V2 -> MathObj -> MathIdx -> N -> MathOper ;



--2 Propositions and Lists of Propositions
oper
	
	Prop2NPModCNPos,
	Prop2NPModCNNeg : CN -> NP -> NP -> MathCl ;

	relationPosA2,
	relationNegA2 : (NP -> AP) -> (x,y:MathObj) -> MathCl ;
	
	
-- A Clause with Polarity:
oper

    Proposition,
    PropList,
    FullQProp : Type;

--    base_propL : (p,q : Proposition) -> PropList ;
--    cons_propL : Proposition -> PropList -> PropList ;

    PositiveCl,
    NegativeCl : Cl -> MathCl ;

	mkFullQProp : MathCl -> FullQProp ;
	mkFullProp  : MathCl -> Proposition ;

	posCl, negCl : Cl -> S ;
	posS, negS   : S -> Proposition ;
	posQS, negQS : QS -> FullQProp ;
 	
	and_prop,
    or_prop,
    xor_prop : PropList -> Proposition ;

--2 Selection Operations
oper
   such_that : MathObj -> Proposition -> MathObj ;
   SelectN : MathObj -> Proposition -> MathOper ;
   SelectNamed : MathVar -> MathCN -> Proposition -> MathOper ;
   SelectFromN : MathObj -> MathObj -> Proposition -> MathOper ;
   setN : MathObj -> MathCN -> MathObj ; 
   a_element : MathObj ;


--2 Declarations + combinations of operations
oper

    baseOperation : MathOper -> MathOperList ;
    consOperation : MathOper -> MathOperList -> MathOperList ;
    declareOper : Proposition -> MathOper -> MathOper ;
 

--2 Interrogatives    
oper
   whatis : MathObj -> MathOper ;

oper
  	ImperativeV2 : V2 -> MathObj -> MathOper ;
   	mkTxtVP : VP -> Text ;
	-- useQualVar : CN -> MathVar -> MathObj ; --moved to PlanGeo1I
	-- usePointVar : MathVar -> MathObj ;   --not used
	
    subjunctS : S -> S -> S ; --- if A then, B
   
    inObj : MathObj -> Adv ;


	AdvS : Adv -> S -> S ;
   
		

{- ----AR cannot have yet: greater than or equal to x
   ---- therefore paraphrase: greater than x or equal to x
-}

    predbiComp : (_,_:NP -> AP) -> (x,y:MathObj) -> MathCl ;

}
