 concrete Rounding1Ger of Rounding1 =
 GroundGer ** Rounding1I - [ceiling, floor, round, trunc] 
 with
 (Syntax = SyntaxGer),
 (Lexicon = LexiconGer),
 (Math = MathGer) **
 open
	 (P = ParadigmsGer)
in 
{
oper
 	floor_Adv = mkAdv (P.mkA "abgerundet") ;  --(although 'abgerundet' it is not an adverb but an adjective...)
	ceiling_Adv = mkAdv (P.mkA "aufgerundet") ;
	round_Adv = mkAdv (P.mkA "gerundet") ;
	trunc_Adv = mkAdv (P.mkA "abgeschnitten") ;


lin 
	floor x = mkNP x floor_Adv ;
	ceiling x = mkNP x ceiling_Adv ;
        round x = mkNP x round_Adv ;
	trunc x = mkNP x trunc_Adv ; 
 }
