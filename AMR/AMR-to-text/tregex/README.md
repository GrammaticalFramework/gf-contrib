# Tregex-based implementation of AMR-to-AST conversion

### Packages under `org.grammaticalframework.amr`:
- `peg`: a parsing expression grammar for rewriting AMR graphs (encoded as trees) in the PENMAN notation to the LISP-like bracketing tree syntax (used in the Penn treebank representation).
- `tregex`: Tregex/Tsurgeon transformation rules, as well as a set of unit tests.
- `propbank`: an utility for extracting frames, their valence patterns and lexical units from the PropBank dataset.

### Contents under `out`:
- `TestLexicon`: an experimental extension of the wide coverage GF translation lexicon for testing purposes (maintained manually).
- `TestTrees`: an automatically generated GF grammar (by running the unit tests) for testing purposes &ndash; the result of the AMR to *pseudo* AST conversion.
- `test.sh`: a script for linearizing the resulting ASTs (executes the automatically generated `TestTrees.gfs` script).
- `output.txt`: the resulting linearizations in English, as well as in Russian and Latvian (partially; to illustrate the potential for multilingual use cases).
