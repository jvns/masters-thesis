thesis:
	latex thesis.tex
	bibtex thesis
	latex thesis.tex
	latex thesis.tex
	dvips thesis.dvi
	ps2pdf thesis.ps

preview:
	latex thesispreview.tex
	bibtex thesispreview
	latex thesispreview.tex
	latex thesispreview.tex
	dvips thesispreview.dvi
	ps2pdf thesispreview.ps


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
