concrete FarmSpa of Farm = WPProblemSpa ** 
	FarmI 	 
with
        (Lexicon = LexiconSpa), 
	(Syntax = SyntaxSpa) **
open 
	(P = ParadigmsSpa)

in
{
lin
	omd = mkNP (P.mkPN "Old mcDonald's") ;
	duck = mkCN (P.mkN "pato");
	rabbit = mkCN (P.mkN "conejo");
}


