set key off
set xlabel "S"
set ylabel "V"
set xtics 0.00005

v(x) = Vm * x / (Km + x)
fit v(x) "10-Km.dat" using 1:2 via Vm, Km

plot "10-Km.dat" using 1:2, v(x)
print "Km = ", Km, " M"
print "Vm = ", Vm, " delta D/min"

