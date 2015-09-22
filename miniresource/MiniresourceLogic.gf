--# -path=.:../YAQL

concrete MiniresourceLogic of Miniresource = open Prelude, ResHaskell in {

-- module GrammarEng

  lincat  
    S,
    Cl,
    NP,
    VP,
    AP,
    CN,
    Det,
    N,
    A,
    V,
    V2,
    AdA,
    Tense,
    Pol,
    Conj
      = Str ;

  lin
--    UseCl t p cl = {s = t.s ++ p.s ++ cl.s ! ClDir ! t.t ! p.b} ; 
    PredVP np vp = apply np vp ;

    ComplV2 v2 np = abstr x_var (apply np (apply v2 x_var)) ;

    UseV v = v ;

    DetCN det cn = apply det cn ;
{-
    ModCN ap cn = {
      s = \\n => ap.s ++ cn.s ! n
      } ;

    CompAP ap = {
      verb = copula ;
      compl = ap.s 
      } ;

    AdAP ada ap = {
      s = ada.s ++ ap.s
      } ;

    ConjS  co x y = {s = x.s ++ co.s ++ y.s} ;

    ConjNP co nx ny = {
      s = \\c => nx.s ! c ++ co.s ++ ny.s ! c ;
      a = conjAgr co.n nx.a ny.a
      } ;
-}
    UseN n = n ;

    UseA adj = adj ;

    a_Det = abstr p_var q_var (apply "any" q_var p_var) ;

    every_Det = abstr p_var q_var (apply "all" q_var p_var) ;
{-
    the_Det = mkDet "the" Sg ;
    this_Det = mkDet "this" Sg ;
    these_Det = mkDet "these" Pl ;
    that_Det = mkDet "that" Sg ;
    those_Det = mkDet "those" Pl ;
-}
    i_NP = abstr p_var (apply p_var "I") ;
{-
    youSg_NP = pronNP "you" "you" Sg Per2 ;
    he_NP = pronNP "he" "him" Sg Per3 ;
    she_NP = pronNP "she" "her" Sg Per3 ;
    we_NP = pronNP "we" "us" Pl Per1 ;
    youPl_NP = pronNP "you" "you" Pl Per2 ;
    they_NP = pronNP "they" "them" Pl Per3 ;

    very_AdA = ss "very" ;

    Pos  = {s = [] ; b = True} ;
    Neg  = {s = [] ; b = False} ;
    Pres = {s = [] ; t = TPres} ;
    Perf = {s = [] ; t = TPerf} ;
-}
    and_Conj = "(&&)" ;
    or_Conj  = "(||)" ;

-- module TestEng

    man_N = "man" ;
    woman_N = "woman" ;
{-
    house_N = mkN "house" ;
    tree_N = mkN "tree" ;
    big_A = mkA "big" ;
    small_A = mkA "small" ;
    green_A = mkA "green" ;
    walk_V = mkV "walk" ;
    arrive_V = mkV "arrive" ;
-}
    love_V2 = "love" ;
--    please_V2 = mkV2 "please" ;


}
