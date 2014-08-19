A FrameNet-based API to GF Resource Grammar Library
===================================================

Version 0.9.4

Introduction
------------

The aim of this project is to make existing FrameNet-based lexical resources computationally accessible for multilingual natural language generation via a shared semantico-syntactic grammar API.

We provide a currently bilingual but potentially multilingual FrameNet-based grammar library implemented in [Grammatical Framework](http://www.grammaticalframework.org/), based on its Resource Grammar Library (RGL). The API of the library represents a shared set of automatically extracted semantico-syntactic valence patterns from ~66,800 annotated sentences in [Berkeley FrameNet](https://framenet.icsi.berkeley.edu/) (BFN 1.5) and ~4,100 annotated sentences in [Swedish FrameNet](http://spraakbanken.gu.se/eng/swefn) (SweFN, a snapshot taken in February 2014). The concise set of 714 patterns covers 421 BFN frames, and ~69% of sentences in BFN and SweFN evoking the shared frames.

As a side result, a unified method for comparing semantic and syntactic valence patterns across framenets is provided.

Structure
---------

All grammar modules have been automatically generated based on the automatically extracted semantico-syntactic valence patterns.

### Abstract syntax

  - `Elements.gf` – 482 core frame elements (FE) declared as semantic categories that are subcategorized by the syntactic RGL types.
  - `Patterns.gf` – 714 valence patterns declared as functions that take one or more core FEs and a target verb as arguments, and return a clause. For each frame, the set of core FEs is often split into several alternative functions according to the corpus evidence.
  - `TargetsEngAbs.gf` – 2,996 lexical units (LU) from BFN.
  - `TargetsSweAbs.gf` – 1,257 LUs from SweFN.

### Concrete syntax

  - `ElementsI.gf` – mapping from the semantic types to the syntactic types, shared for all languages.
  - `ElementsEng.gf` and `ElementsSwe.gf` – language-specific instantiations of `ElementsI.gf`.
  - `PatternsEng.gf` and `PatternsSwe.gf` – language-specific implementation of the shared valence patterns (frame building functions).
  - `TargetsEng.gf` – implementation of 2,755 BFN LUs (reusing [`DictEng.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/english/DictEng.gf)).
  - `TargetsSwe.gf` – implementation of 1,211 SweFN LUs (reusing [`DictSwe.gf`](https://github.com/GrammaticalFramework/GF/blob/master/lib/src/swedish/DictSwe.gf)).

LUs between BFN and SweFN are not directly aligned, therefore a framenet-specific lexicon is generated for each language.

Documentation
-------------

The API specification and a change log are available at http://remu.grammaticalframework.org/framenet/

Requirements
------------

[GF 3.6](http://www.grammaticalframework.org/download/index.html) installed from the latest developer source code (at least 2014-07-02).

Usage example
-------------

To illustrate the use of the FrameNet-based API, a re-engineered version of the [Phrasebook](https://github.com/GrammaticalFramework/gf-contrib/tree/master/phrasebook) grammar is included, preserving the original functionality and making no changes in the abstract syntax. Changes affect only the concrete syntax.

Search for "FrameNet API" in `WordsEng.gf`, `PhrasebookEng.gf` and `WordsSwe.gf`, `PhrasebookSwe.gf` under `examples/phrasebook` to see the added and modified code.

Publications
------------

  - Normunds Gruzitis, Peteris Paikens and Guntis Barzdins. [FrameNet Resource Grammar Library for GF](http://arxiv.org/pdf/1406.6844v1.pdf). In: Proceedings of the 3rd Workshop on Controlled Natural Language (CNL), LNCS 7427, Springer, 2012, pp. 121-137

  - Dana Dannélls and Normunds Gruzitis. [Extracting a bilingual semantic grammar from FrameNet-annotated corpora](http://www.lrec-conf.org/proceedings/lrec2014/pdf/1079_Paper.pdf). In: Proceedings of the 9th International Language Resources and Evaluation Conference (LREC), 2014, pp. 2466-2473

  - Dana Dannélls and Normunds Gruzitis. [Controlled natural language generation from a multilingual FrameNet-based grammar](http://arxiv.org/pdf/1406.2400v1.pdf). In: Proceedings of the 4th Workshop on Controlled Natural Language (CNL), LNCS 8625, Springer, 2014, pp. 155-166 (to appear)

Acknowledgements
----------------

This work has been supported by Swedish Research Council under grant No. 2012-5746 (Reliable Multilingual Digital Communication: Methods and Applications) and by Centre for Language Technology in Gothenburg. The initial research has been supported by Latvian National Research Programme in Information Technology.
