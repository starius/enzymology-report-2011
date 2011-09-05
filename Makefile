
dots = $(wildcard dot/*)
dot_pdf = $(dots:.dot=.pdf)
picts = $(dot_pdf)

.SECONDEXPANSION:

build: all.pdf

all.pdf: *.tex $$(picts)
	pdflatex all.tex

clean:
	rm `find -name '*.pdf'`
	rm `find -name '*.eps'`
	rm `find -name '*.aux'`
	rm `find -name '*.log'`

.SECONDARY: $(dots:.dot=.svg) $(dots:.dot=.pdf)

dot/%.svg: dot/%.dot
	dot $< -Tsvg -o $@

dot/%.pdf: dot/%.svg
	inkscape -z --export-pdf=$@ --export-latex $<

