Abstract Meaning Representation (AMR)
=====================================

AMR is a semantic representation language. A sentence is represented in AMR as a rooted, directed, acyclic graph where semantic relations are represented as edges, and concepts are represented as nodes. AMRs include PropBank semantic roles, within-sentence coreferences, named entities and types, modality, negation, questions, quantities, wikification, etc.

See AMR [project page](http://amr.isi.edu/) and [specification](https://github.com/amrisi/amr-guidelines/blob/master/amr.md).

We propose:

1. `AMR-to-text` generation via [GF](http://www.grammaticalframework.org/) abstract syntax trees.
1. `text-to-AMR` parsing in [GF](http://www.grammaticalframework.org/) as a future experiment.

Related work
------------

See [FrameNet-based API to GF](https://github.com/GrammaticalFramework/gf-contrib/tree/master/framenet).
