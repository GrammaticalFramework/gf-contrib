abstract Dialog = 
	AllProblems **
{
cat
	Command ;
	Fact ;
	Feedback ;

fun
	Help : Command ;
	Example : Command ;
	TellAmount : Amount -> Command ;
	TellVar    : Variable -> Command ;
	Define : Variable -> Amount -> Command ;
	Assert : Prop -> Command ;
	AssertEq : Equation -> Command ;


fun
	Ok : Fact ;
	None : Fact ;
	MustDefine  : Amount -> Feedback ; 
	MustPartite : Amount -> Feedback ; 
	MustWriteEq : Prop -> Feedback ;  -- [Prop] argument split by Scala
fun
	TryAgain : Feedback ;
	AlreadyDefined : Variable -> Amount -> Fact ;
fun
	PartitionNotSubclass : Class -> Class -> Fact ;
	PartitionEmpty : Fact ;
	PartitionSuperClass : Class -> Class -> Fact ;
	PartitionNotCovers : Class -> Fact ;
	PartitionUnrelated : Amount -> Amount -> Fact ;
fun
	MEquationIncompatible : [Amount] -> Feedback ;
	AEquationIncompatible : Amount -> Feedback ;
	EquationNotEntailed : Feedback ; -- : Equation -> Feedback ;
	EquationInconsistent : Feedback ;
fun
	just, but, instead : Fact -> Feedback ;
	combine : Feedback -> Feedback -> Feedback ; 
--	Solve : [Variable] -> [Equation] -> Command ;
}