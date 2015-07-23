incomplete concrete PeopleI of People = WPProblemI **
open
	Syntax,
        Lexicon
in
{
oper
	mkHuman : Str -> NP = \s -> mkNP (P.mkPN s) ;
lin
	John  = mkHuman "John" ;
	Mary  = mkHuman "Mary" ;
}
