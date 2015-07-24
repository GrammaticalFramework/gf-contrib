concrete MusicC of Music = open Prelude in {

  lincat
    Score, Piece, Phrase = SS ; --{s:Str}; 
    Note = Str ;

  lin
    Lilypond = embedSS "\\relative c' \\key c \\major \\time 4/4 {" "}" ; -- Creates a Lilypond score, notes relative to middle C

    ABA a b = ss (a.s ++ b.s ++ a.s) ; 
    BaseP   = ss ;
    ConsP   = prefixSS ;

}
