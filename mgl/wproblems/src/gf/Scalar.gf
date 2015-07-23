abstract Scalar = 
{
cat
	Scalar ;
	Variable ; [Variable] {0} ;
	Number ; -- [Number] {2} ;
	Equation ; [Equation] {1} ;
fun
	isEq , isLe : Number -> Number -> Equation ;
	-- areEq : [Number] -> Equation ;
	
fun
	nplus,
	nminus,
	ntimes : Number -> Number -> Number ;
	-- nsum : [Number] -> Number ;

	var2num : Variable -> Number ;

fun
	n1, n2, n3, n4, n5, n6, n7, n8, n9 : Scalar ;
	n100, n260, n300 : Scalar ;
	fromInt : Int -> Number ;
	toScalar : Int -> Scalar ;

fun
	a, b, c, d, e, k, j, l : Variable ;
}
