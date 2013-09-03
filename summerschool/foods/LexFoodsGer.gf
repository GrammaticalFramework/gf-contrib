-- (c) 2009 Aarne Ranta under LGPL

instance LexFoodsGer of LexFoods = 
    open SyntaxGer, ParadigmsGer in {
  oper
    wine_N = mkN "Wein" ;
    pizza_N = mkN "Pizza" "Pizzen" feminine ;
    cheese_N = mkN "K�se" "K�se" masculine ;
    fish_N = mkN "Fisch" ;
    fresh_A = mkA "frisch" ;
    warm_A = mkA "warm" "w�rmer" "w�rmste" ;
    italian_A = mkA "italienisch" ;
    expensive_A = mkA "teuer" ;
    delicious_A = mkA "k�stlich" ;
    boring_A = mkA "langweilig" ;
}
