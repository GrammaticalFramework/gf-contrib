OPTS = -N1000 -t3000 -k8000 -a1 -g1 -Dscaifgtn
enOPTS = $(OPTS) -CUDTranslate.labels,UDTranslateEng.labels
fiOPTS = $(OPTS) -CUDTranslate.labels,UDTranslateFin.labels
svOPTS = $(OPTS) -CUDTranslate.labels,UDTranslateSwe.labels


all: grammar compile testEng testSwe testFin

compile:
	ghc --make -O2 -o ud2gf UD2GF.hs

grammar:
	gf -make UDTranslateEng.gf UDTranslateSwe.gf UDTranslateFin.gf

enggrammar:
	gf -make -name=UDTranslateEng UDTranslateEng.gf

test:
	time ./ud2gf -lEng -Dscamifgtn -GUDTranslateEng.pgf -CUDTranslate.labels,UDTranslateEng.labels doc/cat.conll

testFin:
	time ./ud2gf -lFin -Fdict-fin-eng.tsv $(fiOPTS) treebanks/UD_Finnish/fi-ud-train.conllu >latest-train-fi.tmp
	tail -2 latest-train-fi.tmp
	grep "TRANSL" latest-train-fi.tmp | wc

testEng:
	time ./ud2gf -lEng $(enOPTS) treebanks/UD_English/en-ud-train.conllu >latest-train-en.tmp
	tail -2 latest-train-en.tmp
	grep "TRANSL" latest-train-en.tmp | wc
	grep "ERROR" latest-train-en.tmp | wc

testEngOnly:
	time ./ud2gf -lEng $(enOPTS) -GUDTranslateEng.pgf treebanks/UD_English/en-ud-train.conllu >latest-train-only-en.tmp
	tail -2 latest-train-only-en.tmp
	grep "TRANSL" latest-train-only-en.tmp | wc
	grep "ERROR" latest-train-only-en.tmp | wc

testSwe:
	time ./ud2gf -lSwe $(svOPTS) treebanks/UD_Swedish/sv-ud-train.conllu >latest-train-sv.tmp
	tail -2 latest-train-sv.tmp
	grep "TRANSL" latest-train-sv.tmp | wc


testNodalida:
	time ./ud2gf -lEng -t10000 -k3000 -a1 -g1 -Dscaifgtn -CUDTranslate.labels,UDTranslateEng.labels treebanks/UD_English/en-ud-test.conllu >latest-test-en.tmp
	time ./ud2gf -lSwe -t10000 -k3000 -a1 -g1 -Dscaifgtn -CUDTranslate.labels,UDTranslateSwe.labels treebanks/UD_Swedish/sv-ud-test.conllu >latest-test-sv.tmp
	time ./ud2gf -lFin -Fdict-fin-eng.tsv -t10000 -k3000 -a1 -g1 -Dscaifgtn -CUDTranslate.labels,UDTranslateFin.labels treebanks/UD_Finnish/fi-ud-test.conllu >latest-test-fi.tmp
	time ./ud2gf -lSwe -t10000 -k3000 -a1 -g1 -Dscaifgtn -CUDTranslate.labels treebanks/UD_Swedish/sv-ud-test.conllu >latest-test-sv-absonly.tmp
	time ./ud2gf -lFin -Fdict-fin-eng.tsv -t10000 -k3000 -a1 -g1 -Dscaifgtn -CUDTranslate.labels treebanks/UD_Finnish/fi-ud-test.conllu >latest-test-fi-absonly.tmp


