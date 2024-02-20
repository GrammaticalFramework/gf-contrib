abstract Prop = {

-- intuitionistic propositional calculus with proof objects

-- this works:
-- > gt -depth=2 ThmProof (Impl (Conj A B) (Conj B A)) ? | pt -number=1 -compute
-- ThmProof (Impl (Conj A B) (Conj B A)) (ImplI (Conj A B) (Conj B A) (\v0 -> ConjI B A (ConjEr A B v0) (ConjEl A B v0)))
-- many other problems loop infinitely with gt

flags startcat = Thm ;

cat
  Thm ;
  Prop ;
  [Prop] ;
  Proof Prop ;

data
  ThmProof : (a : Prop) -> Proof a -> Thm ;

  Conj, Disj, Impl : Prop -> Prop -> Prop ;
  Falsum : Prop ;
  A, B, C : Prop ;

  ConjI  : (a, b : Prop) -> Proof a -> Proof b -> Proof (Conj a b) ;
  DisjIl : (a, b : Prop) -> Proof a -> Proof (Disj a b) ;
  DisjIr : (a, b : Prop) -> Proof b -> Proof (Disj a b) ;
  ImplI  : (a, b : Prop) -> (h : Proof a -> Proof b) -> Proof (Impl a b) ;

-- natural deduction proofs
fun
  ConjEl : (a, b : Prop) -> Proof (Conj a b) -> Proof a ;
  ConjEr : (a, b : Prop) -> Proof (Conj a b) -> Proof b ;
  DisjE  : (a, b, c : Prop) -> Proof (Disj a b) ->
               (d : Proof a -> Proof c) -> (e : Proof b -> Proof c) -> Proof c ; 
  ImplE  : (a, b : Prop) -> Proof (Impl a b) -> Proof a -> Proof b ;
  FalsumE : (a : Prop) -> Proof Falsum -> Proof a ;

  Neg : Prop -> Prop ;

def
  ConjEl _ _ (ConjI _ _ x y) = x ;
  ConjEr _ _ (ConjI _ _ x y) = y ;

  DisjE _ _ _ (DisjIl _ _ x) d _ = d x ;
  DisjE _ _ _ (DisjIr _ _ y) _ e = e y ;
  
  ImplE _ _ (ImplI _ _ f) x = f x ;

  Neg a = Impl a Falsum ;

-- sequent calculus proofs, G3ip (Negri & von Plato 2001, p. 28)
-- would need multiset [Prop] to work properly
-- this works:
-- > gt -depth=2 ThmSeq (ConsProp (Conj A B) BaseProp) A ?
-- ThmSeq (ConsProp (Conj A B) BaseProp) A (ConjL BaseProp A B A (Ax (ConsProp B BaseProp) A))


cat
  Seq [Prop] Prop ;
fun
  ThmSeq : (hs : [Prop]) -> (a : Prop) -> Seq hs a -> Thm ;
  
  Ax : (hs : [Prop]) -> (a : Prop) ->
    Seq (ConsProp a hs) a ;
  ConjL: (hs : [Prop]) -> (a, b, c : Prop) ->
    Seq (ConsProp a (ConsProp b hs)) c ->
      Seq (ConsProp (Conj a b) hs) c ;
  ConjR: (hs : [Prop]) -> (a, b : Prop) ->
    Seq hs a -> Seq hs b ->
      Seq hs (Conj a b) ;
}