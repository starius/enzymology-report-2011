
gnu = $(wildcard *.gnu)
pdf = $(gnu:.gnu=-$(DATA).pdf)

.SECONDEXPANSION:

all: $$(pdf)

%.pdf: %.eps
	epstopdf $<

%-$(DATA).eps: %.gnu
	gnuplot -e "set terminal epslatex; set output '$(@:.eps=.tex)'; data = '$(DATA).dat';" $< 2>&1 \
		|tail --lines 2 > tmp.tex
	echo " " >> $(@:.eps=.tex)
	cat tmp.tex >> $(@:.eps=.tex)

