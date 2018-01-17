all: minsql algebra keywordalgebra executable

executable: xml
	ghc --make -o qconv -odir objs -hidir objs QConv.hs


minsql:
	bnfc -mMakefile.minsql --haskell MinSQL.bnf
	make -f Makefile.minsql

algebra:
	bnfc -mMakefile.algebra --haskell-gadt RelAlgebra.bnf
	make -f Makefile.algebra

keywordalgebra:
	bnfc -mMakefile.keywordalgebra --haskell KeywordRelAlgebra.bnf
	make -f Makefile.keywordalgebra

xml:
	bnfc -mMakefile.xml --haskell-gadt XML.bnf
	make -f Makefile.xml
