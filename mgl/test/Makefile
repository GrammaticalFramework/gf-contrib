MODULE = OpenMath
CREATE = python create.py
LANG = Eng
GF = gf --run ../${MODULE}.pgf
CABALPKGS = json Diff regex-compat containers transformers mtl gf
EXECUTABLES = inspect
WITHPM = -DPM=1

tbm: Main.hs
	ghc -XCPP $(foreach p, $(CABALPKGS),-package $(p)) $^ -o $@

pm: Main.hs
	ghc -XCPP --make ${WITHPM} $^ -o tbm

samples:
		${CREATE} gr '../abstract/*.gf' 1 > $@

base.abs: samples
	${GF} < $< | ${CREATE} clean $<  > $@

eng.json: base.abs
	${CREATE} treebank ${LANG} < $< |${GF}| ${CREATE} save ${MODULE} > $@

clean:
	rm -f samples *.hi *.o

distclean:
	make clean
	rm -f $(EXECUTABLES)

all: inspect