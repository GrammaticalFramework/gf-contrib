# AMR-to-text generation via GF abstract syntax trees

The initial proposal is concisely described in a position paper by Grūzītis and Bārzdiņš (2016).

Task: for a given AMR graph, represented as a tree in the PENMAN notation, transform it to a GF abstract syntax tree (AST), and linearize the AST in the target language. The output sentence is in general a paraphrase of the input sentence represented by the AMR graph.


## Structure

1. `lexicons`: language-specific GF lexicons extending the wide-coverage lexicons provided by the GF resource grammar library, interlinked via an abstract lexicon. Extensions: lexical units from PropBank, named entities from DBpedia, etc.
1. `rules`: implementation-independent AMR-to-AST transformation rules (methodology).
1. `tregex`: implementation of the transformation rules, based on the [Tregex](http://nlp.stanford.edu/software/tregex.html) package provided by the Stanford JavaNLP library. The use of Tregex was inspired by Butler (2016).


## Workflow

![Workflow](workflow.png)


## Goals and work plan

### SemEval 2017 Task 9 Subtask 2

See the [task](http://alt.qcri.org/semeval2017/task9/) and [deadlines](http://alt.qcri.org/semeval2017/task9/index.php?id=important-dates). `!!`

1. The current implementation produces GF API constructor application trees instead of the actual ASTs. This is suboptimal as it requires to generate and compile a grammar for each new AMR (or a batch of AMRs), but it seems a simpler solution in the short term, and this is also a workaround for handling the open list of named entities / proper names which, thus, can be linearized by directly applying the `mkPN` constructor. This works for English.
1. Add much more transformation rules (and test cases)!
  * Can we reuse the AMR-to-Penn rules by Butler (2016)?
  * To what extent the conversion of `:ARG[2..N]` relations depends on the particular PropBank frames?
1. At the end, prune all edges and nodes in the given AMR, so that at least a partial AMR is linearized.

### Future tasks

1. Conversion of AMRs into proper ASTs.
1. Re-implementation in a programming language which has a native support for operations on trees, e.g. Haskell or LISP (a future task).
1. AMR-to-English vs. multilingual text generation.
  * Use of the `:wiki` relations and a multilingual named entity lexicon generated from DBpedia (instead of the `:name` + `:op[1..N]` relations). This should be an optional feature, as the automatic wikification is error-prone.


## Publications

Grūzītis, Normunds and Bārzdiņš, Guntis. (2016). [The role of CNL and AMR in scalable abstractive summarization for multilingual media monitoring](http://arxiv.org/abs/1606.05994). Controlled Natural Language, LNCS 9767, Springer, pp. 127-130

Butler, Alastair. (2016). [Deterministic natural language generation from meaning representations for machine translation](http://aclweb.org/anthology/W/W16/W16-0601.pdf). Proceedings of the 2nd Workshop on Semantics-Driven Machine Translation, ACL, pp. 1-9
