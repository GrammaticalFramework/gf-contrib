concrete Interval1Urd of Interval1 =
GroundUrd **
Interval1I - [oc_interval , co_interval]
with
	(Lexicon = LexiconUrd),
	(Math = MathUrd) **
open
	SyntaxUrd
in {

oper
	half_open : CN -> CN	= mkCN half_open_A  ;
	half_closed : CN -> CN	= mkCN half_closed_A ; 
	oc_interval : CN = variants
			{	byLeft (half_open interval_CN) ;
				byRight (half_closed interval_CN) ;
			} ;
	co_interval : CN = variants
			{	byLeft (half_closed interval_CN) ;
				byRight (half_open interval_CN) ;
			} ;

}
