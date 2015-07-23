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
	floor x   = mkMathObj (mkNP x.v floor_Adv) (L.floor x.s) x ;
	ceiling x = mkMathObj (mkNP x.v ceiling_Adv) (L.ceiling x.s) x ;
        round x   = mkMathObj (mkNP x.v round_Adv) (L.round x.s) x ;
	trunc x   = mkMathObj (mkNP x.v trunc_Adv) ; 
 }
