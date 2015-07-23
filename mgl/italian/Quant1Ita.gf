concrete Quant1Ita of Quant1 =
VariablesIta ** Quant1I - [existential,forall_quantifier] with
(Lexicon = LexiconIta),
(Syntax = SyntaxIta),
(Sentence = SentenceIta),
(Math = MathIta) **
open 
MathIta, LexiconIta, (P = ParadigmsIta), (E = ExtraIta) in
{
oper

        existential : MathObj -> MathObj -> Proposition -> Proposition =
        \vars,set,prop -> 
            posS (mkS (E.ExistsNP (such_that (adverbNP (prepAdv in_Prep set) vars) prop))) ;

 	such_that_Ind : MathObj -> Proposition -> MathObj  
		= \o,p -> adverbNP (mkAdv (mkSubjInd ["tale che"]) p) o ; ----- tale should agree. AR 22/5/2013

        forall_quantifier : MathObj -> S -> S =
       	  \vars -> ExtAdvS (prepAdv for_Prep (mkNP (P.mkPredet "ogni") vars)) ;


}
