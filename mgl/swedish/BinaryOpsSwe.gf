concrete BinaryOpsSwe of BinaryOps =
GroundSwe **
BinaryOpsI - [bin_over]
with
	(Lexicon = LexiconSwe),
	(Syntax = SyntaxSwe),
	(Symbolic = SymbolicSwe),
	(Math = MathSwe) **
open ParadigmsSwe in {
lin 
    bin_over x y = mkNP (mkNP x (mkV2 "dela")) (mkAdv with_Prep y);
}

