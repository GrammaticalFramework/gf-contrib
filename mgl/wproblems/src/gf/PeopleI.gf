incomplete concrete PeopleI of People =
ClassI **
open
	Syntax,
    Lexicon
in
{
oper
	mkHuman : Str -> NP = \s -> mkNP (mkPN s) ;
lin
	John  = mkHuman "John" ;
	Mary  = mkHuman "Mary" ;
}
