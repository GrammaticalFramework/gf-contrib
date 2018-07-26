--# -path=.:present

concrete PropPor of Prop = PropI with 
  (Syntax = SyntaxPor), 
  (Symbolic = SymbolicPor),
  (Sentence = SentencePor)
  ** open (P = ParadigmsPor), ExtraPor, Prelude in {

    -- instance of interface
  oper
    case_N = P.mkN "caso" ;
    such_A = P.mkA "tal" ;
    then_Adv = P.mkAdv "então" ;
    element_N = P.mkN "element" ;
    set_N2 = P.mkN2 (P.mkN "conjunto") P.genitive ;
    hold_V = P.mkV "valer" ;

    singular = P.singular ;

    -- test lexicon
  lin
    Vertical = mkAP (P.mkA "vertical") ;
    Horizontal = mkAP (P.mkA "horizontal") ;
    Parallel = P.mkA2 (P.mkA "paralelo") P.dative ;
    Equal = P.mkA2 (P.mkA "igual") P.dative ;
    Line = mkCN (P.mkN "linha") ;
    Point = mkCN (P.mkN "ponto") ;
    Centre = mkFun1 "centre" (P.mkN "centro") possess_Prep ;
    Intersection = mkFun2 "intersection" (P.mkN "interseção" P.feminine) possess_Prep ;

    Set k = mkCN set_N2 (mkNP a_Art plNum k) ; 

    Even = mkAP (P.mkA "par") ;
    Odd = mkAP (P.mkA "ímpar" "ímpar") ;
    Square = mkFun1 "square "(P.mkN "quadrado")  possess_Prep ;
    Sum = mkFun2 "sum" (P.mkN "soma") possess_Prep ;
    Product = mkFun2 "product" (P.mkN "produto") possess_Prep ;
    Nat = mkCN (P.mkN "número") ;

    oper
      mkFun1, mkFun2 : Str -> N -> Prep -> {s : Symb ; v : N2} = \s,n,p -> 
        {s = mkSymb  ("\\" + s) ; v = P.mkN2 n p} ;
} ;