interface Syntax = open Prelude, Grammar in {

oper

  mkS = overload {
    mkS : Tense -> Cl -> S
     = UseCl ;
    mkS : Cl -> S
     = \cl -> UseCl Present cl;
    mkS : Tense -> NP -> VP -> S
       = \t,np,vp -> UseCl t (PredVP np vp) ;
    mkS : NP -> VP -> S
       = \np,vp -> UseCl Present (PredVP np vp) ;
    mkS : Tense -> NP -> V2 -> NP -> S
       = \t,np,v,o -> UseCl t (PredVP np (ComplV2 v o)) ;
    mkS : NP -> V2 -> NP -> S
       = \np,v,o -> UseCl Present (PredVP np (ComplV2 v o)) ;
    mkS : Conj -> S -> S -> S
       = ConjS ;
    mkS : Adv -> S -> S 
       = AdvS ;
    } ;
    
  mkCl = overload {
    mkCl : NP -> VP -> Cl
      = PredVP ;
    mkCl : NP -> V -> Cl
      = PassVP ;
  } ;
    
  mkVP : V2 -> NP -> VP 
    = ComplV2 ;

  mkNP = overload {
    mkNP : Det -> CN -> NP 
      = DetCN ;
    mkNP : Det -> N -> NP 
      = \det,n -> DetCN det (UseN n) ;
    mkNP : CN -> NP
      = \cn -> DetCN sg_Det cn ;
    mkNP : N -> NP 
      = \n -> DetCN sg_Det (UseN n) ;
  } ;

  mkCN = overload {
    mkCN : ModP -> CN -> CN 
      = ModCN ;
    mkCN : ModP -> N -> CN 
      = ModN ;
    mkCN : N -> CN 
      = UseN ;
  } ;

  mkMod = overload {
    mkMod : NP -> ModP
      = UseMod ;
    mkMod : Str -> ModP
      = \str -> lin ModP {s = str }
  } ;
}

