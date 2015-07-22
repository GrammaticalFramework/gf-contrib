concrete Set1Fin of Set1 =
GroundFin ** Set1I - [set,subset,set_base,set1_in,prsubset,notsubset,notin,notprsubset,map] 
with
(Lexicon = LexiconFin),
(Syntax = SyntaxFin),
(Symbolic = SymbolicFin),
(Math = MathFin) 

** open SyntaxFin, ParadigmsFin, (E = ExtraFin), LexiconFin in {

flags coding = utf8 ;

lin
  set terms = mkNP the_Det (mkCN set_CN (mkRS (mkRCl (E.GenRP pluralNum element_CN) (mkVP (mkNP and_Conj terms))))) ;
--  set terms = mkNP (E.GenNP (mkNP and_Conj terms)) set_CN ;
  set_base x = mkNP (E.GenNP x) (mkN "yksiö") ;
  subset a b = PositiveCl (mkCl a (mkVP (mkNP (E.GenNP (appset b)) subset_CN))) ;
  notsubset a b = NegativeCl (mkCl a (mkVP (mkNP (E.GenNP (appset b)) subset_CN))) ;
  prsubset a b = PositiveCl (mkCl a (mkVP (mkNP (E.GenNP (appset b)) proper_subset_CN))) ;
  notprsubset a b = NegativeCl (mkCl a (mkVP (mkNP (E.GenNP (appset b)) proper_subset_CN))) ;
  set1_in a b = PositiveCl (mkCl a (mkVP (mkNP (E.GenNP (appset b)) element_CN))) ;
  notin a b = NegativeCl (mkCl a (mkVP (mkNP (E.GenNP (appset b)) element_CN))) ;

  -- joukko joka saadaan kun kaikki set:n alkiot x kuvataan f:lle
  map x f set =  
    mkNP the_Det (mkCN set_CN (mkRS (mkRCl which_RP 
     (mkVP (passiveVP (mkV2 "saada")) (SyntaxFin.mkAdv when_Subj 
       (mkS (mkCl (mkNP all_Predet (mkNP (E.GenNP set) pluralNum (mkCN element_CN (mkNP x)))) 
                  (mkVP (passiveVP (mkV2 (mkV "kuvata" "kuvasi"))) (SyntaxFin.mkAdv for_Prep f))))))))) ;

oper
  appset : NP -> NP = \v -> v ;                       -- no apposition: A:n
---  appset : NP -> NP = \v -> mkNP (mkCN set_CN v) ; -- apposition: joukon A

}

