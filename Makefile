all: minted/minted.sty advanced_python.pdf

minted/minted.sty:
	$(MAKE) -C minted/ minted.sty

TEXFLAGS = -e '$$pdflatex=q/pdflatex %O -shell-escape %S/' -pdf

%.pdf: %.tex version.txt
	TEXINPUTS=:minted/ latexmk $(TEXFLAGS) $<

.PHONY: version.txt
version.txt:
	git describe > $@.tmp
	diff -q version.txt.tmp $@.tmp && mv $@.tmp $@ || rm $@.tmp
