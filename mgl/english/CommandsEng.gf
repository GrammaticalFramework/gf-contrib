--# -path=present:../abstract:../resources

concrete CommandsEng of Commands =
    GroundEng, 
    OpenMathEng,
    BinaryOpsEng **
    CommandsI - [Assign, AssignFun]
with
    (Lexicon = LexiconEng),
    (Math    = MathEng),
    (Symbolic = SymbolicEng),
    (Syntax  = SyntaxEng)
**
open
     IdiomEng,
     (P = ParadigmsEng)
in
{
oper
	now_Adv       		= P.mkAdv "now" ;   --not in Lexicon since P.mkAdv is in conflict with Constructors

lin
        Assign _ x y        	= mkText (ImpP3 (useVar x) (mkVP y)) ;   --it is here because ImpP3Assign does not exist in Eng

        AssignFun f x np 	= mkText (ImpP3 (mkNP (useVar f) (mkAdv possess_Prep (useVar x))) (mkVP np)) ;
}


