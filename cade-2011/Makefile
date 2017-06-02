all: pgf top

pgf:
	gf -make -output-format=haskell --haskell=gadt PropEng.gf PropSwe.gf PropFre.gf PropGer.gf PropFin.gf PropLatex.gf
top:
	ghc --make -XGADTs Trans.hs

