 concrete Quant1Ger of Quant1  =
 VariablesGer **
 Quant1I  - [forall_quantifier] 
with
 (Lexicon = LexiconGer),
 (Syntax = SyntaxGer),
 (Sentence = SentenceGer),
 (Math = MathGer)
**
open 
	MathGer, 
	LexiconGer, 
	ResGer,
	(P = ParadigmsGer)
in {  
flags
	coding = utf8 ;

oper
 
	forAdv : NP -> Adv = \np -> P.mkAdv("für alle"++ np.s!(NPC Acc) ++ " , ");

        --empty_CN = mkCN (P.mkN " ") ;
       
	forall_quantifier : MathObj -> S -> S =    	
		\vars,s -> mkS (forAdv vars) s ;
                                                    -- in german we write "für alle x", vars is always treatened in plural
					            -- The option (mkNP all_Predet vars)) s; writes "für alles x", x singular
    
                --\vars,s -> mkS (forAdv vars) (mkS (mkCl (mkNP (mkCN empty_CN s)) hold_V ));

}

