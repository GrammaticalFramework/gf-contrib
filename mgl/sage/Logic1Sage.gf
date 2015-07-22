--# -path=.:../Ground:../lexicon

concrete Logic1Sage of Logic1 = GroundSage **
open
	myFormal,
	mySage in
{
--Site Propositional Calculus in Sage Reference v4.7
--http://www.sagemath.org/doc/reference/sage/logic/propcalc.html#classes-and-functions

lin
	not = ufun1 "~" ;             			
			
	implies p q	= function_command (delimited_brackets p) (delimited_command "ifthen" q) ;   		--but there is the command -> as well
	equivalent p q 	= function_command (delimited_brackets p) (delimited_command "equivalent" q) ;   	--but there is the command <-> as well!
	true 		= constant "True" ;
	false 		= constant "False" ;
lin
	and terms 	= delimited  "and_list([" "])" (mkPrec 0 terms.s);
	or  terms 	= delimited  "or_list([" "])"  (mkPrec 0 terms.s);
	xor terms 	= delimited  "xor_list([" "])" (mkPrec 0 terms.s);


	--and terms 	= mkPrec 0 terms.a ;  										--[Prop] -> Prop ;
	--or terms	= mkPrec 0 terms.o ;
	--xor terms 	= mkPrec 0 terms.r ;

{-
--2 Binary operators (transfer)
lin
	bin_and  	= infixr 1 "&" ;    
	bin_or   	= infixn 1 "|" ;
	bin_xor  	= infixn 1 "^" ;
-}
}


