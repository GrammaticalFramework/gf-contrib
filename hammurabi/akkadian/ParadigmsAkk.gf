resource ParadigmsAkk = GrammarAkk [N,A,V,Tense] ** 
  open ResAkk, GrammarAkk, Prelude in {

oper
  masculine : Gender = Masc ;
  feminine : Gender = Fem ; 
  accusative : Case = Acc ;

  mkN = overload {
    mkN : (awiilum : Str) -> N 
      = \n -> lin N (mascNoun n) ;
    mkN : (sarratum,saptan : Str) -> N 
     = \sg,du -> lin N (femNoun sg du) ;
    } ;


  mkV = overload {
    mkV : (prs,aa : Str) -> V 
      = \r,v -> lin V (strongVerb r v) ;
--    mkV : (x1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,x16 : Str) -> V 
--      = mkVerb ;
    } ;



  mkV2 = overload {
    mkV2 : (prs,aa : Str) -> V2 
      = \r,v -> lin V2 ((strongVerb r v) ** {c = accusative}) ;
    mkV2 : V -> V2
      = \v -> lin V2 (v ** {c = accusative}) ;
    mkV2 : V -> Case -> V2
      = \v,c -> lin V2 (v ** {c = c}) ;
    } ;

}
