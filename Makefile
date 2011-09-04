
build: all.pdf

all.pdf: *.tex
	pdflatex all.tex

clean:
	rm `find -name '*.pdf'`
	rm `find -name '*.eps'`
	rm `find -name '*.aux'`
	rm `find -name '*.log'`

