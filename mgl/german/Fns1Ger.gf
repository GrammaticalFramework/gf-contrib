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
    left_compose  f g = fncomp composition_CN g f ;   --Komposition von g und f = f(g(x)) = f o g = left_compose
    right_compose f g = fncomp composition_CN f g ;
}
