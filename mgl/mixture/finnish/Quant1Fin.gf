concrete Quant1Fin of Quant1 =
VariablesFin **
Quant1I - [exist, forall, forall_set]
with
(Lexicon = LexiconFin),
(Sentence = SentenceFin),
(Syntax = SyntaxFin),
(Math = MathFin)  **
	open 
   MathFin, 
   LexiconFin 
in 
{
lin
	exist vars set prop 	 = mkFullPropPlus (existential (andVars vars) set.v prop.v) ; 			--(L.exist (var2SS vars.s3) set.s prop.s) False;
	forall vars prop 	 = mkFullPropPlus (forall_quantifier (andVars vars) prop.v) ; 			--(L.forall (var2SS vars.s3) prop.s) False ;
	forall_set vars set prop = mkFullPropPlus (forall_quantifier (adverbNP (inObj set.v) (andVars vars)) prop.v) ; 
														--(L.forall_set (var2SS vars.s3) set.s prop.s) False ;
}
