--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete BinaryOpsLaTeX of BinaryOps =
GroundLaTeX **
open 
  myFormal,
  myLaTeX 
in
{
flags
	lexer = textlit ;
	unlexer = text ;
lin

--From Arith1
	bin_plus = infixr 1 "+" ;
	bin_times = infixr 2 "\\cdot" ;
	bin_minus = infixr 1 "-" ;
        bin_over = infixr 1 "/" ;

--From Logic1
	bin_and  = infixn 1 "\\wedge" ;
	bin_or   = infixn 1 "\\vee" ;
	bin_xor  = infixn 1 "\\otimes" ;

--From Set1
	bin_cartesian_product = infixr 2 "\\times" ;
	bin_intersect = infixr 2 "\\cap" ;
	bin_union = infixr 1 "\\cup" ;
}
