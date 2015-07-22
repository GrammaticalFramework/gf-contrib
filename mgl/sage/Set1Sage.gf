--# -path=.:../Ground:../lexicon

concrete Set1Sage of Set1 = GroundSage **
open
	mySage,
	Prelude,
	myFormal in
{
oper
	subsets : TermPrec -> TermPrec -> (_,_: Str)-> TermPrec = 
			\a, b, strBoolSubset, strBoolProper -> 
					mkPrec highest ((usePrec 0 a) ++ ".subsets(" ++ (usePrec 0 b) ++"," ++ strBoolSubset ++ "," ++ strBoolProper ++ ")") ; 
	
--	Set : TermPrec -> TermPrec = \set -> delimited_command "Set" set ;
								  
lin
	map v x a	 	=  delimited_command_withcomma "map_sage" x a ;           -- set of values of the form x=x(v) when v ranges over A
											 -- map does not work for continuous sets. v not used!
	suchthat set x p 	= delimited_command_withcomma "suchthat_sage" set p ;   	 -- the set of x ranging in A such that p(x). x not used!
	 										 
	emptyset 	= constant "RealSet([],[])" ;

	size a 		= command_postfix "size" a ;  	

	set xs 		= variants {delimited "RealSet([],[" "])" (mkPrec 1 xs.s) ;
			           delimited "{" "}" (mkPrec 1 xs.s)
				   }; 	

	set_base x	= variants{delimited_command "RealSet.singleton" x ;
				   delimited "{" "}" x
				   };			

	setdiff a b 	= function_command a (delimited_command "setdiff"  b) ;

	subset a b 	= subsets a b "1" "0" ;
	  
	set1_in x a	= isTrue  (delimited_brackets (infixn 1 "in" x a)) ;
	notin x a	= isFalse (delimited_brackets (infixn 1 "in" x a)) ;

	prsubset a b	= subsets a b "1" "1" ; 
	notsubset a b   = subsets a b "0" "0" ;
	notprsubset a b	= subsets a b "0" "1" ; 

--3 
lin
	cartesian_product terms =  constant "NotImplementedError()" ; 					--Set( delimited "cartesian_product([" "])" (mkPrec 0 terms.s) );  		
					
	intersect terms 	= delimited "RealSet_intersection([" "])"   (mkPrec 0 terms.s) ;

	union terms 		= delimited "RealSet_union([" "])"   (mkPrec 0 terms.s) ;

{-
--3 Binary operators
lin

	bin_cartesian_product a b =  constant "NotImplementedError()" ;  			--Set (delimited2 "cartesian_product([" ","  "])"  (Set a) (Set b)) ; 
													
			-- Set (cartesian_product([a,b])). The Sage cartesian product does not return a Set, with Set we obtain type "Set object with category"
			-- http://www.sagemath.org/doc/reference/sage/categories/cartesian_product.html#sage.categories.cartesian_product.cartesian_product
																
	bin_intersect a b =  function_command a (delimited_command "intersection" b) ;
														    	
	bin_union a b	=  function_command a (delimited_command "union" b) ;
-}
}

