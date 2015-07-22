 concrete Arith1Ger of Arith1 =
 GroundGer **
 Arith1I - [root, power, rangeOp, rangeBtwn, unary_minus, minus] with 
	 (Lexicon = LexiconGer),
	 (Syntax = SyntaxGer),
	 (Symbolic = SymbolicGer),
	 (Math = MathGer) **
open 
        (P = ParadigmsGer) 	  
in 
{
lin
	root  = DefGenCNidxRev root_CN ;
	power x y = mkNP x (mkAdv hoch_Prep y) ; 

 	unary_minus ob = mkNP (mkCN minus_N ob) ;
	minus n1 n2    = mkNP (mkNP the_Det difference_CN) (mkAdv between_Prep (both_and n1 n2)) ; 

oper  
       rangeOp : CN -> MathObj -> Adv -> MathObj =
        		\cn,obj,range -> adverbNP range (mkNP the_Art (mkCN cn (mkAdv above_Prep obj)));

       rangeBtwn : MathVar -> (x0,x1:MathObj) -> Adv =
        	\v,x0,x1 ->
            		let
                		x = useVar v ;
                		cl : Cl = mkCl x range_V3 x0 x1 ;
				sen : S = mkS cl
            		in mkAdv wobei_Subj sen ;
 
       minus_N : N = P.mkN "minus" ;
}

