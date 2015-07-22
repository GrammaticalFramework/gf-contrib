--# -path=.:../Ground:../lexicon

concrete Transc1Sage of Transc1 = GroundSage **
open
	mySage,
	myFormal in
{
lin
	--we write these functions as symbolic expressions so that they can be easily derivated, integrated,... (Calculus1Sage)

	arcsinh = fun_X_hasNoVar (constant "arcsinh") ;
	arccos  = fun_X_hasNoVar (constant "arccos") ;
	arccoth = fun_X_hasNoVar (constant "arccoth") ;
	cosh    = fun_X_hasNoVar (constant "cosh") ;
	sec     = fun_X_hasNoVar (constant "sec") ;
	arccsch = fun_X_hasNoVar (constant "arccsch") ;
	tan     = fun_X_hasNoVar (constant "tan") ;
	arcsec  = fun_X_hasNoVar (constant "arcsec") ;
	ln      = fun_X_hasNoVar (constant "log");        --fun_X_hasNoVar (constant "ln")
	csch    = fun_X_hasNoVar (constant "csch") ;
	csc     = fun_X_hasNoVar (constant "csc") ;
	arctan  = fun_X_hasNoVar (constant "arctan") ;
	arccsc  = fun_X_hasNoVar (constant "arccsc") ;
	sin     = fun_X_hasNoVar (constant "sin") ;
	arcsin  = fun_X_hasNoVar (constant "arcsin") ;
	arctanh = fun_X_hasNoVar (constant "arctanh") ;
	sinh    = fun_X_hasNoVar (constant "sinh") ;
	arcsech = fun_X_hasNoVar (constant "arcsech") ;
	coth    = fun_X_hasNoVar (constant "coth") ;
	cos     = fun_X_hasNoVar (constant "cos") ;
	cot     = fun_X_hasNoVar (constant "cot") ;
	tanh    = fun_X_hasNoVar (constant "tanh") ;
	sech    = fun_X_hasNoVar (constant "sech") ;
	arccot  = fun_X_hasNoVar (constant "arccot") ;
	exp	= fun_X_hasNoVar (constant "exp") ;
	arccosh = fun_X_hasNoVar (constant "arccosh") ;
	log b   = fun_X_hasVar (mapping "X" (delimited  "log( X ,"  ")" b)) ;   			-- log(X,b) is logarithm of X to the base b
														-- map( X ,[ log( X , b) ]) [0]
}

