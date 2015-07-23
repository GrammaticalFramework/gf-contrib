concrete Quant1Swe of Quant1 =
VariablesSwe ** Quant1I-[forall_quantifier] with
(Lexicon = LexiconSwe),
(Syntax = SyntaxSwe),
(Sentence = SentenceSwe),
(Math = MathSwe) ** 
open SyntaxSwe in {

oper
   forall_quantifier : MathObj -> S -> S =
       	\vars -> ExtAdvS (prepAdv for_Prep (mkNP everybody_NP (lin Adv (mkUtt vars)))) ;

}
