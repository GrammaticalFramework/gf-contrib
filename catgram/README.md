# CCG in GF

An English CCG parses an English sentence into an English CCG abstract syntax tree.
A Basque CCG parses a Basque sentence into a Basque CCG abstract syntax tree.

This GF grammar translates between the English and Basque CCG ASTs. (The Basque sentences are not grammatical, there is hardly any inflection.)

Intransitive sentences (`NPa` is for absolutive NP in Basque):

```
CatGram> l -bind MkPhr (Sleep Marcel)
Marcel:NP slept:S\NP
Marcel:NPa lo_egin:S\NPa
```

Transitive sentences (`NPe` is for ergative NP). Word order differs, hence does the type in CCG.

```
CatGram> l -bind MkPhr (Prove Marcel Completeness )
Marcel:NP proved:(S\NP)/NP completeness:NP
Marcelek:NPe osotasun:NPa frogatu:(S\NPe)\NPa
```

Conjunction!

```
CatGram> l -bind MkPhr (AndVP Walk Sleep Marcel)
Marcel:NP ( walked:S\NP and:(X\X)/X slept:S\NP ):S\NP
Marcel:NPa ( ibili:S\NPa eta:(X\X)/X lo_egin:S\NPa ):S\NPa
```

Also for transitive verbs, they share both subject and object:

```
CatGram> l -bind MkPhr (AndV2 (\x,y -> Prove x y) (\x,y -> Conjecture x y) Marcel Completeness)
Marcel:NP ( proved:(S\NP)/NP and:(X\X)/X conjectured:(S\NP)/NP ):(S\NP)/NP completeness:NP
Marcelek:NPe osotasun:NPa ( frogatu:(S\NPe)\NPa eta:(X\X)/X aierua_egin:(S\NPe)\NPa ):(S\NPe)\NPa
```

Combining `Prove Completeness` and `Walk` goes nicely for nominative-accusative languages; underspecified NP for Basque:

```
CatGram> l -bind MkPhr (AndVP (\x -> Prove x Completeness) Walk Marcel)
Marcel:NP ( proved:(S\NP)/NP completeness:NP and:(X\X)/X walked:S\NP ):S\NP
Marcel:NP? ( osotasun:NPa frogatu:(S\NPe)\NPa eta:(X\X)/X ibili:S\NPa ):(S\NP?)\NP?
```





