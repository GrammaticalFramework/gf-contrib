abstract Amount = 
	Class,
	Scalar
** 
{
cat
	Amount ; [Amount] {2} ;
fun
	gen :  Class -> Scalar -> Amount ;
	atimes : Scalar -> Amount -> Amount ;
	aplus  : [Amount] -> Amount ;
	some, unknown  : Class -> Amount ;
	avar  : Variable -> Class -> Amount ;

--      twice_Predet:  Predet;
--      thrice_Predet: Predet;


{- fun 
	twice, thrice : Amount -> Amount ;
def
	twice am  = atimes n2 am ;
	thrice am = atimes n3 am ;
-}
}
