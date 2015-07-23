incomplete concrete WPProblemI of WPProblem = 
AmountI ** 
{
--From Farm
lincat
	Sentence = Text ;
	Question = QS ;
lin
	fromProp = mkText ;
	fromQuestion = mkText ;
	aeq x y = mkS (mkCl x y) ;
	every c = mkNP every_Det c ;
	denote v am = mkText (mkS (mkCl (mkNP (P.mkPN v.s)) denote_V2 am)) ;

oper
	howm : CN -> IP = \c -> mkIP how8many_IDet c ;
	min : NP -> Adv = mkAdv in_Prep ;
	defClass : CN -> NP = \c -> mkNP thePl_Det c ; 
	bareClass : CN -> NP = \c -> mkNP aPl_Det c ; 


--TODO: compilation error with QuestVP , and we must choose the appropiate verb:
--mymkQCl : IP -> Adv -> QCl   -- who is here   
--	= \x,y -> QuestVP x (mkVP (mkVP haber_V y)) ; 

--From Fruits
oper
	ownV2 : V2 = P.mkV2 own_V ;
	qclPred : IP -> NP -> QS =
		\ip,np -> mkQS (mkQCl ip (mkClSlash np ownV2)) ;

--From Farm
lin
	mkAmount np = np ;
lin
	isin ob1 ob2 = mkS (mkCl ob1 (min ob2)) ;
	E2isin am ob = mkS (ExistNP (mkNP am (min ob))) ;
--	Q2isin cl ob = mkQS (mymkQCl (howm cl) (min ob)) ; --Q2isin cl ob = mkQS (mkQCl (mkIP (howm cl) (min ob))) ;
	Q2isin cl ob = mkQS (mkQCl (howm cl) (min ob)) ;
	P2isin cl ob = mkNP (defClass cl) (min ob) ;
	C2isin cl am = mkNP (defClass cl) (min am) ;

--From Fruits
lin
	E1owns obj am = mkS (mkCl obj ownV2 am) ;
	P1owns obj cl = let
			cnThat : CN = mkCN cl (mkSC (mkS (mkCl obj own_V))) ;
		in mkNP thePl_Det cnThat ;
	Q1owns obj cl = let
			howm : IP = mkIP how8many_IDet cl
		in qclPred howm obj ;
}

