
dots = $(wildcard dot/*.dot)
dot_pdf = $(dots:.dot=.pdf)
gnuplots = $(wildcard gnuplot/*.gnu)
gnu_pdf = $(gnuplots:.gnu=.pdf)

picts = $(dot_pdf) $(gnu_pdf)

.SECONDEXPANSION:

build: all.pdf

all.pdf: *.tex $$(picts)
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

gnuplot/%.pdf: gnuplot/%.eps
	epstopdf $<

gnuplot/%.eps: gnuplot/%.gnu
	cd gnuplot && gnuplot -e "set terminal epslatex; set output '$*.tex'" $*.gnu

