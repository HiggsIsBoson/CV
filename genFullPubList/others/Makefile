LATEX    = latex
BIBTEX   = bibtex
DVIPS    = dvips


BASENAME = pubList

default: testpdflatex #long compilation

conf: 
	BASENAME = supportNote
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

