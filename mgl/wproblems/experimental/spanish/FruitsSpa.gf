concrete FruitsSpa of Fruits = WPProblemSpa **
	FruitsI -- -[orange, banana]
with 
	(Lexicon = LexiconSpa),
	(Syntax = SyntaxSpa)
**
open 
	ParadigmsSpa
in {
flags
	coding = utf8 ;
lin
	Orange = mkClass "naranja" ;
	Banana = mkClass "plátano" ;
}


