 concrete Quant1Fre of Quant1 =
 VariablesFre **
 Quant1I - [existential] with
 (Lexicon = LexiconFre),
 (Syntax = SyntaxFre),
(Sentence = SentenceFre),
 (Math = MathFre) **
open MathFre, LexiconFre, (P = ParadigmsFre), (E = ExtraFre) in {
oper

        existential : MathObj -> MathObj -> Proposition -> Proposition =
        \vars,set,prop -> 
            posS (mkS (E.ExistsNP (such_that (adverbNP (prepAdv in_Prep set) vars) prop))) ;

 	such_that_Ind : MathObj -> Proposition -> MathObj  
		= \o,p -> adverbNP (mkAdv (mkSubjInd ["tel que"]) p) o ; ----- tel should agree. AR 22/5/2013

}
