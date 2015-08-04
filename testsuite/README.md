# Test suites for the standard GF grammars

## Format of the test files

The examples are stored in `.gfs` files, as a series of GF shell commands. Example:

```
i <Language[1-n]>.gfo

-- Sentences to test

l -treebank PositA warm_A
l -treebank ComparA warm_A (UsePron i_Pron)
...
``` 

## Usage

Run `gf < FILENAME.gfs` in a terminal. This will produce linearisations as output, and you can compare them with `FILENAME.gfs.gold` using `diff`.
Example script:

```
gf < resource.gfs | egrep "Lang(...)?:" | tr -s '\n' | diff -u - resource.gfs.gold 
```

Example output, suppose we have an error in the Swedish production for `warm_A`:

```
--- -  2015-07-30 12:35:20.000000000 +0200
+++ resource.gfs.gold	     2015-07-30 12:35:18.000000000 +0200
@@ -1,7 +1,7 @@
 Lang> Lang: PositA warm_A
 LangBul: топъл
 LangEng: warm
-LangSwe: kall
+LangSwe: varm 
 Lang> Lang: ComparA warm_A (UsePron i_Pron)
 LangBul: по - топъл от мен
 LangEng: warmer than I
```

The `diff` command will show that the linearisation for `warm_A` in the output (first argument, marked with - by diff) differs from the gold standard (second argument, marked with +), and the 3-4 lines before and after show the context where the difference occurs.


## Content in the files


### miniresource.gfs

This file contains constructions implemented by the miniresource.

Examples:

 * gt UseCl ? ? (PredVP i_NP (UseV walk_V))
 * UseCl Pres Pos (PredVP (DetCN the_Det (UseN woman_N)) (CompAP (UseA green_A)))



## resource.gfs and resource.gfs.gold

 * Examples from GF/testsuite/libraries, with gold standard in English, Swedish and Bulgarian.


## wide-coverage.gfs

--he transplanted the cell by publishing the document

```ChunkPhr (OneChunk (S_Chunk (UseCl (TTAnt TPast ASimul) PPos (PredVP (UsePron he_Pron) (AdvVP (ComplV2 transplant_V2 (DetCN (DetQuant DefArt NumSg) (UseN cell_N))) (ByVP (ComplV2 publish_V2 (DetCN (DetQuant DefArt NumSg) (UseN document_N)))))))))```


## german-disco.txt

Discontinuous sentences from the TIGER treebank, collected by Wolfgang Meier et al. See http://cl.indiana.edu/~skuebler/papers/disco.pdf

Currently there are no GF parses or gold standard for this, just the sentences extracted.