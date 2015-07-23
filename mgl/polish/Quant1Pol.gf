concrete Quant1Pol of Quant1 =
VariablesPol **
Quant1I - [forall_quantifier] with
(Lexicon = LexiconPol),
(Syntax = SyntaxPol),
(Sentence = SentencePol),
(Math = MathPol) **
open
	MorphoPol,
	ResPol
in {
flags
	coding = utf8 ;

oper 
	every_Predet : Predet = (lin Predet { s= mkAtable (mkCompAdj "każdy").pos; np=wszystko; adj=True }) ;
    forall_quantifier : MathObj -> S -> S =
        \vars -> ExtAdvS (prepAdv for_Prep (mkNP every_Predet vars)) ;

}