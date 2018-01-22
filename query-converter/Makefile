all: keywordalgebra executable

D=-odir objs -hidir objs

executable: xml minsql algebra
	ghc --make -o qconv $D QConv.hs

qconv.cgi::
	ghc --make -o qconv.cgi $D -main-is QConvCGI QConvCGI.hs

minsql:
	bnfc -mMakefile_minsql --haskell MinSQL.bnf
	make -f Makefile_minsql

algebra:
	bnfc -mMakefile_algebra --haskell-gadt RelAlgebra.bnf
	make -f Makefile_algebra

keywordalgebra:
	bnfc -mMakefile_keywordalgebra --haskell KeywordRelAlgebra.bnf
	make -f Makefile_keywordalgebra

xml:
	bnfc -mMakefile_xml --haskell-gadt XML.bnf
	make -f Makefile_xml

clean:
	-rm -rf *.log *.aux *.hi *.o *.dvi objs qconv TestMinSQL TestXML TestKeywordRelAlgebra TestRelAlgebra
