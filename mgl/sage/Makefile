ifeq ($(shell uname), Darwin)
GHCL = -optl"-Wl,-read_only_relocs,suppress"
GHCCP = -DOS=1 -DVOICED
endif
ifeq ($(shell uname), Linux)
GHCCP = -DOS=2 -DVOICED
endif

MGLPATH = -path=../* 

EXEC = gfsage
LANGS = english catalan german spanish
GRAMMAR = Commands
PGF_FORMAT=-output-format=haskell

$(EXEC): GfSage.hs *Side.hs Transfer.hs Test.hs $(GRAMMAR).pgf
	ghc -cpp ${GHCCP} --make $< ${GHCL} -package gf -package curl -package json  -o $@
	make -C nlgf basic
	make -C nlgf build


sage-shell: $(GRAMMAR).pgf
	make -C nlgf basic
	make -C nlgf shell


$(GRAMMAR).pgf: $(GRAMMAR)Sage.gf ../abstract/$(GRAMMAR).gf
	find $(patsubst %,../%,${LANGS}) -name "$(GRAMMAR)*.gf" | xargs gf $(MGLPATH) $(PGF_FORMAT) -make $<

clean:
	rm -f *.hi *.o *.gfo *.pgf *.pyc $(EXEC) $(GRAMMAR).hs history

distclean:
	make clean
	make -C nlgf clean
	make -C nlgf build
    
.PHONY:  sage
sage:
	make -C nlgf build
    
shell:
	make -C nlgf shell
