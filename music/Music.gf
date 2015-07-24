abstract Music = {

  flags startcat = Score ;

  cat
    Score ;

    Piece ;
    Phrase ;
    Note ;

  fun 
    Lilypond : Piece -> Score ;       -- Just a wrapper to add Lilypond notation stuff
 
    -- Functions to combine phrases into pieces.
    -- TBD: more structures.
    ABA : Phrase -> Phrase -> Piece ;     -- A-B-A structure, like Gubben Noak 


    -- TBD: constraints for phrases. Depends on scale and musical tradition.
    BaseP : Note -> Phrase ;          
    ConsP : Note -> Phrase -> Phrase ;

    -- Also notes (and what they are called) depend on scale.
    -- Do , Re , Mi , Fa, ... : Note ; 

}
