aarne vid chalmers punkt se

13/4/2011 - 20/4

updated 2/6/2017 for gf-contrib at GitHub

## Code to accompany the paper

_Translating between language and logic: what is easy and what is difficult._
A Ranta - International Conference on Automated Deduction, 2011, LNCS/LNAI.

http://www.cse.chalmers.se/~aarne/articles/cade2011.pdf

Experimental program for translating between language and logic.

### Compile globally

Prerequisite: GF with haskell binding

To compile

    make

To test

    echo "for all numbers x , x is even or x is odd" | ./Trans

### Alternative: compile with stack

This is a parallel method to the previous. Both work, and if you choose one, you can ignore the other.

To build

    make pgf
    stack build

To test

    echo "for all numbers x , x is even or x is odd" | stack run trans

### Source files

```
  -- language-neutral
  Prop.gf        -- abstract syntax
  TransProp.hs   -- conversions
  Trans.hs       -- top loop
  Makefile

  -- concrete syntax
  PropI.gf       -- concrete syntax, functor with RGL
  PropEng.gf     -- concrete syntax, English with RGL functor
  PropFin.gf     -- concrete syntax, Finnish with RGL functor
  PropFre.gf     -- concrete syntax, French  with RGL functor
  PropGer.gf     -- concrete syntax, German  with RGL functor
  PropPor.gf     -- concrete syntax, Portuguese with RGL functor
  PropSwe.gf     -- concrete syntax, Swedish with RGL functor
  PropLatex.gf   -- concrete syntax, symbolic logic in LaTeX

  -- not in use
  PropENF.gf     -- concrete syntax, English with RGL ordinary module
  PropStr.gf     -- concrete syntax, pidgin English
```

### Generated files

```
  Prop.hs        -- abstract syntax in Haskell
```

### TODO

  - web demo
  - integration with MOLTO math library
  - bullet-based conjunctions are a hack now - should be supported better by RGL
