A FrameNet-based API to GF Resource Grammar Library
===================================================

Version 0.9.7

Introduction
------------

The aim of this project is to make existing FrameNet (FN) resources computationally accessible for multilingual natural language generation and controlled semantic parsing via a shared semantico-syntactic grammar and lexicon API.

We provide a currently bilingual but potentially multilingual FN-based grammar and lexicon library implemented in [Grammatical Framework](http://www.grammaticalframework.org/) (GF) on top of GF Resource Grammar Library (RGL). The API of the FN-based library represents a shared set of automatically extracted semantico-syntactic verb valence patterns from 66,918 annotated sentences in [Berkeley FrameNet](https://framenet.icsi.berkeley.edu/) (BFN 1.5) and 4,267 sentences in [Swedish FrameNet](http://spraakbanken.gu.se/eng/swefn) (SweFN, a snapshot taken in December 3, 2014). The concise set of 869 patterns covers 483 shared frames (using BFN frames as interlingua) and 77.5% of sentences evoking the shared frames in both BFN and SweFN (44,645 and 2,596 sentences respectively).

Based on the FN-annotated sentences covered by the shared valence patterns, and the GF RGL type system for verbs, we have extracted 3,432 lexical entries (subcategorized lexical units, LUs) from BFN, and 1,899 entries form SweFN. LUs between BFN and SweFN are not directly aligned, therefore a specific lexicon is generated for each language. However, a partial shared lexicon has been automatically derived on top of the language-specific lexicons, currently providing a mapping between 703 LUs in BFN and 900 LUs in SweFN. The shared lexicon covers 25.1% (11,223) of BFN sentences and 35.8% (928) of SweFN sentences – of the above mentioned sentences which are represented by the shared valence patterns.

As a side result, a unified method for comparing and mapping semantic and syntactic valence patterns and lexical units across framenets is provided.

Structure
---------

All modules of the grammar and lexicon have been automatically generated based on the automatically extracted semantico-syntactic valence patterns.

### Abstract syntax

  - `Elements.gf` – 541 core frame elements (FE) declared as semantic categories that are subcategorized by the syntactic RGL types.
  - `Patterns.gf` – 869 valence patterns declared as functions that take one or more core FEs and a target verb as arguments, and return a clause. For each frame, the set of core FEs is often split into several alternative functions according to the corpus evidence.
  - `TargetsEngAbs.gf` – 3,432 lexical units (LU) from BFN (subcategorized by RGL verb types).
  - `TargetsSweAbs.gf` – 1,899 LUs from SweFN (subcategorized by RGL verb types).
  - `Targets.gf` – 703 LUs from BFN for which a mapping to one or more LUs in SweFN has been found.

### Concrete syntax

  - `ElementsI.gf` – mapping from the semantic types to the syntactic types, shared for all languages.
  - `ElementsEng.gf` and `ElementsSwe.gf` – language-specific instantiations of `ElementsI.gf`.
  - `PatternsEng.gf` and `PatternsSwe.gf` – language-specific implementation of the shared valence patterns (frame building functions).
  - `TargetsEngCnc.gf` – implementation of 3,350 BFN-specific LUs (reusing [`DictEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/english/DictEng.gf), [`DictionaryEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/translator/DictionaryEng.gf), [`LexiconEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/english/LexiconEng.gf), [`IrregEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/english/IrregEng.gf), [`StructuralEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/english/StructuralEng.gf)).
  - `TargetsSweCnc.gf` – implementation of 1,789 SweFN-specific LUs (reusing [`DictSwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/swedish/DictSwe.gf), [`DictionarySwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/translator/DictionarySwe.gf), [`LexiconSwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/swedish/LexiconSwe.gf), [`IrregSwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/swedish/IrregSwe.gf), [`StructuralSwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/swedish/StructuralSwe.gf)).
  - `TargetsEng.gf` and `TargetsSwe.gf` – language-specific implementation of the shared LUs (the mapping from English to Swedish is based on potential translation equivalents extracted from the multilingual [`DictionaryEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/translator/DictionaryEng.gf)/[`DictionarySwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/translator/DictionarySwe.gf) and [`LexiconEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/english/LexiconEng.gf)/[`LexiconSwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/swedish/LexiconSwe.gf)).

_Note_: The RGL modules `DictL`, `DictionaryL`, `LexiconL`, `IrregL` and `StructuralL` are a subject to change independently of this library. We have used an RGL snapshot of December 15, 2014.

Documentation
-------------

The API specification and a change log are available at http://remu.grammaticalframework.org/framenet/

Requirements
------------

[GF 3.6](http://www.grammaticalframework.org/download/index.html) installed from a recent developer source code (at least 2014-07-02).

Usage example
-------------

To illustrate the use of the FrameNet-based API, a re-engineered version of the [Phrasebook](https://github.com/GrammaticalFramework/gf-contrib/tree/master/phrasebook) grammar is included, preserving the original functionality and making no changes in the abstract syntax. Changes affect only the concrete syntax.

Search for "FrameNet API" in `WordsEng.gf`, `PhrasebookEng.gf` and `WordsSwe.gf`, `PhrasebookSwe.gf` under `examples/phrasebook` to see the added and modified code.

Publications
------------

  - Normunds Gruzitis, Peteris Paikens and Guntis Barzdins. [FrameNet Resource Grammar Library for GF](http://arxiv.org/pdf/1406.6844v1.pdf). In: Proceedings of the 3rd Workshop on Controlled Natural Language (CNL), LNCS 7427, Springer, 2012, pp. 121-137

  - Dana Dannélls and Normunds Gruzitis. [Extracting a bilingual semantic grammar from FrameNet-annotated corpora](http://www.lrec-conf.org/proceedings/lrec2014/pdf/1079_Paper.pdf). In: Proceedings of the 9th International Language Resources and Evaluation Conference (LREC), 2014, pp. 2466-2473

  - Dana Dannélls and Normunds Gruzitis. [Controlled natural language generation from a multilingual FrameNet-based grammar](http://arxiv.org/pdf/1406.2400v1.pdf). In: Proceedings of the 4th Workshop on Controlled Natural Language (CNL), LNCS 8625, Springer, 2014, pp. 155-166 ([slides](http://attempto.ifi.uzh.ch/site/cnl2014/slides/gruzitis.pdf), [video](https://www.youtube.com/watch?v=-qQpQxg5-GQ))

Acknowledgements
----------------

This work has been supported by Swedish Research Council under grant No. 2012-5746 (Reliable Multilingual Digital Communication: Methods and Applications) and by Centre for Language Technology in Gothenburg. The initial research has been supported by Latvian National Research Programme in Information Technology.
