abstract Three = Dictionary ** {

flags startcat = Phrase ;

cat
  Phrase ;
  NP2 ;
  VP2 ;
  NP1 ;
  VP1 ;
  Adv2 ;

  Tense0 ;
  Tense1 ;
-- all other categories are lexical categories in Dictionary

fun
  n1v2   : Tense0 -> NP1 -> VP2 -> Phrase ;  -- he loves her
  n2v1   : Tense0 -> NP2 -> VP1 -> Phrase ;  -- the man runs
  n1v1   : Tense1 -> NP1 -> VP1 -> Phrase ;  -- he has run

  n1sg   : N -> NP1 ;  -- beer
  n1pl   : N -> NP1 ;  -- songs
  
  n2sg   : A -> N -> NP2 ;  -- cold beer
  n2pl   : A -> N -> NP2 ;  -- happy songs

  n1pron : Pron -> NP1 ;    -- you
  n1pn   : PN -> NP1 ;      -- John

  n2quant   : Quant -> N -> NP2 ;  -- this man
  n2quantpl : Quant -> N -> NP2 ;  -- these men
  n2det     : Det   -> N -> NP2 ;  -- every man
  
  v1v  : V -> VP1 ;  -- runs  --- includes particle verbs too

  v2tvn  : V2 -> NP1 -> VP2 ;  -- loves her  --- includes prepositional verbs too
  v2a    : A  -> VP2 ;         -- is cold
  v2adv  : Adv -> VP2 ;        -- is above

  n2adv  : NP2 -> Adv -> Phrase ;  -- an airplane above
  n1adv2 : NP1 -> Adv2 -> Phrase ; -- airplane in space
  
  adv2prep : Prep -> NP1 -> Adv2 ;  -- in space

  present, past : Tense0 ;
  perfect, pluperfect, future, conditional : Tense1 ;

}