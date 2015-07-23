concrete WPProblemGer of WPProblem = AmountGer ** 
open
	SyntaxGer in
{
	
lincat
	Sentence = Text ;
	Question = QS ;
lin
	fromProp = mkText ;
	fromQuestion = mkText ;
	aeq x y = mkS (mkCl x y) ;
	every c = mkNP every_Det c ;
}
