LATEX    = latex
BIBTEX   = bibtex
DVIPS    = dvips

SHAREDFILES   = moderncv/moderncv.cls moderncv/moderncvcompatibility.sty moderncv/moderncvcolor*.sty moderncv/moderncvdebugtools.sty

BASENAME = CV_shionChen

default: testpdflatex #long compilation

conf: 
	BASENAME = CV_shionChen_ILC
	testlatex

testlatex:
	latex -halt-on-error ${BASENAME}
	latex -halt-on-error ${BASENAME}
	bibtex ${BASENAME}
	latex -halt-on-error ${BASENAME}
	latex -halt-on-error ${BASENAME}
	dvipdf -sPAPERSIZE=a4 -dPDFSETTINGS=/prepress ${BASENAME}

testpdflatex:
	pdflatex  ${BASENAME}
	pdflatex  ${BASENAME}
	bibtex    ${BASENAME}
	pdflatex  ${BASENAME}


template_classic_*.pdf: $(SHAREDFILES) CV_shionChen_20161114.tex moderncv/template_classic_green.diff moderncv/moderncvstyleclassic.sty moderncv/moderncvheadi.sty moderncv/moderncvbodyi.sty moderncv/moderncviconsmarvosym.sty
	TARGET=basename($<)
	echo -e "Generating $<\c";
	cp template.tex $TARGET.tex                                       && echo -e ".\c";
	patch --silent $TARGET.tex < $TARGET.diff                         && echo -e ".\c";
	lualatex --interaction=batchmode --draftmode $TARGET > /dev/null  && echo -e ".\c";
	bibtex $TARGET > /dev/null                                        && echo -e ".\c";
	lualatex --interaction=batchmode $TARGET > /dev/null              && echo -e ".\c";
	lualatex --interaction=batchmode $TARGET > /dev/null              && echo -e " done";


#
# standard Latex targets
#

%.dvi:	%.tex 
	$(LATEX) $<

%.bbl:	%.tex *.bib
	$(LATEX) $*
	$(BIBTEX) $*

%.ps:	%.dvi
	$(DVIPS) $< -o $@

%.pdf:	%.tex
	$(PDFLATEX) $<

.PHONY: clean

clean:
	rm -f ./supportContent/*.aux *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
	      *.inx *.dvi *.toc *.out *~ ~* spellTmp 

