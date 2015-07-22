--# -path=.:../Ground:../lexicon:../mathres:prelude:present:mathematical

concrete Relation1Sage of Relation1 =
GroundSage **
open 
        MathSage,
	mySage,
	myFormal 
in
{

flags
	lexer = textlit ;
	unlexer = text ; 

--2 relation1
lin
	eq_num  = rel "==" ;                 			  --symbolic equation

	neq_num = variants{ rel "!=" ;
			    rel "<>"};                       
	gt_num  = rel ">" ;
	lt_num  = rel "<" ;
	geq_num = rel ">=" ;
	leq_num = rel "<=" ; 
	approx  = variants{} ;
}
