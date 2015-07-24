concrete DiatonicC of Diatonic = MusicPolyphonic - [Note,BaseP,ConsP]
 ** open Prelude in {
  
  lincat 
    Chord = PNote * PNote * PNote ;
    Ton, Dom, Sub = {s : Phrase ; ch : Chord} ;

  lin
   MkPhrase d t = {mel = d.s.mel ++ t.s.mel ;
		   har = d.s.har ++ t.s.har } ;

   AddSub s d = {s  = lin Phrase {mel = (glue s.s.mel "8")  ++ (glue d.s.mel "8") ;
				  har = inv2 d.ch} ;
		 ch = d.ch } ; --more notes will be played while same chord is playing on the background 

-- More structures
--    : Ton -> Dom -> Ton -> Phrase ;
--    : Ton -> Sub -> Ton ;


   -- TBD: add chords with different roots and inversions
    I  = {s = baseP ! Do ; ch = IMaj } ; 
    IV = {s = baseP ! Fa ; ch = IVMaj} ;
    V  = {s = baseP ! So ; ch = VMaj } ;
--, IIm, V7

param PNote = Do | Re | Mi | Fa | So | La | Ti ;


  oper

    IMaj  = <Do,Mi,So> ;
    IVMaj = lin Chord {p1 = Fa ; p2 = La ; p3 = Do } ;
    VMaj  = lin Chord {p1 = So ; p2 = Ti ; p3 = Re } ;

    noinv : Chord -> Str = \ch -> linChord ch.p1 ch.p2 ch.p3 ;
    inv2 : Chord -> Str = \ch -> linChord ch.p3 ch.p1 ch.p2 ;

    linChord : PNote -> PNote -> PNote -> Str = \p1,p2,p3 -> 
      "<" ++ glue (baseN ! p1) "," ++ 
             glue (baseN ! p2) "," ++ 
             glue (baseN ! p3) "," ++
      ">"  ;

    baseP : PNote => Phrase = \\c => emptyHarm (baseN ! c) ;

    baseN : PNote => Str =
      table { Do => "c" ;
	      Re => "d" ;
	      Mi => "e" ;
	      Fa => "f" ;
	      So => "g" ;
	      La => "a" ;
	      Ti => "b" } ;

    emptyHarm : Str -> Phrase = \note -> lin Phrase {mel=note; har=[]} ;
}
