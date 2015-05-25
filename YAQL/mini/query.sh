#!/bin/bash
ghc -e "$(echo "p -lang=Eng \"$1\" | pt -number=1 \
  | l -lang=Hs" | gf -run -startcat=Query MathQueryEng.gf MathQueryHs.gf)"

