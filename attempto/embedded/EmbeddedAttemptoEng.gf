--# -path=.:libsrc/translator:libsrc/chunk

concrete EmbeddedAttemptoEng of EmbeddedAttempto =
   AttemptoEng,
   TranslateEng - [SymbPN,Symb_Chunk] ---- could also take a subset, as in GF/examples/App
   ** open
    SyntaxEng,
    ParadigmsEng,
    (R = ResEng)
  in {

  flags
    literal=Symb ;

  lincat
    Start = Text ;

  lin
    AceStart t = t ;
    BackupStart p = mkText p ;

-- coercions from ACE
    AceCN cn = cn ;
    AceNP np = np ;
    AceAP ap = ap ;
    AceS s = s ;
    ---- some more cats could be added


-- building lexicon in ACE from Dictionary

    dictCN_ACE n = mkCN n ;
    dictA_ACE a = a ;
    dictV_ACE v = v ;
    dictV2_ACE v2 = v2 ** {s = \\f => v2.s ! f ++ v2.c2 ; c2 = []} ; -- glue prep
    

    ---- Adv: we only want to import lexical Adv's


    ApposPN pn noun = {s = \\n,c => pn.s ! R.Nom ++ noun.s ! n ! c ; g = noun.g} ;
}