abstract Scalar = 
--open
--	Syntax
--in
{
cat
	Scalar ;
	Variable ; [Variable] {0} ;
	Number ; [Number] {2} ;
	Equation ; [Equation] {1} ;
	Command ; 
fun
	isEq , isLe : Number -> Number -> Equation ;
	areEq : [Number] -> Equation ;
	solve : [Variable] -> [Equation] -> Command ;
	declare : [Variable] -> Command ;
fun
	nplus,
	nminus,
	ntimes : Number -> Number -> Number ;

	var2num : Variable -> Number ;

fun
	n1, n2, n3, n4, n5, n6, n7 : Scalar ;
	n100, n260, n300 : Scalar ;
	fromInt : Int -> Number ;

fun
	a, b, c, d, e, k, j, l : Variable ;
}
