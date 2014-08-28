# Character lexing
John J. Camilleri, GF Summer School 2013

# The problem
## Introduce the Love grammar in English
### Parse in the shell
- "I love him"
  `Pred (UsePron i_Pron) Love (UsePron he_Pron)`
- "I love his mother"
  `Pred (UsePron i_Pron) Love (Person he_Pron Mother)`

## Introduce Maltese concrete syntax
### Parse in the shell
- "jien nħobb &+ u"
  `Pred (UsePron i_Pron) Love (UsePron he_Pron)`
- "jien nħobb lil omm &+ u"
   `Pred (UsePron i_Pron) Love (Person he_Pron Mother)`

## Introduce `parse.hs` and show how it does lexing for us
- "jien nħobbu"
  `Pred (UsePron i_Pron) Love (UsePron he_Pron)`
- "jien nħobb lil ommu"
  `Pred (UsePron i_Pron) Love (Person he_Pron Mother)`

## Problem parse
"aħna nħobbu lil ommu"
(aħ &+ na nħobb &+ u lil omm &+ u)
NO PARSE

# The solution
## Character lexing - each character is a token
- Grammar looks almost identical.
- Show the word operator.
- We now have to handle word boundaries.

## Load in shell:
```
p -lang=MltX "a ħ n a | n ħ o b b u | l i l | o m m u" | l -treebank
Love: Pred (UsePron we_Pron) Love (Person he_Pron Mother)
LoveEng: we love his mother
LoveMltX: a ħ n a | n ħ o b b u | l i l | o m m u
```
## This looks messy... but now very easy to lex!
```
"aħna nħobbu lil ommu"
(a ħ n a | n ħ o b b u | l i l | o m m u)
Pred (UsePron we_Pron) Love (Person he_Pron Mother)
```
## Show lexer in Haskell
Much simpler.

# The problems with the solution
1. PGF is larger: 1-2 bytes per character using UTF-8 vs. 8 bytes per character (pointers on 64-bit machine)
   This small example: PGF is 5% larger
2. Parsing is slower: 13% slower over 100,000 random strings (linearisation is the same)
2. The `word` oper is ugly
3. Don't know how well this scales
   - In terms of grammar writiing: Perhaps expliticly inserting word boundaries is tedious
   - In terms of compiler/runtime: Things might get big/slow very quickly
4. Doesn't solve the fact that you can't pattern match on runtime strings. Sandhi problems still exist.
   - nħobbu + ok → nħobbuk
   But we get "aħna nħobbuok"

# Other
1. This is just a proof of concept.
2. The extinct `lexer=chars` flag indicates this was once possible without having to write the `word` function.
3. This is probably something that could/should happen internally.