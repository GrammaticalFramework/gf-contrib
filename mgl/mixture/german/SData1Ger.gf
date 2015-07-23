 concrete SData1Ger of SData1 =
 GroundGer **
 SData1I - [moment] 
with
 (Lexicon = LexiconGer),
 (Syntax = SyntaxGer),
 (Math = MathGer)
**
{
lin 
	moment index point list =
        	let i = mkOrd index.v
        	in mkMathObj (DefGenCNOrd moment_CN i (adverbNP (mkAdv over_Prep point.v) (andNP list.v))) ;  
}

