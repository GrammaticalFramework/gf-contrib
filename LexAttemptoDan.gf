instance LexAttemptoDan of LexAttempto = 
  open ExtraDan, SyntaxDan, ParadigmsDan, ConstructX, 
    MakeStructuralDan,
    IrregDan in {

oper
  possible_A = mkA "mulig" ;
  necessary_A = mkA "nødvendig" ;
  --own_A = mkA "egen" "eget" "egne" "egnare" "egnast" ;
  own_A = mkA "egen" "eget" "egne"  ;

  have_VV = must_VV ;
  provably_Adv = mkAdv "bevisligt" ;
  provable_A = mkA "bevislig" ;
  false_A = mkA "falsk" ;
  such_A = mkA "sådan" ;

  genitiveNP np = mkNP (GenNP np) ;

  each_Det = every_Det ; ----

  that_Subj = mkSubj "at" ;

  comma_and_Conj = mkConj [] ", og" plural ;
  comma_or_Conj = mkConj [] ", eller" singular ;
  slash_Conj = mkConj [] "/" singular ;
  whose_IDet = mkIDet (mkIQuant "hvis" "hvis" "hvis" dDefIndef) ;

  eachOf np = mkNP (mkPredet "hver og en" "hvert og et" "af" singular) np ;

  adj_thatCl : A -> S -> Cl = \a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

}
