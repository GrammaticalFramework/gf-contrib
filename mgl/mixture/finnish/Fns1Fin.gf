concrete Fns1Fin of Fns1 =
GroundFin ** 
Fns1I - [lambda] with
(Lexicon = LexiconFin),
(Syntax = SyntaxFin),
(Math = MathFin) **
	open 
   MathFin, 
   LexiconFin 
in 
{
lin
		lambda x y 	= mkMathFunc (lambda_fn x y.v) (L.lambda (var2SS x) y.s) y ;
}
