all: KeywordRelAlgebra executable cgi
cgi:: www/qconv-real.cgi

# Install web pages & CGI script (run it on www.grammaticalframework.org)
DST=/usr/local/www/qconv/
install: cgi
	rsync -av www/ $(DST)/
	-chgrp gf $(DST)/

G=generated
D=-i$G -odir objs -hidir objs

executable: XML MinSQL RelAlgebra
	ghc -j --make -O -o qconv $D QConv.hs

R=-with-rtsopts=-M1G
www/qconv-real.cgi:: RelAlgebra MinSQL
	ghc -j --make -O -o $@ $D $R -main-is QConvCGI QConvCGI.hs


SHELL=bash # The lines below might not work with /bin/sh, the default
ALEX=if [ $G/Lex$@.x -nt $G/Lex$@.hs ] ; then alex -g $G/Lex$@.x ; fi
HAPPY=if [ $G/Par$@.y -nt $G/Par$@.hs ] ; then happy -gac $G/Par$@.y ; fi

BNFC=bnfc -o $G -mMakefile_$@ --haskell $@.bnf && $(ALEX) && $(HAPPY)
BNFC_GADT=bnfc -o $G -mMakefile_$@ --haskell-gadt $@.bnf && $(ALEX) && $(HAPPY)

XML:: ; $(BNFC_GADT)
MinSQL:: ; $(BNFC)
RelAlgebra:: ; $(BNFC_GADT)
KeywordRelAlgebra:: ; $(BNFC_GADT)

clean:
	-rm -rf *.log *.aux *.dvi objs generated qconv www/qconv.cgi
