concrete Quant1Cat of Quant1 =
VariablesCat ** Quant1I - [existential]
with 
(Lexicon = LexiconCat),
(Syntax = SyntaxCat),
(Sentence = SentenceCat),
(Math = MathCat) **
open
MathCat, LexiconCat 
in 
{
oper
	existential : MathObj -> MathObj -> Proposition -> Proposition =
        	\vars,set,prop -> 
        		posS (mkS (mkCl (such_that_Ind (adverbNP (prepAdv in_Prep set) vars) prop))) ;

 	such_that_Ind : MathObj -> Proposition -> MathObj  
		= \o,p -> 
       		        adverbNP (mkAdv (mkSubjInd ["tal que"]) p) o ;
}
