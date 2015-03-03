all:
	happy -gca ParXPath.y
	alex -g LexXPath.x
	ghc --make TestXPath.hs -o TestXPath

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi
	-rm -f DocXPath.ps

distclean: clean
	-rm -f DocXPath.* LexXPath.* ParXPath.* LayoutXPath.* SkelXPath.* PrintXPath.* TestXPath.* AbsXPath.* TestXPath ErrM.* SharedString.* ComposOp.* XPath.dtd XMLXPath.* Makefile*
	

