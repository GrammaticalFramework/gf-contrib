--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete Arith1Sage of Arith1 =
GroundSage **
open 
  myFormal,
  mySage in
{
flags
	lexer 	= textlit ;
	unlexer = text ;

oper
	mkPowerC : Str -> TermPrec -> TermPrec = 
		\n,x -> infixr 3 "^" x (constant n) ;

  	arith_set : Str -> (_,_,_: Str) -> TermPrec = 
	       	\com,z,x,set -> mkPrec highest (com ++ "(" ++ z ++ "for" ++ x ++ "in" ++ set ++ ")") ; 
  
	delimited4 : Str -> (_,_,_,_: Str) -> TermPrec = 
	       	\com,x1,x2,x3,x4 -> mkPrec highest (com ++ "(" ++ x1 ++ "," ++ x2 ++ "," ++ x3 ++ "," ++ x4 ++ ")") ; 
	      --\com,x1,x2,x3,x4 -> mkPrec highest (com ++"(" ++ (usePrec 0 x1) ++ "," ++ (usePrec 0 x2) ++ "," ++ (usePrec 0 x3) ++ "," ++ (usePrec 0 x4) ++ ")") ; 

--2 arith1
lin
        abs	= delimited_command "abs" ;
        power 	= infixr 3 "^" ; -- **
 	power2 	= mkPowerC "2" ;
	power3 	= mkPowerC "3" ; 

	unary_minus x = mkPrec 1 ("-" ++ (usePrec 3 x)); 
	minus 	= infixl 1 "-" ; 
	divide 	= division ;

        root x n = function_command (RR x) (delimited_command "nth_root" (mkPrec 1 n.s)); 	-- RR ( x ).nth_root(n)
												-- alternative: delimited2_index "RR(" ").nth_root(" ")" x n.s ; 
 	root2 	= delimited_command "sqrt" ;
        root3 x	= command_postfix "cube_root" (delimited_command "RR" x) ;                      -- RR( x ).cube_root()

        gcd xs  = delimited "GCD([" "])" (mkPrec 1 xs.s) ;
        lcm xs  = delimited "LCM([" "])"(mkPrec 1 xs.s) ;

        sum x set z     	= arith_set "sum"  z.s x.s set.s ;   	           	      -- the sum of z(x) when x ranges over set
        product x set z 	= arith_set "prod" z.s x.s set.s ;        

        sum_range x lo hi z     = arith_set "sum"  z.s x.s ("range(" ++ lo.s ++ "," ++ hi.s ++ "+1)") ; 
									-- sum_range x lo hi z = the sum of z(x) when x ranges from lo to hi = sum(z,x,lo,hi)  
 
        product_range x lo hi z = arith_set "prod" z.s x.s ("range(" ++ lo.s ++ "," ++ hi.s ++ "+1)") ; 

--3 Use transfer instead
lin	
	plus xs  = variants {delimited "sum([" "])" (mkPrec 0 xs.s) ;
			    delimited "add([" "])" (mkPrec 0 xs.s) } ;

	times xs = delimited "mul([" "])" (mkPrec 0 xs.s) ;
}
