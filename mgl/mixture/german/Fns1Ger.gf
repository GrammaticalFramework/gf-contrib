 concrete Fns1Ger of Fns1 =
 GroundGer ** 
 Fns1I - [left_compose, right_compose] 
with
 (Lexicon = LexiconGer),
 (Syntax = SyntaxGer),
 (Math = MathGer) **
open
	MathGer
in
{
lin
    left_compose  f g = mkMathFunc (fncomp composition_CN g.v f.v) (L.left_compose f.s g.s) f g ;   --Komposition von g und f = f(g(x)) = f o g = left_compose
    right_compose f g = mkMathFunc (fncomp composition_CN f.v g.v) (L.right_compose f.s g.s) f g ;
}
