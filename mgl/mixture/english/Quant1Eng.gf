concrete Quant1Eng of Quant1 =
VariablesEng ** Quant1I -- -[forall_quantifier] 
with
(Lexicon = LexiconEng),
(Syntax = SyntaxEng),
(Sentence = SentenceEng),
(Math = MathEng)

{- trying "for all x , p holds"

**
open 
	(P = ParadigmsEng)
in
{
oper 
 	empty_CN = mkCN (P.mkN " ") ;
  
	forall_quantifier : MathObj -> S -> S =
              \vars,s -> mkS (prepAdv for_Prep (mkNP all_Predet vars)) (mkS (mkCl (mkNP (mkCN empty_CN s)) hold_V )) ;
}

-}
