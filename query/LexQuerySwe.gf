instance LexQuerySwe of LexQuery = 
  open SyntaxSwe, (M = MakeStructuralSwe), ParadigmsSwe, ExtraSwe, IrregSwe in {

oper
  located_A : A = compoundA (mkA "bel�gen" "bel�get" "bel�gna" [] []) ;

  giveMe : NP -> VP = \np -> mkVP (mkV3 giva_V) (mkNP i_Pron) np ; 
  know_V2 = mkV2 veta_V ;

-- structural words
  about_Prep : Prep = mkPrep "om" ;
  all_NP : NP = mkNP (mkPN "allt") ; ---
  also_AdV : AdV = mkAdV "ocks�" ;
  also_AdA : AdA = mkAdA "�ven" ;
  as_Prep : Prep = mkPrep "f�r" ; --- only used for "vad har X f�r Y"
  at_Prep : Prep = mkPrep "p�" ; --- | mkPrep "hos" | mkPrep "vid" ;
  that_RP = which_RP ;

  participlePropCN : Prop -> CN -> CN = variants {} ;

  vpAP _ = mkAP (mkA "obefintlig") ; --- not used, see LexQuery.participlePropCN

  called_A : A = compoundA (mkA "kallad" "kallat" "kallade" "kallade" "kallade") ;

  information_N : N = mkN "information" "informationer" ;
  other_A : A = compoundA (mkA "annan" "annat" "andra" "andra" "andra") ;
  otherwise_AdV : AdV = mkAdV "annars" ;
  otherwise_AdA : AdA = mkAdA "annars" ;
  what_IQuant : IQuant = which_IQuant ;


}
