preview:
	pdflatex thesispreview.tex
	bibtex thesispreview
	pdflatex thesispreview.tex
	pdflatex thesispreview.tex

thesis:
	pdflatex thesis.tex
	bibtex thesis
	pdflatex thesis.tex
	pdflatex thesis.tex
