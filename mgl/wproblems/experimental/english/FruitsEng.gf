concrete FruitsEng of Fruits = WPProblemEng **
	FruitsI -- -[orange, banana]
with 
	(Lexicon = LexiconEng),
	(Syntax = SyntaxEng)
**
open 
	ParadigmsEng
in {
lin
	Orange = mkClass (mkN "orange") ;
	Banana = mkClass (mkN "banana") ;
}
