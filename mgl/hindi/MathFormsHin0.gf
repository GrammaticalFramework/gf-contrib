
resource MathFormsHin0 = MathHin0 - [DefGenCNOrd]  **
open WebaltLexiconHin, 
 	SymbolicHin, 
	SyntaxHin,
 	(Constructors = ConstructorsHin),
	(X=ConstructX),
  	(P = ParadigmsHin),
  	PredefCnc, Prelude 
 in 
 {
 oper
 DefGenCNOrd : CN -> Ord -> MathObj -> MathObj = \cn,ord,obj -> 
          mkNP (modCN cn (modAdv ord (mkAdv possess_Prep obj))) ;
 modAdv : Ord -> Adv -> Adv = \ord,adv -> 
   lin Adv { s = \\g => adv.s ! g  ++ ord.s ; lock_Adv = <>} ;
 }