concrete Quant1Rus of Quant1 =
VariablesRus **
Quant1I - [forall_quantifier] with
(Lexicon = LexiconRus),
(Syntax = SyntaxRus),
(Sentence = SentenceRus),
(Math = MathRus) **
open
	MorphoRus,
	ResRus
in {
flags
	coding = utf8 ;

oper 
	every_Predet : Predet = (lin Predet { s = (uy_j_EndDecl "кажд").s ; g = PGen Masc; c =  Nom; size = nom }) ;
    forall_quantifier : MathObj -> S -> S =
        \vars -> ExtAdvS (prepAdv for_Prep (mkNP every_Predet vars)) ;

}