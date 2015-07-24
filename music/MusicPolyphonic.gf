concrete MusicPolyphonic of Music = open Prelude in {

  lincat
    Score = SS ;
    Phrase, Piece = {mel : Str ; har : Str } ;

  lin
    Lilypond p = 
      let melody  : Str = "\\new Staff { \\clef \"treble\" " ++ p.mel ++ " }" ; 
          harmony : Str = "\\new Staff { \\clef \"bass\" " ++ p.har ++ " }" ;
      in embedSS "\\version \"2.18.2\" \n \\score { \\relative c' {  <<" 
                 ">> }} \n \\midi { } \\layout { }" 
                 (ss2 melody harmony) ;


    ABA a b = {mel = a.mel ++ b.mel ++ a.mel ;
	       har = a.har ++ b.har ++ a.har } ;

}

