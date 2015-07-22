TESTLANGS = english german spanish
EULANGS = ${TESTLANGS}  french italian bulgarian swedish finnish romanian polish 
NATLANGS = ${EULANGS} catalan hindi urdu russian  
ALLLANGS = ${NATLANGS} latex abstract
LAYER = OpenMath
GFFLAGS = -path=.:./abstract:./latex:./resources:${GF_LIB_PATH} --optimize=none #--optimize-pgf
oper:
	find ${EULANGS} -name "Test*.gf" | xargs gf -make ${GFFLAGS}

om:
	find ${EULANGS} -name "OpenMath*.gf" | xargs gf -make ${GFFLAGS}
    
omall:
	find ${NATLANGS} -name "OpenMath*.gf" | xargs gf -make ${GFFLAGS}

mathbar: 
	find ${ALLLANGS} -name "MathBar*.gf" | xargs gf -path=latex:abstract:resources:${GF_LIB_PATH}  -make --optimize-pgf -old-comp

upload:: mathbar
	rsync -av MathBar.pgf server/mathbar/* www.grammaticalframework.org:/usr/local/www/GF-demos/www/mathbar/

mymathbar:
	gf -make -optimize-pgf -name=MathBarEng english/MathBarEng.gf
	gf -make -optimize-pgf -name=MathBarFre french/MathBarFre.gf
	gf -make -optimize-pgf -name=MathBarGer -old-comp german/MathBarGer.gf
	gf -make -optimize-pgf -name=MathBarSpa spanish/MathBarSpa.gf
	gf -make MathBarEng.pgf MathBarFre.pgf MathBarGer.pgf MathBarSpa.pgf

