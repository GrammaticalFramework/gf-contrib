concrete SData1Eng of SData1 =
GroundEng ** SData1I - [moment]
with
(Lexicon = LexiconEng),
(Syntax = SyntaxEng),
(Math = MathEng) ** 
open
	MathEng, LexiconEng  
in 
{
lin
	moment index point list = 
        let i = mkOrd index
        in DefGenCNOrd moment_CN i (adverbNP (aboutObj point) (andNP list)) ;  -- selectOrd' moment_N index (mkNP (andNP list) (aboutObj point)) ;
}
