concrete Quant1Fin of Quant1 =
VariablesFin **
Quant1I - [forall_quantifier]
with
(Lexicon = LexiconFin),
(Sentence = SentenceFin),
(Syntax = SyntaxFin),
(Math = MathFin) ** open ParadigmsFin in {

oper

        forall_quantifier : MathObj -> S -> S =
       	  \vars -> ExtAdvS (prepAdv (prePrep nominative "kaikille") vars) ;

}
