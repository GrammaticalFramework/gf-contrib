concrete Logic1Eng of Logic1 =
GroundEng ** Logic1I -- -[negateS]
with
(Lexicon = LexiconEng),
(Syntax = SyntaxEng),
(Math = MathEng) --**
--open
--	ParadigmsEng
--in
--{
--oper
--   negateS : Proposition -> Proposition =
--        \prop -> negCl (mkCl (mkVP (mkVP hold_V) (mkAdv (mkSubj " ") prop))) ;  --it does not hold p.  Commented since it does not sound good.
                                                                    --ideally: mkCl prop2 hold_v, with prop2=NP, but I do not how to convert a Proposition into a NP --}
