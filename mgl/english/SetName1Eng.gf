concrete SetName1Eng of SetName1 =
GroundEng **
SetName1I with
    (Math = MathEng),
    (Symbolic = SymbolicEng),
    (Syntax = SyntaxEng) **
open
    ParadigmsEng,
    LexiconEng in
{
oper
 set_of_N2 : N2 = mkN2 LexiconEng.set_N ;
}