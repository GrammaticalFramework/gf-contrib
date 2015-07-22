concrete Transc1Swe of Transc1 =
GroundSwe ** open MathSwe,LexiconSwe,SyntaxSwe,ParadigmsSwe in {

--1 transc1
lin
	arccos = trig_fn ["arcus cosinus"];

	arccosh = named_fn (f_inverse (hyperbolic cosine_CN));
	arccot = named_fn arccotangent_CN ;
    	arccoth = named_fn (f_inverse (hyperbolic cotangent_CN)) ;
	arccsc = named_fn arccosecant_CN ; 
	arccsch = named_fn (f_inverse (hyperbolic cosecant_CN)) ;
	arcsec = named_fn arcsecant_CN ; 
	arcsech = named_fn (f_inverse (hyperbolic secant_CN));

	arcsin = trig_fn ["arcus sinus"];

	arcsinh = named_fn (f_inverse (hyperbolic sine_CN)) ;

	arctan = trig_fn ["arcus tangens"];

	arctanh = named_fn (f_inverse (hyperbolic tangent_CN)) ;
	csc = named_fn cosecant_CN ; 
	csch = named_fn (hyperbolic cosecant_CN) ;

	cos = trig_fn "cosinus";
	cosh = trig_fn ["cosinus hyperbolicus"];
	cot = trig_fn "cotangens";
	coth = trig_fn ["cotangens hyperbolicus"];

	sec = named_fn secant_CN ;
	sech = named_fn (hyperbolic secant_CN) ;

	sin = trig_fn "sinus" ;
	sinh = trig_fn ["sinus hyperbolicus"];
	tan = trig_fn "tangens";
	tanh = trig_fn ["tangens hyperbolicus"];

	exp =  named_fn exponential_CN ; 
	log m = NPfn (DefGenCN logarithm_CN m) ;
	ln =  named_fn natural_logarithm_CN ;

oper
    trig_fn : Str -> MathFunc = \s -> 
        {t= FNamed; s2=NullVar} ** (mkNP (mkPN s)) ;
}
