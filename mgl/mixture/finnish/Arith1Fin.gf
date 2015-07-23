concrete Arith1Fin of Arith1 =
GroundFin **
Arith1I - [root, sum, product, sum_range, product_range] with
	(Lexicon = LexiconFin),
	(Syntax = SyntaxFin),
	(Symbolic = SymbolicFin),
	(Math = MathFin) **
open MathFin, LexiconFin in 
{
lin 
        root x k  		= mkMathObj (DefGenCNidxRev root_CN x.v k) (L.root x.s k.s) x ;

	sum v set z             = mkMathObj (rangeOp summation_CN z.v (rangeOver v set.v)) (L.sum (var2SS v) set.s z.s) set z ;      
        product v set z         = mkMathObj (rangeOp product_CN z.v (rangeOver v set.v)) (L.product (var2SS v) set.s z.s) set z ; 
	sum_range v x0 x1 z     = mkMathObj (rangeOp summation_CN z.v (rangeBtwn v x0.v x1.v)) (L.sum_range (var2SS v) x0.s x1.s z.s) x0 x1 z ;
	product_range v x0 x1 z = mkMathObj (rangeOp product_CN z.v (rangeBtwn v x0.v x1.v)) (L.product_range (var2SS v) x0.s x1.s z.s) x0 x1 z ;  
}
