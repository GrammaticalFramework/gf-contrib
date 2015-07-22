concrete Interval1Fin of Interval1 =
GroundFin **
Interval1I with
(Lexicon = LexiconFin),
(Math = MathFin),
(Syntax = SyntaxFin)
  
{-

open
	SyntaxEng
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

-}
