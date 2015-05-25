interface BuildQueryInterface = 
  open 
    Syntax,
    (Verb = Verb),
    (Lexicon = Lexicon),
    Prelude 
  in {

-------------------------------------------------
-- to be instantiated
oper
  nameEntity : Str -> NP ;
  personNameEntity : Str -> Str -> NP ;
  showUtt : NP -> Utt ;
  about_Prep : Prep ;
  at_Prep : Prep ;
  than_Prep : Prep ;

-------------------------------------------------
-- lexicon building
oper
  -- x influences y
  transverbRelation : V2 -> R2 = \verb ->
      {vps = mkVPSlash verb ; subjectFirst = True} ; 

  -- x is influenced by y
  passiveRelation : V2 -> R2 = \verb ->
      {vps = Verb.VPSlashPrep (passiveVP verb) by8agent_Prep ; subjectFirst = True} ; 

  -- x influences y | y is influenced by x
  bothWaysRelation : V2 -> R2 = \verb ->
      transverbRelation verb 
    | {vps = Verb.VPSlashPrep (passiveVP verb) by8agent_Prep ; subjectFirst = False} ; 

  -- x is earlier than y
  comparativeRelation : A -> R2 = \adj ->
      {vps = Verb.VPSlashPrep (mkVP (comparAP adj)) than_Prep ; subjectFirst = True} ; 

  -- x is divisible by y
  adjectiveRelation : A -> Prep -> R2 = \adj,prep ->
      {vps = Verb.VPSlashPrep (mkVP (mkAP adj)) prep ; subjectFirst = True} ; 

  -- x is in y
  prepositionRelation : Prep -> R2 = \prep ->
      {vps = Verb.VPSlashPrep (Verb.UseCopula) prep ; subjectFirst = True} ; 

  reverseRelation : R2 -> R2 = \rel ->
      {vps = rel.vps ; subjectFirst = notB rel.subjectFirst} ;

  -- x is even
  adjectiveProperty : A -> R1 = \adj -> apProperty (mkAP adj) ;

  -- x is uniformly continuous
  apProperty : AP -> R1 = \adj ->
      {vps = Verb.VPSlashPrep (mkVP adj) dummyPrep ; arg = dummyNP ; qualif = adj ; adv = dummyAdv ; 
       predType = PAdjective} ; 
      --- prep, arg not used

  -- x is differentiable almost everywhere
  vpProperty : VP -> R1 = \vp ->
      {vps = Verb.VPSlashPrep vp dummyPrep ; arg = dummyNP ; qualif = dummyAP; adv = dummyAdv ; 
       predType = PSubjectOnly} ; 
      --- prep, arg not used

  -- x is without exceptions
  adverbProperty : Adv -> R1 = \adv ->
      {vps = Verb.VPSlashPrep (mkVP adv) dummyPrep ; arg = dummyNP ; qualif = dummyAP ; adv = adv ; 
       predType = PAdverb} ; 
      --- prep, arg not used

  -- x is a prime number
  nounProperty : CN -> R1 = \cn ->
      {vps = Verb.VPSlashPrep (mkVP cn) dummyPrep ; arg = dummyNP ; qualif = dummyAP ; adv = dummyAdv ;
       predType = PSubjectOnly} ; 
      --- prep, arg not used


-------------------------------------------------
-- also used in YAQLFunctor

oper
  R1 : Type = {vps : VPSlash ; arg : NP ; qualif : AP ; adv : Adv ; predType : PredType} ;
  R2 : Type = {vps : VPSlash ; subjectFirst : Bool} ;
  F1 : Type = {cn : CN ; prep : Prep} ;

param
  PredType =     
      PSubjectFirst Bool -- x influenced Marx / Marx influenced x
    | PSubjectOnly       -- x sleeps 
    | PAdjective         -- x is German
    | PAdverb            -- x is in Germany
    ; 

oper
  dummyAP = mkAP Lexicon.old_A ; --- hack: an AP never used but needed for type checking
  dummyAdv = here_Adv ;
  dummyPrep = in_Prep ;
  dummyNP = it_NP ;

}