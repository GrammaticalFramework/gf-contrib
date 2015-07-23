concrete Interval1Pol of Interval1 =
GroundPol **
Interval1I - [oc_interval_oper , co_interval_oper] 
with
	(Lexicon = LexiconPol),
	(Syntax = SyntaxPol),
	(Math = MathPol) **
open
	ConstructorsPol
in {
oper
	oc_interval_oper : CN = open_interval_CN ;
-- variants
-- 			{	byLeft open_interval_CN ;
-- 				byRight closed_interval_CN
-- 			} ;
	co_interval_oper : CN = open_interval_CN ;
-- variants
-- 			{	byLeft closed_interval_CN ;
-- 				byRight open_interval_CN
-- 			} ;
}
