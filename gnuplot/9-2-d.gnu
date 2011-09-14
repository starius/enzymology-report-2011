set key left box
set xdata time
set timefmt "%M:%S"
set ylabel "delta D"

f20(x) = a20 * x + b20
f10(x) = a10 * x + b10
f5(x) = a5 * x + b5
fit f20(x) "9.dat" using 1:(0.543-$5) via a20, b20
fit f10(x) "9.dat" using 1:(0.733-$6) via a10, b10
fit f5(x) "9.dat" using 1:(0.790-$7) via a5, b5

plot [120:] "9.dat" using 1:(0.543-$5) title "20",\
    f20(x) title "20 approx",\
    "9.dat" using 1:(0.733-$6) title "10",\
    f10(x) title "10 approx",\
    "9.dat" using 1:(0.790-$7) title "5",\
    f5(x) title "5 approx"

print "20: delta D/min = ", a20*60
print "10: delta D/min = ", a10*60
print "05: delta D/min = ", a5*60

