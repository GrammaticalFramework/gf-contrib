A New Mini Resource Grammar
Aarne Ranta
University of Gothenburg, April 2017


=Summary=

This directory contains a new version of the "mini resource grammar".
The original version can be found in the parent directory.
The original version is documented in the GF book, Chapter 9, as well as in the freely available book slides.
The explanations are mostly adequate for the new version as well.
The differences are the following
- slightly different module structure and module names (all prefixed "Mini")
- function and category names are directly from the main RGL, to allow for easier continuation
  - except for a handful of special cases (or view them as shortcuts) marked ---s in MiniGrammar.gf
- the lexicon is significantly larger, to allow for more interesting example sentences
- some functions and categories have been removed or added
  - no more Tense, just Polarity (to simplify the verb morphology for most languages)
  - no AdA (would be trivial to add, but is not so central)
  - Utt as top level
  - mass nouns, proper names, adverbs, prepositions


=Files=

Abstract syntax
- MiniGrammar.gf   -- categories, syntactic combinations, structural words
- MiniLang.gf      -- put together Grammar and Lexicon
- MiniLexicon.gf   -- content words


Concrete syntax files for English, module by module, as reference implementation

ExtMiniGrammarEng.gf, for those who waht to extend the grammar project. Also a subset of the main RGL

The subdirectory functor/ gives a functor implementation using the RGL. Usable for testing for all RGL languages.


=Suggested workflow=

1. Copy each *Eng.gf to your *XXX.gf, and change the Eng references in module headers.

2. Start with MinResXXX 
- define Noun and the parameters needed for it (Number, Case, Definiteness, Gender,...)
- define mkNoun, regNoun, smartNoun, and mkN
- test with the cc command
```
  > i -retain MiniResXXX.gf
  > cc mkN "foo"
```

3. Implement all nouns in MiniLexiconXXX
- define lincat N = Noun in MiniGrammarXXX.gf but keep all other rules commented out
- fill in appropriate arguments to mkN in MiniLexiconXXX
- test by generating all noun forms
```
  > i MiniLexiconXXX.gf
  > gt -cat=N | l -list
```

4. Repeat the same with ProperName, Adjective, Verb, Verb2, Adverb until MiniLexiconXXX is complete
- but don't get stuck with possibly difficult cases: mark them with comments for later TODO


5. Complete MiniGrammarXXX
- start with common nouns: CN, AP, UseN, PositA, AdjCN; test gr and gt commands with flag -cat=CN
- continue with noun phrases: NP, Det, PN, Pron, DetCN, MassNP, UsePN, UsePron and the structural words
- build verb phrases and sentences: S, Cl, VP, UsePresCl, PredVP, ComplV2, UseV, UseAP
  - the Pol type will probably work with the same implementation as in English
- finish with Utt, Adv, UttS, UttNP, AdvVP, PrepNP
- frequently test with gr and gt with appropriate categories



=Dependency trees=

This will be covered later during the course.
The material here can be used as preparation for a UD project.

Files:
- MiniLang.labels     -- abstract labels, for all languages
- MiniLangEng.labels  -- concrete labels, language specific, mainly to cover syncategorematic words

Test:
```
  > gr -cat=S -number=10 | vd -view=open -output=latex -abslabels=MiniLang.labels -cnclabels=MiniLangEng.labels
  > h vd
```