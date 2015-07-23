concrete Set1Fin of Set1 =
GroundFin ** Set1I - [subset, set1_in, prsubset, notsubset, notin, notprsubset, suchthat, map] 
with
(Lexicon = LexiconFin),
(Syntax = SyntaxFin),
(Symbolic = SymbolicFin),
(Math = MathFin) 

** open SyntaxFin, ParadigmsFin, (E = ExtraFin), LexiconFin in {

lin
  subset a b = mkMathCl (PositiveCl (mkCl a.v (mkVP (mkNP (E.GenNP (appset b.v)) subset_CN)))) (L.subset a.s b.s) a b ;
  notsubset a b = mkMathCl (NegativeCl (mkCl a.v (mkVP (mkNP (E.GenNP (appset b.v)) subset_CN)))) (L.notsubset a.s b.s) a b ;
  prsubset a b = mkMathCl (PositiveCl (mkCl a.v (mkVP (mkNP (E.GenNP (appset b.v)) proper_subset_CN)))) (L.prsubset a.s b.s) a b ;
  notprsubset a b = mkMathCl (NegativeCl (mkCl a.v (mkVP (mkNP (E.GenNP (appset b.v)) proper_subset_CN)))) (L.notprsubset a.s b.s) a b ;
  set1_in a b = mkMathCl (PositiveCl (mkCl a.v (mkVP (mkNP (E.GenNP (appset b.v)) element_CN)))) (L.set1_in a.s b.s) a b ;
  notin a b = mkMathCl (NegativeCl (mkCl a.v (mkVP (mkNP (E.GenNP (appset b.v)) element_CN)))) (L.notin a.s b.s) a b ;

  map vars type set = mkMathObj (such_that (setOfForm type.v) (posPrep vars set.v)) (L.map (var2SS vars) type.s set.s) type set ;
  suchthat set x prop = mkMathObj (such_that (adverbSet set.v x) prop.v) ; 				-- (L.suchthat set.s (var2SS x) prop.s) False ; 

oper
  appset : NP -> NP = \v -> v ;                       -- no apposition: A:n
---  appset : NP -> NP = \v -> mkNP (mkCN set_CN v) ; -- apposition: joukon A

}

