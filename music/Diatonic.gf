abstract Diatonic = Music - [Note,BaseP,ConsP] ** {
 flags startcat = Score ;

 cat 
   Chord ;
   Ton ; Dom ; Sub ;  -- Tonic, dominant and subdominant

 fun 
    -- Using ideas from http://dl.acm.org/citation.cfm?id=2633638.2633645&coll=DL&dl=GUIDE

   MkPhrase : Dom -> Ton -> Phrase ;


   AddSub : Sub -> Dom -> Dom ;    

-- More structures
--    : Ton -> Dom -> Ton -> Phrase ;
--    : Ton -> Sub -> Ton ;

    I : Ton ;
    IV, IIm : Sub ;
    V, V7 : Dom ;

}
