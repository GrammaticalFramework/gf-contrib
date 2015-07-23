concrete Interval1Rus of Interval1 =
GroundRus **
Interval1I - [oc_interval , co_interval] 
with
	(Lexicon = LexiconRus),
	(Syntax = SyntaxRus),
	(Math = MathRus) **
open
	ConstructorsRus
in {
oper
	oc_interval : CN = open_interval_CN ;
-- variants
-- 			{	byLeft open_interval_CN ;
-- 				byRight closed_interval_CN
-- 			} ;
	co_interval : CN = open_interval_CN ;
-- variants
-- 			{	byLeft closed_interval_CN ;
-- 				byRight open_interval_CN
-- 			} ;
}
