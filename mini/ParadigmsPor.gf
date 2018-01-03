resource ParadigmsPor = GrammarPor [N,A,V] ** 
  open ResPor, GrammarPor, Prelude in {

oper
  masculine : Gender = Masc ;
  feminine : Gender = Fem ;

  accusative : Case = Acc ;
  dative : Case = Dat ;

  mkN = overload {
    mkN : (vinho : Str) -> N 
      = \n -> lin N (regNoun n) ;
    mkN : (pão, pães : Str) -> Gender -> N 
      = \s,p,g -> lin N (mkNoun s p g) ;
    } ;

  mkA = overload {
    mkA : (preto : Str) -> A 
      = \a -> lin A (regAdj a) ;
    mkA : (bom,boa,bons,boas: Str) -> Bool -> A 
      = \sm,sf,pm,pf,p -> lin A (mkAdj sm sf pm pf False) ;
    } ;

  preA : A -> A
      = \a -> lin A {s = a.s ; isPre = True} ;
--
  mkV = overload {
    mkV : (finire : Str) -> V 
      = \v -> lin V (regVerb v) ;
    mkV : (andare,vado,vadi,va,andiamo,andate,vanno,andato : Str) -> V 
      = \i,p1,p2,p3,p4,p5,p6,p -> lin V (mkVerb i p1 p2 p3 p4 p5 p6 p Avere) ;
    } ;

  haverV : V -> V
    = \v -> lin V {s = v.s ; aux = Haver} ;
  terV : V -> V
    = \v -> lin V {s = v.s ; aux = Ter} ;
  serV : V -> V
    = \v -> lin V {s = v.s ; aux = Ser} ;
  estarV : V -> V
    = \v -> lin V {s = v.s ; aux = Estar} ;

  mkV2 = overload {
    mkV2 : Str -> V2
      = \s -> lin V2 (regVerb s ** {c = accusative}) ;
    mkV2 : V -> V2
      = \v -> lin V2 (v ** {c = accusative}) ;
    mkV2 : V -> Case -> V2
      = \v,c -> lin V2 (v ** {c = c}) ;
    } ;

}
