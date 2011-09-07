set key left box
set xlabel "µg of protein/cuvette"
set ylabel "A"
f(x) = A0 + k * x
fit f(x) "bsa.dat" using 1:2 via A0, k
plot [0:44] "bsa.dat" using 1:2 title "experiment" pt 7,\
    f(x) title "linear" lw 2

