abstract WPProblem = 
	Amount **
{
flags startcat = Sentence ;
cat
	Sentence ;
	Question ;
fun
	fromProp : Prop -> Sentence ;
	fromQuestion : Question -> Sentence ;
	forall : Class -> Amount -> Amount ;
	denote : Variable -> Amount -> Sentence ;
fun
	aeq : Amount -> Amount -> Prop ;
	aeqNum : Amount -> Scalar -> Prop ;
	every : Class -> Object ;

--From Farm
fun
	mkAmount : Amount -> Object ; 
}
