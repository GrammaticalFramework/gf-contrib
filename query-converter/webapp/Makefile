all: copy-js

copy-js: build
	mkdir -p js	
	cp $$(stack path --local-install-root)/bin/qconv-webapp.jsexe/*.js js

build: setup
	stack build

setup:
	stack setup

REMOTEPATH=/chalmers/groups/edu2009/www/www.cse.chalmers.se/year/2016/course/TDA357/VT2016/qconv

upload:
	rsync -priv --delete --chmod=F664,D775 --checksum \
	  index.html style.css js libs chalmers:${REMOTEPATH}

.PHONY: build setup copy-js upload
