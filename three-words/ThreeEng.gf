--# -path=.:GF/lib/src/translator

concrete ThreeEng of Three = DictionaryEng ** open SyntaxEng in {

lincat
  Phrase = Utt ;
  NP2 = NP ;
  VP2 = VP ;
  NP1 = NP ;
  VP1 = VP ;
  Adv2 = Adv ;

  Tense0 = Tense ;
  Tense1 = {t : Tense ; a : Ant} ;
-- all other categories are lexical categories in Dictionary

lin
  n1v2 t np vp = mkUtt (mkS t (mkCl np vp)) ;
  n2v1 t np vp = mkUtt (mkS t (mkCl np vp)) ;
  n1v1 t np vp = mkUtt (mkS t.t t.a (mkCl np vp)) ;

  n1sg n = mkNP n ;
  n1pl n = mkNP aPl_Det n ;
  
  n2sg a n = mkNP (mkCN a n) ;
  n2pl a n = mkNP aPl_Det (mkCN a n) ;

  n1pron pron = mkNP pron ; 
  n1pn pn = mkNP pn ; --- can be complex PN as well

  n2quant q n = mkNP q n ;
  n2quantpl q n = mkNP (mkDet q pluralNum) n ;
  n2det q n = mkNP q n ;
  
  v1v v = mkVP v ;

  v2tvn tv np = mkVP tv np ;
  v2a a = mkVP a ;
  v2adv adv = mkVP adv ;

  n2adv np adv = mkUtt (mkNP np adv) ;
  n1adv2 np adv = mkUtt (mkNP np adv) ;
  
  adv2prep p np = mkAdv p np ;

  present = presentTense ;
  past = pastTense ;
  perfect = {t = presentTense ; a = anteriorAnt} ;
  pluperfect = {t = pastTense ; a = anteriorAnt} ;
  future = {t = futureTense ; a = simultaneousAnt} ;
  conditional = {t = conditionalTense ; a = simultaneousAnt} ;

}