#!/bin/bash
ghc -e "$(echo "p -lang=Eng \"$1\" | pt -number=1 \
  | l -lang=Haskell" | gf -run QueryArithmEng.gf QueryArithmHaskell.gf)"
