# A Grammar of GQL

Graph Query Language, based on the description in

  Nadime Francis et al, A Researcher's Digest of GQL, ICDT 2023.

The grammar can be compiled with BNFC, https://bnfc.digitalgrammars.com/

For example:
```
  bnfc -m -haskell GQL.cf
  make
  ./TestGQL ex1.gql
```
This creates a Haskell program. BNFC can also generate other languages, such as Java and OCAML.

