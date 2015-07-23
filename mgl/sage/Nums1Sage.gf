--# -path=.:../Ground:../lexicon

concrete Nums1Sage of Nums1 = GroundSage **
open 
	myFormal,
	mySage,
	Prelude 
in
{
oper
	decimal_conversion : Str -> SS -> Value = \b,s -> constant ( "ZZ('" ++ s.s ++ "', base =" ++ b ++ ")" ) ;    			--ZZ("s", base=b)

lin
	nums1_e 	= constant "e" ;
	nums1_i 	= constant "I" ;
	nums1_gamma 	= constant "euler_gamma" ;
	nums1_pi 	= constant "pi" ;
	nums1_NaN 	= constant "NaN" ; 
	nums1_infinity 		= prefix 4 "+" (constant "Infinity") ;
	nums1_minus_infinity 	= prefix 4 "-" (constant "Infinity") ; 
	nums1_rational 	= division ;
	based_integer b s  = decimal_conversion b.s s ;                      -- https://groups.google.com/group/sage-devel/browse_thread/thread/36f73d1e9def6683
	based_integer2 s   = delimited "ZZ(str(" "), base= 2)"   (constant s.s) ; 			
        based_integer8 s   = delimited "ZZ(str(" "), base= 8)"   (constant s.s) ; 			
	based_integer10 s  = delimited "ZZ(str(" "), base= 10)"  (constant s.s) ; 			
	based_integer16 s  = delimited "ZZ(str(" "), base= 16)"  (constant s.s) ; 			
}

