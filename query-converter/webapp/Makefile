all: copy-js

copy-js: build
	mkdir -p js	
	cp $$(stack path --local-install-root)/bin/qconv-webapp.jsexe/*.js js

build: setup
	stack build

setup:
	stack setup

.PHONY: build setup copy-js
