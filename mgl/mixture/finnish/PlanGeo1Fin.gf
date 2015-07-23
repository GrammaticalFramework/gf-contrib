concrete PlanGeo1Fin of PlanGeo1 =
VariablesFin ** PlanGeo1I - [useQualVar, point, line] 
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

lin
	point v cs 		= mkMathObj (qualSuchthat point_CN v cs.v) ; --(L.point (var2SS v) cs.s) False ;
	line v cs 		= mkMathObj (qualSuchthat line_CN v cs.v) ;  --(L.line (var2SS v) cs.s) False ; 
}
