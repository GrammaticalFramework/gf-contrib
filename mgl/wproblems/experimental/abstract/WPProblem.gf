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
	denote : Variable -> Amount -> Sentence ;
fun
	aeq : Amount -> Amount -> Prop ;
	every : Class -> Object ;

--From Fruits
fun
	E1owns : Object -> Amount -> Prop ;    -- O has A 
	P1owns : Object -> Class -> Amount ;   -- the C that O has
	Q1owns : Object -> Class -> Question ; -- How many C O has?

--From Farm
fun
	mkAmount : Amount -> Object ; 
fun
	isin : Object -> Object -> Prop ; -- O1 is in O2
	E2isin  : Amount -> Object -> Prop ; -- there are A in O
	P2isin  : Class -> Object -> Amount ;  -- the C in O
	Q2isin  : Class -> Object -> Question ; -- How many C are in O?
	C2isin  : Class -> Object -> Amount ;   
}
