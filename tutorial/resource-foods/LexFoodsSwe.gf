instance LexFoodsSwe of LexFoods = open SyntaxSwe, ParadigmsSwe, IrregSwe in {
  oper
    wine_N = mkN "vin" "vinet" "viner" "vinerna" ;
    pizza_N = mkN "pizza" ;
    cheese_N = mkN "ost" ;
    fish_N = mkN "fisk" ;
    fresh_A = mkA "f�rsk" ;
    warm_A = mkA "varm" ;
    italian_A = mkA "italiensk" ;
    expensive_A = mkA "dyr" ;
    delicious_A = mkA "l�cker" "l�ckert" "l�ckra" "l�ckrare" "l�ckrast" ;
    boring_A = mkA "tr�kig" ;

    eat_V2 = mkV2 (mkV "�ta" "�t" "�tit") ;
    drink_V2 = mkV2 (mkV "dricka" "drack" "druckit") ;
    pay_V2 = mkV2 "betala" ;
    lady_N = mkN "dam" "damer" ;
    gentleman_N = mkN "herr" ;

}
