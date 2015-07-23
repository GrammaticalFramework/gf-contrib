concrete FarmGer of Farm = WPProblemGer ** 
	FarmI 	 
with
        (Lexicon = LexiconGer), 
	(Syntax = SyntaxGer) **
open 
	(P = ParadigmsGer)

in
{
flags
	coding = utf8 ;
lin
	omd = mkNP (P.mkPN "Old mcDonald's") ;
	duck = mkCN (P.mkN "Ente");
	rabbit = mkCN (P.mkN "Kaninchen" "Kaninchen" P.neuter);
}

