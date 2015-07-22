incomplete concrete FruitsI of Fruits = 
	WPProblemI **
open
	Syntax,
        Lexicon
in
{
oper
	mkClass : N -> CN = \n -> mkCN n ;
lin
--	Orange = mkClass orange_N ;   --in DictLan
	Apple  = mkClass apple_N ;
	Fruit  = mkClass fruit_N ;
--	Banana = mkClass banana_N ;   --in DictLan
}
