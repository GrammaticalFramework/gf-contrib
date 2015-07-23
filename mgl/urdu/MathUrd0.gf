--# -path=.:../lexicon:prelude:alltenses:mathematical

instance MathUrd0 of Math = open LexiconUrd, 
 	SymbolicUrd, 
	SyntaxUrd,
 	(Constructors = ConstructorsUrd),
	(X=ConstructX),
  	(P = ParadigmsUrd),
  	PredefCnc, Prelude 
in {
flags 
    optimize=values ;
    coding = utf8;
oper
--	element_linalg_CN : CN = mkCN (P.mkN "ےلعمعنت" "ےلعمعنتع" P.neuter) ;
	element_linalg_CN : CN = mkCN (P.mkN "عنصر") ;
        mkExVP vp = mkUtt (mkImp vp) ;
        then_Adv = P.mkAdv "تب" ;
        elem_Prep = possess_Prep ;
-- -	fromAdv : Str -> CN -> CN = \s,cn -> mkCN cn (X.mkAdv ("سے" ++ s)) ;
	
}