concrete PlanGeo1Fin of PlanGeo1 =
VariablesFin ** PlanGeo1I - [useQualVar] 
with
(Lexicon = LexiconFin),
(Syntax = SyntaxFin),
(Math = MathFin) 
**
open
    (S = SyntaxFin)
in
{
oper
	useQualVar : CN -> MathVar -> MathObj = \cn, v -> S.mkNP the_Det (S.mkCN cn (S.mkNP v)) ;
}
