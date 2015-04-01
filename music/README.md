# Grammar for music

In progress, still figuring out nice and less nice ways of representing music.

Terms like "pentatonic/diatonic" and "polyphonic" should be able to combine; and support other scales.

## Files

`Music.gf` -- basic building blocks; types `Note`, `Phrase`, `Piece`, `Score` (for Lilypond output). Independent of scale.

### General concrete syntaxes
* MusicC.gf -- concrete syntax for a minimal stuff, with no rules, just combining note.
* MusicPolyphonic.gf -- concrete syntax that includes a melody and a harmony part.

### Tiny example
* Pentatonic.gf -- Music ** notes in pentatonic scale
* PentatonicC.gf -- concrete syntax for those notes, using middle C as base note.

### Including harmony
* Diatonic.gf -- Music ** chords & musical functions (tonic, subdominant, dominant)
* DiatonicC.gf -- Concrete syntax in C major

### Generating output

If you have lilypond, you can easily generate scores or midis:

gr | l -bind | wf | ? lilypond _gftmp

If you want to test your output without installing lilypond, go here and paste your output: http://www.tunefl.com/




Some ideas from here: http://dl.acm.org/citation.cfm?id=2633638.2633645&coll=DL&dl=GUIDE