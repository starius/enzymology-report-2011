
dots = $(wildcard dot/*)
dot_pdf = $(dots:.dot=.pdf)
picts = $(dot_pdf)

.SECONDEXPANSION:

build: all.pdf

all.pdf: *.tex $$(picts)
	pdflatex all.tex

clean:
	rm $(wildcard *.pdf *.eps *.aux *.log *.out *.toc dot/*.pdf_tex dot/*.pdf dot/*.svg)

.SECONDARY: $(dots:.dot=.svg) $(dots:.dot=.pdf)

dot/%.svg: dot/%.dot
	dot $< -Tsvg -o $@

dot/%.pdf: dot/%.svg
	inkscape -z --export-pdf=$@ --export-latex $<

