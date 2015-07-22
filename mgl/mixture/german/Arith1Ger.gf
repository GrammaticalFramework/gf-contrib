 concrete Arith1Ger of Arith1 =
 GroundGer **
 Arith1I - [root, power, rangeOp, rangeBtwn, unary_minus, minus] with 
	 (Lexicon = LexiconGer),
	 (Syntax = SyntaxGer),
	 (Math = MathGer) 
**
open 
        (P = ParadigmsGer) 	  
in 
{
lin
	root x k  	= mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x ;  

	power x y 	= mkMathObj (mkNP x.v (mkAdv hoch_Prep y.v)) (L.power x.s y.s) x y ; 
 
 	unary_minus x 	= mkMathObj (mkNP (mkCN minus_N x.v)) (L.unary_minus x.s) x ;

	minus n1 n2    	= mkMathObj (mkNP (mkNP the_Det difference_CN) (mkAdv between_Prep (both_and n1.v n2.v))) (L.minus n1.s n2.s) n1 n2 ; 

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

