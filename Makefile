
dots = $(wildcard dot/*.dot)
dot_pdf = $(dots:.dot=.pdf)
gnuplots = $(wildcard gnuplot/*.gnu)
gnu_pdf = $(gnuplots:.gnu=.pdf)

picts = $(dot_pdf) $(gnu_pdf) img/ef-2.pdf img/Coomassie_Brilliant_Blue_G-250.pdf

.SECONDEXPANSION:

build: all.pdf

all.pdf: *.tex $$(picts) Km
	pdflatex all.tex
	makeindex all.nlo -s nomencl.ist -o all.nls
	pdflatex all.tex

clean:
	rm $(wildcard *.pdf *.eps *.aux *.log *.out *.toc dot/*.pdf_tex dot/*.pdf dot/*.svg)

build-dep:
	apt-get install texlive texlive-bibtex-extra texlive-fonts-extra \
	texlive-formats-extra texlive-generic-extra texlive-lang-cyrillic \
	texlive-latex-base texlive-latex-extra texlive-math-extra texlive-pictures \
	texlive-science \
	graphviz \
	inkscape \
	gnuplot

.SECONDARY: $(dots:.dot=.svg) $(dots:.dot=.pdf)

dot/%.svg: dot/%.dot
	dot $< -Tsvg -o $@

dot/%.pdf: dot/%.svg
	inkscape -z --export-pdf=$@ --export-latex $<

img/%.pdf: img/%.svg
	inkscape -z --export-pdf=$@ --export-latex $<

img/ef-2.svg: img/ef-2.svg.in
	sed 's@{PWD}@$(shell pwd)@' < $< > $@

gnuplot/%.pdf: gnuplot/%.eps
	epstopdf $<

gnuplot/%.eps: gnuplot/%.gnu
	cd gnuplot && gnuplot -e "set terminal epslatex; set output '$*.tex'" $*.gnu

.PHONY: Km
Km:
	$(MAKE) -C gnuplot/Km DATA=10
	$(MAKE) -C gnuplot/Km DATA=17
	$(MAKE) -C gnuplot/Km DATA=17-1

