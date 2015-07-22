--# -path=../resources
-- Testing the upper layer
abstract MixtureTest =
    Operations,
    OpenMath **
{
flags
    startcat = Exercise ;

fun 
	asVerbal : ValNum -> Text ;
	asFormula: ValNum -> Formula ;

Text = Text ;
Formula = Str ;
} ;

