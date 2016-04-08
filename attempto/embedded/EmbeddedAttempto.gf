--# -path=.:libsrc/translator:libsrc/chunk

abstract EmbeddedAttempto =
   Attempto,
   Translate ---- could also take a subset, as in GF/examples/App
   ** {

  flags startcat = Start ;

  cat
    Start ;

  fun
    AceStart    : Text_ACE -> Start ;
    BackupStart : Phr -> Start ;

-- coercions from ACE
    AceVP : VP_ACE -> VP ;
    AceCN : CN_ACE -> CN ;
    AceNP : NP_ACE -> NP ;
    AceAP : AP_ACE -> AP ;
    AceS  : S_ACE  -> S ;
    ---- some more cats could be added


-- building lexicon in ACE from Dictionary

    dictCN_ACE : N -> CN_ACE ;
    dictA_ACE  : A -> A_ACE ;
    dictV_ACE  : V -> V_ACE ;
    dictV2_ACE : V2 -> V2_ACE ;
    ---- Adv: we only want to import lexical Adv's
    ---- more categories

-- for "a UK visa"
    ApposPN : PN -> N -> CN ; -- UK visa

}