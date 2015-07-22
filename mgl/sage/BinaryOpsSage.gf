--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete BinaryOpsSage of BinaryOps =
GroundSage **
open 
  myFormal,
  mySage 
in
{
flags
	lexer = textlit ;
	unlexer = text ;
lin

--From Arith1
	bin_plus  = infixl 1 "+" ;
	bin_times = infixl 2 "*" ;
	bin_minus = infixl 1 "-" ;
	bin_over  = infixl 1 "/" ;

--From Logic1
	bin_and  	= infixr 1 "&" ;    
	bin_or   	= infixn 1 "|" ;
	bin_xor  	= infixn 1 "^" ;

--From Set1
	bin_cartesian_product a b =  constant "NotImplementedError()" ;  			--Set (delimited2 "cartesian_product([" ","  "])"  (Set a) (Set b)) ; 
													
			-- Set (cartesian_product([a,b])). The Sage cartesian product does not return a Set, with Set we obtain type "Set object with category"
			-- http://www.sagemath.org/doc/reference/sage/categories/cartesian_product.html#sage.categories.cartesian_product.cartesian_product
																
	bin_intersect a b =  function_command a (delimited_command "intersection" b) ;
														    	
	bin_union a b	=  function_command a (delimited_command "union" b) ;
}
