set key left box
set xlabel "µg of protein/cuvette"
set ylabel "$A_{595}$"
f(x) = A0 + k * x
fit f(x) "bsa.dat" using 1:2 via A0, k
plot [0:44] "bsa.dat" using 1:2 title "experiment" pt 7,\
    f(x) title "linear" lw 2

m(A) = (A-A0) / k
print "0.0915 ", m(0.0915)
print "0.2623 ", m(0.2623)
print "0.1933 ", m(0.1933)
print "0.1554 ", m(0.1554)
print "0.0857 ", m(0.0857)

