--# -path=.:../lexicon:prelude:present:mathematical

instance MathHin of Math = MathI - [DefGenCNOrd]  
with
    (Cat = CatHin), --CatHindustani ?
    (Syntax = SyntaxHin), 
    (Symbolic = SymbolicHin), --SymbolHindustani ?
    (Lexicon = LexiconHin) ** 
open
	(X = ConstructX),
  	(P = ParadigmsHin)
in {
flags coding = utf8 ;

oper
    then_Adv = P.mkAdv "तब" ;
    elem_Prep = my_possess_Prep ;
	DefGenCNOrd : CN -> Ord -> MathObj -> MathObj = \cn,ord,obj -> 
	          mkNP (modCN cn (modAdv ord (mkAdv possess_Prep obj))) ;
	 modAdv : Ord -> Adv -> Adv = \ord,adv -> 
	   lin Adv { s = \\g => adv.s ! g  ++ ord.s ; lock_Adv = <>} ;
	element_linalg_CN : CN = mkCN (P.mkN "अवयव") ;
    -- mkExVP vp = mkUtt (mkImp vp) ;
    -- fromAdv : Str -> CN -> CN = \s,cn -> mkCN cn (X.mkAdv ("से" ++ s)) ; --ares
}
