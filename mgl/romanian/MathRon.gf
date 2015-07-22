

--# -path=.:../lexicon:prelude:present:mathematical

instance MathRon of Math = MathI
with
    (Cat = CatRon),
    (Syntax = SyntaxRon), 
    (Symbolic = SymbolicRon), 
    (Lexicon = LexiconRon) **
open
    (P = ParadigmsRon)
in {
oper
        then_Adv = P.mkAdv "atunci" ;
        elem_Prep = part_Prep ;
}
