SRCDIR = src/
TARGET = presentation

%.pdf: %.svg
	rsvg-convert -f pdf -o $@ $<

svgImages = \
	pics/projection/fromortho.pdf\
	pics/projection/frompers.pdf\
	pics/projection/ndc.pdf\
	pics/projection/ortho.pdf\
	pics/projection/pers.pdf\
	pics/linear/scale.pdf\
	pics/linear/space.pdf\
	pics/linear/axis-angle.pdf\

all: ${svgImages}
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	pdflatex -shell-escape $(SRCDIR)$(TARGET)
	#bibtex $(TARGET)
	#pdflatex -shell-escape $(TARGET)
	#pdflatex -shell-escape $(TARGET)

clean:
	rm -rf *.aux *.pdf *.log *.toc *.bbl *.blg *.out *.nav *.snm *.pyg *.vrb _minted-presentation ${svgImages}
