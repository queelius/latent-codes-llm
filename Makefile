.PHONY: all clean pdf view

# Main target
all: pdf

# Build PDF
pdf: paper.tex references.bib
	pdflatex paper.tex
	bibtex paper
	pdflatex paper.tex
	pdflatex paper.tex

# Clean auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.synctex.gz

# Clean everything including PDF
distclean: clean
	rm -f paper.pdf

# View PDF (requires a PDF viewer)
view: pdf
	xdg-open paper.pdf 2>/dev/null || open paper.pdf 2>/dev/null || echo "Please open paper.pdf manually"
