incomplete concrete Fns1I of Fns1 =
GroundI **
open 
  Math,
  Prelude, 
  (L = Fns1LaTeX)
in
{
oper
    fncomp : CN -> (f,g:MathFunc) -> MathFunc =
        \cn,f,g -> let 
                    lf : NP = fn_qualNP f ;
                    lg : NP = fn_qualNP g ;
                    mapf : NP -> NP = \n -> DefGenCN cn (both_and lf n) ; 
                    fg : NP = variants {mapf g; mapf lg}
                in case g.t of {
                    FVar => lambda_fn g.s2 fg ;
                    _ => NPfn fg } ;

 --1 fns1
lin
	domain f 	= mkMathObj (fn_qualNP (flwrt domain_CN f.v)) ; 				--(L.domain f.s) f ;
	range f  	= mkMathObj (fn_qualNP (flwrt range_CN f.v)) ; 					--(L.range f.s) f ;
	inverse f 	= mkMathFunc (flwrt inverse_function_CN f.v) (L.inverse f.s) f;
	left_inverse f 	= mkMathFunc (flwrt left_inverse_function_CN f.v) ; 				--(L.left_inverse f.s) f ;
	right_inverse f = mkMathFunc (flwrt right_inverse_function_CN f.v) ; 				--(L.right_inverse f.s) f ;         
	left_compose f g = mkMathFunc (fncomp left_composition_CN f.v g.v) (L.left_compose f.s g.s) f g ;
	right_compose f g = mkMathFunc (fncomp right_composition_CN f.v g.v) (L.right_compose f.s g.s) f g ;
	identity 	= mkMathFunc (named_fn identity_CN) (L.identity) True ;
	lambda x y 	= mkMathFunc (lambda_fn x y.v) (L.lambda x y.s) y ; ---mkFunc f (useStr f.v) ;
}
