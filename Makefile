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
	rm -f .2_algbackground.tex.swp
	rm -f .3_categoricalbackground.tex.swp
	rm -f .4_uqsl2.tex.swp
	rm -f .5_MTC-from-uqsl2.tex.swp
	rm -f .preamble.tex.swp
	rm -f .thesis.tex.swp
	rm -f .thesispreview.tex.swp
	rm -f amazing_outline_ch3.aux
	rm -f thesis.out
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
