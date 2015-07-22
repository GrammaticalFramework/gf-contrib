--# -path=.:../lexicon:prelude:alltenses:mathematical

instance MathHin0 of Math = open LexiconHin, 
 	SymbolicHin, 
	SyntaxHin,
 	(Constructors = ConstructorsHin),
	(X=ConstructX),
  	(P = ParadigmsHin),
  	PredefCnc, Prelude 
in {
flags 
    optimize=values ;
    coding = utf8;
oper
--	element_linalg_CN : CN = mkCN (P.mkN "Element" "Elemente" P.neuter) ;
	element_linalg_CN : CN = mkCN (P.mkN "Avayav") ;
        mkExVP vp = mkUtt (mkImp vp) ;
        then_Adv = P.mkAdv "tab" ;
        elem_Prep = possess_Prep ;
-- -	fromAdv : Str -> CN -> CN = \s,cn -> mkCN cn (X.mkAdv ("se:" ++ s)) ;
	
}