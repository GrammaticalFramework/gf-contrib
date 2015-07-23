concrete SData1Eng of SData1 =
GroundEng ** SData1I - [moment]
with
(Lexicon = LexiconEng),
(Syntax = SyntaxEng),
(Math = MathEng) 
** 
open
	MathEng, LexiconEng  

in 
{
oper
    aboutObj : MathObj -> Adv = prepAdv about_Prep ;
lin
	moment index point list = 
	        let i = mkOrd index.v
        	in mkMathObj (DefGenCNOrd moment_CN i (adverbNP (aboutObj point.v) (andNP list.v))) ;  
												-- selectOrd' moment_N index (mkNP (andNP list) (aboutObj point)) ;
}

