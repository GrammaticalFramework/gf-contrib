RUNGHC=runghc
RUNMAKE=$(RUNGHC) Make.hs

TPROBSFILE=attempto.probs

all: EmbeddedAttemptoEng.pgf

S=-s
GFMKT=mkdir -p ../translator && gf $S -make -probs=$(TPROBSFILE)
#GFMKT=mkdir -p ../translator && gf $S -make -literal=Symb -probs=$(TPROBSFILE)


# Translate grammars for individual languages
EmbeddedAttemptoEng.pgf:: ; $(GFMKT) -name=EmbeddedAttemptoEng EmbeddedAttemptoEng.gf
