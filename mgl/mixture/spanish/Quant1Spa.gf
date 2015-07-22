concrete Quant1Spa of Quant1 =
VariablesSpa ** Quant1I - [existential]
with
	(Lexicon = LexiconSpa),
	(Syntax = SyntaxSpa),
	(Sentence = SentenceSpa),
	(Math = MathSpa) **
open
	MathSpa,
	LexiconSpa 
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
