abstract WPRelation = WPProblem **
{
fun  -- own
	E1owns : Object -> Amount -> Prop ;    -- O has A 
	P1owns : Object -> Class -> Amount ;   -- the C that O has
	Q1owns : Object -> Class -> Question ; -- How many C O has?

fun  -- isin
	isin    : Object -> Object -> Prop ; -- O1 is in O2
	E2isin  : Amount -> Object -> Prop ; -- there are A in O
	P2isin  : Class -> Object -> Amount ;  -- the C in O
	Q2isin  : Class -> Object -> Question ; -- How many C are in O?

}