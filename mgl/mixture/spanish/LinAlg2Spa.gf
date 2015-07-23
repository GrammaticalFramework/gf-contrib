concrete LinAlg2Spa of LinAlg2 =
GroundSpa ** LinAlg2I -[matrixrow, matrixrow_base, vector, vector_base]
with
(Lexicon = LexiconSpa),
(Syntax = SyntaxSpa),
(Math = MathSpa) **
{
oper  
  	pointOf : CN -> MathObj -> CN =
        	\point,x ->  mkCN point (prepAdv possess_Prep x) ;

        IndefCNofCN : CN -> CN -> MathObj -> MathObj =
        	\point,coords,obj -> 
            		InDefSgNP (pointOf point (mCoords coords obj)) ; 	
	IndefCNofCN1 : CN -> CN -> MathObj -> MathObj =
        	\point,coord,obj -> 
                        InDefSgNP (pointOf point (mkNP (mkCN (mkCN single_A coord) obj))) ;
 
	DefCNofCN : CN -> CN -> MathObj -> MathObj =
        	\point,coords,obj -> 
       			DefSgNP (pointOf point (mCoords coords obj)) ;
 
	DefCNofCN1 : CN -> CN -> MathObj -> MathObj =
	        \point,coord,obj -> 
		        DefSgNP (pointOf point (mkNP (mkCN single_A (mkCN coord obj)))) ; 



lin 
	matrixrow terms 	= mkMathObj (IndefCNofCN row_CN element_linalg_CN (andNP terms.v)) ;  
	matrixrow_base x 	= mkMathObj (IndefCNofCN1 row_CN element_linalg_CN x.v) ;  
	vector terms 		= mkMathObj (DefCNofCN vector_CN element_linalg_CN (andNP terms.v)) ;
	vector_base x 		= mkMathObj (DefCNofCN1 vector_CN element_linalg_CN x.v) ;
}

