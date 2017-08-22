# AMR-to-text generation via GF abstract syntax trees

The initial proposal is concisely described in a position paper by Grūzītis & Bārzdiņš (2016). Details of the current implementation can be found in a system description paper by Grūzītis et al. (2017). See the Publication section below.

Outline: for a given AMR graph, represented as a tree in the PENMAN notation, transform it to a GF abstract syntax tree (AST), and linearize the AST in the target language. The output sentence is in general a paraphrase of the input sentence represented by the AMR graph.


## Structure

1. `lexicons`: monolingual and multilingual GF lexicons &ndash; extensions to the wide coverage lexicons provided by the GF resource grammar library (RGL).
1. `rules`: transformation rule sets (AMR-to-GF, Penn-to-GF, etc.).
1. `tregex`: implementation of the AMR-to-GF transformation and GF-to-text generation pipeline, based on the [Tregex](http://nlp.stanford.edu/software/tregex.html) package provided by the Stanford JavaNLP library, and [GF](http://www.grammaticalframework.org/). The use of Tregex was inspired by Butler (2016).


## Workflow

![Workflow](workflow.png)


## Publications

Gruzitis, Normunds & Gosko, Didzis & Barzdins, Guntis. (2017). [RIGOTRIO at SemEval-2017 Task 9: Combining Machine Learning and Grammar Engineering for AMR Parsing and Generation](http://nlp.arizona.edu/SemEval-2017/pdf/SemEval159.pdf). Proceedings of the 11th International Workshop on Semantic Evaluation (SemEval), ACL, pp. 924-928

Gruzitis, Normunds & Barzdins, Guntis. (2016). [The role of CNL and AMR in scalable abstractive summarization for multilingual media monitoring](http://arxiv.org/abs/1606.05994). Controlled Natural Language, LNCS 9767, Springer, pp. 127-130

Butler, Alastair. (2016). [Deterministic natural language generation from meaning representations for machine translation](http://aclweb.org/anthology/W/W16/W16-0601.pdf). Proceedings of the 2nd Workshop on Semantics-Driven Machine Translation, ACL, pp. 1-9


## Licence

The [Tregex](https://nlp.stanford.edu/software/tregex.shtml) component is licensed under GNU General Public License (v2 or later).
The [Parboiled](https://github.com/sirthias/parboiled/wiki) component is licensed under Apache License (v2).
The rest is licensed under BSD License.
