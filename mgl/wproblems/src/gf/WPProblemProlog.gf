concrete WPProblemProlog of WPProblem = AmountProlog ** 
open
	Formal in
{
oper
	find = fun1 "find" ;
lincat
	Sentence = TermPrec ;
	Question = TermPrec ;
lin
	fromQuestion p = p ;
	fromProp p = p ;
	aeq = fun2 "aeq" ;
	aeqNum = fun2 "aeq" ;
	every = fun1 "every" ;
	denote v x = variants {
		fun2 "def" v x ;
		fun2 "find" v x };
	mkAmount x = x ;
}