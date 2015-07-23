concrete QualifierProlog of Qualifier =
	ClassProlog **
open
	Formal in 
{
lincat
	Qualifier = Str ;

lin
	Qual q c = mfun2 "adj" (constant q) c ;
	red   = "red" ;
	blue  = "blue" ;
	green = "green" ;
}