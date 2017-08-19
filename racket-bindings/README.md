# Racket bindings

A _pure_ set of bindings to call GF runtime functions from Racket.

## Installation

You need Racket and GF _compiled with the C-runtime_

1. Locate and write your **GF/src/runtime/c/.libs** directory
2. `cd gf`
2. In the file **info.rkt**, replace the definition of `cruntime-lib-dir` by
the path of **.libs** relative to the current directory (**gf**). 
(As in `realpath --relative-to . c-libs-directory`)
3. Run `raco pkg install`


## Features

### In `gf/pgf`

* Get a concrete from a `.pgf` file
* Parse

### In `gf/expr`

* Unpack a parsing into an _S-expression_

