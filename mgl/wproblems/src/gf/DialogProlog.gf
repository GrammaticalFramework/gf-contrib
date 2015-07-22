concrete DialogProlog of Dialog =
	AllProblemsProlog **
open
	Formal,
	Prelude
in {
lincat
	Command 	= TermPrec ;
	Feedback	= TermPrec ;
	Fact 		= TermPrec ;
oper
	tell = fun1 "tell" ;
	hint = fun1 "hint" ;

lin
	Ok = constant "ok" ;

	Help = constant "help" ;

	Example = constant "example" ;
	
	TellAmount = tell ;
	TellVar    = tell ; 

	Define = fun2 "define" ;


	Assert x = x ;
	AssertEq eq = eq ;


lin
	just ans    = ans ;
	but ans     = variants {} ; -- to get an unambigous parsing
	instead ans = variants {} ;

	None  = constant "none" ;
	

	MustDefine  am   = hint (fun1 "define" am) ;
	MustPartite am   = hint (fun1 "partite" am) ;
	MustWriteEq aeq  = hint (fun1 "write_eq" aeq) ;

	AlreadyDefined = fun2 "already_defined" ;
	TryAgain = constant "try_again" ;

	PartitionEmpty  	 = constant "empty" ;
	PartitionNotSubclass = fun2 "not_subclass" ;
	PartitionSuperClass  = fun2 "superclass" ;
	PartitionNotCovers   = fun1 "not_covering" ;
	PartitionUnrelated	 = fun2 "unrelated" ;

	MEquationIncompatible eqs = fun1 "incompatible" eqs.t ;
	AEquationIncompatible eq  = fun1 "incompatible" eq ;
	EquationNotEntailed       = constant "not_entailed" ;
	EquationInconsistent	  = constant "inconsistent" ;

	combine = fun2 "," ;

}