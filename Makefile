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
clean:
	rm -f .2_algbackground.tex.swp
	rm -f .3_categoricalbackground.tex.swp
	rm -f .4_uqsl2.tex.swp
	rm -f .5_MTC-from-uqsl2.tex.swp
	rm -f .preamble.tex.swp
	rm -f .thesis.tex.swp
	rm -f .thesispreview.tex.swp
	rm -f amazing_outline_ch3.aux
	rm -f amazing_outline_ch3.log
	rm -f amazing_outline_ch3.pdf
	rm -f "julia's_12_labours.aux"
	rm -f "julia's_12_labours.log"
	rm -f "julia's_12_labours.pdf"
	rm -f thesis.aux
	rm -f thesis.bbl
	rm -f thesis.blg
	rm -f thesis.log
	rm -f thesis.toc
	rm -f thesispreview.aux
	rm -f thesispreview.bbl
	rm -f thesispreview.blg
	rm -f thesispreview.log
	rm -f thesispreview.toc
