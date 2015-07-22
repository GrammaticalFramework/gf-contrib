sage = sage
nl = nlgf
SAGE_ROOT = $(shell $(sage) -root)
BASICPY = prelude.sage realsets.py
SAGE_SAGE = $(SAGE_ROOT)/devel/sage
SAGE_NL = $(SAGE_SAGE)/sage/$(nl)
SAGE_INTERFACES = $(SAGE_SAGE)/sage/interfaces/
setup = $(SAGE_SAGE)/setup.py
nlmodule = sage.$(nl)
grep_setup = grep -q "$(nlmodule)" $(setup)
grep_all   = grep -q "nlgf" $(SAGE_INTERFACES)/all.py


basic: $(BASICPY)
	$(grep_setup) || (echo "\nPlease add '$(nlmodule)' to $(setup)\n"  ; exit 1)
	mkdir -p $(SAGE_NL)
	touch $(SAGE_NL)/__init__.py
	cp $(BASICPY) $(SAGE_NL)


shell: nlgf.py ../Commands.pgf
	make basic
	$(grep_all) || (echo "\nPlease add nlgf components to the interfaces list in $(SAGE_INTERFACES)all.py\n"; exit 1)
	cp nlgf.py $(SAGE_INTERFACES)
	cp ../Commands.pgf $(SAGE_NL)
	make build

build:
	$(sage) -b

clean:
	$(grep_setup) && echo "\nPlease remove '$(nlmodule)' from $(setup).\n" && exit 1  || exit 0
	$(grep_all) && echo "\nPlease remove nlgf entries from $(SAGE_INTERFACES)all.py\n" && exit 1  || exit 0
	rm -rf $(SAGE_NL)
