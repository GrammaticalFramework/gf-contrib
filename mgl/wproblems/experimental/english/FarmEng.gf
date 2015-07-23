concrete FarmEng of Farm = WPProblemEng ** 
	FarmI 	 
with
        (Lexicon = LexiconEng), 
	(Syntax = SyntaxEng) **
open 
	(P = ParadigmsEng)

in
{
lin
	omd = mkNP (P.mkPN "Old mcDonald's") ;
	duck = mkCN (P.mkN "duck");
	rabbit = mkCN (P.mkN "rabbit");
}
