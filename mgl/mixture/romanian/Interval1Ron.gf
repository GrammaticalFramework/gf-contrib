concrete Interval1Ron of Interval1 =
GroundRon **
Interval1I - [oc_interval , co_interval]
with
	(Lexicon = LexiconRon),
	(Math = MathRon) **
open
	SyntaxRon,
	ParadigmsRon
in {
oper
	half_open : CN -> CN	= mkCN (regA "semi-deschis")  ;
	half_closed : CN -> CN	= mkCN (regA "semi-închis") ; 
	oc_interval : CN = variants
			{	byLeft (half_open interval_CN) ;
				byRight (half_closed interval_CN) ;
			} ;
	co_interval : CN = variants
			{	byLeft (half_closed interval_CN) ;
				byRight (half_open interval_CN) ;
			} ;
}
