
gnu = $(wildcard *.gnu)
pdf = $(gnu:.gnu=-$(DATA).pdf)

.SECONDEXPANSION:

all: $$(pdf)

%.pdf: %.eps
	epstopdf $<

%-$(DATA).eps: %.gnu $$(DATA).dat print.inc
	gnuplot -e "set terminal epslatex; set output '$(@:.eps=.tex)'; data = '$(DATA).dat';" $< 2>&1 \
		|tail --lines 4 > $(@:.eps=.tex).tmp
	echo " " >> $(@:.eps=.tex)
	cat $(@:.eps=.tex).tmp >> $(@:.eps=.tex)
	rm $(@:.eps=.tex).tmp

