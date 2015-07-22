
resource MathFormsUrd0 = MathUrd0 - [DefGenCNOrd]  **
open WebaltLexiconUrd, 
 	SymbolicUrd, 
	SyntaxUrd,
 	(Constructors = ConstructorsUrd),
	(X=ConstructX),
  	(P = ParadigmsUrd),
  	PredefCnc, Prelude 
 in 
 {
 oper
 DefGenCNOrd : CN -> Ord -> MathObj -> MathObj = \cn,ord,obj -> 
          mkNP (modCN cn (modAdv ord (mkAdv possess_Prep obj))) ;
 modAdv : Ord -> Adv -> Adv = \ord,adv -> 
   lin Adv { s = \\g => adv.s ! g  ++ ord.s ; lock_Adv = <>} ;
 }