thesis:
	pdflatex --enable-write18 thesis.tex
	bibtex thesis
	pdflatex --enable-write18 thesis.tex
	pdflatex --enable-write18 thesis.tex

preview:
	pdflatex --enable-write18 thesispreview.tex
	bibtex thesispreview
	pdflatex --enable-write18 thesispreview.tex
	pdflatex --enable-write18 thesispreview.tex


clean:
	rm -f amazing_outline_ch3.pdf
	rm -f "julia's_12_labours.pdf"
	rm -f *.bbl
	rm -f *.blg
	rm -f *.toc
	rm -f *.log
	rm -f *.aux
	rm -f *.dvi
	rm -f *.ps
