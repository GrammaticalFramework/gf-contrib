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
--	element_linalg_CN : CN = mkCN (P.mkN "Eलeमeनत" "Eलeमeनतe" P.neuter) ;
	element_linalg_CN : CN = mkCN (P.mkN "अवयव") ;
        mkExVP vp = mkUtt (mkImp vp) ;
        then_Adv = P.mkAdv "तब" ;
        elem_Prep = possess_Prep ;
-- -	fromAdv : Str -> CN -> CN = \s,cn -> mkCN cn (X.mkAdv ("से" ++ s)) ;
	
}