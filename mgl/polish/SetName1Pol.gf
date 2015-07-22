concrete SetName1Pol of SetName1 =
GroundPol ** SetName1I
with
    (Math = MathPol),
    (Symbolic = SymbolicPol),
    (Syntax = SyntaxPol) **
open
    ParadigmsPol,
    LexiconPol in
{
oper
  set_of_N2 : N2 = mkN2 LexiconPol.set_N possess_Prep ;
}

