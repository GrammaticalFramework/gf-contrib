incomplete concrete WPProblemI of WPProblem = 
AmountI 
** open
	Syntax,
	Symbolic in
{
lincat
	Sentence = Text ;
	Question = QS ;

lin
	fromProp = mkText ;
	fromQuestion = mkText ;
	aeq x y = mkS (mkCl x y) ;
	aeqNum x n = mkS (mkCl x (mkNP (mkDet n))) ;
	every c = mkNP every_Det c ;
	denote v am = let v_NP : NP = symb v
		in mkText (mkS (mkCl v_NP denote_V2 am)) ;
oper
	howm : CN -> IP = \c -> mkIP how8many_IDet c ;
	min : NP -> Adv = Syntax.mkAdv in_Prep ;
	defClass : CN -> NP = \c -> mkNP thePl_Det c ; 
	bareClass : CN -> NP = \c -> mkNP aPl_Det c ; 


--TODO: compilation error with QuestVP , and we must choose the appropiate verb:
--mymkQCl : IP -> Adv -> QCl   -- who is here   
--	= \x,y -> QuestVP x (mkVP (mkVP haber_V y)) ; 

lin
	mkAmount np = np ;


}

