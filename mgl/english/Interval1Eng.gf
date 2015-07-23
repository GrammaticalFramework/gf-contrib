concrete Interval1Eng of Interval1 =
GroundEng **
Interval1I - [oc_interval , co_interval]
with
	(Lexicon = LexiconEng),
	(Math = MathEng) **
open
	SyntaxEng
in 
{
oper
  oc_interval_oper : CN = variants
 			{	mkCN left_half_open_A interval_CN ;  
				mkCN right_half_closed_A interval_CN ;
			} ;
  co_interval_oper : CN = variants
			{	mkCN right_half_open_A interval_CN ; 
			    	mkCN left_half_closed_A interval_CN ; 
			} ;
}
