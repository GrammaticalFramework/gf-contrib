concrete FruitsGer of Fruits = WPProblemGer **
	FruitsI -- -[orange, banana]
with 
	(Lexicon = LexiconGer),
	(Syntax = SyntaxGer)
**
open 
	ParadigmsGer
in {
flags
	coding = utf8 ;
lin
	Orange = mkClass (mkN "Orange") ;
	Banana = mkClass (mkN "Banane") ;

}

