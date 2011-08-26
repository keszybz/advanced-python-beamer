all: minted/minted.sty advanced_python.pdf

minted/minted.sty:
	$(MAKE) -C minted/ minted.sty

TEXFLAGS = -e '$$pdflatex=q/pdflatex %O -shell-escape %S/' -pdf

%.pdf: %.tex
	TEXINPUTS=:minted/ latexmk $(TEXFLAGS) $<
