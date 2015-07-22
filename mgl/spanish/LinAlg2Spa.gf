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
	matrixrow terms = IndefCNofCN row_CN element_linalg_CN (andNP terms) ;  
	matrixrow_base = IndefCNofCN1 row_CN element_linalg_CN ; 
	vector terms = DefCNofCN vector_CN element_linalg_CN (andNP terms) ;
	vector_base = DefCNofCN1 vector_CN element_linalg_CN ;
}

