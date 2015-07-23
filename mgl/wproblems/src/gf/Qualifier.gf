abstract Qualifier = Class **
{
cat Qualifier;

fun
	Qual : Qualifier -> Class -> Class ; -- subclass(qual(X,C),C). X/=Y => disjoint(qual(X,C), qual(Y,C))
	red, blue, green : Qualifier ; 
}